	.file "soma_core.pas"
# Begin asmlist al_procedures

.section .text.n_soma_core$_$soma_matinverse$pointer$int64$int64$$boolean_$$_fin$00000002,"x"
	.balign 16,0x90
SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002:
.Lc1:
.seh_proc SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
# [soma_core.pas]
# [98] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc3:
.Lc4:
	movq	%rcx,%rbp
.Lc5:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
	leaq	RTTI_$SOMA_CORE_$$_def00000003(%rip),%rdx
	leaq	-8(%rbp),%rcx
	call	fpc_finalize
# [40] begin
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:

.section .text.n_soma_core_$$_soma_matinverse$pointer$int64$int64$$boolean,"x"
	.balign 16,0x90
SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN:
.Lc6:
# Temps allocated between rbp-128 and rbp-8
.seh_proc SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
	pushq	%rbp
.seh_pushreg %rbp
.Lc8:
.Lc9:
	movq	%rsp,%rbp
.Lc10:
	leaq	-160(%rsp),%rsp
.seh_stackalloc 160
	movq	%rbx,-128(%rbp)
	movq	%rdi,-120(%rbp)
	movq	%rsi,-112(%rbp)
	movq	%r12,-104(%rbp)
	movq	%r13,-96(%rbp)
	movq	%r14,-88(%rbp)
	movq	%r15,-80(%rbp)
.seh_savereg %rbx, 32
.seh_savereg %rdi, 40
.seh_savereg %rsi, 48
.seh_savereg %r12, 56
.seh_savereg %r13, 64
.seh_savereg %r14, 72
.seh_savereg %r15, 80
.seh_endprologue
# Var $result located in register al
# Var A located at rbp-8, size=OS_64
# Var FS located in register rax
# Var i located in register r15d
# Var j located in register r10d
# Var k located in register r11d
# Var pivotRow located in register ebx
# Var sz located in register eax
# Var w located in register eax
# Var maxVal located in register xmm0
# Var ratio located in register xmm2
# Var pivot located in register xmm5
# Var tmp located in register xmm4
# Var StateBase located in register rcx
# Var N located in register rdx
	movq	%r8,-32(%rbp)
# Var MatrixBase located in register rax
	movq	$0,-8(%rbp)
.Lj11:
	nop
.Lj7:
# [41] Result := True;
	movb	$1,-24(%rbp)
# [42] sz := N;
	movl	%edx,%eax
	movq	%rax,-40(%rbp)
# [43] w  := 2 * sz;
	movl	-40(%rbp),%edx
	shll	$1,%edx
	movl	%edx,%eax
	movq	%rax,-48(%rbp)
# [44] FS := PDouble(PByte(StateBase) + FSTACK_OFFSET);
	leaq	2304(%rcx),%rax
	movq	%rax,-56(%rbp)
# [45] SetLength(A, sz * w);
	movslq	-40(%rbp),%rax
	movslq	-48(%rbp),%rdx
	imulq	%rdx,%rax
	movq	%rax,-16(%rbp)
	leaq	RTTI_$SOMA_CORE_$$_def00000003(%rip),%rdx
	leaq	-16(%rbp),%r9
	leaq	-8(%rbp),%rcx
	movl	$1,%r8d
	call	fpc_dynarray_setlength
# [48] for i := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%ecx
	testl	%ecx,%ecx
	jnge	.Lj13
	movl	$-1,%r15d
	.balign 8,0x90
.Lj14:
	addl	$1,%r15d
# [50] for j := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%r8d
	testl	%r8d,%r8d
	jnge	.Lj18
	movl	$-1,%r10d
	.balign 8,0x90
.Lj19:
	addl	$1,%r10d
# [51] A[i * w + j] := FS[MatrixBase + i * sz + j];
	movq	-8(%rbp),%r9
	movslq	-48(%rbp),%rdx
	movslq	%r15d,%rax
	movq	%rax,%r11
	imulq	%r11,%rdx
	movslq	%r10d,%rax
	movq	%rax,%rsi
	leaq	(%rdx,%rsi),%rbx
	movslq	-40(%rbp),%rax
	imulq	%r11,%rax
	movq	-32(%rbp),%rdx
	addq	%rdx,%rax
	addq	%rsi,%rax
	movq	-56(%rbp),%rdx
	movq	(%rdx,%rax,8),%rax
	movq	%rax,(%r9,%rbx,8)
	cmpl	%r10d,%r8d
	jnle	.Lj19
	.balign 4,0x90
.Lj18:
# [52] for j := 0 to sz - 1 do
	movl	-40(%rbp),%eax
	leal	-1(%eax),%r8d
	testl	%r8d,%r8d
	jnge	.Lj23
	movl	$-1,%r10d
	.balign 8,0x90
.Lj24:
	addl	$1,%r10d
# [53] A[i * w + sz + j] := Ord(i = j) * 1.0;
	movq	-8(%rbp),%r9
	movslq	%r15d,%rdx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rdx
	movslq	-40(%rbp),%rax
	addq	%rdx,%rax
	movslq	%r10d,%rdx
	addq	%rax,%rdx
	cmpl	%r15d,%r10d
	seteb	%al
	andl	$255,%eax
	cvtsi2ssl	%eax,%xmm0
	mulss	_$SOMA_CORE$_Ld1(%rip),%xmm0
	cvtss2sd	%xmm0,%xmm0
	movsd	%xmm0,(%r9,%rdx,8)
	cmpl	%r10d,%r8d
	jnle	.Lj24
	.balign 4,0x90
.Lj23:
	cmpl	%r15d,%ecx
	jnle	.Lj14
	.balign 4,0x90
.Lj13:
# [56] for k := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%r9d
	testl	%r9d,%r9d
	jnge	.Lj28
	movl	$-1,%r11d
	.balign 8,0x90
.Lj29:
	addl	$1,%r11d
# [58] pivotRow := k;
	movl	%r11d,%ebx
# [59] maxVal := Abs(A[k * w + k]);
	movq	-8(%rbp),%rcx
	movslq	-48(%rbp),%rdx
	movslq	%r11d,%rax
	imulq	%rax,%rdx
	addq	%rdx,%rax
	movsd	(%rcx,%rax,8),%xmm1
	andpd	FPC_ABSMASK_DOUBLE(%rip),%xmm1
	movapd	%xmm1,%xmm0
# [60] for i := k + 1 to sz - 1 do
	leal	1(%r11d),%ecx
	movl	-40(%rbp),%eax
	leal	-1(%eax),%edx
	cmpl	%ecx,%edx
	jnge	.Lj33
	movl	%ecx,%r15d
	subl	$1,%r15d
	.balign 8,0x90
.Lj34:
	addl	$1,%r15d
# [61] if Abs(A[i * w + k]) > maxVal then
	movq	-8(%rbp),%r8
	movslq	%r15d,%rcx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rcx
	movslq	%r11d,%rax
	addq	%rcx,%rax
	movsd	(%r8,%rax,8),%xmm1
	andpd	FPC_ABSMASK_DOUBLE(%rip),%xmm1
	comisd	%xmm1,%xmm0
	jp	.Lj38
	jnb	.Lj38
# [63] maxVal := Abs(A[i * w + k]);
	movq	-8(%rbp),%r8
	movslq	%r15d,%rcx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rcx
	movslq	%r11d,%rax
	addq	%rcx,%rax
	movsd	(%r8,%rax,8),%xmm1
	andpd	FPC_ABSMASK_DOUBLE(%rip),%xmm1
	movapd	%xmm1,%xmm0
# [64] pivotRow := i;
	movl	%r15d,%ebx
	.balign 4,0x90
.Lj38:
	cmpl	%r15d,%edx
	jnle	.Lj34
	.balign 4,0x90
