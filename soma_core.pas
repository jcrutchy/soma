unit soma_core;

{$mode Delphi}
{$ASMMODE INTEL}

interface

uses
  soma_types;

procedure Execute(var State: TVMState);

implementation

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

    // clear halt reason at entry
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_NONE

  @Loop:
    cmp r12, GENOME_SIZE
    jge @HaltBounds

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
    // $B0-$FF unused (80 entries)
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
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED
    dq @UNUSED, @UNUSED,  @UNUSED,  @UNUSED

  //------------------------------------------------------------
  // HANDLERS
  //------------------------------------------------------------

  @UNUSED:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_UNUSED
    jmp @Exit

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
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_UNUSED
    jmp @Exit

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
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_UNUSED
    jmp @Exit

  //-- Halt reasons -------------------------------------------

  @HaltBounds:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BOUNDS
    jmp @Exit

  @HaltDivZero:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_DIV_ZERO
    jmp @Exit

  @HaltFDivZero:
    mov qword ptr [rbx + HALT_REASON_OFFSET], HR_FDIV_ZERO
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