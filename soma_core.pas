unit soma_core;

{$mode Delphi}
{$ASMMODE INTEL}

interface

uses
  soma_types, Math;

procedure Execute(var State: TVMState);

implementation

{ ------------------------------------------------------------------------
  Soma_MatInverse: called (via `call`, not inlined) from inside the OP_MATINV
  handler below. This is a deliberate exception to the "everything inline
  in the dispatch asm" style used everywhere else in this file: an N-wide
  Gauss-Jordan elimination with partial pivoting needs an N x 2N scratch
  buffer that has nowhere to live in registers once N gets past 2 or 3,
  and hand-rolling pivoting/elimination control flow directly in asm labels
  is a correctness risk for very little benefit here (this is a cold path,
  not a per-tick hot loop). rbx/r12/r13/r14/r15 are all callee-saved under
  both SysV and Win64, so they survive this call for free -- no special
  handling needed for the pinned dispatch registers.

  Operates directly on State^.fstack in place: reads the N*N matrix
  starting at fstack[MatrixBase], and on success overwrites the same
  N*N window with the inverse. Returns False (leaving the operand
  untouched) if the matrix is singular -- the caller (asm handler) halts
  with HR_SINGULAR_MATRIX in that case rather than leaving garbage on
  the float stack.
  ------------------------------------------------------------------------ }
function Soma_MatInverse(StateBase: Pointer; N: Int64; MatrixBase: Int64): Boolean;
var
  A: array of Double;
  FS: PDouble;
  i, j, k, pivotRow, sz, w: Integer;
  maxVal, ratio, pivot, tmp: Double;
begin
  Result := True;
  sz := N;
  w  := 2 * sz;
  FS := PDouble(PByte(StateBase) + FSTACK_OFFSET);
  SetLength(A, sz * w);

  // Build augmented [M | I]
  for i := 0 to sz - 1 do
  begin
    for j := 0 to sz - 1 do
      A[i * w + j] := FS[MatrixBase + i * sz + j];
    for j := 0 to sz - 1 do
      A[i * w + sz + j] := Ord(i = j) * 1.0;
  end;

  for k := 0 to sz - 1 do
  begin
    pivotRow := k;
    maxVal := Abs(A[k * w + k]);
    for i := k + 1 to sz - 1 do
      if Abs(A[i * w + k]) > maxVal then
      begin
        maxVal := Abs(A[i * w + k]);
        pivotRow := i;
      end;

    if maxVal < 1.0E-12 then
    begin
      Result := False;
      Exit;
    end;

    if pivotRow <> k then
      for j := 0 to w - 1 do
      begin
        tmp := A[k * w + j];
        A[k * w + j] := A[pivotRow * w + j];
        A[pivotRow * w + j] := tmp;
      end;

    pivot := A[k * w + k];
    for j := 0 to w - 1 do
      A[k * w + j] := A[k * w + j] / pivot;

    for i := 0 to sz - 1 do
      if i <> k then
      begin
        ratio := A[i * w + k];
        if ratio <> 0.0 then
          for j := 0 to w - 1 do
            A[i * w + j] := A[i * w + j] - ratio * A[k * w + j];
      end;
  end;

  for i := 0 to sz - 1 do
    for j := 0 to sz - 1 do
      FS[MatrixBase + i * sz + j] := A[i * w + sz + j];
end;

function Soma_Sigmoid(X: Double): Double;
begin
  Result := 1.0 / (1.0 + Exp(-X));
end;

function Soma_Tanh(X: Double): Double;
begin
  Result := Math.Tanh(X);
end;

procedure Execute(var State: TVMState);
begin
  asm
    // Save non-volatile registers
    push rbx
    push r12
    push r13
    push r14
    push r15
{$IFDEF WINDOWS}
    sub  rsp, 64
    movdqu [rsp+$00], xmm6
    movdqu [rsp+$10], xmm7
    movdqu [rsp+$20], xmm8
    movdqu [rsp+$30], xmm9
{$ENDIF}