.Lj33:
# [67] if maxVal < 1.0E-12 then
	comisd	_$SOMA_CORE$_Ld2(%rip),%xmm0
	jp	.Lj41
	jnb	.Lj41
# [69] Result := False;
	movb	$0,-24(%rbp)
# [70] Exit;
	jmp	.Lj9
	.balign 4,0x90
.Lj41:
# [73] if pivotRow <> k then
	cmpl	%ebx,%r11d
	je	.Lj44
# [74] for j := 0 to w - 1 do
	movl	-48(%rbp),%eax
	leal	-1(%eax),%edx
	testl	%edx,%edx
	jnge	.Lj46
	movl	$-1,%r10d
	.balign 8,0x90
.Lj47:
	addl	$1,%r10d
# [76] tmp := A[k * w + j];
	movq	-8(%rbp),%r8
	movslq	%r11d,%rcx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rcx
	movslq	%r10d,%rax
	addq	%rcx,%rax
	movsd	(%r8,%rax,8),%xmm4
# [77] A[k * w + j] := A[pivotRow * w + j];
	movq	-8(%rbp),%r8
	movslq	%r11d,%rcx
	movslq	-48(%rbp),%rax
	movq	%rax,%rdi
	imulq	%rdi,%rcx
	movslq	%r10d,%rax
	movq	%rax,%r12
	leaq	(%rcx,%r12),%rsi
	movq	-8(%rbp),%rcx
	movslq	%ebx,%rax
	imulq	%rdi,%rax
	addq	%r12,%rax
	movq	(%rcx,%rax,8),%rax
	movq	%rax,(%r8,%rsi,8)
# [78] A[pivotRow * w + j] := tmp;
	movq	-8(%rbp),%r8
	movslq	%ebx,%rcx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rcx
	movslq	%r10d,%rax
	addq	%rcx,%rax
	movsd	%xmm4,(%r8,%rax,8)
	cmpl	%r10d,%edx
	jnle	.Lj47
	.balign 4,0x90
.Lj46:
	.balign 4,0x90
.Lj44:
# [81] pivot := A[k * w + k];
	movq	-8(%rbp),%rcx
	movslq	-48(%rbp),%rdx
	movslq	%r11d,%rax
	imulq	%rax,%rdx
	addq	%rdx,%rax
	movsd	(%rcx,%rax,8),%xmm5
# [82] for j := 0 to w - 1 do
	movl	-48(%rbp),%eax
	leal	-1(%eax),%ecx
	testl	%ecx,%ecx
	jnge	.Lj51
	movl	$-1,%r10d
	.balign 8,0x90
.Lj52:
	addl	$1,%r10d
# [83] A[k * w + j] := A[k * w + j] / pivot;
	movq	-8(%rbp),%r8
	movslq	%r11d,%rdx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rdx
	movslq	%r10d,%rax
	addq	%rax,%rdx
	movsd	(%r8,%rdx,8),%xmm1
	divsd	%xmm5,%xmm1
	movq	-8(%rbp),%rax
	movsd	%xmm1,(%rax,%rdx,8)
	cmpl	%r10d,%ecx
	jnle	.Lj52
	.balign 4,0x90
.Lj51:
# [85] for i := 0 to sz - 1 do
	movl	-40(%rbp),%eax
	leal	-1(%eax),%r14d
	testl	%r14d,%r14d
	jnge	.Lj56
	movl	$-1,%r15d
	.balign 8,0x90
.Lj57:
	addl	$1,%r15d
# [86] if i <> k then
	cmpl	%r15d,%r11d
	je	.Lj61
# [88] ratio := A[i * w + k];
	movq	-8(%rbp),%rcx
	movslq	%r15d,%rdx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rdx
	movslq	%r11d,%rax
	addq	%rdx,%rax
	movsd	(%rcx,%rax,8),%xmm2
# [89] if ratio <> 0.0 then
	comisd	_$SOMA_CORE$_Ld3(%rip),%xmm2
	jp	.Lj62
	je	.Lj63
.Lj62:
# [90] for j := 0 to w - 1 do
	movl	-48(%rbp),%eax
	subl	$1,%eax
	testl	%eax,%eax
	jnge	.Lj65
	movl	$-1,%r10d
	.balign 8,0x90
.Lj66:
	addl	$1,%r10d
# [91] A[i * w + j] := A[i * w + j] - ratio * A[k * w + j];
	movq	-8(%rbp),%rdx
	movslq	%r15d,%rsi
	movslq	-48(%rbp),%rcx
	imulq	%rcx,%rsi
	movslq	%r10d,%r8
	addq	%r8,%rsi
	movq	-8(%rbp),%rdi
	movq	%rdi,-16(%rbp)
	movq	%rdi,%r12
	movslq	%r11d,%r13
	imulq	%rcx,%r13
	leaq	(%r8,%r13),%rcx
	movapd	%xmm2,%xmm1
	mulsd	(%r12,%rcx,8),%xmm1
	movsd	(%rdi,%rsi,8),%xmm3
	subsd	%xmm1,%xmm3
	movsd	%xmm3,(%rdx,%rsi,8)
	cmpl	%r10d,%eax
	jnle	.Lj66
	.balign 4,0x90
.Lj65:
	.balign 4,0x90
.Lj63:
	.balign 4,0x90
.Lj61:
	cmpl	%r15d,%r14d
	jnle	.Lj57
	.balign 4,0x90
.Lj56:
	cmpl	%r11d,%r9d
	jnle	.Lj29
	.balign 4,0x90
.Lj28:
# [95] for i := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%ecx
	testl	%ecx,%ecx
	jnge	.Lj70
	movl	$-1,%r15d
	.balign 8,0x90
.Lj71:
	addl	$1,%r15d
# [96] for j := 0 to sz - 1 do
	movl	-40(%rbp),%eax
	leal	-1(%eax),%r8d
	testl	%r8d,%r8d
	jnge	.Lj75
	movl	$-1,%r10d
	.balign 8,0x90
.Lj76:
	addl	$1,%r10d
# [97] FS[MatrixBase + i * sz + j] := A[i * w + sz + j];
	movslq	%r15d,%rax
	movq	%rax,%r11
	movslq	-40(%rbp),%rax
	movq	%rax,%rbx
	imulq	%r11,%rax
	movq	-32(%rbp),%rdx
	leaq	(%rdx,%rax),%r9
	movslq	%r10d,%rax
	movq	%rax,%rsi
	addq	%rsi,%r9
	movq	-8(%rbp),%rdx
	movslq	-48(%rbp),%rax
	imulq	%r11,%rax
	addq	%rbx,%rax
	addq	%rsi,%rax
	movq	(%rdx,%rax,8),%rdx
	movq	-56(%rbp),%rax
	movq	%rdx,(%rax,%r9,8)
	cmpl	%r10d,%r8d
	jnle	.Lj76
	.balign 4,0x90
.Lj75:
	cmpl	%r15d,%ecx
	jnle	.Lj71
	.balign 4,0x90
.Lj70:
.Lj9:
	nop
.Lj8:
	movq	%rbp,%rcx
	call	SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
	movb	-24(%rbp),%al
	movq	-128(%rbp),%rbx
	movq	-120(%rbp),%rdi
	movq	-112(%rbp),%rsi
	movq	-104(%rbp),%r12
	movq	-96(%rbp),%r13
	movq	-88(%rbp),%r14
	movq	-80(%rbp),%r15
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_handler __FPC_specific_handler,@unwind
.seh_handlerdata
	.long	1
	.long	0
	.rva	.Lj7
	.rva	.Lj8
	.rva	SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002

.section .text.n_soma_core_$$_soma_matinverse$pointer$int64$int64$$boolean,"x"
.seh_endproc
.Lc7:

.section .text.n_soma_core_$$_soma_sigmoid$double$$double,"x"
	.balign 16,0x90
SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE:
.Lc11:
.seh_proc SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
# [101] begin
	leaq	-40(%rsp),%rsp
.Lc13:
.seh_stackalloc 40
.seh_endprologue
# Var $result located in register xmm0
# Var X located in register xmm0
# [102] Result := 1.0 / (1.0 + Exp(-X));
	movsd	_$SOMA_CORE$_Ld5(%rip),%xmm1
	xorpd	%xmm1,%xmm0
	call	fpc_exp_real
	movapd	%xmm0,%xmm1
	addsd	_$SOMA_CORE$_Ld4(%rip),%xmm1
	movsd	_$SOMA_CORE$_Ld4(%rip),%xmm0
	divsd	%xmm1,%xmm0
# Var $result located in register xmm0
# [103] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc12:

.section .text.n_soma_core_$$_soma_tanh$double$$double,"x"
	.balign 16,0x90
SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE:
.Lc14:
.seh_proc SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
# [106] begin
	leaq	-40(%rsp),%rsp
.Lc16:
.seh_stackalloc 40
.seh_endprologue
# Var $result located in register xmm0
# Var X located in register xmm0
# Var X located in register xmm0
# [107] Result := Math.Tanh(X);
	call	MATH_$$_TANH$DOUBLE$$DOUBLE
# Var $result located in register xmm0
# [108] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc15:

.section .text.n_soma_core_$$_execute$tvmstate,"x"
	.balign 16,0x90
.globl	SOMA_CORE_$$_EXECUTE$TVMSTATE
SOMA_CORE_$$_EXECUTE$TVMSTATE:
.Lc17:
.seh_proc SOMA_CORE_$$_EXECUTE$TVMSTATE
# [111] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc19:
.Lc20:
	movq	%rsp,%rbp
.Lc21:
	leaq	-16(%rsp),%rsp
.seh_stackalloc 16
.seh_endprologue
# Var State located at rbp-8, size=OS_64
	movq	%rcx,-8(%rbp)
#  CPU ATHLON64
# [114] push rbx
	pushq	%rbx
# [115] push r12
	pushq	%r12
# [116] push r13
	pushq	%r13
# [117] push r14
	pushq	%r14
# [118] push r15
	pushq	%r15
# [120] sub  rsp, 64
	subq	$64,%rsp
# [121] movdqu [rsp+$00], xmm6
	movdqu	%xmm6,(%rsp)
# [122] movdqu [rsp+$10], xmm7
	movdqu	%xmm7,16(%rsp)
# [123] movdqu [rsp+$20], xmm8
	movdqu	%xmm8,32(%rsp)
# [124] movdqu [rsp+$30], xmm9
	movdqu	%xmm9,48(%rsp)
# [128] mov rbx, rcx
	movq	%rcx,%rbx
# [133] mov r12, [rbx + IP_OFFSET]
	movq	4368(%rbx),%r12
# [134] mov r13, [rbx + ISP_OFFSET]
	movq	4352(%rbx),%r13
# [135] mov r14, [rbx + FSP_OFFSET]
	movq	4360(%rbx),%r14
# [136] lea r15, [rip + @JumpTable]
	leaq	.Lj85(%rip),%r15
# [139] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_NONE
	movq	$0,4384(%rbx)
# [140] mov qword ptr [rbx + EXEC_COUNT_OFFSET],   0
	movq	$0,37160(%rbx)
# [153] sub     rsp, 8
	subq	$8,%rsp
# [154] stmxcsr [rsp]
	stmxcsr	(%rsp)
# [155] or      dword ptr [rsp], $1F80
	orl	$8064,(%rsp)
# [156] ldmxcsr [rsp]
	ldmxcsr	(%rsp)
# [157] fnstcw  [rsp]
	fnstcw	(%rsp)
# [158] or      word ptr [rsp], $003F
	orw	$63,(%rsp)
# [159] fldcw   [rsp]
	fldcw	(%rsp)
# [160] add     rsp, 8
	addq	$8,%rsp
.Lj86:
# [163] cmp r12, GENOME_SIZE
	cmpq	$4096,%r12
# [164] jge @HaltBounds
	jge	.Lj87
# [165] cmp r12, 0
	cmpq	$0,%r12
# [166] jl  @HaltBounds
	jl	.Lj87
# [176] inc qword ptr [rbx + EXEC_COUNT_OFFSET]
	incq	37160(%rbx)
# [177] cmp qword ptr [rbx + EXEC_COUNT_OFFSET], MAX_EXEC_CYCLES
	cmpq	$65536,37160(%rbx)
# [178] jge @HaltCycleLimit
	jge	.Lj88
# [192] cmp r13, 0
	cmpq	$0,%r13
# [193] jge @ISPFloorOK
	jge	.Lj89
# [194] xor r13, r13
	xorq	%r13,%r13
.Lj89:
# [196] cmp r13, STACK_SIZE
	cmpq	$256,%r13
# [197] jle @ISPCeilOK
	jle	.Lj90
# [198] mov r13, STACK_SIZE
	movq	$256,%r13
.Lj90:
# [200] cmp r14, 0
	cmpq	$0,%r14
# [201] jge @FSPFloorOK
	jge	.Lj91
# [202] xor r14, r14
	xorq	%r14,%r14
.Lj91:
# [204] cmp r14, STACK_SIZE
	cmpq	$256,%r14
# [205] jle @FSPCeilOK
	jle	.Lj92
# [206] mov r14, STACK_SIZE
	movq	$256,%r14
.Lj92:
# [209] movzx rax, word ptr [rbx + GENOME_OFFSET + r12*8]
	movzwq	4392(%rbx,%r12,8),%rax
# [210] cmp   rax, LAYER0_MAX
	cmpq	$255,%rax
# [211] jg    @HigherLayer
	jg	.Lj93
# [212] jmp   qword ptr [r15 + rax*8]
	jmp	*(%r15,%rax,8)
.Lj85:
	.quad	.Lj94
	.quad	.Lj95
	.quad	.Lj96
	.quad	.Lj97
	.quad	.Lj98
	.quad	.Lj99
	.quad	.Lj100
	.quad	.Lj101
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj103
	.quad	.Lj104
	.quad	.Lj105
	.quad	.Lj106
	.quad	.Lj107
	.quad	.Lj108
	.quad	.Lj109
	.quad	.Lj110
	.quad	.Lj111
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj112
	.quad	.Lj113
	.quad	.Lj114
	.quad	.Lj115
	.quad	.Lj116
	.quad	.Lj117
	.quad	.Lj118
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj119
	.quad	.Lj120
	.quad	.Lj121
	.quad	.Lj122
	.quad	.Lj123
	.quad	.Lj124
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj125
	.quad	.Lj126
	.quad	.Lj127
	.quad	.Lj128
	.quad	.Lj129
	.quad	.Lj130
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj131
	.quad	.Lj132
	.quad	.Lj133
	.quad	.Lj134
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj135
	.quad	.Lj136
	.quad	.Lj137
	.quad	.Lj138
	.quad	.Lj139
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj140
	.quad	.Lj141
	.quad	.Lj142
	.quad	.Lj143
	.quad	.Lj144
	.quad	.Lj145
	.quad	.Lj146
	.quad	.Lj147
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj148
	.quad	.Lj149
	.quad	.Lj150
	.quad	.Lj151
	.quad	.Lj152
	.quad	.Lj153
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj154
	.quad	.Lj155
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj156
	.quad	.Lj157
	.quad	.Lj158
	.quad	.Lj159
	.quad	.Lj160
	.quad	.Lj161
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj162
	.quad	.Lj163
	.quad	.Lj164
	.quad	.Lj165
	.quad	.Lj166
	.quad	.Lj167
	.quad	.Lj168
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
	.quad	.Lj102