{$IFDEF WINDOWS}
    mov rbx, rcx
{$ELSE}
    mov rbx, rdi
{$ENDIF}

    mov r12, [rbx + IP_OFFSET]
    mov r13, [rbx + ISP_OFFSET]
    mov r14, [rbx + FSP_OFFSET]
    lea r15, [rip + @JumpTable]

    // clear halt reason and exec_count at entry
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_NONE
    mov qword ptr [rbx + EXEC_COUNT_OFFSET],   0

    // Mask all FPU/SSE arithmetic exceptions (invalid-op, div-by-zero,
    // overflow, underflow, denormal, precision) for both the SSE unit
    // (MXCSR, bits 7-12) and the x87 unit (FCW, bits 0-5 -- @FMOD below
    // uses fld/fprem/fstp, a separate control word from MXCSR). Masked
    // means these produce a quiet NaN/Inf and continue, matching
    // IEEE754's default and every other language runtime's default,
    // instead of raising a hardware trap that kills the colony thread.
    // Confirmed by fuzz testing: unmasked, sqrtsd on a negative operand
    // reliably crashes with an unhandled EInvalidOp, and this VM's own
    // NOP-transparency change makes a random genome far more likely to
    // actually reach an op like FSQRT before halting than it used to be.
    sub     rsp, 8
    stmxcsr [rsp]
    or      dword ptr [rsp], $1F80
    ldmxcsr [rsp]
    fnstcw  [rsp]
    or      word ptr [rsp], $003F
    fldcw   [rsp]
    add     rsp, 8

  @Loop:
    cmp r12, GENOME_SIZE
    jge @HaltBounds
    cmp r12, 0
    jl  @HaltBounds
    // Floor check matters just as much as the ceiling one above: JMP/JZ/
    // JNZ/CALL add a signed imm directly to r12, and a negative-enough
    // offset (or a tight loop of small negative jumps accumulating over
    // several iterations) drives r12 negative. The ceiling check alone
    // (`jge @HaltBounds`) doesn't catch that -- a negative r12 always
    // satisfies "less than GENOME_SIZE" under signed comparison, so it
    // was falling through to dispatch and computing a wildly out-of-
    // bounds genome address. Confirmed via fuzz testing: this crashed
    // a random genome with r12 = -693448442032 at the fault.
    inc qword ptr [rbx + EXEC_COUNT_OFFSET]
    cmp qword ptr [rbx + EXEC_COUNT_OFFSET], MAX_EXEC_CYCLES
    jge @HaltCycleLimit

    // Clamp isp/fsp into [0, STACK_SIZE] before dispatch, using whatever
    // the PREVIOUS instruction left them at. No individual opcode moves
    // either pointer by more than a handful of slots in one step (the
    // widest is the neural ops at up to 2*MAX_NN_WIDTH=16), so clamping
    // once per loop iteration is enough to keep the pointer from ever
    // drifting far enough to compute an out-of-bounds address -- a long
    // run of pop-heavy instructions with nothing pushing WILL walk isp/fsp
    // negative otherwise, and r13*8 / r14*8 on a sufficiently negative
    // index lands well outside the allocated TVMState block (confirmed:
    // this crashed the very first real random genome tested against it).
    // Saturating rather than halting keeps this a neutral/graceful event
    // rather than a lethal one, matching @UNUSED's NOP-transparency.
    cmp r13, 0
    jge @ISPFloorOK
    xor r13, r13
  @ISPFloorOK:
    cmp r13, STACK_SIZE
    jle @ISPCeilOK
    mov r13, STACK_SIZE
  @ISPCeilOK:
    cmp r14, 0
    jge @FSPFloorOK
    xor r14, r14
  @FSPFloorOK:
    cmp r14, STACK_SIZE
    jle @FSPCeilOK
    mov r14, STACK_SIZE
  @FSPCeilOK:

    movzx rax, word ptr [rbx + GENOME_OFFSET + r12*8]
    cmp   rax, LAYER0_MAX
    jg    @HigherLayer
    jmp   qword ptr [r15 + rax*8]

  //------------------------------------------------------------
  // JUMP TABLE - 256 entries
  //------------------------------------------------------------
  @JumpTable:
    // $00-$07 Integer stack ops
    dq @NOP,    @PUSH,    @POP,     @DUP
    dq @SWAP,   @OVER,    @ROT,     @DROP
    // $08-$0F unused
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $10-$18 Integer arithmetic
    dq @ADD,    @SUB,     @MUL,     @DIV
    dq @MOD,    @NEG,     @ABS,     @INC
    dq @DEC,    @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $20-$26 Bitwise
    dq @BAND,   @BOR,     @BXOR,    @BNOT
    dq @SHL,    @SHR,     @SAR,     @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $30-$35 Integer comparison
    dq @EQ,     @NEQ,     @LT,      @GT
    dq @LTE,    @GTE,     @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $40-$45 Control flow
    dq @JMP,    @JZ,      @JNZ,     @CALL
    dq @RET,    @HALT,    @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $50-$53 Memory
    dq @LOAD,   @STORE,   @MLOAD,   @MSTORE
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $60-$64 Float stack ops
    dq @FPUSH,  @FPOP,    @FDUP,    @FSWAP
    dq @FDROP,  @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $70-$77 Float arithmetic
    dq @FADD,   @FSUB,    @FMUL,    @FDIV
    dq @FNEG,   @FABS,    @FSQRT,   @FMOD
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $80-$85 Float comparison
    dq @FEQ,    @FNEQ,    @FLT,     @FGT
    dq @FLTE,   @FGTE,    @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $90-$91 Conversion
    dq @I2F,    @F2I,     @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $A0-$A5 System
    dq @RAND,   @FRAND,   @PCNT,    @YIELD
    dq @IN,     @OUT,     @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    // $B0-$B6 Vector/matrix/neural primitives, $B7 spare
    dq @VDOT,   @MATVEC,  @MATINV,  @FMA
    dq @SIGMOID,@TANH,    @RELU,    @UNUSED
    // $B8-$FF unused (72 entries)
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED

  //------------------------------------------------------------
  // HANDLERS
  //------------------------------------------------------------

  @UNUSED:
    // Transparent NOP: a mutation landing on reserved opcode space is a
    // neutral mutation, not a lethal one. OP_HALT ($0045) remains the
    // explicit, deliberate way to stop -- this is no longer how "stop"
    // happens by accident.
    inc r12
    jmp @Loop

  //-- Integer stack ops --------------------------------------

  @NOP:
    inc r12
    jmp @Loop

  @PUSH:
    movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    mov    [rbx + ISTACK_OFFSET + r13*8], rax
    inc    r13
    inc    r12
    jmp    @Loop

  @POP:
    dec r13
    inc r12
    jmp @Loop

  @DUP:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov [rbx + ISTACK_OFFSET + r13*8], rax
    inc r13
    inc r12
    jmp @Loop

  @SWAP:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
    mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rcx
    mov [rbx + ISTACK_OFFSET + r13*8 - 16], rax
    inc r12
    jmp @Loop

  @OVER:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    mov [rbx + ISTACK_OFFSET + r13*8], rax
    inc r13
    inc r12
    jmp @Loop

  @ROT:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 24]
    mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
    mov rdx, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov [rbx + ISTACK_OFFSET + r13*8 - 24], rcx
    mov [rbx + ISTACK_OFFSET + r13*8 - 16], rdx
    mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rax
    inc r12
    jmp @Loop

  @DROP:
    dec r13
    inc r12
    jmp @Loop

  //-- Integer arithmetic -------------------------------------

  @ADD:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    add rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @SUB:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    sub rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @MUL:
    mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    imul rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    dec  r13
    mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc  r12
    jmp  @Loop

  @DIV:
    mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
    test rcx, rcx
    jz   @HaltDivZero
    cmp  rcx, -1
    jne  @DIV_SafeDivisor
    mov  r8, $8000000000000000    // Int64.MinValue -- idiv traps if
    cmp  rax, r8                  // dividend=MinValue and divisor=-1
    je   @HaltIntOverflow
  @DIV_SafeDivisor:
    cqo
    idiv rcx
    dec  r13
    mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc  r12
    jmp  @Loop

  @MOD:
    mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
    test rcx, rcx
    jz   @HaltDivZero
    cmp  rcx, -1
    jne  @MOD_SafeDivisor
    mov  r8, $8000000000000000
    cmp  rax, r8
    je   @HaltIntOverflow
  @MOD_SafeDivisor:
    cqo
    idiv rcx
    dec  r13
    mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rdx
    inc  r12
    jmp  @Loop

  @NEG:
    neg qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
    inc r12
    jmp @Loop

  @ABS:
    mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov  rcx, rax
    neg  rcx
    cmovl rax, rcx
    mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc  r12
    jmp  @Loop

  @INC:
    inc qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
    inc r12
    jmp @Loop

  @DEC:
    dec qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
    inc r12
    jmp @Loop

  //-- Bitwise ------------------------------------------------

  @BAND:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    and rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @BOR:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    or  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @BXOR:
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    xor rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @BNOT:
    not qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
    inc r12
    jmp @Loop

  @SHL:
    mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    shl rax, cl
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @SHR:
    mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    shr rax, cl
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  @SAR:
    mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
    mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    sar rax, cl
    dec r13
    mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc r12
    jmp @Loop

  //-- Integer comparison -------------------------------------

  @EQ:
    mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    sete  al
    movzx rax, al
    dec   r13
    mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc   r12
    jmp   @Loop

  @NEQ:
    mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    setne al
    movzx rax, al
    dec   r13
    mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc   r12
    jmp   @Loop

  @LT:
    mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    setl  al
    movzx rax, al
    dec   r13
    mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc   r12
    jmp   @Loop

  @GT:
    mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    setg  al
    movzx rax, al
    dec   r13
    mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc   r12
    jmp   @Loop

  @LTE:
    mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    setle al
    movzx rax, al
    dec   r13
    mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc   r12
    jmp   @Loop

  @GTE:
    mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
    cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    setge al
    movzx rax, al
    dec   r13
    mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
    inc   r12
    jmp   @Loop

  //-- Control flow -------------------------------------------

  @JMP:
    movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    add    r12, rax
    jmp    @Loop

  @JZ:
    mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    dec  r13
    test rax, rax
    jnz  @JZ_Skip
    movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    add    r12, rax
    jmp    @Loop
  @JZ_Skip:
    inc r12
    jmp @Loop

  @JNZ:
    mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    dec  r13
    test rax, rax
    jz   @JNZ_Skip
    movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    add    r12, rax
    jmp    @Loop
  @JNZ_Skip:
    inc r12
    jmp @Loop

  @CALL:
    lea  rax, [r12 + 1]
    mov  [rbx + ISTACK_OFFSET + r13*8], rax
    inc  r13
    movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    add    r12, rax
    jmp    @Loop

  @RET:
    dec r13
    mov r12, [rbx + ISTACK_OFFSET + r13*8]
    jmp @Loop

  @HALT:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HALT
    jmp @Exit

  //-- Memory (stubs) -----------------------------------------

  @LOAD:
  @STORE:
  @MLOAD:
  @MSTORE:
    // Not implemented yet -- transparent NOP rather than a lethal halt,
    // same reasoning as @UNUSED. These are sampled by VALID_OPCODES, so
    // treating them as landmines instead of no-ops would make ~6/74 of
    // the mutation pool silently fatal for no interesting reason.
    inc r12
    jmp @Loop

  //-- Float stack ops ----------------------------------------

  @FPUSH:
    movsxd   rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    cvtsi2sd xmm0, rax
    movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
    inc      r14
    inc      r12
    jmp      @Loop

  @FPOP:
    dec r14
    inc r12
    jmp @Loop

  @FDUP:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    movsd [rbx + FSTACK_OFFSET + r14*8], xmm0
    inc   r14
    inc   r12
    jmp   @Loop

  @FSWAP:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8],  xmm1
    movsd [rbx + FSTACK_OFFSET + r14*8 - 16], xmm0
    inc   r12
    jmp   @Loop

  @FDROP:
    dec r14
    inc r12
    jmp @Loop

  //-- Float arithmetic ---------------------------------------

  @FADD:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    addsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    dec   r14
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  @FSUB:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    subsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    dec   r14
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  @FMUL:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    mulsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    dec   r14
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  @FDIV:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    movsd   xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
    xorpd   xmm2, xmm2
    ucomisd xmm1, xmm2
    je      @HaltFDivZero
    divsd   xmm0, xmm1
    dec     r14
    movsd   [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc     r12
    jmp     @Loop

  @FNEG:
    movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    mov    rax,  $8000000000000000
    movq   xmm1, rax
    xorpd  xmm0, xmm1
    movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc    r12
    jmp    @Loop

  @FABS:
    movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    mov    rax,  $7FFFFFFFFFFFFFFF
    movq   xmm1, rax
    andpd  xmm0, xmm1
    movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc    r12
    jmp    @Loop

  @FSQRT:
    movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    sqrtsd xmm0, xmm0
    movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc    r12
    jmp    @Loop

  @FMOD:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
    sub   rsp, 16
    movsd [rsp],   xmm1
    movsd [rsp+8], xmm0
    fld   qword ptr [rsp]
    fld   qword ptr [rsp+8]
    fprem
    fstp  qword ptr [rsp+8]
    fstp  qword ptr [rsp]
    movsd xmm0, [rsp+8]
    add   rsp, 16
    dec   r14
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  //-- Float comparison ---------------------------------------

  @FEQ:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    sete    al
    movzx   rax, al
    dec     r14
    mov     [rbx + ISTACK_OFFSET + r13*8], rax
    inc     r13
    inc     r12
    jmp     @Loop

  @FNEQ:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    setne   al
    movzx   rax, al
    dec     r14
    mov     [rbx + ISTACK_OFFSET + r13*8], rax
    inc     r13
    inc     r12
    jmp     @Loop

  @FLT:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    setb    al
    movzx   rax, al
    dec     r14
    mov     [rbx + ISTACK_OFFSET + r13*8], rax
    inc     r13
    inc     r12
    jmp     @Loop

  @FGT:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    seta    al
    movzx   rax, al
    dec     r14
    mov     [rbx + ISTACK_OFFSET + r13*8], rax
    inc     r13
    inc     r12
    jmp     @Loop

  @FLTE:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    setbe   al
    movzx   rax, al
    dec     r14
    mov     [rbx + ISTACK_OFFSET + r13*8], rax
    inc     r13
    inc     r12
    jmp     @Loop

  @FGTE:
    movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
    ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    setae   al
    movzx   rax, al
    dec     r14
    mov     [rbx + ISTACK_OFFSET + r13*8], rax
    inc     r13
    inc     r12
    jmp     @Loop

  //-- Conversion ---------------------------------------------

  @I2F:
    mov      rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
    dec      r13
    cvtsi2sd xmm0, rax
    movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
    inc      r14
    inc      r12
    jmp      @Loop

  @F2I:
    movsd     xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    dec       r14
    cvttsd2si rax, xmm0
    mov       [rbx + ISTACK_OFFSET + r13*8], rax
    inc       r13
    inc       r12
    jmp       @Loop

  //-- System -------------------------------------------------

  @RAND:
    mov rcx, [rbx + RNG_OFFSET]
    mov rax, rcx
    shl rax, 13
    xor rcx, rax
    mov rax, rcx
    shr rax, 7
    xor rcx, rax
    mov rax, rcx
    shl rax, 17
    xor rcx, rax
    mov [rbx + RNG_OFFSET], rcx
    mov [rbx + ISTACK_OFFSET + r13*8], rcx
    inc r13
    inc r12
    jmp @Loop

  @FRAND:
    mov rcx, [rbx + RNG_OFFSET]
    mov rax, rcx
    shl rax, 13
    xor rcx, rax
    mov rax, rcx
    shr rax, 7
    xor rcx, rax
    mov rax, rcx
    shl rax, 17
    xor rcx, rax
    mov [rbx + RNG_OFFSET], rcx
    shr rcx, 11
    cvtsi2sd xmm0, rcx
    mov      rax,  $3CA0000000000000
    movq     xmm1, rax
    mulsd    xmm0, xmm1
    movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
    inc      r14
    inc      r12
    jmp      @Loop

  @PCNT:
    rdtsc
    shl rdx, 32
    or  rax, rdx
    mov [rbx + ISTACK_OFFSET + r13*8], rax
    inc r13
    inc r12
    jmp @Loop

  @YIELD:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_YIELD
    inc r12
    jmp @Exit

  @IN:
  @OUT:
    // Same reasoning: unimplemented sensor/actuator stubs shouldn't be
    // lethal until there's an actual environment to sense/act on.
    inc r12
    jmp @Loop

  //-- Vector/matrix/neural primitives -------------------------
  // Width (N) comes from the instruction's imm field, clamped to
  // [1, MAX_NN_WIDTH]. Fully in-register scalar loops -- no packed/AVX
  // instructions, matching the scalar-only style used throughout this
  // file (and sidestepping the 16-byte-alignment requirement that
  // packed SSE arithmetic-with-memory-operand forms have and this
  // stack's slots don't guarantee).

  @VDOT:
    // imm=N; pop vecA[N], vecB[N] (B pushed last, on top) -> push dot product
    movsxd rcx, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    cmp    rcx, 1
    jl     @HaltBadOperand
    cmp    rcx, MAX_NN_WIDTH
    jg     @HaltBadOperand

    mov    rax, r14
    sub    rax, rcx
    sub    rax, rcx           // rax = base = fsp - 2N  (start of vecA)
    cmp    rax, 0             // N validated above, but fsp may still not
    jl     @HaltInsufficientStack  // have had 2N elements available (see
                                     // HR_INSUFFICIENT_STACK note in soma_types.pas)
    xorpd  xmm0, xmm0         // accumulator
    xor    rdx, rdx           // i = 0
  @VDOT_Loop:
    cmp    rdx, rcx
    jge    @VDOT_Done
    mov    r8, rax
    add    r8, rdx
    movsd  xmm1, [rbx + FSTACK_OFFSET + r8*8]   // A[i]
    mov    r9, rax
    add    r9, rcx
    add    r9, rdx
    movsd  xmm2, [rbx + FSTACK_OFFSET + r9*8]   // B[i]
    mulsd  xmm1, xmm2
    addsd  xmm0, xmm1
    inc    rdx
    jmp    @VDOT_Loop
  @VDOT_Done:
    mov    r14, rax
    movsd  [rbx + FSTACK_OFFSET + r14*8], xmm0
    inc    r14
    inc    r12
    jmp    @Loop

  @MATVEC:
    // imm=N; pop mat[N*N] (row-major, pushed first), vec[N] (pushed last,
    // on top) -> push vec[N] = mat . vec
    movsxd rcx, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
    cmp    rcx, 1
    jl     @HaltBadOperand
    cmp    rcx, MAX_NN_WIDTH
    jg     @HaltBadOperand

    mov    rax, rcx
    imul   rax, rcx            // rax = N*N
    mov    r8, rax
    add    r8, rcx              // r8 = N*N + N  (total operand doubles)
    mov    r9, r14
    sub    r9, r8                // r9 = matrixBase
    cmp    r9, 0                 // N validated above, but this is the wide
    jl     @HaltInsufficientStack // one (N*N+N doubles) -- see HR_INSUFFICIENT_STACK
    mov    r10, r9
    add    r10, rax               // r10 = vectorBase = matrixBase + N*N

    xor    r11, r11               // i = 0
  @MATVEC_RowLoop:
    cmp    r11, rcx
    jge    @MATVEC_Done
    xorpd  xmm0, xmm0
    xor    rdx, rdx              // j = 0
  @MATVEC_ColLoop:
    cmp    rdx, rcx
    jge    @MATVEC_RowDone
    mov    rax, r11
    imul   rax, rcx
    add    rax, rdx
    add    rax, r9
    movsd  xmm1, [rbx + FSTACK_OFFSET + rax*8]   // M[i][j]
    mov    rax, r10
    add    rax, rdx
    movsd  xmm2, [rbx + FSTACK_OFFSET + rax*8]   // V[j]
    mulsd  xmm1, xmm2
    addsd  xmm0, xmm1
    inc    rdx
    jmp    @MATVEC_ColLoop
  @MATVEC_RowDone:
    // Safe in-place write: this only ever overwrites row 0's storage
    // (indices [matrixBase, matrixBase+N)), which by this point has
    // already been fully read for every row -- row 0's own columns
    // are read to completion before its result is written, and no
    // later row's data lives in that index range.
    mov    rax, r9
    add    rax, r11
    movsd  [rbx + FSTACK_OFFSET + rax*8], xmm0
    inc    r11
    jmp    @MATVEC_RowLoop
  @MATVEC_Done:
    mov    r14, r9
    add    r14, rcx
    inc    r12
    jmp    @Loop

  @MATINV:
    // imm=N; pop mat[N*N] -> push mat[N*N] inverse, or halt HR_SINGULAR_MATRIX
    movsxd r11, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]   // r11 = N
    cmp    r11, 1
    jl     @HaltBadOperand
    cmp    r11, MAX_NN_WIDTH
    jg     @HaltBadOperand

    mov    rax, r11
    imul   rax, r11             // rax = N*N
    mov    r9, r14
    sub    r9, rax               // r9 = matrixBase = fsp - N*N
    cmp    r9, 0
    jl     @HaltInsufficientStack

    // MATINV is in-place: N*N doubles in, N*N doubles out, so fsp (r14)
    // doesn't change at all -- and since r14 is callee-saved, it survives
    // the call untouched with no stashing needed (unlike rsp above, which
    // genuinely does need the memory-stash trick since the alignment
    // adjustment happens on this side of the call).
    mov    rcx, rsp                // save original rsp
    and    rsp, -16                // 16-byte align
{$IFDEF WINDOWS}
    sub    rsp, 48                  // 16 scratch + 32 Win64 shadow space
{$ELSE}
    sub    rsp, 16                   // 16 scratch
{$ENDIF}
    mov    [rsp], rcx                 // stash original rsp