.Lj102:
# [306] inc r12
	incq	%r12
# [307] jmp @Loop
	jmp	.Lj86
.Lj94:
# [312] inc r12
	incq	%r12
# [313] jmp @Loop
	jmp	.Lj86
.Lj95:
# [316] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
# [317] mov    [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [318] inc    r13
	incq	%r13
# [319] inc    r12
	incq	%r12
# [320] jmp    @Loop
	jmp	.Lj86
.Lj96:
# [323] dec r13
	decq	%r13
# [324] inc r12
	incq	%r12
# [325] jmp @Loop
	jmp	.Lj86
.Lj97:
# [328] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [329] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [330] inc r13
	incq	%r13
# [331] inc r12
	incq	%r12
# [332] jmp @Loop
	jmp	.Lj86
.Lj98:
# [335] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [336] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rcx
# [337] mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rcx
	movq	%rcx,248(%rbx,%r13,8)
# [338] mov [rbx + ISTACK_OFFSET + r13*8 - 16], rax
	movq	%rax,240(%rbx,%r13,8)
# [339] inc r12
	incq	%r12
# [340] jmp @Loop
	jmp	.Lj86
.Lj99:
# [343] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [344] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [345] inc r13
	incq	%r13
# [346] inc r12
	incq	%r12
# [347] jmp @Loop
	jmp	.Lj86
.Lj100:
# [350] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 24]
	movq	232(%rbx,%r13,8),%rax
# [351] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rcx
# [352] mov rdx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rdx
# [353] mov [rbx + ISTACK_OFFSET + r13*8 - 24], rcx
	movq	%rcx,232(%rbx,%r13,8)
# [354] mov [rbx + ISTACK_OFFSET + r13*8 - 16], rdx
	movq	%rdx,240(%rbx,%r13,8)
# [355] mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rax
	movq	%rax,248(%rbx,%r13,8)
# [356] inc r12
	incq	%r12
# [357] jmp @Loop
	jmp	.Lj86
.Lj101:
# [360] dec r13
	decq	%r13
# [361] inc r12
	incq	%r12
# [362] jmp @Loop
	jmp	.Lj86
.Lj103:
# [367] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [368] add rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	addq	240(%rbx,%r13,8),%rax
# [369] dec r13
	decq	%r13
# [370] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [371] inc r12
	incq	%r12
# [372] jmp @Loop
	jmp	.Lj86
.Lj104:
# [375] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [376] sub rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	subq	248(%rbx,%r13,8),%rax
# [377] dec r13
	decq	%r13
# [378] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [379] inc r12
	incq	%r12
# [380] jmp @Loop
	jmp	.Lj86
.Lj105:
# [383] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [384] imul rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	imulq	240(%rbx,%r13,8),%rax
# [385] dec  r13
	decq	%r13
# [386] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [387] inc  r12
	incq	%r12
# [388] jmp  @Loop
	jmp	.Lj86
.Lj106:
# [391] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [392] mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
# [393] test rcx, rcx
	testq	%rcx,%rcx
# [394] jz   @HaltDivZero
	jz	.Lj169
# [395] cmp  rcx, -1
	cmpq	$-1,%rcx
# [396] jne  @DIV_SafeDivisor
	jne	.Lj170
# [397] mov  r8, $8000000000000000    // Int64.MinValue -- idiv traps if
	movq	$-9223372036854775808,%r8
# [398] cmp  rax, r8                  // dividend=MinValue and divisor=-1
	cmpq	%r8,%rax
# [399] je   @HaltIntOverflow
	je	.Lj171
.Lj170:
# [401] cqo
	cqto
# [402] idiv rcx
	idivq	%rcx
# [403] dec  r13
	decq	%r13
# [404] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [405] inc  r12
	incq	%r12
# [406] jmp  @Loop
	jmp	.Lj86
.Lj107:
# [409] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [410] mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
# [411] test rcx, rcx
	testq	%rcx,%rcx
# [412] jz   @HaltDivZero
	jz	.Lj169
# [413] cmp  rcx, -1
	cmpq	$-1,%rcx
# [414] jne  @MOD_SafeDivisor
	jne	.Lj172
# [415] mov  r8, $8000000000000000
	movq	$-9223372036854775808,%r8
# [416] cmp  rax, r8
	cmpq	%r8,%rax
# [417] je   @HaltIntOverflow
	je	.Lj171
.Lj172:
# [419] cqo
	cqto
# [420] idiv rcx
	idivq	%rcx
# [421] dec  r13
	decq	%r13
# [422] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rdx
	movq	%rdx,248(%rbx,%r13,8)
# [423] inc  r12
	incq	%r12
# [424] jmp  @Loop
	jmp	.Lj86
.Lj108:
# [427] neg qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	negq	248(%rbx,%r13,8)
# [428] inc r12
	incq	%r12
# [429] jmp @Loop
	jmp	.Lj86
.Lj109:
# [432] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [433] mov  rcx, rax
	movq	%rax,%rcx
# [434] neg  rcx
	negq	%rcx
# [435] cmovl rax, rcx
	cmovlq	%rcx,%rax
# [436] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [437] inc  r12
	incq	%r12
# [438] jmp  @Loop
	jmp	.Lj86
.Lj110:
# [441] inc qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	incq	248(%rbx,%r13,8)
# [442] inc r12
	incq	%r12
# [443] jmp @Loop
	jmp	.Lj86
.Lj111:
# [446] dec qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	decq	248(%rbx,%r13,8)
# [447] inc r12
	incq	%r12
# [448] jmp @Loop
	jmp	.Lj86
.Lj112:
# [453] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [454] and rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	andq	240(%rbx,%r13,8),%rax
# [455] dec r13
	decq	%r13
# [456] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [457] inc r12
	incq	%r12
# [458] jmp @Loop
	jmp	.Lj86
.Lj113:
# [461] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [462] or  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	orq	240(%rbx,%r13,8),%rax
# [463] dec r13
	decq	%r13
# [464] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [465] inc r12
	incq	%r12
# [466] jmp @Loop
	jmp	.Lj86
.Lj114:
# [469] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [470] xor rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	xorq	240(%rbx,%r13,8),%rax
# [471] dec r13
	decq	%r13
# [472] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [473] inc r12
	incq	%r12
# [474] jmp @Loop
	jmp	.Lj86
.Lj115:
# [477] not qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	notq	248(%rbx,%r13,8)
# [478] inc r12
	incq	%r12
# [479] jmp @Loop
	jmp	.Lj86
.Lj116:
# [482] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
# [483] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [484] shl rax, cl
	shlq	%cl,%rax
# [485] dec r13
	decq	%r13
# [486] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [487] inc r12
	incq	%r12
# [488] jmp @Loop
	jmp	.Lj86
.Lj117:
# [491] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
# [492] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [493] shr rax, cl
	shrq	%cl,%rax
# [494] dec r13
	decq	%r13
# [495] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [496] inc r12
	incq	%r12
# [497] jmp @Loop
	jmp	.Lj86
.Lj118:
# [500] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
# [501] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [502] sar rax, cl
	sarq	%cl,%rax
# [503] dec r13
	decq	%r13
# [504] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [505] inc r12
	incq	%r12
# [506] jmp @Loop
	jmp	.Lj86
.Lj119:
# [511] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [512] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
# [513] sete  al
	seteb	%al
# [514] movzx rax, al
	movzbq	%al,%rax
# [515] dec   r13
	decq	%r13
# [516] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [517] inc   r12
	incq	%r12
# [518] jmp   @Loop
	jmp	.Lj86
.Lj120:
# [521] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [522] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
# [523] setne al
	setneb	%al
# [524] movzx rax, al
	movzbq	%al,%rax
# [525] dec   r13
	decq	%r13
# [526] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [527] inc   r12
	incq	%r12
# [528] jmp   @Loop
	jmp	.Lj86
.Lj121:
# [531] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [532] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
# [533] setl  al
	setlb	%al
# [534] movzx rax, al
	movzbq	%al,%rax
# [535] dec   r13
	decq	%r13
# [536] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [537] inc   r12
	incq	%r12
# [538] jmp   @Loop
	jmp	.Lj86
.Lj122:
# [541] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [542] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
# [543] setg  al
	setgb	%al
# [544] movzx rax, al
	movzbq	%al,%rax
# [545] dec   r13
	decq	%r13
# [546] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [547] inc   r12
	incq	%r12
# [548] jmp   @Loop
	jmp	.Lj86
.Lj123:
# [551] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [552] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
# [553] setle al
	setleb	%al
# [554] movzx rax, al
	movzbq	%al,%rax
# [555] dec   r13
	decq	%r13
# [556] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [557] inc   r12
	incq	%r12
# [558] jmp   @Loop
	jmp	.Lj86
.Lj124:
# [561] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
# [562] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
# [563] setge al
	setgeb	%al
# [564] movzx rax, al
	movzbq	%al,%rax
# [565] dec   r13
	decq	%r13
# [566] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
# [567] inc   r12
	incq	%r12
# [568] jmp   @Loop
	jmp	.Lj86
.Lj125:
# [573] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
# [574] add    r12, rax
	addq	%rax,%r12
# [575] jmp    @Loop
	jmp	.Lj86
.Lj126:
# [578] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [579] dec  r13
	decq	%r13
# [580] test rax, rax
	testq	%rax,%rax
# [581] jnz  @JZ_Skip
	jnz	.Lj173
# [582] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
# [583] add    r12, rax
	addq	%rax,%r12
# [584] jmp    @Loop
	jmp	.Lj86
.Lj173:
# [586] inc r12
	incq	%r12
# [587] jmp @Loop
	jmp	.Lj86
.Lj127:
# [590] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [591] dec  r13
	decq	%r13
# [592] test rax, rax
	testq	%rax,%rax
# [593] jz   @JNZ_Skip
	jz	.Lj174
# [594] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
# [595] add    r12, rax
	addq	%rax,%r12
# [596] jmp    @Loop
	jmp	.Lj86
.Lj174:
# [598] inc r12
	incq	%r12
# [599] jmp @Loop
	jmp	.Lj86
.Lj128:
# [602] lea  rax, [r12 + 1]
	leaq	1(%r12),%rax
# [603] mov  [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [604] inc  r13
	incq	%r13
# [605] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
# [606] add    r12, rax
	addq	%rax,%r12
# [607] jmp    @Loop
	jmp	.Lj86
.Lj129:
# [610] dec r13
	decq	%r13
# [611] mov r12, [rbx + ISTACK_OFFSET + r13*8]
	movq	256(%rbx,%r13,8),%r12
# [612] jmp @Loop
	jmp	.Lj86
.Lj130:
# [615] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HALT
	movq	$1,4384(%rbx)
# [616] jmp @Exit
	jmp	.Lj175
.Lj131:
.Lj132:
.Lj133:
.Lj134:
# [628] inc r12
	incq	%r12
# [629] jmp @Loop
	jmp	.Lj86
.Lj135:
# [634] movsxd   rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
# [635] cvtsi2sd xmm0, rax
	cvtsi2sdq	%rax,%xmm0
# [636] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
# [637] inc      r14
	incq	%r14
# [638] inc      r12
	incq	%r12
# [639] jmp      @Loop
	jmp	.Lj86
.Lj136:
# [642] dec r14
	decq	%r14
# [643] inc r12
	incq	%r12
# [644] jmp @Loop
	jmp	.Lj86
.Lj137:
# [647] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [648] movsd [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
# [649] inc   r14
	incq	%r14
# [650] inc   r12
	incq	%r12
# [651] jmp   @Loop
	jmp	.Lj86
.Lj138:
# [654] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [655] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm1
# [656] movsd [rbx + FSTACK_OFFSET + r14*8 - 8],  xmm1
	movsd	%xmm1,2296(%rbx,%r14,8)
# [657] movsd [rbx + FSTACK_OFFSET + r14*8 - 16], xmm0
	movsd	%xmm0,2288(%rbx,%r14,8)
# [658] inc   r12
	incq	%r12
# [659] jmp   @Loop
	jmp	.Lj86
.Lj139:
# [662] dec r14
	decq	%r14
# [663] inc r12
	incq	%r12
# [664] jmp @Loop
	jmp	.Lj86
.Lj140:
# [669] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [670] addsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	addsd	2296(%rbx,%r14,8),%xmm0
# [671] dec   r14
	decq	%r14
# [672] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [673] inc   r12
	incq	%r12
# [674] jmp   @Loop
	jmp	.Lj86
.Lj141:
# [677] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [678] subsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	subsd	2296(%rbx,%r14,8),%xmm0
# [679] dec   r14
	decq	%r14
# [680] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [681] inc   r12
	incq	%r12
# [682] jmp   @Loop
	jmp	.Lj86
.Lj142:
# [685] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [686] mulsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	mulsd	2296(%rbx,%r14,8),%xmm0
# [687] dec   r14
	decq	%r14
# [688] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [689] inc   r12
	incq	%r12
# [690] jmp   @Loop
	jmp	.Lj86
.Lj143:
# [693] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [694] movsd   xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm1
# [695] xorpd   xmm2, xmm2
	xorpd	%xmm2,%xmm2
# [696] ucomisd xmm1, xmm2
	ucomisd	%xmm2,%xmm1
# [697] je      @HaltFDivZero
	je	.Lj176
# [698] divsd   xmm0, xmm1
	divsd	%xmm1,%xmm0
# [699] dec     r14
	decq	%r14
# [700] movsd   [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [701] inc     r12
	incq	%r12
# [702] jmp     @Loop
	jmp	.Lj86
.Lj144:
# [705] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [706] mov    rax,  $8000000000000000
	movq	$-9223372036854775808,%rax
# [707] movq   xmm1, rax
	movq	%rax,%xmm1
# [708] xorpd  xmm0, xmm1
	xorpd	%xmm1,%xmm0
# [709] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [710] inc    r12
	incq	%r12
# [711] jmp    @Loop
	jmp	.Lj86
.Lj145:
# [714] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [715] mov    rax,  $7FFFFFFFFFFFFFFF
	movq	$9223372036854775807,%rax
# [716] movq   xmm1, rax
	movq	%rax,%xmm1
# [717] andpd  xmm0, xmm1
	andpd	%xmm1,%xmm0
# [718] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [719] inc    r12
	incq	%r12
# [720] jmp    @Loop
	jmp	.Lj86
.Lj146:
# [723] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [724] sqrtsd xmm0, xmm0
	sqrtsd	%xmm0,%xmm0
# [725] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [726] inc    r12
	incq	%r12
# [727] jmp    @Loop
	jmp	.Lj86
.Lj147:
# [730] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [731] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm1
# [732] sub   rsp, 16
	subq	$16,%rsp
# [733] movsd [rsp],   xmm1
	movsd	%xmm1,(%rsp)
# [734] movsd [rsp+8], xmm0
	movsd	%xmm0,8(%rsp)
# [735] fld   qword ptr [rsp]
	fldl	(%rsp)
# [736] fld   qword ptr [rsp+8]
	fldl	8(%rsp)
# [737] fprem
	fprem
# [738] fstp  qword ptr [rsp+8]
	fstpl	8(%rsp)