{$IFDEF WINDOWS}
    mov    r8,  r9                     // arg2 = MatrixBase
    mov    rdx, r11                     // arg1 = N
    mov    rcx, rbx                      // arg0 = StateBase
{$ELSE}
    mov    rdx, r9                       // arg2 = MatrixBase
    mov    rsi, r11                       // arg1 = N
    mov    rdi, rbx                        // arg0 = StateBase
{$ENDIF}
    call   Soma_MatInverse             // result (Boolean) returned in AL

    mov    r10, [rsp]                    // recover original rsp (AL untouched)
    mov    rsp, r10
    test   al, al
    jz     @HaltSingular

    inc    r12
    jmp    @Loop

  @FMA:
    // pop acc, w, x -> push acc + w*x   (weighted-sum accumulate)
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 24]   // acc
    movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]   // w
    movsd xmm2, [rbx + FSTACK_OFFSET + r14*8 - 8]    // x
    mulsd xmm1, xmm2
    addsd xmm0, xmm1
    sub   r14, 2
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  @SIGMOID:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    mov   rax, rsp                 // save original rsp (see OP_MATINV note
    and   rsp, -16                 // above on why this can't be a register)
{$IFDEF WINDOWS}
    sub   rsp, 48
{$ELSE}
    sub   rsp, 16
{$ENDIF}
    mov   [rsp], rax
    call  Soma_Sigmoid              // result returned in xmm0
    mov   r10, [rsp]
    mov   rsp, r10
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  @TANH:
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    mov   rax, rsp
    and   rsp, -16
{$IFDEF WINDOWS}
    sub   rsp, 48
{$ELSE}
    sub   rsp, 16
{$ENDIF}
    mov   [rsp], rax
    call  Soma_Tanh
    mov   r10, [rsp]
    mov   rsp, r10
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  @RELU:
    pxor  xmm1, xmm1
    movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
    maxsd xmm0, xmm1
    movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
    inc   r12
    jmp   @Loop

  //-- Halt reasons -------------------------------------------

  @HaltBounds:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BOUNDS
    jmp @Exit

  @HaltDivZero:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_DIV_ZERO
    jmp @Exit

  @HaltIntOverflow:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_INT_OVERFLOW
    jmp @Exit

  @HaltFDivZero:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_FDIV_ZERO
    jmp @Exit

  @HaltBadOperand:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BAD_OPERAND
    jmp @Exit

  @HaltSingular:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_SINGULAR_MATRIX
    jmp @Exit

  @HaltInsufficientStack:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_INSUFFICIENT_STACK
    jmp @Exit

  @HaltCycleLimit:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_CYCLE_LIMIT
    jmp @Exit

  //-- Higher layer -------------------------------------------

  @HigherLayer:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HIGHER_LAYER
    mov [rbx + IP_OFFSET],  r12
    mov [rbx + ISP_OFFSET], r13
    mov [rbx + FSP_OFFSET], r14
    jmp @ExitNoSave

  //-- Exit ---------------------------------------------------

  @Exit:
    mov [rbx + IP_OFFSET],  r12
    mov [rbx + ISP_OFFSET], r13
    mov [rbx + FSP_OFFSET], r14

  @ExitNoSave:
{$IFDEF WINDOWS}
    movdqu xmm6, [rsp+$00]
    movdqu xmm7, [rsp+$10]
    movdqu xmm8, [rsp+$20]
    movdqu xmm9, [rsp+$30]
    add    rsp, 64
{$ENDIF}
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
  end;
end;

end.