# [739] fstp  qword ptr [rsp]
	fstpl	(%rsp)
# [740] movsd xmm0, [rsp+8]
	movsd	8(%rsp),%xmm0
# [741] add   rsp, 16
	addq	$16,%rsp
# [742] dec   r14
	decq	%r14
# [743] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [744] inc   r12
	incq	%r12
# [745] jmp   @Loop
	jmp	.Lj86
.Lj148:
# [750] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [751] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
# [752] sete    al
	seteb	%al
# [753] movzx   rax, al
	movzbq	%al,%rax
# [754] dec     r14
	decq	%r14
# [755] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [756] inc     r13
	incq	%r13
# [757] inc     r12
	incq	%r12
# [758] jmp     @Loop
	jmp	.Lj86
.Lj149:
# [761] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [762] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
# [763] setne   al
	setneb	%al
# [764] movzx   rax, al
	movzbq	%al,%rax
# [765] dec     r14
	decq	%r14
# [766] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [767] inc     r13
	incq	%r13
# [768] inc     r12
	incq	%r12
# [769] jmp     @Loop
	jmp	.Lj86
.Lj150:
# [772] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [773] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
# [774] setb    al
	setbb	%al
# [775] movzx   rax, al
	movzbq	%al,%rax
# [776] dec     r14
	decq	%r14
# [777] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [778] inc     r13
	incq	%r13
# [779] inc     r12
	incq	%r12
# [780] jmp     @Loop
	jmp	.Lj86
.Lj151:
# [783] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [784] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
# [785] seta    al
	setab	%al
# [786] movzx   rax, al
	movzbq	%al,%rax
# [787] dec     r14
	decq	%r14
# [788] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [789] inc     r13
	incq	%r13
# [790] inc     r12
	incq	%r12
# [791] jmp     @Loop
	jmp	.Lj86
.Lj152:
# [794] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [795] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
# [796] setbe   al
	setbeb	%al
# [797] movzx   rax, al
	movzbq	%al,%rax
# [798] dec     r14
	decq	%r14
# [799] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [800] inc     r13
	incq	%r13
# [801] inc     r12
	incq	%r12
# [802] jmp     @Loop
	jmp	.Lj86
.Lj153:
# [805] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
# [806] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
# [807] setae   al
	setaeb	%al
# [808] movzx   rax, al
	movzbq	%al,%rax
# [809] dec     r14
	decq	%r14
# [810] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [811] inc     r13
	incq	%r13
# [812] inc     r12
	incq	%r12
# [813] jmp     @Loop
	jmp	.Lj86
.Lj154:
# [818] mov      rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
# [819] dec      r13
	decq	%r13
# [820] cvtsi2sd xmm0, rax
	cvtsi2sdq	%rax,%xmm0
# [821] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
# [822] inc      r14
	incq	%r14
# [823] inc      r12
	incq	%r12
# [824] jmp      @Loop
	jmp	.Lj86
.Lj155:
# [827] movsd     xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [828] dec       r14
	decq	%r14
# [829] cvttsd2si rax, xmm0
	cvttsd2siq	%xmm0,%rax
# [830] mov       [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [831] inc       r13
	incq	%r13
# [832] inc       r12
	incq	%r12
# [833] jmp       @Loop
	jmp	.Lj86
.Lj156:
# [838] mov rcx, [rbx + RNG_OFFSET]
	movq	4376(%rbx),%rcx
# [839] mov rax, rcx
	movq	%rcx,%rax
# [840] shl rax, 13
	shlq	$13,%rax
# [841] xor rcx, rax
	xorq	%rax,%rcx
# [842] mov rax, rcx
	movq	%rcx,%rax
# [843] shr rax, 7
	shrq	$7,%rax
# [844] xor rcx, rax
	xorq	%rax,%rcx
# [845] mov rax, rcx
	movq	%rcx,%rax
# [846] shl rax, 17
	shlq	$17,%rax
# [847] xor rcx, rax
	xorq	%rax,%rcx
# [848] mov [rbx + RNG_OFFSET], rcx
	movq	%rcx,4376(%rbx)
# [849] mov [rbx + ISTACK_OFFSET + r13*8], rcx
	movq	%rcx,256(%rbx,%r13,8)
# [850] inc r13
	incq	%r13
# [851] inc r12
	incq	%r12
# [852] jmp @Loop
	jmp	.Lj86
.Lj157:
# [855] mov rcx, [rbx + RNG_OFFSET]
	movq	4376(%rbx),%rcx
# [856] mov rax, rcx
	movq	%rcx,%rax
# [857] shl rax, 13
	shlq	$13,%rax
# [858] xor rcx, rax
	xorq	%rax,%rcx
# [859] mov rax, rcx
	movq	%rcx,%rax
# [860] shr rax, 7
	shrq	$7,%rax
# [861] xor rcx, rax
	xorq	%rax,%rcx
# [862] mov rax, rcx
	movq	%rcx,%rax
# [863] shl rax, 17
	shlq	$17,%rax
# [864] xor rcx, rax
	xorq	%rax,%rcx
# [865] mov [rbx + RNG_OFFSET], rcx
	movq	%rcx,4376(%rbx)
# [866] shr rcx, 11
	shrq	$11,%rcx
# [867] cvtsi2sd xmm0, rcx
	cvtsi2sdq	%rcx,%xmm0
# [868] mov      rax,  $3CA0000000000000
	movq	$4368491638549381120,%rax
# [869] movq     xmm1, rax
	movq	%rax,%xmm1
# [870] mulsd    xmm0, xmm1
	mulsd	%xmm1,%xmm0
# [871] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
# [872] inc      r14
	incq	%r14
# [873] inc      r12
	incq	%r12
# [874] jmp      @Loop
	jmp	.Lj86
.Lj158:
# [877] rdtsc
	rdtsc
# [878] shl rdx, 32
	shlq	$32,%rdx
# [879] or  rax, rdx
	orq	%rdx,%rax
# [880] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
# [881] inc r13
	incq	%r13
# [882] inc r12
	incq	%r12
# [883] jmp @Loop
	jmp	.Lj86
.Lj159:
# [886] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_YIELD
	movq	$2,4384(%rbx)
# [887] inc r12
	incq	%r12
# [888] jmp @Exit
	jmp	.Lj175
.Lj160:
.Lj161:
# [894] inc r12
	incq	%r12
# [895] jmp @Loop
	jmp	.Lj86
.Lj162:
# [907] movsxd rcx, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rcx
# [908] cmp    rcx, 1
	cmpq	$1,%rcx
# [909] jl     @HaltBadOperand
	jl	.Lj177
# [910] cmp    rcx, MAX_NN_WIDTH
	cmpq	$8,%rcx
# [911] jg     @HaltBadOperand
	jg	.Lj177
# [913] mov    rax, r14
	movq	%r14,%rax
# [914] sub    rax, rcx
	subq	%rcx,%rax
# [915] sub    rax, rcx           // rax = base = fsp - 2N  (start of vecA)
	subq	%rcx,%rax
# [916] cmp    rax, 0             // N validated above, but fsp may still not
	cmpq	$0,%rax
# [917] jl     @HaltInsufficientStack  // have had 2N elements available (see
	jl	.Lj178
# [919] xorpd  xmm0, xmm0         // accumulator
	xorpd	%xmm0,%xmm0
# [920] xor    rdx, rdx           // i = 0
	xorq	%rdx,%rdx
.Lj179:
# [922] cmp    rdx, rcx
	cmpq	%rcx,%rdx
# [923] jge    @VDOT_Done
	jge	.Lj180
# [924] mov    r8, rax
	movq	%rax,%r8
# [925] add    r8, rdx
	addq	%rdx,%r8
# [926] movsd  xmm1, [rbx + FSTACK_OFFSET + r8*8]   // A[i]
	movsd	2304(%rbx,%r8,8),%xmm1
# [927] mov    r9, rax
	movq	%rax,%r9
# [928] add    r9, rcx
	addq	%rcx,%r9
# [929] add    r9, rdx
	addq	%rdx,%r9
# [930] movsd  xmm2, [rbx + FSTACK_OFFSET + r9*8]   // B[i]
	movsd	2304(%rbx,%r9,8),%xmm2
# [931] mulsd  xmm1, xmm2
	mulsd	%xmm2,%xmm1
# [932] addsd  xmm0, xmm1
	addsd	%xmm1,%xmm0
# [933] inc    rdx
	incq	%rdx
# [934] jmp    @VDOT_Loop
	jmp	.Lj179
.Lj180:
# [936] mov    r14, rax
	movq	%rax,%r14
# [937] movsd  [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
# [938] inc    r14
	incq	%r14
# [939] inc    r12
	incq	%r12
# [940] jmp    @Loop
	jmp	.Lj86
.Lj163:
# [945] movsxd rcx, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rcx
# [946] cmp    rcx, 1
	cmpq	$1,%rcx
# [947] jl     @HaltBadOperand
	jl	.Lj177
# [948] cmp    rcx, MAX_NN_WIDTH
	cmpq	$8,%rcx
# [949] jg     @HaltBadOperand
	jg	.Lj177
# [951] mov    rax, rcx
	movq	%rcx,%rax
# [952] imul   rax, rcx            // rax = N*N
	imulq	%rcx,%rax
# [953] mov    r8, rax
	movq	%rax,%r8
# [954] add    r8, rcx              // r8 = N*N + N  (total operand doubles)
	addq	%rcx,%r8
# [955] mov    r9, r14
	movq	%r14,%r9
# [956] sub    r9, r8                // r9 = matrixBase
	subq	%r8,%r9
# [957] cmp    r9, 0                 // N validated above, but this is the wide
	cmpq	$0,%r9
# [958] jl     @HaltInsufficientStack // one (N*N+N doubles) -- see HR_INSUFFICIENT_STACK
	jl	.Lj178
# [959] mov    r10, r9
	movq	%r9,%r10
# [960] add    r10, rax               // r10 = vectorBase = matrixBase + N*N
	addq	%rax,%r10
# [962] xor    r11, r11               // i = 0
	xorq	%r11,%r11
.Lj181:
# [964] cmp    r11, rcx
	cmpq	%rcx,%r11
# [965] jge    @MATVEC_Done
	jge	.Lj182
# [966] xorpd  xmm0, xmm0
	xorpd	%xmm0,%xmm0
# [967] xor    rdx, rdx              // j = 0
	xorq	%rdx,%rdx
.Lj183:
# [969] cmp    rdx, rcx
	cmpq	%rcx,%rdx
# [970] jge    @MATVEC_RowDone
	jge	.Lj184
# [971] mov    rax, r11
	movq	%r11,%rax
# [972] imul   rax, rcx
	imulq	%rcx,%rax
# [973] add    rax, rdx
	addq	%rdx,%rax
# [974] add    rax, r9
	addq	%r9,%rax
# [975] movsd  xmm1, [rbx + FSTACK_OFFSET + rax*8]   // M[i][j]
	movsd	2304(%rbx,%rax,8),%xmm1
# [976] mov    rax, r10
	movq	%r10,%rax
# [977] add    rax, rdx
	addq	%rdx,%rax
# [978] movsd  xmm2, [rbx + FSTACK_OFFSET + rax*8]   // V[j]
	movsd	2304(%rbx,%rax,8),%xmm2
# [979] mulsd  xmm1, xmm2
	mulsd	%xmm2,%xmm1
# [980] addsd  xmm0, xmm1
	addsd	%xmm1,%xmm0
# [981] inc    rdx
	incq	%rdx
# [982] jmp    @MATVEC_ColLoop
	jmp	.Lj183
.Lj184:
# [989] mov    rax, r9
	movq	%r9,%rax
# [990] add    rax, r11
	addq	%r11,%rax
# [991] movsd  [rbx + FSTACK_OFFSET + rax*8], xmm0
	movsd	%xmm0,2304(%rbx,%rax,8)
# [992] inc    r11
	incq	%r11
# [993] jmp    @MATVEC_RowLoop
	jmp	.Lj181
.Lj182:
# [995] mov    r14, r9
	movq	%r9,%r14
# [996] add    r14, rcx
	addq	%rcx,%r14
# [997] inc    r12
	incq	%r12
# [998] jmp    @Loop
	jmp	.Lj86
.Lj164:
# [1002] movsxd r11, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]   // r11 = N
	movslq	4396(%rbx,%r12,8),%r11
# [1003] cmp    r11, 1
	cmpq	$1,%r11
# [1004] jl     @HaltBadOperand
	jl	.Lj177
# [1005] cmp    r11, MAX_NN_WIDTH
	cmpq	$8,%r11
# [1006] jg     @HaltBadOperand
	jg	.Lj177
# [1008] mov    rax, r11
	movq	%r11,%rax
# [1009] imul   rax, r11             // rax = N*N
	imulq	%r11,%rax
# [1010] mov    r9, r14
	movq	%r14,%r9
# [1011] sub    r9, rax               // r9 = matrixBase = fsp - N*N
	subq	%rax,%r9
# [1012] cmp    r9, 0
	cmpq	$0,%r9
# [1013] jl     @HaltInsufficientStack
	jl	.Lj178
# [1020] mov    rcx, rsp                // save original rsp
	movq	%rsp,%rcx
# [1021] and    rsp, -16                // 16-byte align
	andq	$-16,%rsp
# [1023] sub    rsp, 48                  // 16 scratch + 32 Win64 shadow space
	subq	$48,%rsp
# [1027] mov    [rsp], rcx                 // stash original rsp
	movq	%rcx,(%rsp)
# [1030] mov    r8,  r9                     // arg2 = MatrixBase
	movq	%r9,%r8
# [1031] mov    rdx, r11                     // arg1 = N
	movq	%r11,%rdx
# [1032] mov    rcx, rbx                      // arg0 = StateBase
	movq	%rbx,%rcx
# [1038] call   Soma_MatInverse             // result (Boolean) returned in AL
	call	SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
# [1040] mov    r10, [rsp]                    // recover original rsp (AL untouched)
	movq	(%rsp),%r10
# [1041] mov    rsp, r10
	movq	%r10,%rsp
# [1042] test   al, al
	testb	%al,%al
# [1043] jz     @HaltSingular
	jz	.Lj185
# [1045] inc    r12
	incq	%r12
# [1046] jmp    @Loop
	jmp	.Lj86
.Lj165:
# [1050] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 24]   // acc
	movsd	2280(%rbx,%r14,8),%xmm0
# [1051] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]   // w
	movsd	2288(%rbx,%r14,8),%xmm1
# [1052] movsd xmm2, [rbx + FSTACK_OFFSET + r14*8 - 8]    // x
	movsd	2296(%rbx,%r14,8),%xmm2
# [1053] mulsd xmm1, xmm2
	mulsd	%xmm2,%xmm1
# [1054] addsd xmm0, xmm1
	addsd	%xmm1,%xmm0
# [1055] sub   r14, 2
	subq	$2,%r14
# [1056] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [1057] inc   r12
	incq	%r12
# [1058] jmp   @Loop
	jmp	.Lj86
.Lj166:
# [1061] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [1062] mov   rax, rsp                 // save original rsp (see OP_MATINV note
	movq	%rsp,%rax
# [1063] and   rsp, -16                 // above on why this can't be a register)
	andq	$-16,%rsp
# [1065] sub   rsp, 48
	subq	$48,%rsp
# [1069] mov   [rsp], rax
	movq	%rax,(%rsp)
# [1070] call  Soma_Sigmoid              // result returned in xmm0
	call	SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
# [1071] mov   r10, [rsp]
	movq	(%rsp),%r10
# [1072] mov   rsp, r10
	movq	%r10,%rsp
# [1073] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [1074] inc   r12
	incq	%r12
# [1075] jmp   @Loop
	jmp	.Lj86
.Lj167:
# [1078] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [1079] mov   rax, rsp
	movq	%rsp,%rax
# [1080] and   rsp, -16
	andq	$-16,%rsp
# [1082] sub   rsp, 48
	subq	$48,%rsp
# [1086] mov   [rsp], rax
	movq	%rax,(%rsp)
# [1087] call  Soma_Tanh
	call	SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
# [1088] mov   r10, [rsp]
	movq	(%rsp),%r10
# [1089] mov   rsp, r10
	movq	%r10,%rsp
# [1090] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [1091] inc   r12
	incq	%r12
# [1092] jmp   @Loop
	jmp	.Lj86
.Lj168:
# [1095] pxor  xmm1, xmm1
	pxor	%xmm1,%xmm1
# [1096] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
# [1097] maxsd xmm0, xmm1
	maxsd	%xmm1,%xmm0
# [1098] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
# [1099] inc   r12
	incq	%r12
# [1100] jmp   @Loop
	jmp	.Lj86
.Lj87:
# [1105] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BOUNDS
	movq	$3,4384(%rbx)
# [1106] jmp @Exit
	jmp	.Lj175
.Lj169:
# [1109] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_DIV_ZERO
	movq	$4,4384(%rbx)
# [1110] jmp @Exit
	jmp	.Lj175
.Lj171:
# [1113] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_INT_OVERFLOW
	movq	$11,4384(%rbx)
# [1114] jmp @Exit
	jmp	.Lj175
.Lj176:
# [1117] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_FDIV_ZERO
	movq	$5,4384(%rbx)
# [1118] jmp @Exit
	jmp	.Lj175
.Lj177:
# [1121] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BAD_OPERAND
	movq	$9,4384(%rbx)
# [1122] jmp @Exit
	jmp	.Lj175
.Lj185:
# [1125] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_SINGULAR_MATRIX
	movq	$8,4384(%rbx)
# [1126] jmp @Exit
	jmp	.Lj175
.Lj178:
# [1129] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_INSUFFICIENT_STACK
	movq	$12,4384(%rbx)
# [1130] jmp @Exit
	jmp	.Lj175
.Lj88:
# [1133] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_CYCLE_LIMIT
	movq	$10,4384(%rbx)
# [1134] jmp @Exit
	jmp	.Lj175
.Lj93:
# [1139] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HIGHER_LAYER
	movq	$7,4384(%rbx)
# [1140] mov [rbx + IP_OFFSET],  r12
	movq	%r12,4368(%rbx)
# [1141] mov [rbx + ISP_OFFSET], r13
	movq	%r13,4352(%rbx)
# [1142] mov [rbx + FSP_OFFSET], r14
	movq	%r14,4360(%rbx)
# [1143] jmp @ExitNoSave
	jmp	.Lj186
.Lj175:
# [1148] mov [rbx + IP_OFFSET],  r12
	movq	%r12,4368(%rbx)
# [1149] mov [rbx + ISP_OFFSET], r13
	movq	%r13,4352(%rbx)
# [1150] mov [rbx + FSP_OFFSET], r14
	movq	%r14,4360(%rbx)
.Lj186:
# [1154] movdqu xmm6, [rsp+$00]
	movdqu	(%rsp),%xmm6
# [1155] movdqu xmm7, [rsp+$10]
	movdqu	16(%rsp),%xmm7
# [1156] movdqu xmm8, [rsp+$20]
	movdqu	32(%rsp),%xmm8
# [1157] movdqu xmm9, [rsp+$30]
	movdqu	48(%rsp),%xmm9
# [1158] add    rsp, 64
	addq	$64,%rsp
# [1160] pop r15
	popq	%r15
# [1161] pop r14
	popq	%r14
# [1162] pop r13
	popq	%r13
# [1163] pop r12
	popq	%r12
# [1164] pop rbx
	popq	%rbx
#  CPU ATHLON64
# [1166] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc18:
# End asmlist al_procedures
# Begin asmlist al_typedconsts

.section .rodata.n__$SOMA_CORE$_Ld1,"d"
	.balign 4
.globl	_$SOMA_CORE$_Ld1
_$SOMA_CORE$_Ld1:
# value: 0d+1.000000000E+00
	.byte	0,0,128,63

.section .rodata.n__$SOMA_CORE$_Ld2,"d"
	.balign 8
.globl	_$SOMA_CORE$_Ld2
_$SOMA_CORE$_Ld2:
# value: 0d+9.9999999999999998E-013
	.byte	17,234,45,129,153,151,113,61

.section .rodata.n__$SOMA_CORE$_Ld3,"d"
	.balign 8
.globl	_$SOMA_CORE$_Ld3
_$SOMA_CORE$_Ld3:
# value: 0d+0.0000000000000000E+000
	.byte	0,0,0,0,0,0,0,0

.section .rodata.n__$SOMA_CORE$_Ld4,"d"
	.balign 8
.globl	_$SOMA_CORE$_Ld4
_$SOMA_CORE$_Ld4:
# value: 0d+1.0000000000000000E+000
	.byte	0,0,0,0,0,0,240,63

.section .rodata.n__$SOMA_CORE$_Ld5,"d"
	.balign 8
.globl	_$SOMA_CORE$_Ld5
_$SOMA_CORE$_Ld5:
	.long	0,-2147483648
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_CORE_$$_def00000003,"d"
	.balign 8
.globl	RTTI_$SOMA_CORE_$$_def00000003
RTTI_$SOMA_CORE_$$_def00000003:
	.byte	21,0
	.quad	8
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.long	5
	.quad	0
	.byte	9
# [1168] end.
	.ascii	"soma_core"
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_RTTI_$SOMA_CORE_$$_def00000003,"d"
	.balign 8
.globl	RTTI_$SOMA_CORE_$$_def00000003$indirect
RTTI_$SOMA_CORE_$$_def00000003$indirect:
	.quad	RTTI_$SOMA_CORE_$$_def00000003
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc22:
	.long	.Lc24-.Lc23
.Lc23:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc24:
	.long	.Lc26-.Lc25
.Lc25:
	.secrel32	.Lc22
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc4-.Lc3
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc5-.Lc4
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc26:
	.long	.Lc28-.Lc27
.Lc27:
	.secrel32	.Lc22
	.quad	.Lc6
	.quad	.Lc7-.Lc6
	.byte	4
	.long	.Lc8-.Lc6
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc9-.Lc8
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc10-.Lc9
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc28:
	.long	.Lc30-.Lc29
.Lc29:
	.secrel32	.Lc22
	.quad	.Lc11
	.quad	.Lc12-.Lc11
	.byte	4
	.long	.Lc13-.Lc11
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc30:
	.long	.Lc32-.Lc31
.Lc31:
	.secrel32	.Lc22
	.quad	.Lc14
	.quad	.Lc15-.Lc14
	.byte	4
	.long	.Lc16-.Lc14
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc32:
	.long	.Lc34-.Lc33
.Lc33:
	.secrel32	.Lc22
	.quad	.Lc17
	.quad	.Lc18-.Lc17
	.byte	4
	.long	.Lc19-.Lc17
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc20-.Lc19
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc21-.Lc20
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc34:
# End asmlist al_dwarf_frame

