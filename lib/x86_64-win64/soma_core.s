	.file "soma_core.pas"
# Begin asmlist al_begin

.section .debug_line
.Ldebug_linesection0:
.Ldebug_line0:

.section .debug_abbrev
.Ldebug_abbrevsection0:
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$SOMA_CORE,"x"
.globl	DEBUGSTART_$SOMA_CORE
DEBUGSTART_$SOMA_CORE:
# End asmlist al_begin
# Begin asmlist al_procedures

.section .text.n_soma_core$_$soma_matinverse$pointer$int64$int64$$boolean_$$_fin$00000002,"x"
	.balign 16,0x90
SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002:
.Lc1:
.seh_proc SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
.Ll1:
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
.Ll2:
	leaq	RTTI_$SOMA_CORE_$$_def00000003(%rip),%rdx
	leaq	-8(%rbp),%rcx
	call	fpc_finalize
.Ll3:
# [40] begin
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:
.Lt3:
.Ll4:

.section .text.n_soma_core_$$_soma_matinverse$pointer$int64$int64$$boolean,"x"
	.balign 16,0x90
SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN:
.Lc6:
# Temps allocated between rbp-128 and rbp-8
.seh_proc SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
.Ll5:
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
.Ll6:
	movq	$0,-8(%rbp)
.Lj11:
	nop
.Lj7:
.Ll7:
# [41] Result := True;
	movb	$1,-24(%rbp)
.Ll8:
# [42] sz := N;
	movl	%edx,%eax
	movq	%rax,-40(%rbp)
.Ll9:
# [43] w  := 2 * sz;
	movl	-40(%rbp),%edx
	shll	$1,%edx
	movl	%edx,%eax
	movq	%rax,-48(%rbp)
.Ll10:
# [44] FS := PDouble(PByte(StateBase) + FSTACK_OFFSET);
	leaq	2304(%rcx),%rax
	movq	%rax,-56(%rbp)
.Ll11:
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
.Ll12:
# [48] for i := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%ecx
	testl	%ecx,%ecx
	jnge	.Lj13
	movl	$-1,%r15d
	.balign 8,0x90
.Lj14:
	addl	$1,%r15d
.Ll13:
# [50] for j := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%r8d
	testl	%r8d,%r8d
	jnge	.Lj18
	movl	$-1,%r10d
	.balign 8,0x90
.Lj19:
	addl	$1,%r10d
.Ll14:
# [51] A[i * w + j] := FS[MatrixBase + i * sz + j];
	movq	-8(%rbp),%r9
	movslq	-48(%rbp),%rdx
	movslq	%r15d,%rax
.Ll15:
	movq	%rax,%r11
.Ll16:
	imulq	%r11,%rdx
	movslq	%r10d,%rax
.Ll17:
	movq	%rax,%rsi
.Ll18:
	leaq	(%rdx,%rsi),%rbx
	movslq	-40(%rbp),%rax
	imulq	%r11,%rax
	movq	-32(%rbp),%rdx
	addq	%rdx,%rax
	addq	%rsi,%rax
	movq	-56(%rbp),%rdx
	movq	(%rdx,%rax,8),%rax
	movq	%rax,(%r9,%rbx,8)
.Ll19:
	cmpl	%r10d,%r8d
	jnle	.Lj19
	.balign 4,0x90
.Lj18:
.Ll20:
# [52] for j := 0 to sz - 1 do
	movl	-40(%rbp),%eax
	leal	-1(%eax),%r8d
	testl	%r8d,%r8d
	jnge	.Lj23
	movl	$-1,%r10d
	.balign 8,0x90
.Lj24:
	addl	$1,%r10d
.Ll21:
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
.Ll22:
	cmpl	%r10d,%r8d
	jnle	.Lj24
	.balign 4,0x90
.Lj23:
.Ll23:
	cmpl	%r15d,%ecx
	jnle	.Lj14
	.balign 4,0x90
.Lj13:
.Ll24:
# [56] for k := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%r9d
	testl	%r9d,%r9d
	jnge	.Lj28
	movl	$-1,%r11d
	.balign 8,0x90
.Lj29:
	addl	$1,%r11d
.Ll25:
# [58] pivotRow := k;
	movl	%r11d,%ebx
.Ll26:
# [59] maxVal := Abs(A[k * w + k]);
	movq	-8(%rbp),%rcx
	movslq	-48(%rbp),%rdx
	movslq	%r11d,%rax
	imulq	%rax,%rdx
	addq	%rdx,%rax
	movsd	(%rcx,%rax,8),%xmm1
	andpd	FPC_ABSMASK_DOUBLE(%rip),%xmm1
	movapd	%xmm1,%xmm0
.Ll27:
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
.Ll28:
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
.Ll29:
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
.Ll30:
# [64] pivotRow := i;
	movl	%r15d,%ebx
	.balign 4,0x90
.Lj38:
.Ll31:
	cmpl	%r15d,%edx
	jnle	.Lj34
	.balign 4,0x90
.Lj33:
.Ll32:
# [67] if maxVal < 1.0E-12 then
	comisd	_$SOMA_CORE$_Ld2(%rip),%xmm0
	jp	.Lj41
	jnb	.Lj41
.Ll33:
# [69] Result := False;
	movb	$0,-24(%rbp)
.Ll34:
# [70] Exit;
	jmp	.Lj9
	.balign 4,0x90
.Lj41:
.Ll35:
# [73] if pivotRow <> k then
	cmpl	%ebx,%r11d
	je	.Lj44
.Ll36:
# [74] for j := 0 to w - 1 do
	movl	-48(%rbp),%eax
	leal	-1(%eax),%edx
	testl	%edx,%edx
	jnge	.Lj46
	movl	$-1,%r10d
	.balign 8,0x90
.Lj47:
	addl	$1,%r10d
.Ll37:
# [76] tmp := A[k * w + j];
	movq	-8(%rbp),%r8
	movslq	%r11d,%rcx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rcx
	movslq	%r10d,%rax
	addq	%rcx,%rax
	movsd	(%r8,%rax,8),%xmm4
.Ll38:
# [77] A[k * w + j] := A[pivotRow * w + j];
	movq	-8(%rbp),%r8
	movslq	%r11d,%rcx
	movslq	-48(%rbp),%rax
.Ll39:
	movq	%rax,%rdi
.Ll40:
	imulq	%rdi,%rcx
	movslq	%r10d,%rax
.Ll41:
	movq	%rax,%r12
.Ll42:
	leaq	(%rcx,%r12),%rsi
	movq	-8(%rbp),%rcx
	movslq	%ebx,%rax
	imulq	%rdi,%rax
	addq	%r12,%rax
	movq	(%rcx,%rax,8),%rax
	movq	%rax,(%r8,%rsi,8)
.Ll43:
# [78] A[pivotRow * w + j] := tmp;
	movq	-8(%rbp),%r8
	movslq	%ebx,%rcx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rcx
	movslq	%r10d,%rax
	addq	%rcx,%rax
	movsd	%xmm4,(%r8,%rax,8)
.Ll44:
	cmpl	%r10d,%edx
	jnle	.Lj47
	.balign 4,0x90
.Lj46:
	.balign 4,0x90
.Lj44:
.Ll45:
# [81] pivot := A[k * w + k];
	movq	-8(%rbp),%rcx
	movslq	-48(%rbp),%rdx
	movslq	%r11d,%rax
	imulq	%rax,%rdx
	addq	%rdx,%rax
	movsd	(%rcx,%rax,8),%xmm5
.Ll46:
# [82] for j := 0 to w - 1 do
	movl	-48(%rbp),%eax
	leal	-1(%eax),%ecx
	testl	%ecx,%ecx
	jnge	.Lj51
	movl	$-1,%r10d
	.balign 8,0x90
.Lj52:
	addl	$1,%r10d
.Ll47:
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
.Ll48:
	cmpl	%r10d,%ecx
	jnle	.Lj52
	.balign 4,0x90
.Lj51:
.Ll49:
# [85] for i := 0 to sz - 1 do
	movl	-40(%rbp),%eax
	leal	-1(%eax),%r14d
	testl	%r14d,%r14d
	jnge	.Lj56
	movl	$-1,%r15d
	.balign 8,0x90
.Lj57:
	addl	$1,%r15d
.Ll50:
# [86] if i <> k then
	cmpl	%r15d,%r11d
	je	.Lj61
.Ll51:
# [88] ratio := A[i * w + k];
	movq	-8(%rbp),%rcx
	movslq	%r15d,%rdx
	movslq	-48(%rbp),%rax
	imulq	%rax,%rdx
	movslq	%r11d,%rax
	addq	%rdx,%rax
	movsd	(%rcx,%rax,8),%xmm2
.Ll52:
# [89] if ratio <> 0.0 then
	comisd	_$SOMA_CORE$_Ld3(%rip),%xmm2
	jp	.Lj62
	je	.Lj63
.Lj62:
.Ll53:
# [90] for j := 0 to w - 1 do
	movl	-48(%rbp),%eax
	subl	$1,%eax
	testl	%eax,%eax
	jnge	.Lj65
	movl	$-1,%r10d
	.balign 8,0x90
.Lj66:
	addl	$1,%r10d
.Ll54:
# [91] A[i * w + j] := A[i * w + j] - ratio * A[k * w + j];
	movq	-8(%rbp),%rdx
	movslq	%r15d,%rsi
	movslq	-48(%rbp),%rcx
	imulq	%rcx,%rsi
	movslq	%r10d,%r8
	addq	%r8,%rsi
.Ll55:
	movq	-8(%rbp),%rdi
	movq	%rdi,-16(%rbp)
.Ll56:
	movq	%rdi,%r12
	movslq	%r11d,%r13
	imulq	%rcx,%r13
	leaq	(%r8,%r13),%rcx
	movapd	%xmm2,%xmm1
	mulsd	(%r12,%rcx,8),%xmm1
	movsd	(%rdi,%rsi,8),%xmm3
	subsd	%xmm1,%xmm3
	movsd	%xmm3,(%rdx,%rsi,8)
.Ll57:
	cmpl	%r10d,%eax
	jnle	.Lj66
	.balign 4,0x90
.Lj65:
	.balign 4,0x90
.Lj63:
	.balign 4,0x90
.Lj61:
.Ll58:
	cmpl	%r15d,%r14d
	jnle	.Lj57
	.balign 4,0x90
.Lj56:
.Ll59:
	cmpl	%r11d,%r9d
	jnle	.Lj29
	.balign 4,0x90
.Lj28:
.Ll60:
# [95] for i := 0 to sz - 1 do
	movl	-40(%rbp),%edx
	leal	-1(%edx),%ecx
	testl	%ecx,%ecx
	jnge	.Lj70
	movl	$-1,%r15d
	.balign 8,0x90
.Lj71:
	addl	$1,%r15d
.Ll61:
# [96] for j := 0 to sz - 1 do
	movl	-40(%rbp),%eax
	leal	-1(%eax),%r8d
	testl	%r8d,%r8d
	jnge	.Lj75
	movl	$-1,%r10d
	.balign 8,0x90
.Lj76:
	addl	$1,%r10d
.Ll62:
# [97] FS[MatrixBase + i * sz + j] := A[i * w + sz + j];
	movslq	%r15d,%rax
.Ll63:
	movq	%rax,%r11
.Ll64:
	movslq	-40(%rbp),%rax
.Ll65:
	movq	%rax,%rbx
.Ll66:
	imulq	%r11,%rax
	movq	-32(%rbp),%rdx
	leaq	(%rdx,%rax),%r9
	movslq	%r10d,%rax
.Ll67:
	movq	%rax,%rsi
.Ll68:
	addq	%rsi,%r9
	movq	-8(%rbp),%rdx
	movslq	-48(%rbp),%rax
	imulq	%r11,%rax
	addq	%rbx,%rax
	addq	%rsi,%rax
	movq	(%rdx,%rax,8),%rdx
	movq	-56(%rbp),%rax
	movq	%rdx,(%rax,%r9,8)
.Ll69:
	cmpl	%r10d,%r8d
	jnle	.Lj76
	.balign 4,0x90
.Lj75:
.Ll70:
	cmpl	%r15d,%ecx
	jnle	.Lj71
	.balign 4,0x90
.Lj70:
.Lj9:
.Ll71:
	nop
.Lj8:
	movq	%rbp,%rcx
	call	SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
.Ll72:
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
.Lt2:
.Ll73:

.section .text.n_soma_core_$$_soma_sigmoid$double$$double,"x"
	.balign 16,0x90
SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE:
.Lc11:
.seh_proc SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
.Ll74:
# [101] begin
	leaq	-40(%rsp),%rsp
.Lc13:
.seh_stackalloc 40
.seh_endprologue
# Var $result located in register xmm0
# Var X located in register xmm0
.Ll75:
# [102] Result := 1.0 / (1.0 + Exp(-X));
	movsd	_$SOMA_CORE$_Ld5(%rip),%xmm1
	xorpd	%xmm1,%xmm0
	call	fpc_exp_real
	movapd	%xmm0,%xmm1
	addsd	_$SOMA_CORE$_Ld4(%rip),%xmm1
	movsd	_$SOMA_CORE$_Ld4(%rip),%xmm0
	divsd	%xmm1,%xmm0
# Var $result located in register xmm0
.Ll76:
# [103] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc12:
.Lt4:
.Ll77:

.section .text.n_soma_core_$$_soma_tanh$double$$double,"x"
	.balign 16,0x90
SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE:
.Lc14:
.seh_proc SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
.Ll78:
# [106] begin
	leaq	-40(%rsp),%rsp
.Lc16:
.seh_stackalloc 40
.seh_endprologue
# Var $result located in register xmm0
# Var X located in register xmm0
# Var X located in register xmm0
.Ll79:
# [107] Result := Math.Tanh(X);
	call	MATH_$$_TANH$DOUBLE$$DOUBLE
# Var $result located in register xmm0
.Ll80:
# [108] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc15:
.Lt5:
.Ll81:

.section .text.n_soma_core_$$_execute$tvmstate,"x"
	.balign 16,0x90
.globl	SOMA_CORE_$$_EXECUTE$TVMSTATE
SOMA_CORE_$$_EXECUTE$TVMSTATE:
.Lc17:
.seh_proc SOMA_CORE_$$_EXECUTE$TVMSTATE
.Ll82:
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
.Ll83:
# [114] push rbx
	pushq	%rbx
.Ll84:
# [115] push r12
	pushq	%r12
.Ll85:
# [116] push r13
	pushq	%r13
.Ll86:
# [117] push r14
	pushq	%r14
.Ll87:
# [118] push r15
	pushq	%r15
.Ll88:
# [120] sub  rsp, 64
	subq	$64,%rsp
.Ll89:
# [121] movdqu [rsp+$00], xmm6
	movdqu	%xmm6,(%rsp)
.Ll90:
# [122] movdqu [rsp+$10], xmm7
	movdqu	%xmm7,16(%rsp)
.Ll91:
# [123] movdqu [rsp+$20], xmm8
	movdqu	%xmm8,32(%rsp)
.Ll92:
# [124] movdqu [rsp+$30], xmm9
	movdqu	%xmm9,48(%rsp)
.Ll93:
# [128] mov rbx, rcx
	movq	%rcx,%rbx
.Ll94:
# [133] mov r12, [rbx + IP_OFFSET]
	movq	4368(%rbx),%r12
.Ll95:
# [134] mov r13, [rbx + ISP_OFFSET]
	movq	4352(%rbx),%r13
.Ll96:
# [135] mov r14, [rbx + FSP_OFFSET]
	movq	4360(%rbx),%r14
.Ll97:
# [136] lea r15, [rip + @JumpTable]
	leaq	.Lj85(%rip),%r15
.Ll98:
# [139] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_NONE
	movq	$0,4384(%rbx)
.Ll99:
# [140] mov qword ptr [rbx + EXEC_COUNT_OFFSET],   0
	movq	$0,37160(%rbx)
.Ll100:
# [153] sub     rsp, 8
	subq	$8,%rsp
.Ll101:
# [154] stmxcsr [rsp]
	stmxcsr	(%rsp)
.Ll102:
# [155] or      dword ptr [rsp], $1F80
	orl	$8064,(%rsp)
.Ll103:
# [156] ldmxcsr [rsp]
	ldmxcsr	(%rsp)
.Ll104:
# [157] fnstcw  [rsp]
	fnstcw	(%rsp)
.Ll105:
# [158] or      word ptr [rsp], $003F
	orw	$63,(%rsp)
.Ll106:
# [159] fldcw   [rsp]
	fldcw	(%rsp)
.Ll107:
# [160] add     rsp, 8
	addq	$8,%rsp
.Lj86:
.Ll108:
# [163] cmp r12, GENOME_SIZE
	cmpq	$4096,%r12
.Ll109:
# [164] jge @HaltBounds
	jge	.Lj87
.Ll110:
# [165] cmp r12, 0
	cmpq	$0,%r12
.Ll111:
# [166] jl  @HaltBounds
	jl	.Lj87
.Ll112:
# [176] inc qword ptr [rbx + EXEC_COUNT_OFFSET]
	incq	37160(%rbx)
.Ll113:
# [177] cmp qword ptr [rbx + EXEC_COUNT_OFFSET], MAX_EXEC_CYCLES
	cmpq	$65536,37160(%rbx)
.Ll114:
# [178] jge @HaltCycleLimit
	jge	.Lj88
.Ll115:
# [192] cmp r13, 0
	cmpq	$0,%r13
.Ll116:
# [193] jge @ISPFloorOK
	jge	.Lj89
.Ll117:
# [194] xor r13, r13
	xorq	%r13,%r13
.Lj89:
.Ll118:
# [196] cmp r13, STACK_SIZE
	cmpq	$256,%r13
.Ll119:
# [197] jle @ISPCeilOK
	jle	.Lj90
.Ll120:
# [198] mov r13, STACK_SIZE
	movq	$256,%r13
.Lj90:
.Ll121:
# [200] cmp r14, 0
	cmpq	$0,%r14
.Ll122:
# [201] jge @FSPFloorOK
	jge	.Lj91
.Ll123:
# [202] xor r14, r14
	xorq	%r14,%r14
.Lj91:
.Ll124:
# [204] cmp r14, STACK_SIZE
	cmpq	$256,%r14
.Ll125:
# [205] jle @FSPCeilOK
	jle	.Lj92
.Ll126:
# [206] mov r14, STACK_SIZE
	movq	$256,%r14
.Lj92:
.Ll127:
# [209] movzx rax, word ptr [rbx + GENOME_OFFSET + r12*8]
	movzwq	4392(%rbx,%r12,8),%rax
.Ll128:
# [210] cmp   rax, LAYER0_MAX
	cmpq	$255,%rax
.Ll129:
# [211] jg    @HigherLayer
	jg	.Lj93
.Ll130:
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
.Ll131:
# [306] inc r12
	incq	%r12
.Ll132:
# [307] jmp @Loop
	jmp	.Lj86
.Lj94:
.Ll133:
# [312] inc r12
	incq	%r12
.Ll134:
# [313] jmp @Loop
	jmp	.Lj86
.Lj95:
.Ll135:
# [316] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
.Ll136:
# [317] mov    [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll137:
# [318] inc    r13
	incq	%r13
.Ll138:
# [319] inc    r12
	incq	%r12
.Ll139:
# [320] jmp    @Loop
	jmp	.Lj86
.Lj96:
.Ll140:
# [323] dec r13
	decq	%r13
.Ll141:
# [324] inc r12
	incq	%r12
.Ll142:
# [325] jmp @Loop
	jmp	.Lj86
.Lj97:
.Ll143:
# [328] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll144:
# [329] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll145:
# [330] inc r13
	incq	%r13
.Ll146:
# [331] inc r12
	incq	%r12
.Ll147:
# [332] jmp @Loop
	jmp	.Lj86
.Lj98:
.Ll148:
# [335] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll149:
# [336] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rcx
.Ll150:
# [337] mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rcx
	movq	%rcx,248(%rbx,%r13,8)
.Ll151:
# [338] mov [rbx + ISTACK_OFFSET + r13*8 - 16], rax
	movq	%rax,240(%rbx,%r13,8)
.Ll152:
# [339] inc r12
	incq	%r12
.Ll153:
# [340] jmp @Loop
	jmp	.Lj86
.Lj99:
.Ll154:
# [343] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll155:
# [344] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll156:
# [345] inc r13
	incq	%r13
.Ll157:
# [346] inc r12
	incq	%r12
.Ll158:
# [347] jmp @Loop
	jmp	.Lj86
.Lj100:
.Ll159:
# [350] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 24]
	movq	232(%rbx,%r13,8),%rax
.Ll160:
# [351] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rcx
.Ll161:
# [352] mov rdx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rdx
.Ll162:
# [353] mov [rbx + ISTACK_OFFSET + r13*8 - 24], rcx
	movq	%rcx,232(%rbx,%r13,8)
.Ll163:
# [354] mov [rbx + ISTACK_OFFSET + r13*8 - 16], rdx
	movq	%rdx,240(%rbx,%r13,8)
.Ll164:
# [355] mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rax
	movq	%rax,248(%rbx,%r13,8)
.Ll165:
# [356] inc r12
	incq	%r12
.Ll166:
# [357] jmp @Loop
	jmp	.Lj86
.Lj101:
.Ll167:
# [360] dec r13
	decq	%r13
.Ll168:
# [361] inc r12
	incq	%r12
.Ll169:
# [362] jmp @Loop
	jmp	.Lj86
.Lj103:
.Ll170:
# [367] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll171:
# [368] add rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	addq	240(%rbx,%r13,8),%rax
.Ll172:
# [369] dec r13
	decq	%r13
.Ll173:
# [370] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll174:
# [371] inc r12
	incq	%r12
.Ll175:
# [372] jmp @Loop
	jmp	.Lj86
.Lj104:
.Ll176:
# [375] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll177:
# [376] sub rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	subq	248(%rbx,%r13,8),%rax
.Ll178:
# [377] dec r13
	decq	%r13
.Ll179:
# [378] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll180:
# [379] inc r12
	incq	%r12
.Ll181:
# [380] jmp @Loop
	jmp	.Lj86
.Lj105:
.Ll182:
# [383] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll183:
# [384] imul rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	imulq	240(%rbx,%r13,8),%rax
.Ll184:
# [385] dec  r13
	decq	%r13
.Ll185:
# [386] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll186:
# [387] inc  r12
	incq	%r12
.Ll187:
# [388] jmp  @Loop
	jmp	.Lj86
.Lj106:
.Ll188:
# [391] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll189:
# [392] mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
.Ll190:
# [393] test rcx, rcx
	testq	%rcx,%rcx
.Ll191:
# [394] jz   @HaltDivZero
	jz	.Lj169
.Ll192:
# [395] cmp  rcx, -1
	cmpq	$-1,%rcx
.Ll193:
# [396] jne  @DIV_SafeDivisor
	jne	.Lj170
.Ll194:
# [397] mov  r8, $8000000000000000    // Int64.MinValue -- idiv traps if
	movq	$-9223372036854775808,%r8
.Ll195:
# [398] cmp  rax, r8                  // dividend=MinValue and divisor=-1
	cmpq	%r8,%rax
.Ll196:
# [399] je   @HaltIntOverflow
	je	.Lj171
.Lj170:
.Ll197:
# [401] cqo
	cqto
.Ll198:
# [402] idiv rcx
	idivq	%rcx
.Ll199:
# [403] dec  r13
	decq	%r13
.Ll200:
# [404] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll201:
# [405] inc  r12
	incq	%r12
.Ll202:
# [406] jmp  @Loop
	jmp	.Lj86
.Lj107:
.Ll203:
# [409] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll204:
# [410] mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
.Ll205:
# [411] test rcx, rcx
	testq	%rcx,%rcx
.Ll206:
# [412] jz   @HaltDivZero
	jz	.Lj169
.Ll207:
# [413] cmp  rcx, -1
	cmpq	$-1,%rcx
.Ll208:
# [414] jne  @MOD_SafeDivisor
	jne	.Lj172
.Ll209:
# [415] mov  r8, $8000000000000000
	movq	$-9223372036854775808,%r8
.Ll210:
# [416] cmp  rax, r8
	cmpq	%r8,%rax
.Ll211:
# [417] je   @HaltIntOverflow
	je	.Lj171
.Lj172:
.Ll212:
# [419] cqo
	cqto
.Ll213:
# [420] idiv rcx
	idivq	%rcx
.Ll214:
# [421] dec  r13
	decq	%r13
.Ll215:
# [422] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rdx
	movq	%rdx,248(%rbx,%r13,8)
.Ll216:
# [423] inc  r12
	incq	%r12
.Ll217:
# [424] jmp  @Loop
	jmp	.Lj86
.Lj108:
.Ll218:
# [427] neg qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	negq	248(%rbx,%r13,8)
.Ll219:
# [428] inc r12
	incq	%r12
.Ll220:
# [429] jmp @Loop
	jmp	.Lj86
.Lj109:
.Ll221:
# [432] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll222:
# [433] mov  rcx, rax
	movq	%rax,%rcx
.Ll223:
# [434] neg  rcx
	negq	%rcx
.Ll224:
# [435] cmovl rax, rcx
	cmovlq	%rcx,%rax
.Ll225:
# [436] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll226:
# [437] inc  r12
	incq	%r12
.Ll227:
# [438] jmp  @Loop
	jmp	.Lj86
.Lj110:
.Ll228:
# [441] inc qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	incq	248(%rbx,%r13,8)
.Ll229:
# [442] inc r12
	incq	%r12
.Ll230:
# [443] jmp @Loop
	jmp	.Lj86
.Lj111:
.Ll231:
# [446] dec qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	decq	248(%rbx,%r13,8)
.Ll232:
# [447] inc r12
	incq	%r12
.Ll233:
# [448] jmp @Loop
	jmp	.Lj86
.Lj112:
.Ll234:
# [453] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll235:
# [454] and rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	andq	240(%rbx,%r13,8),%rax
.Ll236:
# [455] dec r13
	decq	%r13
.Ll237:
# [456] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll238:
# [457] inc r12
	incq	%r12
.Ll239:
# [458] jmp @Loop
	jmp	.Lj86
.Lj113:
.Ll240:
# [461] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll241:
# [462] or  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	orq	240(%rbx,%r13,8),%rax
.Ll242:
# [463] dec r13
	decq	%r13
.Ll243:
# [464] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll244:
# [465] inc r12
	incq	%r12
.Ll245:
# [466] jmp @Loop
	jmp	.Lj86
.Lj114:
.Ll246:
# [469] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll247:
# [470] xor rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	xorq	240(%rbx,%r13,8),%rax
.Ll248:
# [471] dec r13
	decq	%r13
.Ll249:
# [472] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll250:
# [473] inc r12
	incq	%r12
.Ll251:
# [474] jmp @Loop
	jmp	.Lj86
.Lj115:
.Ll252:
# [477] not qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	notq	248(%rbx,%r13,8)
.Ll253:
# [478] inc r12
	incq	%r12
.Ll254:
# [479] jmp @Loop
	jmp	.Lj86
.Lj116:
.Ll255:
# [482] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
.Ll256:
# [483] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll257:
# [484] shl rax, cl
	shlq	%cl,%rax
.Ll258:
# [485] dec r13
	decq	%r13
.Ll259:
# [486] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll260:
# [487] inc r12
	incq	%r12
.Ll261:
# [488] jmp @Loop
	jmp	.Lj86
.Lj117:
.Ll262:
# [491] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
.Ll263:
# [492] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll264:
# [493] shr rax, cl
	shrq	%cl,%rax
.Ll265:
# [494] dec r13
	decq	%r13
.Ll266:
# [495] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll267:
# [496] inc r12
	incq	%r12
.Ll268:
# [497] jmp @Loop
	jmp	.Lj86
.Lj118:
.Ll269:
# [500] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rcx
.Ll270:
# [501] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll271:
# [502] sar rax, cl
	sarq	%cl,%rax
.Ll272:
# [503] dec r13
	decq	%r13
.Ll273:
# [504] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll274:
# [505] inc r12
	incq	%r12
.Ll275:
# [506] jmp @Loop
	jmp	.Lj86
.Lj119:
.Ll276:
# [511] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll277:
# [512] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
.Ll278:
# [513] sete  al
	seteb	%al
.Ll279:
# [514] movzx rax, al
	movzbq	%al,%rax
.Ll280:
# [515] dec   r13
	decq	%r13
.Ll281:
# [516] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll282:
# [517] inc   r12
	incq	%r12
.Ll283:
# [518] jmp   @Loop
	jmp	.Lj86
.Lj120:
.Ll284:
# [521] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll285:
# [522] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
.Ll286:
# [523] setne al
	setneb	%al
.Ll287:
# [524] movzx rax, al
	movzbq	%al,%rax
.Ll288:
# [525] dec   r13
	decq	%r13
.Ll289:
# [526] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll290:
# [527] inc   r12
	incq	%r12
.Ll291:
# [528] jmp   @Loop
	jmp	.Lj86
.Lj121:
.Ll292:
# [531] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll293:
# [532] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
.Ll294:
# [533] setl  al
	setlb	%al
.Ll295:
# [534] movzx rax, al
	movzbq	%al,%rax
.Ll296:
# [535] dec   r13
	decq	%r13
.Ll297:
# [536] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll298:
# [537] inc   r12
	incq	%r12
.Ll299:
# [538] jmp   @Loop
	jmp	.Lj86
.Lj122:
.Ll300:
# [541] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll301:
# [542] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
.Ll302:
# [543] setg  al
	setgb	%al
.Ll303:
# [544] movzx rax, al
	movzbq	%al,%rax
.Ll304:
# [545] dec   r13
	decq	%r13
.Ll305:
# [546] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll306:
# [547] inc   r12
	incq	%r12
.Ll307:
# [548] jmp   @Loop
	jmp	.Lj86
.Lj123:
.Ll308:
# [551] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll309:
# [552] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
.Ll310:
# [553] setle al
	setleb	%al
.Ll311:
# [554] movzx rax, al
	movzbq	%al,%rax
.Ll312:
# [555] dec   r13
	decq	%r13
.Ll313:
# [556] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll314:
# [557] inc   r12
	incq	%r12
.Ll315:
# [558] jmp   @Loop
	jmp	.Lj86
.Lj124:
.Ll316:
# [561] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	240(%rbx,%r13,8),%rax
.Ll317:
# [562] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	248(%rbx,%r13,8),%rax
.Ll318:
# [563] setge al
	setgeb	%al
.Ll319:
# [564] movzx rax, al
	movzbq	%al,%rax
.Ll320:
# [565] dec   r13
	decq	%r13
.Ll321:
# [566] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,248(%rbx,%r13,8)
.Ll322:
# [567] inc   r12
	incq	%r12
.Ll323:
# [568] jmp   @Loop
	jmp	.Lj86
.Lj125:
.Ll324:
# [573] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
.Ll325:
# [574] add    r12, rax
	addq	%rax,%r12
.Ll326:
# [575] jmp    @Loop
	jmp	.Lj86
.Lj126:
.Ll327:
# [578] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll328:
# [579] dec  r13
	decq	%r13
.Ll329:
# [580] test rax, rax
	testq	%rax,%rax
.Ll330:
# [581] jnz  @JZ_Skip
	jnz	.Lj173
.Ll331:
# [582] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
.Ll332:
# [583] add    r12, rax
	addq	%rax,%r12
.Ll333:
# [584] jmp    @Loop
	jmp	.Lj86
.Lj173:
.Ll334:
# [586] inc r12
	incq	%r12
.Ll335:
# [587] jmp @Loop
	jmp	.Lj86
.Lj127:
.Ll336:
# [590] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll337:
# [591] dec  r13
	decq	%r13
.Ll338:
# [592] test rax, rax
	testq	%rax,%rax
.Ll339:
# [593] jz   @JNZ_Skip
	jz	.Lj174
.Ll340:
# [594] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
.Ll341:
# [595] add    r12, rax
	addq	%rax,%r12
.Ll342:
# [596] jmp    @Loop
	jmp	.Lj86
.Lj174:
.Ll343:
# [598] inc r12
	incq	%r12
.Ll344:
# [599] jmp @Loop
	jmp	.Lj86
.Lj128:
.Ll345:
# [602] lea  rax, [r12 + 1]
	leaq	1(%r12),%rax
.Ll346:
# [603] mov  [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll347:
# [604] inc  r13
	incq	%r13
.Ll348:
# [605] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
.Ll349:
# [606] add    r12, rax
	addq	%rax,%r12
.Ll350:
# [607] jmp    @Loop
	jmp	.Lj86
.Lj129:
.Ll351:
# [610] dec r13
	decq	%r13
.Ll352:
# [611] mov r12, [rbx + ISTACK_OFFSET + r13*8]
	movq	256(%rbx,%r13,8),%r12
.Ll353:
# [612] jmp @Loop
	jmp	.Lj86
.Lj130:
.Ll354:
# [615] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HALT
	movq	$1,4384(%rbx)
.Ll355:
# [616] jmp @Exit
	jmp	.Lj175
.Lj131:
.Lj132:
.Lj133:
.Lj134:
.Ll356:
# [628] inc r12
	incq	%r12
.Ll357:
# [629] jmp @Loop
	jmp	.Lj86
.Lj135:
.Ll358:
# [634] movsxd   rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rax
.Ll359:
# [635] cvtsi2sd xmm0, rax
	cvtsi2sdq	%rax,%xmm0
.Ll360:
# [636] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
.Ll361:
# [637] inc      r14
	incq	%r14
.Ll362:
# [638] inc      r12
	incq	%r12
.Ll363:
# [639] jmp      @Loop
	jmp	.Lj86
.Lj136:
.Ll364:
# [642] dec r14
	decq	%r14
.Ll365:
# [643] inc r12
	incq	%r12
.Ll366:
# [644] jmp @Loop
	jmp	.Lj86
.Lj137:
.Ll367:
# [647] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll368:
# [648] movsd [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
.Ll369:
# [649] inc   r14
	incq	%r14
.Ll370:
# [650] inc   r12
	incq	%r12
.Ll371:
# [651] jmp   @Loop
	jmp	.Lj86
.Lj138:
.Ll372:
# [654] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll373:
# [655] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm1
.Ll374:
# [656] movsd [rbx + FSTACK_OFFSET + r14*8 - 8],  xmm1
	movsd	%xmm1,2296(%rbx,%r14,8)
.Ll375:
# [657] movsd [rbx + FSTACK_OFFSET + r14*8 - 16], xmm0
	movsd	%xmm0,2288(%rbx,%r14,8)
.Ll376:
# [658] inc   r12
	incq	%r12
.Ll377:
# [659] jmp   @Loop
	jmp	.Lj86
.Lj139:
.Ll378:
# [662] dec r14
	decq	%r14
.Ll379:
# [663] inc r12
	incq	%r12
.Ll380:
# [664] jmp @Loop
	jmp	.Lj86
.Lj140:
.Ll381:
# [669] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll382:
# [670] addsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	addsd	2296(%rbx,%r14,8),%xmm0
.Ll383:
# [671] dec   r14
	decq	%r14
.Ll384:
# [672] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll385:
# [673] inc   r12
	incq	%r12
.Ll386:
# [674] jmp   @Loop
	jmp	.Lj86
.Lj141:
.Ll387:
# [677] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll388:
# [678] subsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	subsd	2296(%rbx,%r14,8),%xmm0
.Ll389:
# [679] dec   r14
	decq	%r14
.Ll390:
# [680] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll391:
# [681] inc   r12
	incq	%r12
.Ll392:
# [682] jmp   @Loop
	jmp	.Lj86
.Lj142:
.Ll393:
# [685] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll394:
# [686] mulsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	mulsd	2296(%rbx,%r14,8),%xmm0
.Ll395:
# [687] dec   r14
	decq	%r14
.Ll396:
# [688] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll397:
# [689] inc   r12
	incq	%r12
.Ll398:
# [690] jmp   @Loop
	jmp	.Lj86
.Lj143:
.Ll399:
# [693] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll400:
# [694] movsd   xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm1
.Ll401:
# [695] xorpd   xmm2, xmm2
	xorpd	%xmm2,%xmm2
.Ll402:
# [696] ucomisd xmm1, xmm2
	ucomisd	%xmm2,%xmm1
.Ll403:
# [697] je      @HaltFDivZero
	je	.Lj176
.Ll404:
# [698] divsd   xmm0, xmm1
	divsd	%xmm1,%xmm0
.Ll405:
# [699] dec     r14
	decq	%r14
.Ll406:
# [700] movsd   [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll407:
# [701] inc     r12
	incq	%r12
.Ll408:
# [702] jmp     @Loop
	jmp	.Lj86
.Lj144:
.Ll409:
# [705] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll410:
# [706] mov    rax,  $8000000000000000
	movq	$-9223372036854775808,%rax
.Ll411:
# [707] movq   xmm1, rax
	movq	%rax,%xmm1
.Ll412:
# [708] xorpd  xmm0, xmm1
	xorpd	%xmm1,%xmm0
.Ll413:
# [709] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll414:
# [710] inc    r12
	incq	%r12
.Ll415:
# [711] jmp    @Loop
	jmp	.Lj86
.Lj145:
.Ll416:
# [714] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll417:
# [715] mov    rax,  $7FFFFFFFFFFFFFFF
	movq	$9223372036854775807,%rax
.Ll418:
# [716] movq   xmm1, rax
	movq	%rax,%xmm1
.Ll419:
# [717] andpd  xmm0, xmm1
	andpd	%xmm1,%xmm0
.Ll420:
# [718] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll421:
# [719] inc    r12
	incq	%r12
.Ll422:
# [720] jmp    @Loop
	jmp	.Lj86
.Lj146:
.Ll423:
# [723] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll424:
# [724] sqrtsd xmm0, xmm0
	sqrtsd	%xmm0,%xmm0
.Ll425:
# [725] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll426:
# [726] inc    r12
	incq	%r12
.Ll427:
# [727] jmp    @Loop
	jmp	.Lj86
.Lj147:
.Ll428:
# [730] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll429:
# [731] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm1
.Ll430:
# [732] sub   rsp, 16
	subq	$16,%rsp
.Ll431:
# [733] movsd [rsp],   xmm1
	movsd	%xmm1,(%rsp)
.Ll432:
# [734] movsd [rsp+8], xmm0
	movsd	%xmm0,8(%rsp)
.Ll433:
# [735] fld   qword ptr [rsp]
	fldl	(%rsp)
.Ll434:
# [736] fld   qword ptr [rsp+8]
	fldl	8(%rsp)
.Ll435:
# [737] fprem
	fprem
.Ll436:
# [738] fstp  qword ptr [rsp+8]
	fstpl	8(%rsp)
.Ll437:
# [739] fstp  qword ptr [rsp]
	fstpl	(%rsp)
.Ll438:
# [740] movsd xmm0, [rsp+8]
	movsd	8(%rsp),%xmm0
.Ll439:
# [741] add   rsp, 16
	addq	$16,%rsp
.Ll440:
# [742] dec   r14
	decq	%r14
.Ll441:
# [743] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll442:
# [744] inc   r12
	incq	%r12
.Ll443:
# [745] jmp   @Loop
	jmp	.Lj86
.Lj148:
.Ll444:
# [750] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll445:
# [751] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
.Ll446:
# [752] sete    al
	seteb	%al
.Ll447:
# [753] movzx   rax, al
	movzbq	%al,%rax
.Ll448:
# [754] dec     r14
	decq	%r14
.Ll449:
# [755] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll450:
# [756] inc     r13
	incq	%r13
.Ll451:
# [757] inc     r12
	incq	%r12
.Ll452:
# [758] jmp     @Loop
	jmp	.Lj86
.Lj149:
.Ll453:
# [761] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll454:
# [762] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
.Ll455:
# [763] setne   al
	setneb	%al
.Ll456:
# [764] movzx   rax, al
	movzbq	%al,%rax
.Ll457:
# [765] dec     r14
	decq	%r14
.Ll458:
# [766] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll459:
# [767] inc     r13
	incq	%r13
.Ll460:
# [768] inc     r12
	incq	%r12
.Ll461:
# [769] jmp     @Loop
	jmp	.Lj86
.Lj150:
.Ll462:
# [772] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll463:
# [773] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
.Ll464:
# [774] setb    al
	setbb	%al
.Ll465:
# [775] movzx   rax, al
	movzbq	%al,%rax
.Ll466:
# [776] dec     r14
	decq	%r14
.Ll467:
# [777] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll468:
# [778] inc     r13
	incq	%r13
.Ll469:
# [779] inc     r12
	incq	%r12
.Ll470:
# [780] jmp     @Loop
	jmp	.Lj86
.Lj151:
.Ll471:
# [783] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll472:
# [784] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
.Ll473:
# [785] seta    al
	setab	%al
.Ll474:
# [786] movzx   rax, al
	movzbq	%al,%rax
.Ll475:
# [787] dec     r14
	decq	%r14
.Ll476:
# [788] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll477:
# [789] inc     r13
	incq	%r13
.Ll478:
# [790] inc     r12
	incq	%r12
.Ll479:
# [791] jmp     @Loop
	jmp	.Lj86
.Lj152:
.Ll480:
# [794] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll481:
# [795] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
.Ll482:
# [796] setbe   al
	setbeb	%al
.Ll483:
# [797] movzx   rax, al
	movzbq	%al,%rax
.Ll484:
# [798] dec     r14
	decq	%r14
.Ll485:
# [799] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll486:
# [800] inc     r13
	incq	%r13
.Ll487:
# [801] inc     r12
	incq	%r12
.Ll488:
# [802] jmp     @Loop
	jmp	.Lj86
.Lj153:
.Ll489:
# [805] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2288(%rbx,%r14,8),%xmm0
.Ll490:
# [806] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2296(%rbx,%r14,8),%xmm0
.Ll491:
# [807] setae   al
	setaeb	%al
.Ll492:
# [808] movzx   rax, al
	movzbq	%al,%rax
.Ll493:
# [809] dec     r14
	decq	%r14
.Ll494:
# [810] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll495:
# [811] inc     r13
	incq	%r13
.Ll496:
# [812] inc     r12
	incq	%r12
.Ll497:
# [813] jmp     @Loop
	jmp	.Lj86
.Lj154:
.Ll498:
# [818] mov      rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	248(%rbx,%r13,8),%rax
.Ll499:
# [819] dec      r13
	decq	%r13
.Ll500:
# [820] cvtsi2sd xmm0, rax
	cvtsi2sdq	%rax,%xmm0
.Ll501:
# [821] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
.Ll502:
# [822] inc      r14
	incq	%r14
.Ll503:
# [823] inc      r12
	incq	%r12
.Ll504:
# [824] jmp      @Loop
	jmp	.Lj86
.Lj155:
.Ll505:
# [827] movsd     xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll506:
# [828] dec       r14
	decq	%r14
.Ll507:
# [829] cvttsd2si rax, xmm0
	cvttsd2siq	%xmm0,%rax
.Ll508:
# [830] mov       [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll509:
# [831] inc       r13
	incq	%r13
.Ll510:
# [832] inc       r12
	incq	%r12
.Ll511:
# [833] jmp       @Loop
	jmp	.Lj86
.Lj156:
.Ll512:
# [838] mov rcx, [rbx + RNG_OFFSET]
	movq	4376(%rbx),%rcx
.Ll513:
# [839] mov rax, rcx
	movq	%rcx,%rax
.Ll514:
# [840] shl rax, 13
	shlq	$13,%rax
.Ll515:
# [841] xor rcx, rax
	xorq	%rax,%rcx
.Ll516:
# [842] mov rax, rcx
	movq	%rcx,%rax
.Ll517:
# [843] shr rax, 7
	shrq	$7,%rax
.Ll518:
# [844] xor rcx, rax
	xorq	%rax,%rcx
.Ll519:
# [845] mov rax, rcx
	movq	%rcx,%rax
.Ll520:
# [846] shl rax, 17
	shlq	$17,%rax
.Ll521:
# [847] xor rcx, rax
	xorq	%rax,%rcx
.Ll522:
# [848] mov [rbx + RNG_OFFSET], rcx
	movq	%rcx,4376(%rbx)
.Ll523:
# [849] mov [rbx + ISTACK_OFFSET + r13*8], rcx
	movq	%rcx,256(%rbx,%r13,8)
.Ll524:
# [850] inc r13
	incq	%r13
.Ll525:
# [851] inc r12
	incq	%r12
.Ll526:
# [852] jmp @Loop
	jmp	.Lj86
.Lj157:
.Ll527:
# [855] mov rcx, [rbx + RNG_OFFSET]
	movq	4376(%rbx),%rcx
.Ll528:
# [856] mov rax, rcx
	movq	%rcx,%rax
.Ll529:
# [857] shl rax, 13
	shlq	$13,%rax
.Ll530:
# [858] xor rcx, rax
	xorq	%rax,%rcx
.Ll531:
# [859] mov rax, rcx
	movq	%rcx,%rax
.Ll532:
# [860] shr rax, 7
	shrq	$7,%rax
.Ll533:
# [861] xor rcx, rax
	xorq	%rax,%rcx
.Ll534:
# [862] mov rax, rcx
	movq	%rcx,%rax
.Ll535:
# [863] shl rax, 17
	shlq	$17,%rax
.Ll536:
# [864] xor rcx, rax
	xorq	%rax,%rcx
.Ll537:
# [865] mov [rbx + RNG_OFFSET], rcx
	movq	%rcx,4376(%rbx)
.Ll538:
# [866] shr rcx, 11
	shrq	$11,%rcx
.Ll539:
# [867] cvtsi2sd xmm0, rcx
	cvtsi2sdq	%rcx,%xmm0
.Ll540:
# [868] mov      rax,  $3CA0000000000000
	movq	$4368491638549381120,%rax
.Ll541:
# [869] movq     xmm1, rax
	movq	%rax,%xmm1
.Ll542:
# [870] mulsd    xmm0, xmm1
	mulsd	%xmm1,%xmm0
.Ll543:
# [871] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
.Ll544:
# [872] inc      r14
	incq	%r14
.Ll545:
# [873] inc      r12
	incq	%r12
.Ll546:
# [874] jmp      @Loop
	jmp	.Lj86
.Lj158:
.Ll547:
# [877] rdtsc
	rdtsc
.Ll548:
# [878] shl rdx, 32
	shlq	$32,%rdx
.Ll549:
# [879] or  rax, rdx
	orq	%rdx,%rax
.Ll550:
# [880] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,256(%rbx,%r13,8)
.Ll551:
# [881] inc r13
	incq	%r13
.Ll552:
# [882] inc r12
	incq	%r12
.Ll553:
# [883] jmp @Loop
	jmp	.Lj86
.Lj159:
.Ll554:
# [886] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_YIELD
	movq	$2,4384(%rbx)
.Ll555:
# [887] inc r12
	incq	%r12
.Ll556:
# [888] jmp @Exit
	jmp	.Lj175
.Lj160:
.Lj161:
.Ll557:
# [894] inc r12
	incq	%r12
.Ll558:
# [895] jmp @Loop
	jmp	.Lj86
.Lj162:
.Ll559:
# [907] movsxd rcx, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rcx
.Ll560:
# [908] cmp    rcx, 1
	cmpq	$1,%rcx
.Ll561:
# [909] jl     @HaltBadOperand
	jl	.Lj177
.Ll562:
# [910] cmp    rcx, MAX_NN_WIDTH
	cmpq	$8,%rcx
.Ll563:
# [911] jg     @HaltBadOperand
	jg	.Lj177
.Ll564:
# [913] mov    rax, r14
	movq	%r14,%rax
.Ll565:
# [914] sub    rax, rcx
	subq	%rcx,%rax
.Ll566:
# [915] sub    rax, rcx           // rax = base = fsp - 2N  (start of vecA)
	subq	%rcx,%rax
.Ll567:
# [916] cmp    rax, 0             // N validated above, but fsp may still not
	cmpq	$0,%rax
.Ll568:
# [917] jl     @HaltInsufficientStack  // have had 2N elements available (see
	jl	.Lj178
.Ll569:
# [919] xorpd  xmm0, xmm0         // accumulator
	xorpd	%xmm0,%xmm0
.Ll570:
# [920] xor    rdx, rdx           // i = 0
	xorq	%rdx,%rdx
.Lj179:
.Ll571:
# [922] cmp    rdx, rcx
	cmpq	%rcx,%rdx
.Ll572:
# [923] jge    @VDOT_Done
	jge	.Lj180
.Ll573:
# [924] mov    r8, rax
	movq	%rax,%r8
.Ll574:
# [925] add    r8, rdx
	addq	%rdx,%r8
.Ll575:
# [926] movsd  xmm1, [rbx + FSTACK_OFFSET + r8*8]   // A[i]
	movsd	2304(%rbx,%r8,8),%xmm1
.Ll576:
# [927] mov    r9, rax
	movq	%rax,%r9
.Ll577:
# [928] add    r9, rcx
	addq	%rcx,%r9
.Ll578:
# [929] add    r9, rdx
	addq	%rdx,%r9
.Ll579:
# [930] movsd  xmm2, [rbx + FSTACK_OFFSET + r9*8]   // B[i]
	movsd	2304(%rbx,%r9,8),%xmm2
.Ll580:
# [931] mulsd  xmm1, xmm2
	mulsd	%xmm2,%xmm1
.Ll581:
# [932] addsd  xmm0, xmm1
	addsd	%xmm1,%xmm0
.Ll582:
# [933] inc    rdx
	incq	%rdx
.Ll583:
# [934] jmp    @VDOT_Loop
	jmp	.Lj179
.Lj180:
.Ll584:
# [936] mov    r14, rax
	movq	%rax,%r14
.Ll585:
# [937] movsd  [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2304(%rbx,%r14,8)
.Ll586:
# [938] inc    r14
	incq	%r14
.Ll587:
# [939] inc    r12
	incq	%r12
.Ll588:
# [940] jmp    @Loop
	jmp	.Lj86
.Lj163:
.Ll589:
# [945] movsxd rcx, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4396(%rbx,%r12,8),%rcx
.Ll590:
# [946] cmp    rcx, 1
	cmpq	$1,%rcx
.Ll591:
# [947] jl     @HaltBadOperand
	jl	.Lj177
.Ll592:
# [948] cmp    rcx, MAX_NN_WIDTH
	cmpq	$8,%rcx
.Ll593:
# [949] jg     @HaltBadOperand
	jg	.Lj177
.Ll594:
# [951] mov    rax, rcx
	movq	%rcx,%rax
.Ll595:
# [952] imul   rax, rcx            // rax = N*N
	imulq	%rcx,%rax
.Ll596:
# [953] mov    r8, rax
	movq	%rax,%r8
.Ll597:
# [954] add    r8, rcx              // r8 = N*N + N  (total operand doubles)
	addq	%rcx,%r8
.Ll598:
# [955] mov    r9, r14
	movq	%r14,%r9
.Ll599:
# [956] sub    r9, r8                // r9 = matrixBase
	subq	%r8,%r9
.Ll600:
# [957] cmp    r9, 0                 // N validated above, but this is the wide
	cmpq	$0,%r9
.Ll601:
# [958] jl     @HaltInsufficientStack // one (N*N+N doubles) -- see HR_INSUFFICIENT_STACK
	jl	.Lj178
.Ll602:
# [959] mov    r10, r9
	movq	%r9,%r10
.Ll603:
# [960] add    r10, rax               // r10 = vectorBase = matrixBase + N*N
	addq	%rax,%r10
.Ll604:
# [962] xor    r11, r11               // i = 0
	xorq	%r11,%r11
.Lj181:
.Ll605:
# [964] cmp    r11, rcx
	cmpq	%rcx,%r11
.Ll606:
# [965] jge    @MATVEC_Done
	jge	.Lj182
.Ll607:
# [966] xorpd  xmm0, xmm0
	xorpd	%xmm0,%xmm0
.Ll608:
# [967] xor    rdx, rdx              // j = 0
	xorq	%rdx,%rdx
.Lj183:
.Ll609:
# [969] cmp    rdx, rcx
	cmpq	%rcx,%rdx
.Ll610:
# [970] jge    @MATVEC_RowDone
	jge	.Lj184
.Ll611:
# [971] mov    rax, r11
	movq	%r11,%rax
.Ll612:
# [972] imul   rax, rcx
	imulq	%rcx,%rax
.Ll613:
# [973] add    rax, rdx
	addq	%rdx,%rax
.Ll614:
# [974] add    rax, r9
	addq	%r9,%rax
.Ll615:
# [975] movsd  xmm1, [rbx + FSTACK_OFFSET + rax*8]   // M[i][j]
	movsd	2304(%rbx,%rax,8),%xmm1
.Ll616:
# [976] mov    rax, r10
	movq	%r10,%rax
.Ll617:
# [977] add    rax, rdx
	addq	%rdx,%rax
.Ll618:
# [978] movsd  xmm2, [rbx + FSTACK_OFFSET + rax*8]   // V[j]
	movsd	2304(%rbx,%rax,8),%xmm2
.Ll619:
# [979] mulsd  xmm1, xmm2
	mulsd	%xmm2,%xmm1
.Ll620:
# [980] addsd  xmm0, xmm1
	addsd	%xmm1,%xmm0
.Ll621:
# [981] inc    rdx
	incq	%rdx
.Ll622:
# [982] jmp    @MATVEC_ColLoop
	jmp	.Lj183
.Lj184:
.Ll623:
# [989] mov    rax, r9
	movq	%r9,%rax
.Ll624:
# [990] add    rax, r11
	addq	%r11,%rax
.Ll625:
# [991] movsd  [rbx + FSTACK_OFFSET + rax*8], xmm0
	movsd	%xmm0,2304(%rbx,%rax,8)
.Ll626:
# [992] inc    r11
	incq	%r11
.Ll627:
# [993] jmp    @MATVEC_RowLoop
	jmp	.Lj181
.Lj182:
.Ll628:
# [995] mov    r14, r9
	movq	%r9,%r14
.Ll629:
# [996] add    r14, rcx
	addq	%rcx,%r14
.Ll630:
# [997] inc    r12
	incq	%r12
.Ll631:
# [998] jmp    @Loop
	jmp	.Lj86
.Lj164:
.Ll632:
# [1002] movsxd r11, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]   // r11 = N
	movslq	4396(%rbx,%r12,8),%r11
.Ll633:
# [1003] cmp    r11, 1
	cmpq	$1,%r11
.Ll634:
# [1004] jl     @HaltBadOperand
	jl	.Lj177
.Ll635:
# [1005] cmp    r11, MAX_NN_WIDTH
	cmpq	$8,%r11
.Ll636:
# [1006] jg     @HaltBadOperand
	jg	.Lj177
.Ll637:
# [1008] mov    rax, r11
	movq	%r11,%rax
.Ll638:
# [1009] imul   rax, r11             // rax = N*N
	imulq	%r11,%rax
.Ll639:
# [1010] mov    r9, r14
	movq	%r14,%r9
.Ll640:
# [1011] sub    r9, rax               // r9 = matrixBase = fsp - N*N
	subq	%rax,%r9
.Ll641:
# [1012] cmp    r9, 0
	cmpq	$0,%r9
.Ll642:
# [1013] jl     @HaltInsufficientStack
	jl	.Lj178
.Ll643:
# [1020] mov    rcx, rsp                // save original rsp
	movq	%rsp,%rcx
.Ll644:
# [1021] and    rsp, -16                // 16-byte align
	andq	$-16,%rsp
.Ll645:
# [1023] sub    rsp, 48                  // 16 scratch + 32 Win64 shadow space
	subq	$48,%rsp
.Ll646:
# [1027] mov    [rsp], rcx                 // stash original rsp
	movq	%rcx,(%rsp)
.Ll647:
# [1030] mov    r8,  r9                     // arg2 = MatrixBase
	movq	%r9,%r8
.Ll648:
# [1031] mov    rdx, r11                     // arg1 = N
	movq	%r11,%rdx
.Ll649:
# [1032] mov    rcx, rbx                      // arg0 = StateBase
	movq	%rbx,%rcx
.Ll650:
# [1038] call   Soma_MatInverse             // result (Boolean) returned in AL
	call	SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
.Ll651:
# [1040] mov    r10, [rsp]                    // recover original rsp (AL untouched)
	movq	(%rsp),%r10
.Ll652:
# [1041] mov    rsp, r10
	movq	%r10,%rsp
.Ll653:
# [1042] test   al, al
	testb	%al,%al
.Ll654:
# [1043] jz     @HaltSingular
	jz	.Lj185
.Ll655:
# [1045] inc    r12
	incq	%r12
.Ll656:
# [1046] jmp    @Loop
	jmp	.Lj86
.Lj165:
.Ll657:
# [1050] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 24]   // acc
	movsd	2280(%rbx,%r14,8),%xmm0
.Ll658:
# [1051] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]   // w
	movsd	2288(%rbx,%r14,8),%xmm1
.Ll659:
# [1052] movsd xmm2, [rbx + FSTACK_OFFSET + r14*8 - 8]    // x
	movsd	2296(%rbx,%r14,8),%xmm2
.Ll660:
# [1053] mulsd xmm1, xmm2
	mulsd	%xmm2,%xmm1
.Ll661:
# [1054] addsd xmm0, xmm1
	addsd	%xmm1,%xmm0
.Ll662:
# [1055] sub   r14, 2
	subq	$2,%r14
.Ll663:
# [1056] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll664:
# [1057] inc   r12
	incq	%r12
.Ll665:
# [1058] jmp   @Loop
	jmp	.Lj86
.Lj166:
.Ll666:
# [1061] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll667:
# [1062] mov   rax, rsp                 // save original rsp (see OP_MATINV note
	movq	%rsp,%rax
.Ll668:
# [1063] and   rsp, -16                 // above on why this can't be a register)
	andq	$-16,%rsp
.Ll669:
# [1065] sub   rsp, 48
	subq	$48,%rsp
.Ll670:
# [1069] mov   [rsp], rax
	movq	%rax,(%rsp)
.Ll671:
# [1070] call  Soma_Sigmoid              // result returned in xmm0
	call	SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
.Ll672:
# [1071] mov   r10, [rsp]
	movq	(%rsp),%r10
.Ll673:
# [1072] mov   rsp, r10
	movq	%r10,%rsp
.Ll674:
# [1073] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll675:
# [1074] inc   r12
	incq	%r12
.Ll676:
# [1075] jmp   @Loop
	jmp	.Lj86
.Lj167:
.Ll677:
# [1078] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll678:
# [1079] mov   rax, rsp
	movq	%rsp,%rax
.Ll679:
# [1080] and   rsp, -16
	andq	$-16,%rsp
.Ll680:
# [1082] sub   rsp, 48
	subq	$48,%rsp
.Ll681:
# [1086] mov   [rsp], rax
	movq	%rax,(%rsp)
.Ll682:
# [1087] call  Soma_Tanh
	call	SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
.Ll683:
# [1088] mov   r10, [rsp]
	movq	(%rsp),%r10
.Ll684:
# [1089] mov   rsp, r10
	movq	%r10,%rsp
.Ll685:
# [1090] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll686:
# [1091] inc   r12
	incq	%r12
.Ll687:
# [1092] jmp   @Loop
	jmp	.Lj86
.Lj168:
.Ll688:
# [1095] pxor  xmm1, xmm1
	pxor	%xmm1,%xmm1
.Ll689:
# [1096] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2296(%rbx,%r14,8),%xmm0
.Ll690:
# [1097] maxsd xmm0, xmm1
	maxsd	%xmm1,%xmm0
.Ll691:
# [1098] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2296(%rbx,%r14,8)
.Ll692:
# [1099] inc   r12
	incq	%r12
.Ll693:
# [1100] jmp   @Loop
	jmp	.Lj86
.Lj87:
.Ll694:
# [1105] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BOUNDS
	movq	$3,4384(%rbx)
.Ll695:
# [1106] jmp @Exit
	jmp	.Lj175
.Lj169:
.Ll696:
# [1109] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_DIV_ZERO
	movq	$4,4384(%rbx)
.Ll697:
# [1110] jmp @Exit
	jmp	.Lj175
.Lj171:
.Ll698:
# [1113] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_INT_OVERFLOW
	movq	$11,4384(%rbx)
.Ll699:
# [1114] jmp @Exit
	jmp	.Lj175
.Lj176:
.Ll700:
# [1117] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_FDIV_ZERO
	movq	$5,4384(%rbx)
.Ll701:
# [1118] jmp @Exit
	jmp	.Lj175
.Lj177:
.Ll702:
# [1121] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BAD_OPERAND
	movq	$9,4384(%rbx)
.Ll703:
# [1122] jmp @Exit
	jmp	.Lj175
.Lj185:
.Ll704:
# [1125] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_SINGULAR_MATRIX
	movq	$8,4384(%rbx)
.Ll705:
# [1126] jmp @Exit
	jmp	.Lj175
.Lj178:
.Ll706:
# [1129] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_INSUFFICIENT_STACK
	movq	$12,4384(%rbx)
.Ll707:
# [1130] jmp @Exit
	jmp	.Lj175
.Lj88:
.Ll708:
# [1133] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_CYCLE_LIMIT
	movq	$10,4384(%rbx)
.Ll709:
# [1134] jmp @Exit
	jmp	.Lj175
.Lj93:
.Ll710:
# [1139] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HIGHER_LAYER
	movq	$7,4384(%rbx)
.Ll711:
# [1140] mov [rbx + IP_OFFSET],  r12
	movq	%r12,4368(%rbx)
.Ll712:
# [1141] mov [rbx + ISP_OFFSET], r13
	movq	%r13,4352(%rbx)
.Ll713:
# [1142] mov [rbx + FSP_OFFSET], r14
	movq	%r14,4360(%rbx)
.Ll714:
# [1143] jmp @ExitNoSave
	jmp	.Lj186
.Lj175:
.Ll715:
# [1148] mov [rbx + IP_OFFSET],  r12
	movq	%r12,4368(%rbx)
.Ll716:
# [1149] mov [rbx + ISP_OFFSET], r13
	movq	%r13,4352(%rbx)
.Ll717:
# [1150] mov [rbx + FSP_OFFSET], r14
	movq	%r14,4360(%rbx)
.Lj186:
.Ll718:
# [1154] movdqu xmm6, [rsp+$00]
	movdqu	(%rsp),%xmm6
.Ll719:
# [1155] movdqu xmm7, [rsp+$10]
	movdqu	16(%rsp),%xmm7
.Ll720:
# [1156] movdqu xmm8, [rsp+$20]
	movdqu	32(%rsp),%xmm8
.Ll721:
# [1157] movdqu xmm9, [rsp+$30]
	movdqu	48(%rsp),%xmm9
.Ll722:
# [1158] add    rsp, 64
	addq	$64,%rsp
.Ll723:
# [1160] pop r15
	popq	%r15
.Ll724:
# [1161] pop r14
	popq	%r14
.Ll725:
# [1162] pop r13
	popq	%r13
.Ll726:
# [1163] pop r12
	popq	%r12
.Ll727:
# [1164] pop rbx
	popq	%rbx
#  CPU ATHLON64
.Ll728:
# [1166] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc18:
.Lt1:
.Ll729:
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
# Begin asmlist al_dwarf_info

.section .debug_info
.Ldebug_info0:
	.long	.Ledebug_info0-.Lf2
.Lf2:
	.short	3
	.secrel32	.Ldebug_abbrev0
	.byte	8
	.uleb128	1
# [34] function Soma_MatInverse(StateBase: Pointer; N: Int64; MatrixBase: Int64): Boolean;
	.ascii	"soma_core.pas\000"
	.ascii	"Free Pascal 3.2.2 2026/06/06\000"
	.ascii	"C:/dev/soma/\000"
	.byte	9
	.byte	3
	.secrel32	.Ldebug_line0
	.quad	DEBUGSTART_$SOMA_CORE
	.quad	DEBUGEND_$SOMA_CORE
# Syms - Begin unit SOMA_CORE has index 9
# Symbol SOMA_CORE
# Symbol SYSTEM
# Symbol OBJPAS
# Symbol SOMA_TYPES
# Symbol MATH
# Symbol EXECUTE
# Syms - End unit SOMA_CORE has index 9
# Syms - Begin Staticsymtable
# Symbol SOMA_CORE_$$_init$
# Symbol SOMA_MATINVERSE
# Symbol SOMA_SIGMOID
# Symbol SOMA_TANH
# Symbol rttidef$RTTI_$SOMA_CORE_$$_def00000003
# Symbol rtti_dyn_array$
# Syms - End Staticsymtable
# Procdef Execute(var TVMState);
	.uleb128	2
	.ascii	"Execute\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_CORE_$$_EXECUTE$TVMSTATE
	.quad	.Lt1
# Symbol STATE
	.uleb128	3
	.ascii	"State\000"
	.byte	3
	.byte	118
	.sleb128	-8
	.byte	6
	.long	.La5-.Ldebug_info0
	.byte	0
# Procdef Soma_MatInverse(Pointer;Int64;Int64):Boolean;
	.uleb128	4
	.ascii	"Soma_MatInverse\000"
	.byte	1
	.byte	65
	.long	.La7-.Ldebug_info0
	.quad	SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
	.quad	.Lt2
# Symbol STATEBASE
	.uleb128	3
	.ascii	"StateBase\000"
	.byte	2
	.byte	144
	.uleb128	2
	.long	.La9-.Ldebug_info0
# Symbol N
	.uleb128	3
	.ascii	"N\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La11-.Ldebug_info0
# Symbol MATRIXBASE
	.uleb128	3
	.ascii	"MatrixBase\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La11-.Ldebug_info0
# Symbol result
	.uleb128	5
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La7-.Ldebug_info0
# Symbol SOMA_MATINVERSE
	.uleb128	5
	.ascii	"SOMA_MATINVERSE\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La7-.Ldebug_info0
# Symbol RESULT
	.uleb128	5
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La7-.Ldebug_info0
# Symbol A
	.uleb128	5
	.ascii	"A\000"
	.byte	2
	.byte	118
	.sleb128	-8
	.long	.La13-.Ldebug_info0
# Symbol FS
	.uleb128	5
	.ascii	"FS\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La15-.Ldebug_info0
# Symbol I
	.uleb128	5
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	15
	.long	.La17-.Ldebug_info0
# Symbol J
	.uleb128	5
	.ascii	"j\000"
	.byte	2
	.byte	144
	.uleb128	10
	.long	.La17-.Ldebug_info0
# Symbol K
	.uleb128	5
	.ascii	"k\000"
	.byte	2
	.byte	144
	.uleb128	11
	.long	.La17-.Ldebug_info0
# Symbol PIVOTROW
	.uleb128	5
	.ascii	"pivotRow\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La17-.Ldebug_info0
# Symbol SZ
	.uleb128	5
	.ascii	"sz\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La17-.Ldebug_info0
# Symbol W
	.uleb128	5
	.ascii	"w\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La17-.Ldebug_info0
# Symbol MAXVAL
	.uleb128	5
	.ascii	"maxVal\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol RATIO
	.uleb128	5
	.ascii	"ratio\000"
	.byte	2
	.byte	144
	.uleb128	19
	.long	.La19-.Ldebug_info0
# Symbol PIVOT
	.uleb128	5
	.ascii	"pivot\000"
	.byte	2
	.byte	144
	.uleb128	22
	.long	.La19-.Ldebug_info0
# Symbol TMP
	.uleb128	5
	.ascii	"tmp\000"
	.byte	2
	.byte	144
	.uleb128	21
	.long	.La19-.Ldebug_info0
# Symbol fin$00000002
# Definition {Dynamic} Array Of Double
.La13:
	.uleb128	6
	.byte	2
	.byte	151
	.byte	6
	.long	.La19-.Ldebug_info0
	.uleb128	7
	.uleb128	8
	.uleb128	0
	.byte	14
	.byte	151
	.byte	6
	.byte	18
	.byte	40
	.short	5
	.byte	9
	.byte	255
	.byte	47
	.short	3
	.byte	56
	.byte	28
	.byte	6
	.long	.La17-.Ldebug_info0
	.byte	0
.La14:
	.uleb128	8
	.long	.La13-.Ldebug_info0
	.byte	0
# Procdef $fin$00000002(<^untyped>) is nested; Register;
	.uleb128	9
	.ascii	"$fin$00000002\000"
	.byte	1
	.byte	65
	.quad	SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
	.quad	.Lt3
# Symbol parentfp
	.uleb128	3
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La21-.Ldebug_info0
	.byte	0
# Procdef Soma_Sigmoid(Double):Double;
	.uleb128	4
	.ascii	"Soma_Sigmoid\000"
	.byte	1
	.byte	65
	.long	.La19-.Ldebug_info0
	.quad	SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
	.quad	.Lt4
# Symbol X
	.uleb128	3
	.ascii	"X\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol result
	.uleb128	5
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol SOMA_SIGMOID
	.uleb128	5
	.ascii	"SOMA_SIGMOID\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol RESULT
	.uleb128	5
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
	.byte	0
# Procdef Soma_Tanh(Double):Double;
	.uleb128	4
	.ascii	"Soma_Tanh\000"
	.byte	1
	.byte	65
	.long	.La19-.Ldebug_info0
	.quad	SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
	.quad	.Lt5
# Symbol X
	.uleb128	3
	.ascii	"X\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol result
	.uleb128	5
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol SOMA_TANH
	.uleb128	5
	.ascii	"SOMA_TANH\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
# Symbol RESULT
	.uleb128	5
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La19-.Ldebug_info0
	.byte	0
# Defs - Begin unit SYSTEM has index 1
# Definition Pointer
.La9:
	.uleb128	10
	.ascii	"Pointer\000"
	.long	.La23-.Ldebug_info0
.La23:
	.uleb128	11
.La10:
	.uleb128	8
	.long	.La9-.Ldebug_info0
# Definition LongInt
.La17:
	.uleb128	10
	.ascii	"LongInt\000"
	.long	.La24-.Ldebug_info0
.La24:
	.uleb128	12
	.ascii	"LongInt\000"
	.byte	5
	.byte	4
.La18:
	.uleb128	8
	.long	.La17-.Ldebug_info0
# Definition Int64
.La11:
	.uleb128	10
	.ascii	"Int64\000"
	.long	.La25-.Ldebug_info0
.La25:
	.uleb128	12
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.La12:
	.uleb128	8
	.long	.La11-.Ldebug_info0
# Definition Boolean
.La7:
	.uleb128	10
	.ascii	"Boolean\000"
	.long	.La26-.Ldebug_info0
.La26:
	.uleb128	12
	.ascii	"Boolean\000"
	.byte	2
	.byte	1
.La8:
	.uleb128	8
	.long	.La7-.Ldebug_info0
# Definition Double
.La19:
	.uleb128	10
	.ascii	"Double\000"
	.long	.La27-.Ldebug_info0
.La27:
	.uleb128	12
	.ascii	"Double\000"
	.byte	4
	.byte	8
.La20:
	.uleb128	8
	.long	.La19-.Ldebug_info0
# Definition ^untyped
.La21:
	.uleb128	10
	.ascii	"$parentfp_void_pointer\000"
	.long	.La28-.Ldebug_info0
.La28:
	.uleb128	11
.La22:
	.uleb128	8
	.long	.La21-.Ldebug_info0
# Definition PDouble
.La15:
	.uleb128	10
	.ascii	"PDouble\000"
	.long	.La29-.Ldebug_info0
.La29:
	.uleb128	13
	.long	.La19-.Ldebug_info0
.La16:
	.uleb128	8
	.long	.La15-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit SOMA_TYPES has index 8
# Definition TVMState
.La5:
	.uleb128	10
	.ascii	"TVMState\000"
	.long	.La30-.Ldebug_info0
.La30:
	.uleb128	14
	.ascii	"TVMSTATE\000"
	.uleb128	37184
	.uleb128	15
	.ascii	"guard\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La31-.Ldebug_info0
	.uleb128	15
	.ascii	"istack\000"
	.byte	3
	.byte	35
	.uleb128	256
	.long	.La33-.Ldebug_info0
	.uleb128	15
	.ascii	"fstack\000"
	.byte	3
	.byte	35
	.uleb128	2304
	.long	.La35-.Ldebug_info0
	.uleb128	15
	.ascii	"isp\000"
	.byte	3
	.byte	35
	.uleb128	4352
	.long	.La11-.Ldebug_info0
	.uleb128	15
	.ascii	"fsp\000"
	.byte	3
	.byte	35
	.uleb128	4360
	.long	.La11-.Ldebug_info0
	.uleb128	15
	.ascii	"ip\000"
	.byte	3
	.byte	35
	.uleb128	4368
	.long	.La11-.Ldebug_info0
	.uleb128	15
	.ascii	"rng_state\000"
	.byte	3
	.byte	35
	.uleb128	4376
	.long	.La37-.Ldebug_info0
	.uleb128	15
	.ascii	"halt_reason\000"
	.byte	3
	.byte	35
	.uleb128	4384
	.long	.La37-.Ldebug_info0
	.uleb128	15
	.ascii	"genome\000"
	.byte	3
	.byte	35
	.uleb128	4392
	.long	.La39-.Ldebug_info0
	.uleb128	15
	.ascii	"exec_count\000"
	.byte	4
	.byte	35
	.uleb128	37160
	.long	.La37-.Ldebug_info0
	.uleb128	15
	.ascii	"pad\000"
	.byte	4
	.byte	35
	.uleb128	37168
	.long	.La41-.Ldebug_info0
	.byte	0
.La6:
	.uleb128	8
	.long	.La5-.Ldebug_info0
# Definition TGenome
.La39:
	.uleb128	10
	.ascii	"TGenome\000"
	.long	.La43-.Ldebug_info0
.La43:
	.uleb128	16
	.ascii	"TGenome\000"
	.uleb128	32768
	.long	.La44-.Ldebug_info0
	.uleb128	17
	.sleb128	0
	.sleb128	4095
	.uleb128	8
	.long	.La46-.Ldebug_info0
	.byte	0
.La40:
	.uleb128	8
	.long	.La39-.Ldebug_info0
# Definition TInstruction
.La44:
	.uleb128	10
	.ascii	"TInstruction\000"
	.long	.La48-.Ldebug_info0
.La48:
	.uleb128	14
	.ascii	"TINSTRUCTION\000"
	.uleb128	8
	.uleb128	15
	.ascii	"opcode\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La49-.Ldebug_info0
	.uleb128	15
	.ascii	"flags\000"
	.byte	2
	.byte	35
	.uleb128	2
	.long	.La51-.Ldebug_info0
	.uleb128	15
	.ascii	"pad\000"
	.byte	2
	.byte	35
	.uleb128	3
	.long	.La51-.Ldebug_info0
	.uleb128	15
	.ascii	"imm\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La17-.Ldebug_info0
	.byte	0
.La45:
	.uleb128	8
	.long	.La44-.Ldebug_info0
# Defs - End unit SOMA_TYPES has index 8
# Defs - Begin unit WINDOWS has index 5
# Defs - End unit WINDOWS has index 5
# Defs - Begin unit SYSCONST has index 15
# Defs - End unit SYSCONST has index 15
# Defs - Begin unit WINDIRS has index 16
# Defs - End unit WINDIRS has index 16
# Defs - Begin unit SYSUTILS has index 14
# Defs - End unit SYSUTILS has index 14
# Defs - Begin unit MATH has index 13
# Defs - End unit MATH has index 13
# Defs - Begin unit SOMA_CORE has index 9
# Defs - End unit SOMA_CORE has index 9
# Defs - Begin Staticsymtable
# Definition <record type>
.La1:
	.uleb128	10
	.ascii	"$rttidef$RTTI_$SOMA_CORE_$$_def00000003\000"
	.long	.La53-.Ldebug_info0
.La53:
	.uleb128	14
	.ascii	"$RTTIDEF$RTTI_$SOMA_CORE_$$_DEF00000003\000"
	.uleb128	40
	.byte	0
.La2:
	.uleb128	8
	.long	.La1-.Ldebug_info0
# Definition <record type>
.La3:
	.uleb128	10
	.ascii	"$rtti_dyn_array$\000"
	.long	.La54-.Ldebug_info0
.La54:
	.uleb128	14
	.ascii	"$RTTI_DYN_ARRAY$\000"
	.uleb128	38
	.byte	0
.La4:
	.uleb128	8
	.long	.La3-.Ldebug_info0
# Defs - End Staticsymtable
# Definition TVMState.Array[0..255] Of Byte
.La31:
	.uleb128	18
	.uleb128	256
	.long	.La51-.Ldebug_info0
	.uleb128	17
	.sleb128	0
	.sleb128	255
	.uleb128	1
	.long	.La51-.Ldebug_info0
	.byte	0
.La32:
	.uleb128	8
	.long	.La31-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Int64
.La33:
	.uleb128	18
	.uleb128	2048
	.long	.La11-.Ldebug_info0
	.uleb128	17
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La51-.Ldebug_info0
	.byte	0
.La34:
	.uleb128	8
	.long	.La33-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Double
.La35:
	.uleb128	18
	.uleb128	2048
	.long	.La19-.Ldebug_info0
	.uleb128	17
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La51-.Ldebug_info0
	.byte	0
.La36:
	.uleb128	8
	.long	.La35-.Ldebug_info0
# Definition QWord
.La37:
	.uleb128	10
	.ascii	"QWord\000"
	.long	.La55-.Ldebug_info0
.La55:
	.uleb128	12
	.ascii	"QWord\000"
	.byte	7
	.byte	8
.La38:
	.uleb128	8
	.long	.La37-.Ldebug_info0
# Definition TVMState.Array[0..15] Of Byte
.La41:
	.uleb128	18
	.uleb128	16
	.long	.La51-.Ldebug_info0
	.uleb128	17
	.sleb128	0
	.sleb128	15
	.uleb128	1
	.long	.La56-.Ldebug_info0
	.byte	0
.La42:
	.uleb128	8
	.long	.La41-.Ldebug_info0
# Definition SmallInt
.La46:
	.uleb128	10
	.ascii	"SmallInt\000"
	.long	.La58-.Ldebug_info0
.La58:
	.uleb128	12
	.ascii	"SmallInt\000"
	.byte	5
	.byte	2
.La47:
	.uleb128	8
	.long	.La46-.Ldebug_info0
# Definition Word
.La49:
	.uleb128	10
	.ascii	"Word\000"
	.long	.La59-.Ldebug_info0
.La59:
	.uleb128	12
	.ascii	"Word\000"
	.byte	7
	.byte	2
.La50:
	.uleb128	8
	.long	.La49-.Ldebug_info0
# Definition Byte
.La51:
	.uleb128	10
	.ascii	"Byte\000"
	.long	.La60-.Ldebug_info0
.La60:
	.uleb128	12
	.ascii	"Byte\000"
	.byte	7
	.byte	1
.La52:
	.uleb128	8
	.long	.La51-.Ldebug_info0
# Definition ShortInt
.La56:
	.uleb128	10
	.ascii	"ShortInt\000"
	.long	.La61-.Ldebug_info0
.La61:
	.uleb128	12
	.ascii	"ShortInt\000"
	.byte	5
	.byte	1
.La57:
	.uleb128	8
	.long	.La56-.Ldebug_info0
	.byte	0
.Ledebug_info0:
# End asmlist al_dwarf_info
# Begin asmlist al_dwarf_abbrev

.section .debug_abbrev
# Abbrev 1
	.uleb128	1
	.uleb128	17
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	37
	.uleb128	8
	.uleb128	27
	.uleb128	8
	.uleb128	19
	.uleb128	11
	.uleb128	66
	.uleb128	11
	.uleb128	16
	.uleb128	6
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 2
	.uleb128	2
	.uleb128	46
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	54
	.uleb128	11
	.uleb128	63
	.uleb128	12
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 3
	.uleb128	3
	.uleb128	5
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	2
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 4
	.uleb128	4
	.uleb128	46
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	54
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 5
	.uleb128	5
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	2
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 6
	.uleb128	6
	.uleb128	1
	.byte	1
	.uleb128	80
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 7
	.uleb128	7
	.uleb128	33
	.byte	0
	.uleb128	81
	.uleb128	15
	.uleb128	34
	.uleb128	15
	.uleb128	47
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 8
	.uleb128	8
	.uleb128	16
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 9
	.uleb128	9
	.uleb128	46
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	54
	.uleb128	11
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 10
	.uleb128	10
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 11
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
	.byte	0
# Abbrev 12
	.uleb128	12
	.uleb128	36
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	62
	.uleb128	11
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 13
	.uleb128	13
	.uleb128	15
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 14
	.uleb128	14
	.uleb128	19
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 15
	.uleb128	15
	.uleb128	13
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	56
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 16
	.uleb128	16
	.uleb128	1
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 17
	.uleb128	17
	.uleb128	33
	.byte	0
	.uleb128	34
	.uleb128	13
	.uleb128	47
	.uleb128	13
	.uleb128	81
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 18
	.uleb128	18
	.uleb128	1
	.byte	1
	.uleb128	11
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
	.byte	0
# End asmlist al_dwarf_abbrev
# Begin asmlist al_dwarf_line

.section .debug_line
# === header start ===
	.long	.Ledebug_line0-.Lf3
.Lf3:
	.short	3
	.long	.Lehdebug_line0-.Lf4
.Lf4:
	.byte	1
	.byte	1
	.byte	1
	.byte	255
	.byte	13
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
# include_directories
	.byte	0
# file_names
	.ascii	"soma_core.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Lehdebug_line0:
# === header end ===
# function: SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
# [98:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	109
# [98:1]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	1
# [40:1]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	3
	.sleb128	-58
	.byte	1
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll4
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
# [40:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll5
	.byte	5
	.uleb128	1
	.byte	51
# [40:1]
	.byte	2
	.uleb128	.Ll6-.Ll5
	.byte	1
# [41:3]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	5
	.uleb128	3
	.byte	13
# [42:3]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	13
# [43:11]
	.byte	2
	.uleb128	.Ll9-.Ll8
	.byte	5
	.uleb128	11
	.byte	13
# [44:34]
	.byte	2
	.uleb128	.Ll10-.Ll9
	.byte	5
	.uleb128	34
	.byte	13
# [45:16]
	.byte	2
	.uleb128	.Ll11-.Ll10
	.byte	5
	.uleb128	16
	.byte	13
# [48:20]
	.byte	2
	.uleb128	.Ll12-.Ll11
	.byte	5
	.uleb128	20
	.byte	15
# [50:22]
	.byte	2
	.uleb128	.Ll13-.Ll12
	.byte	5
	.uleb128	22
	.byte	14
# [51:8]
	.byte	2
	.uleb128	.Ll14-.Ll13
	.byte	5
	.uleb128	8
	.byte	13
# [40:1]
	.byte	2
	.uleb128	.Ll15-.Ll14
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-11
	.byte	1
# [51:11]
	.byte	2
	.uleb128	.Ll16-.Ll15
	.byte	5
	.uleb128	11
	.byte	23
# [40:1]
	.byte	2
	.uleb128	.Ll17-.Ll16
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-11
	.byte	1
# [51:15]
	.byte	2
	.uleb128	.Ll18-.Ll17
	.byte	5
	.uleb128	15
	.byte	23
# [50:5]
	.byte	2
	.uleb128	.Ll19-.Ll18
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [52:22]
	.byte	2
	.uleb128	.Ll20-.Ll19
	.byte	5
	.uleb128	22
	.byte	14
# [53:8]
	.byte	2
	.uleb128	.Ll21-.Ll20
	.byte	5
	.uleb128	8
	.byte	13
# [52:5]
	.byte	2
	.uleb128	.Ll22-.Ll21
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [48:3]
	.byte	2
	.uleb128	.Ll23-.Ll22
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-4
	.byte	1
# [56:20]
	.byte	2
	.uleb128	.Ll24-.Ll23
	.byte	5
	.uleb128	20
	.byte	20
# [58:5]
	.byte	2
	.uleb128	.Ll25-.Ll24
	.byte	5
	.uleb128	5
	.byte	14
# [59:31]
	.byte	2
	.uleb128	.Ll26-.Ll25
	.byte	5
	.uleb128	31
	.byte	13
# [60:16]
	.byte	2
	.uleb128	.Ll27-.Ll26
	.byte	5
	.uleb128	16
	.byte	13
# [61:26]
	.byte	2
	.uleb128	.Ll28-.Ll27
	.byte	5
	.uleb128	26
	.byte	13
# [63:35]
	.byte	2
	.uleb128	.Ll29-.Ll28
	.byte	5
	.uleb128	35
	.byte	14
# [64:9]
	.byte	2
	.uleb128	.Ll30-.Ll29
	.byte	5
	.uleb128	9
	.byte	13
# [60:5]
	.byte	2
	.uleb128	.Ll31-.Ll30
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-4
	.byte	1
# [67:15]
	.byte	2
	.uleb128	.Ll32-.Ll31
	.byte	5
	.uleb128	15
	.byte	19
# [69:7]
	.byte	2
	.uleb128	.Ll33-.Ll32
	.byte	5
	.uleb128	7
	.byte	14
# [70:7]
	.byte	2
	.uleb128	.Ll34-.Ll33
	.byte	13
# [73:17]
	.byte	2
	.uleb128	.Ll35-.Ll34
	.byte	5
	.uleb128	17
	.byte	15
# [74:23]
	.byte	2
	.uleb128	.Ll36-.Ll35
	.byte	5
	.uleb128	23
	.byte	13
# [76:17]
	.byte	2
	.uleb128	.Ll37-.Ll36
	.byte	5
	.uleb128	17
	.byte	14
# [77:10]
	.byte	2
	.uleb128	.Ll38-.Ll37
	.byte	5
	.uleb128	10
	.byte	13
# [40:1]
	.byte	2
	.uleb128	.Ll39-.Ll38
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-37
	.byte	1
# [77:13]
	.byte	2
	.uleb128	.Ll40-.Ll39
	.byte	5
	.uleb128	13
	.byte	49
# [40:1]
	.byte	2
	.uleb128	.Ll41-.Ll40
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-37
	.byte	1
# [77:17]
	.byte	2
	.uleb128	.Ll42-.Ll41
	.byte	5
	.uleb128	17
	.byte	49
# [78:10]
	.byte	2
	.uleb128	.Ll43-.Ll42
	.byte	5
	.uleb128	10
	.byte	13
# [74:7]
	.byte	2
	.uleb128	.Ll44-.Ll43
	.byte	5
	.uleb128	7
	.byte	3
	.sleb128	-4
	.byte	1
# [81:15]
	.byte	2
	.uleb128	.Ll45-.Ll44
	.byte	5
	.uleb128	15
	.byte	19
# [82:21]
	.byte	2
	.uleb128	.Ll46-.Ll45
	.byte	5
	.uleb128	21
	.byte	13
# [83:24]
	.byte	2
	.uleb128	.Ll47-.Ll46
	.byte	5
	.uleb128	24
	.byte	13
# [82:5]
	.byte	2
	.uleb128	.Ll48-.Ll47
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [85:22]
	.byte	2
	.uleb128	.Ll49-.Ll48
	.byte	5
	.uleb128	22
	.byte	15
# [86:12]
	.byte	2
	.uleb128	.Ll50-.Ll49
	.byte	5
	.uleb128	12
	.byte	13
# [88:19]
	.byte	2
	.uleb128	.Ll51-.Ll50
	.byte	5
	.uleb128	19
	.byte	14
# [89:18]
	.byte	2
	.uleb128	.Ll52-.Ll51
	.byte	5
	.uleb128	18
	.byte	13
# [90:27]
	.byte	2
	.uleb128	.Ll53-.Ll52
	.byte	5
	.uleb128	27
	.byte	13
# [91:14]
	.byte	2
	.uleb128	.Ll54-.Ll53
	.byte	5
	.uleb128	14
	.byte	13
# [40:1]
	.byte	2
	.uleb128	.Ll55-.Ll54
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-51
	.byte	1
# [91:53]
	.byte	2
	.uleb128	.Ll56-.Ll55
	.byte	5
	.uleb128	53
	.byte	63
# [90:11]
	.byte	2
	.uleb128	.Ll57-.Ll56
	.byte	5
	.uleb128	11
	.byte	3
	.sleb128	-1
	.byte	1
# [85:5]
	.byte	2
	.uleb128	.Ll58-.Ll57
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-5
	.byte	1
# [56:3]
	.byte	2
	.uleb128	.Ll59-.Ll58
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-29
	.byte	1
# [95:20]
	.byte	2
	.uleb128	.Ll60-.Ll59
	.byte	5
	.uleb128	20
	.byte	51
# [96:22]
	.byte	2
	.uleb128	.Ll61-.Ll60
	.byte	5
	.uleb128	22
	.byte	13
# [97:23]
	.byte	2
	.uleb128	.Ll62-.Ll61
	.byte	5
	.uleb128	23
	.byte	13
# [40:1]
	.byte	2
	.uleb128	.Ll63-.Ll62
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-57
	.byte	1
# [97:27]
	.byte	2
	.uleb128	.Ll64-.Ll63
	.byte	5
	.uleb128	27
	.byte	69
# [40:1]
	.byte	2
	.uleb128	.Ll65-.Ll64
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-57
	.byte	1
# [97:25]
	.byte	2
	.uleb128	.Ll66-.Ll65
	.byte	5
	.uleb128	25
	.byte	69
# [40:1]
	.byte	2
	.uleb128	.Ll67-.Ll66
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-57
	.byte	1
# [97:30]
	.byte	2
	.uleb128	.Ll68-.Ll67
	.byte	5
	.uleb128	30
	.byte	69
# [96:5]
	.byte	2
	.uleb128	.Ll69-.Ll68
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [95:3]
	.byte	2
	.uleb128	.Ll70-.Ll69
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-1
	.byte	1
# [40:1]
	.byte	2
	.uleb128	.Ll71-.Ll70
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-55
	.byte	1
# [98:1]
	.byte	2
	.uleb128	.Ll72-.Ll71
	.byte	70
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll73
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
# [101:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll74
	.byte	5
	.uleb128	1
	.byte	112
# [102:33]
	.byte	2
	.uleb128	.Ll75-.Ll74
	.byte	5
	.uleb128	33
	.byte	13
# [103:1]
	.byte	2
	.uleb128	.Ll76-.Ll75
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll77
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
# [106:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll78
	.byte	5
	.uleb128	1
	.byte	117
# [107:13]
	.byte	2
	.uleb128	.Ll79-.Ll78
	.byte	5
	.uleb128	13
	.byte	13
# [108:1]
	.byte	2
	.uleb128	.Ll80-.Ll79
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll81
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_CORE_$$_EXECUTE$TVMSTATE
# [111:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll82
	.byte	5
	.uleb128	1
	.byte	122
# [114:5]
	.byte	2
	.uleb128	.Ll83-.Ll82
	.byte	5
	.uleb128	5
	.byte	15
# [115:5]
	.byte	2
	.uleb128	.Ll84-.Ll83
	.byte	13
# [116:5]
	.byte	2
	.uleb128	.Ll85-.Ll84
	.byte	13
# [117:5]
	.byte	2
	.uleb128	.Ll86-.Ll85
	.byte	13
# [118:5]
	.byte	2
	.uleb128	.Ll87-.Ll86
	.byte	13
# [120:5]
	.byte	2
	.uleb128	.Ll88-.Ll87
	.byte	14
# [121:5]
	.byte	2
	.uleb128	.Ll89-.Ll88
	.byte	13
# [122:5]
	.byte	2
	.uleb128	.Ll90-.Ll89
	.byte	13
# [123:5]
	.byte	2
	.uleb128	.Ll91-.Ll90
	.byte	13
# [124:5]
	.byte	2
	.uleb128	.Ll92-.Ll91
	.byte	13
# [128:5]
	.byte	2
	.uleb128	.Ll93-.Ll92
	.byte	16
# [133:5]
	.byte	2
	.uleb128	.Ll94-.Ll93
	.byte	17
# [134:5]
	.byte	2
	.uleb128	.Ll95-.Ll94
	.byte	13
# [135:5]
	.byte	2
	.uleb128	.Ll96-.Ll95
	.byte	13
# [136:5]
	.byte	2
	.uleb128	.Ll97-.Ll96
	.byte	13
# [139:5]
	.byte	2
	.uleb128	.Ll98-.Ll97
	.byte	15
# [140:5]
	.byte	2
	.uleb128	.Ll99-.Ll98
	.byte	13
# [153:5]
	.byte	2
	.uleb128	.Ll100-.Ll99
	.byte	25
# [154:5]
	.byte	2
	.uleb128	.Ll101-.Ll100
	.byte	13
# [155:5]
	.byte	2
	.uleb128	.Ll102-.Ll101
	.byte	13
# [156:5]
	.byte	2
	.uleb128	.Ll103-.Ll102
	.byte	13
# [157:5]
	.byte	2
	.uleb128	.Ll104-.Ll103
	.byte	13
# [158:5]
	.byte	2
	.uleb128	.Ll105-.Ll104
	.byte	13
# [159:5]
	.byte	2
	.uleb128	.Ll106-.Ll105
	.byte	13
# [160:5]
	.byte	2
	.uleb128	.Ll107-.Ll106
	.byte	13
# [163:5]
	.byte	2
	.uleb128	.Ll108-.Ll107
	.byte	15
# [164:5]
	.byte	2
	.uleb128	.Ll109-.Ll108
	.byte	13
# [165:5]
	.byte	2
	.uleb128	.Ll110-.Ll109
	.byte	13
# [166:5]
	.byte	2
	.uleb128	.Ll111-.Ll110
	.byte	13
# [176:5]
	.byte	2
	.uleb128	.Ll112-.Ll111
	.byte	22
# [177:5]
	.byte	2
	.uleb128	.Ll113-.Ll112
	.byte	13
# [178:5]
	.byte	2
	.uleb128	.Ll114-.Ll113
	.byte	13
# [192:5]
	.byte	2
	.uleb128	.Ll115-.Ll114
	.byte	26
# [193:5]
	.byte	2
	.uleb128	.Ll116-.Ll115
	.byte	13
# [194:5]
	.byte	2
	.uleb128	.Ll117-.Ll116
	.byte	13
# [196:5]
	.byte	2
	.uleb128	.Ll118-.Ll117
	.byte	14
# [197:5]
	.byte	2
	.uleb128	.Ll119-.Ll118
	.byte	13
# [198:5]
	.byte	2
	.uleb128	.Ll120-.Ll119
	.byte	13
# [200:5]
	.byte	2
	.uleb128	.Ll121-.Ll120
	.byte	14
# [201:5]
	.byte	2
	.uleb128	.Ll122-.Ll121
	.byte	13
# [202:5]
	.byte	2
	.uleb128	.Ll123-.Ll122
	.byte	13
# [204:5]
	.byte	2
	.uleb128	.Ll124-.Ll123
	.byte	14
# [205:5]
	.byte	2
	.uleb128	.Ll125-.Ll124
	.byte	13
# [206:5]
	.byte	2
	.uleb128	.Ll126-.Ll125
	.byte	13
# [209:5]
	.byte	2
	.uleb128	.Ll127-.Ll126
	.byte	15
# [210:5]
	.byte	2
	.uleb128	.Ll128-.Ll127
	.byte	13
# [211:5]
	.byte	2
	.uleb128	.Ll129-.Ll128
	.byte	13
# [212:5]
	.byte	2
	.uleb128	.Ll130-.Ll129
	.byte	13
# [306:5]
	.byte	2
	.uleb128	.Ll131-.Ll130
	.byte	106
# [307:5]
	.byte	2
	.uleb128	.Ll132-.Ll131
	.byte	13
# [312:5]
	.byte	2
	.uleb128	.Ll133-.Ll132
	.byte	17
# [313:5]
	.byte	2
	.uleb128	.Ll134-.Ll133
	.byte	13
# [316:5]
	.byte	2
	.uleb128	.Ll135-.Ll134
	.byte	15
# [317:5]
	.byte	2
	.uleb128	.Ll136-.Ll135
	.byte	13
# [318:5]
	.byte	2
	.uleb128	.Ll137-.Ll136
	.byte	13
# [319:5]
	.byte	2
	.uleb128	.Ll138-.Ll137
	.byte	13
# [320:5]
	.byte	2
	.uleb128	.Ll139-.Ll138
	.byte	13
# [323:5]
	.byte	2
	.uleb128	.Ll140-.Ll139
	.byte	15
# [324:5]
	.byte	2
	.uleb128	.Ll141-.Ll140
	.byte	13
# [325:5]
	.byte	2
	.uleb128	.Ll142-.Ll141
	.byte	13
# [328:5]
	.byte	2
	.uleb128	.Ll143-.Ll142
	.byte	15
# [329:5]
	.byte	2
	.uleb128	.Ll144-.Ll143
	.byte	13
# [330:5]
	.byte	2
	.uleb128	.Ll145-.Ll144
	.byte	13
# [331:5]
	.byte	2
	.uleb128	.Ll146-.Ll145
	.byte	13
# [332:5]
	.byte	2
	.uleb128	.Ll147-.Ll146
	.byte	13
# [335:5]
	.byte	2
	.uleb128	.Ll148-.Ll147
	.byte	15
# [336:5]
	.byte	2
	.uleb128	.Ll149-.Ll148
	.byte	13
# [337:5]
	.byte	2
	.uleb128	.Ll150-.Ll149
	.byte	13
# [338:5]
	.byte	2
	.uleb128	.Ll151-.Ll150
	.byte	13
# [339:5]
	.byte	2
	.uleb128	.Ll152-.Ll151
	.byte	13
# [340:5]
	.byte	2
	.uleb128	.Ll153-.Ll152
	.byte	13
# [343:5]
	.byte	2
	.uleb128	.Ll154-.Ll153
	.byte	15
# [344:5]
	.byte	2
	.uleb128	.Ll155-.Ll154
	.byte	13
# [345:5]
	.byte	2
	.uleb128	.Ll156-.Ll155
	.byte	13
# [346:5]
	.byte	2
	.uleb128	.Ll157-.Ll156
	.byte	13
# [347:5]
	.byte	2
	.uleb128	.Ll158-.Ll157
	.byte	13
# [350:5]
	.byte	2
	.uleb128	.Ll159-.Ll158
	.byte	15
# [351:5]
	.byte	2
	.uleb128	.Ll160-.Ll159
	.byte	13
# [352:5]
	.byte	2
	.uleb128	.Ll161-.Ll160
	.byte	13
# [353:5]
	.byte	2
	.uleb128	.Ll162-.Ll161
	.byte	13
# [354:5]
	.byte	2
	.uleb128	.Ll163-.Ll162
	.byte	13
# [355:5]
	.byte	2
	.uleb128	.Ll164-.Ll163
	.byte	13
# [356:5]
	.byte	2
	.uleb128	.Ll165-.Ll164
	.byte	13
# [357:5]
	.byte	2
	.uleb128	.Ll166-.Ll165
	.byte	13
# [360:5]
	.byte	2
	.uleb128	.Ll167-.Ll166
	.byte	15
# [361:5]
	.byte	2
	.uleb128	.Ll168-.Ll167
	.byte	13
# [362:5]
	.byte	2
	.uleb128	.Ll169-.Ll168
	.byte	13
# [367:5]
	.byte	2
	.uleb128	.Ll170-.Ll169
	.byte	17
# [368:5]
	.byte	2
	.uleb128	.Ll171-.Ll170
	.byte	13
# [369:5]
	.byte	2
	.uleb128	.Ll172-.Ll171
	.byte	13
# [370:5]
	.byte	2
	.uleb128	.Ll173-.Ll172
	.byte	13
# [371:5]
	.byte	2
	.uleb128	.Ll174-.Ll173
	.byte	13
# [372:5]
	.byte	2
	.uleb128	.Ll175-.Ll174
	.byte	13
# [375:5]
	.byte	2
	.uleb128	.Ll176-.Ll175
	.byte	15
# [376:5]
	.byte	2
	.uleb128	.Ll177-.Ll176
	.byte	13
# [377:5]
	.byte	2
	.uleb128	.Ll178-.Ll177
	.byte	13
# [378:5]
	.byte	2
	.uleb128	.Ll179-.Ll178
	.byte	13
# [379:5]
	.byte	2
	.uleb128	.Ll180-.Ll179
	.byte	13
# [380:5]
	.byte	2
	.uleb128	.Ll181-.Ll180
	.byte	13
# [383:5]
	.byte	2
	.uleb128	.Ll182-.Ll181
	.byte	15
# [384:5]
	.byte	2
	.uleb128	.Ll183-.Ll182
	.byte	13
# [385:5]
	.byte	2
	.uleb128	.Ll184-.Ll183
	.byte	13
# [386:5]
	.byte	2
	.uleb128	.Ll185-.Ll184
	.byte	13
# [387:5]
	.byte	2
	.uleb128	.Ll186-.Ll185
	.byte	13
# [388:5]
	.byte	2
	.uleb128	.Ll187-.Ll186
	.byte	13
# [391:5]
	.byte	2
	.uleb128	.Ll188-.Ll187
	.byte	15
# [392:5]
	.byte	2
	.uleb128	.Ll189-.Ll188
	.byte	13
# [393:5]
	.byte	2
	.uleb128	.Ll190-.Ll189
	.byte	13
# [394:5]
	.byte	2
	.uleb128	.Ll191-.Ll190
	.byte	13
# [395:5]
	.byte	2
	.uleb128	.Ll192-.Ll191
	.byte	13
# [396:5]
	.byte	2
	.uleb128	.Ll193-.Ll192
	.byte	13
# [397:5]
	.byte	2
	.uleb128	.Ll194-.Ll193
	.byte	13
# [398:5]
	.byte	2
	.uleb128	.Ll195-.Ll194
	.byte	13
# [399:5]
	.byte	2
	.uleb128	.Ll196-.Ll195
	.byte	13
# [401:5]
	.byte	2
	.uleb128	.Ll197-.Ll196
	.byte	14
# [402:5]
	.byte	2
	.uleb128	.Ll198-.Ll197
	.byte	13
# [403:5]
	.byte	2
	.uleb128	.Ll199-.Ll198
	.byte	13
# [404:5]
	.byte	2
	.uleb128	.Ll200-.Ll199
	.byte	13
# [405:5]
	.byte	2
	.uleb128	.Ll201-.Ll200
	.byte	13
# [406:5]
	.byte	2
	.uleb128	.Ll202-.Ll201
	.byte	13
# [409:5]
	.byte	2
	.uleb128	.Ll203-.Ll202
	.byte	15
# [410:5]
	.byte	2
	.uleb128	.Ll204-.Ll203
	.byte	13
# [411:5]
	.byte	2
	.uleb128	.Ll205-.Ll204
	.byte	13
# [412:5]
	.byte	2
	.uleb128	.Ll206-.Ll205
	.byte	13
# [413:5]
	.byte	2
	.uleb128	.Ll207-.Ll206
	.byte	13
# [414:5]
	.byte	2
	.uleb128	.Ll208-.Ll207
	.byte	13
# [415:5]
	.byte	2
	.uleb128	.Ll209-.Ll208
	.byte	13
# [416:5]
	.byte	2
	.uleb128	.Ll210-.Ll209
	.byte	13
# [417:5]
	.byte	2
	.uleb128	.Ll211-.Ll210
	.byte	13
# [419:5]
	.byte	2
	.uleb128	.Ll212-.Ll211
	.byte	14
# [420:5]
	.byte	2
	.uleb128	.Ll213-.Ll212
	.byte	13
# [421:5]
	.byte	2
	.uleb128	.Ll214-.Ll213
	.byte	13
# [422:5]
	.byte	2
	.uleb128	.Ll215-.Ll214
	.byte	13
# [423:5]
	.byte	2
	.uleb128	.Ll216-.Ll215
	.byte	13
# [424:5]
	.byte	2
	.uleb128	.Ll217-.Ll216
	.byte	13
# [427:5]
	.byte	2
	.uleb128	.Ll218-.Ll217
	.byte	15
# [428:5]
	.byte	2
	.uleb128	.Ll219-.Ll218
	.byte	13
# [429:5]
	.byte	2
	.uleb128	.Ll220-.Ll219
	.byte	13
# [432:5]
	.byte	2
	.uleb128	.Ll221-.Ll220
	.byte	15
# [433:5]
	.byte	2
	.uleb128	.Ll222-.Ll221
	.byte	13
# [434:5]
	.byte	2
	.uleb128	.Ll223-.Ll222
	.byte	13
# [435:5]
	.byte	2
	.uleb128	.Ll224-.Ll223
	.byte	13
# [436:5]
	.byte	2
	.uleb128	.Ll225-.Ll224
	.byte	13
# [437:5]
	.byte	2
	.uleb128	.Ll226-.Ll225
	.byte	13
# [438:5]
	.byte	2
	.uleb128	.Ll227-.Ll226
	.byte	13
# [441:5]
	.byte	2
	.uleb128	.Ll228-.Ll227
	.byte	15
# [442:5]
	.byte	2
	.uleb128	.Ll229-.Ll228
	.byte	13
# [443:5]
	.byte	2
	.uleb128	.Ll230-.Ll229
	.byte	13
# [446:5]
	.byte	2
	.uleb128	.Ll231-.Ll230
	.byte	15
# [447:5]
	.byte	2
	.uleb128	.Ll232-.Ll231
	.byte	13
# [448:5]
	.byte	2
	.uleb128	.Ll233-.Ll232
	.byte	13
# [453:5]
	.byte	2
	.uleb128	.Ll234-.Ll233
	.byte	17
# [454:5]
	.byte	2
	.uleb128	.Ll235-.Ll234
	.byte	13
# [455:5]
	.byte	2
	.uleb128	.Ll236-.Ll235
	.byte	13
# [456:5]
	.byte	2
	.uleb128	.Ll237-.Ll236
	.byte	13
# [457:5]
	.byte	2
	.uleb128	.Ll238-.Ll237
	.byte	13
# [458:5]
	.byte	2
	.uleb128	.Ll239-.Ll238
	.byte	13
# [461:5]
	.byte	2
	.uleb128	.Ll240-.Ll239
	.byte	15
# [462:5]
	.byte	2
	.uleb128	.Ll241-.Ll240
	.byte	13
# [463:5]
	.byte	2
	.uleb128	.Ll242-.Ll241
	.byte	13
# [464:5]
	.byte	2
	.uleb128	.Ll243-.Ll242
	.byte	13
# [465:5]
	.byte	2
	.uleb128	.Ll244-.Ll243
	.byte	13
# [466:5]
	.byte	2
	.uleb128	.Ll245-.Ll244
	.byte	13
# [469:5]
	.byte	2
	.uleb128	.Ll246-.Ll245
	.byte	15
# [470:5]
	.byte	2
	.uleb128	.Ll247-.Ll246
	.byte	13
# [471:5]
	.byte	2
	.uleb128	.Ll248-.Ll247
	.byte	13
# [472:5]
	.byte	2
	.uleb128	.Ll249-.Ll248
	.byte	13
# [473:5]
	.byte	2
	.uleb128	.Ll250-.Ll249
	.byte	13
# [474:5]
	.byte	2
	.uleb128	.Ll251-.Ll250
	.byte	13
# [477:5]
	.byte	2
	.uleb128	.Ll252-.Ll251
	.byte	15
# [478:5]
	.byte	2
	.uleb128	.Ll253-.Ll252
	.byte	13
# [479:5]
	.byte	2
	.uleb128	.Ll254-.Ll253
	.byte	13
# [482:5]
	.byte	2
	.uleb128	.Ll255-.Ll254
	.byte	15
# [483:5]
	.byte	2
	.uleb128	.Ll256-.Ll255
	.byte	13
# [484:5]
	.byte	2
	.uleb128	.Ll257-.Ll256
	.byte	13
# [485:5]
	.byte	2
	.uleb128	.Ll258-.Ll257
	.byte	13
# [486:5]
	.byte	2
	.uleb128	.Ll259-.Ll258
	.byte	13
# [487:5]
	.byte	2
	.uleb128	.Ll260-.Ll259
	.byte	13
# [488:5]
	.byte	2
	.uleb128	.Ll261-.Ll260
	.byte	13
# [491:5]
	.byte	2
	.uleb128	.Ll262-.Ll261
	.byte	15
# [492:5]
	.byte	2
	.uleb128	.Ll263-.Ll262
	.byte	13
# [493:5]
	.byte	2
	.uleb128	.Ll264-.Ll263
	.byte	13
# [494:5]
	.byte	2
	.uleb128	.Ll265-.Ll264
	.byte	13
# [495:5]
	.byte	2
	.uleb128	.Ll266-.Ll265
	.byte	13
# [496:5]
	.byte	2
	.uleb128	.Ll267-.Ll266
	.byte	13
# [497:5]
	.byte	2
	.uleb128	.Ll268-.Ll267
	.byte	13
# [500:5]
	.byte	2
	.uleb128	.Ll269-.Ll268
	.byte	15
# [501:5]
	.byte	2
	.uleb128	.Ll270-.Ll269
	.byte	13
# [502:5]
	.byte	2
	.uleb128	.Ll271-.Ll270
	.byte	13
# [503:5]
	.byte	2
	.uleb128	.Ll272-.Ll271
	.byte	13
# [504:5]
	.byte	2
	.uleb128	.Ll273-.Ll272
	.byte	13
# [505:5]
	.byte	2
	.uleb128	.Ll274-.Ll273
	.byte	13
# [506:5]
	.byte	2
	.uleb128	.Ll275-.Ll274
	.byte	13
# [511:5]
	.byte	2
	.uleb128	.Ll276-.Ll275
	.byte	17
# [512:5]
	.byte	2
	.uleb128	.Ll277-.Ll276
	.byte	13
# [513:5]
	.byte	2
	.uleb128	.Ll278-.Ll277
	.byte	13
# [514:5]
	.byte	2
	.uleb128	.Ll279-.Ll278
	.byte	13
# [515:5]
	.byte	2
	.uleb128	.Ll280-.Ll279
	.byte	13
# [516:5]
	.byte	2
	.uleb128	.Ll281-.Ll280
	.byte	13
# [517:5]
	.byte	2
	.uleb128	.Ll282-.Ll281
	.byte	13
# [518:5]
	.byte	2
	.uleb128	.Ll283-.Ll282
	.byte	13
# [521:5]
	.byte	2
	.uleb128	.Ll284-.Ll283
	.byte	15
# [522:5]
	.byte	2
	.uleb128	.Ll285-.Ll284
	.byte	13
# [523:5]
	.byte	2
	.uleb128	.Ll286-.Ll285
	.byte	13
# [524:5]
	.byte	2
	.uleb128	.Ll287-.Ll286
	.byte	13
# [525:5]
	.byte	2
	.uleb128	.Ll288-.Ll287
	.byte	13
# [526:5]
	.byte	2
	.uleb128	.Ll289-.Ll288
	.byte	13
# [527:5]
	.byte	2
	.uleb128	.Ll290-.Ll289
	.byte	13
# [528:5]
	.byte	2
	.uleb128	.Ll291-.Ll290
	.byte	13
# [531:5]
	.byte	2
	.uleb128	.Ll292-.Ll291
	.byte	15
# [532:5]
	.byte	2
	.uleb128	.Ll293-.Ll292
	.byte	13
# [533:5]
	.byte	2
	.uleb128	.Ll294-.Ll293
	.byte	13
# [534:5]
	.byte	2
	.uleb128	.Ll295-.Ll294
	.byte	13
# [535:5]
	.byte	2
	.uleb128	.Ll296-.Ll295
	.byte	13
# [536:5]
	.byte	2
	.uleb128	.Ll297-.Ll296
	.byte	13
# [537:5]
	.byte	2
	.uleb128	.Ll298-.Ll297
	.byte	13
# [538:5]
	.byte	2
	.uleb128	.Ll299-.Ll298
	.byte	13
# [541:5]
	.byte	2
	.uleb128	.Ll300-.Ll299
	.byte	15
# [542:5]
	.byte	2
	.uleb128	.Ll301-.Ll300
	.byte	13
# [543:5]
	.byte	2
	.uleb128	.Ll302-.Ll301
	.byte	13
# [544:5]
	.byte	2
	.uleb128	.Ll303-.Ll302
	.byte	13
# [545:5]
	.byte	2
	.uleb128	.Ll304-.Ll303
	.byte	13
# [546:5]
	.byte	2
	.uleb128	.Ll305-.Ll304
	.byte	13
# [547:5]
	.byte	2
	.uleb128	.Ll306-.Ll305
	.byte	13
# [548:5]
	.byte	2
	.uleb128	.Ll307-.Ll306
	.byte	13
# [551:5]
	.byte	2
	.uleb128	.Ll308-.Ll307
	.byte	15
# [552:5]
	.byte	2
	.uleb128	.Ll309-.Ll308
	.byte	13
# [553:5]
	.byte	2
	.uleb128	.Ll310-.Ll309
	.byte	13
# [554:5]
	.byte	2
	.uleb128	.Ll311-.Ll310
	.byte	13
# [555:5]
	.byte	2
	.uleb128	.Ll312-.Ll311
	.byte	13
# [556:5]
	.byte	2
	.uleb128	.Ll313-.Ll312
	.byte	13
# [557:5]
	.byte	2
	.uleb128	.Ll314-.Ll313
	.byte	13
# [558:5]
	.byte	2
	.uleb128	.Ll315-.Ll314
	.byte	13
# [561:5]
	.byte	2
	.uleb128	.Ll316-.Ll315
	.byte	15
# [562:5]
	.byte	2
	.uleb128	.Ll317-.Ll316
	.byte	13
# [563:5]
	.byte	2
	.uleb128	.Ll318-.Ll317
	.byte	13
# [564:5]
	.byte	2
	.uleb128	.Ll319-.Ll318
	.byte	13
# [565:5]
	.byte	2
	.uleb128	.Ll320-.Ll319
	.byte	13
# [566:5]
	.byte	2
	.uleb128	.Ll321-.Ll320
	.byte	13
# [567:5]
	.byte	2
	.uleb128	.Ll322-.Ll321
	.byte	13
# [568:5]
	.byte	2
	.uleb128	.Ll323-.Ll322
	.byte	13
# [573:5]
	.byte	2
	.uleb128	.Ll324-.Ll323
	.byte	17
# [574:5]
	.byte	2
	.uleb128	.Ll325-.Ll324
	.byte	13
# [575:5]
	.byte	2
	.uleb128	.Ll326-.Ll325
	.byte	13
# [578:5]
	.byte	2
	.uleb128	.Ll327-.Ll326
	.byte	15
# [579:5]
	.byte	2
	.uleb128	.Ll328-.Ll327
	.byte	13
# [580:5]
	.byte	2
	.uleb128	.Ll329-.Ll328
	.byte	13
# [581:5]
	.byte	2
	.uleb128	.Ll330-.Ll329
	.byte	13
# [582:5]
	.byte	2
	.uleb128	.Ll331-.Ll330
	.byte	13
# [583:5]
	.byte	2
	.uleb128	.Ll332-.Ll331
	.byte	13
# [584:5]
	.byte	2
	.uleb128	.Ll333-.Ll332
	.byte	13
# [586:5]
	.byte	2
	.uleb128	.Ll334-.Ll333
	.byte	14
# [587:5]
	.byte	2
	.uleb128	.Ll335-.Ll334
	.byte	13
# [590:5]
	.byte	2
	.uleb128	.Ll336-.Ll335
	.byte	15
# [591:5]
	.byte	2
	.uleb128	.Ll337-.Ll336
	.byte	13
# [592:5]
	.byte	2
	.uleb128	.Ll338-.Ll337
	.byte	13
# [593:5]
	.byte	2
	.uleb128	.Ll339-.Ll338
	.byte	13
# [594:5]
	.byte	2
	.uleb128	.Ll340-.Ll339
	.byte	13
# [595:5]
	.byte	2
	.uleb128	.Ll341-.Ll340
	.byte	13
# [596:5]
	.byte	2
	.uleb128	.Ll342-.Ll341
	.byte	13
# [598:5]
	.byte	2
	.uleb128	.Ll343-.Ll342
	.byte	14
# [599:5]
	.byte	2
	.uleb128	.Ll344-.Ll343
	.byte	13
# [602:5]
	.byte	2
	.uleb128	.Ll345-.Ll344
	.byte	15
# [603:5]
	.byte	2
	.uleb128	.Ll346-.Ll345
	.byte	13
# [604:5]
	.byte	2
	.uleb128	.Ll347-.Ll346
	.byte	13
# [605:5]
	.byte	2
	.uleb128	.Ll348-.Ll347
	.byte	13
# [606:5]
	.byte	2
	.uleb128	.Ll349-.Ll348
	.byte	13
# [607:5]
	.byte	2
	.uleb128	.Ll350-.Ll349
	.byte	13
# [610:5]
	.byte	2
	.uleb128	.Ll351-.Ll350
	.byte	15
# [611:5]
	.byte	2
	.uleb128	.Ll352-.Ll351
	.byte	13
# [612:5]
	.byte	2
	.uleb128	.Ll353-.Ll352
	.byte	13
# [615:5]
	.byte	2
	.uleb128	.Ll354-.Ll353
	.byte	15
# [616:5]
	.byte	2
	.uleb128	.Ll355-.Ll354
	.byte	13
# [628:5]
	.byte	2
	.uleb128	.Ll356-.Ll355
	.byte	24
# [629:5]
	.byte	2
	.uleb128	.Ll357-.Ll356
	.byte	13
# [634:5]
	.byte	2
	.uleb128	.Ll358-.Ll357
	.byte	17
# [635:5]
	.byte	2
	.uleb128	.Ll359-.Ll358
	.byte	13
# [636:5]
	.byte	2
	.uleb128	.Ll360-.Ll359
	.byte	13
# [637:5]
	.byte	2
	.uleb128	.Ll361-.Ll360
	.byte	13
# [638:5]
	.byte	2
	.uleb128	.Ll362-.Ll361
	.byte	13
# [639:5]
	.byte	2
	.uleb128	.Ll363-.Ll362
	.byte	13
# [642:5]
	.byte	2
	.uleb128	.Ll364-.Ll363
	.byte	15
# [643:5]
	.byte	2
	.uleb128	.Ll365-.Ll364
	.byte	13
# [644:5]
	.byte	2
	.uleb128	.Ll366-.Ll365
	.byte	13
# [647:5]
	.byte	2
	.uleb128	.Ll367-.Ll366
	.byte	15
# [648:5]
	.byte	2
	.uleb128	.Ll368-.Ll367
	.byte	13
# [649:5]
	.byte	2
	.uleb128	.Ll369-.Ll368
	.byte	13
# [650:5]
	.byte	2
	.uleb128	.Ll370-.Ll369
	.byte	13
# [651:5]
	.byte	2
	.uleb128	.Ll371-.Ll370
	.byte	13
# [654:5]
	.byte	2
	.uleb128	.Ll372-.Ll371
	.byte	15
# [655:5]
	.byte	2
	.uleb128	.Ll373-.Ll372
	.byte	13
# [656:5]
	.byte	2
	.uleb128	.Ll374-.Ll373
	.byte	13
# [657:5]
	.byte	2
	.uleb128	.Ll375-.Ll374
	.byte	13
# [658:5]
	.byte	2
	.uleb128	.Ll376-.Ll375
	.byte	13
# [659:5]
	.byte	2
	.uleb128	.Ll377-.Ll376
	.byte	13
# [662:5]
	.byte	2
	.uleb128	.Ll378-.Ll377
	.byte	15
# [663:5]
	.byte	2
	.uleb128	.Ll379-.Ll378
	.byte	13
# [664:5]
	.byte	2
	.uleb128	.Ll380-.Ll379
	.byte	13
# [669:5]
	.byte	2
	.uleb128	.Ll381-.Ll380
	.byte	17
# [670:5]
	.byte	2
	.uleb128	.Ll382-.Ll381
	.byte	13
# [671:5]
	.byte	2
	.uleb128	.Ll383-.Ll382
	.byte	13
# [672:5]
	.byte	2
	.uleb128	.Ll384-.Ll383
	.byte	13
# [673:5]
	.byte	2
	.uleb128	.Ll385-.Ll384
	.byte	13
# [674:5]
	.byte	2
	.uleb128	.Ll386-.Ll385
	.byte	13
# [677:5]
	.byte	2
	.uleb128	.Ll387-.Ll386
	.byte	15
# [678:5]
	.byte	2
	.uleb128	.Ll388-.Ll387
	.byte	13
# [679:5]
	.byte	2
	.uleb128	.Ll389-.Ll388
	.byte	13
# [680:5]
	.byte	2
	.uleb128	.Ll390-.Ll389
	.byte	13
# [681:5]
	.byte	2
	.uleb128	.Ll391-.Ll390
	.byte	13
# [682:5]
	.byte	2
	.uleb128	.Ll392-.Ll391
	.byte	13
# [685:5]
	.byte	2
	.uleb128	.Ll393-.Ll392
	.byte	15
# [686:5]
	.byte	2
	.uleb128	.Ll394-.Ll393
	.byte	13
# [687:5]
	.byte	2
	.uleb128	.Ll395-.Ll394
	.byte	13
# [688:5]
	.byte	2
	.uleb128	.Ll396-.Ll395
	.byte	13
# [689:5]
	.byte	2
	.uleb128	.Ll397-.Ll396
	.byte	13
# [690:5]
	.byte	2
	.uleb128	.Ll398-.Ll397
	.byte	13
# [693:5]
	.byte	2
	.uleb128	.Ll399-.Ll398
	.byte	15
# [694:5]
	.byte	2
	.uleb128	.Ll400-.Ll399
	.byte	13
# [695:5]
	.byte	2
	.uleb128	.Ll401-.Ll400
	.byte	13
# [696:5]
	.byte	2
	.uleb128	.Ll402-.Ll401
	.byte	13
# [697:5]
	.byte	2
	.uleb128	.Ll403-.Ll402
	.byte	13
# [698:5]
	.byte	2
	.uleb128	.Ll404-.Ll403
	.byte	13
# [699:5]
	.byte	2
	.uleb128	.Ll405-.Ll404
	.byte	13
# [700:5]
	.byte	2
	.uleb128	.Ll406-.Ll405
	.byte	13
# [701:5]
	.byte	2
	.uleb128	.Ll407-.Ll406
	.byte	13
# [702:5]
	.byte	2
	.uleb128	.Ll408-.Ll407
	.byte	13
# [705:5]
	.byte	2
	.uleb128	.Ll409-.Ll408
	.byte	15
# [706:5]
	.byte	2
	.uleb128	.Ll410-.Ll409
	.byte	13
# [707:5]
	.byte	2
	.uleb128	.Ll411-.Ll410
	.byte	13
# [708:5]
	.byte	2
	.uleb128	.Ll412-.Ll411
	.byte	13
# [709:5]
	.byte	2
	.uleb128	.Ll413-.Ll412
	.byte	13
# [710:5]
	.byte	2
	.uleb128	.Ll414-.Ll413
	.byte	13
# [711:5]
	.byte	2
	.uleb128	.Ll415-.Ll414
	.byte	13
# [714:5]
	.byte	2
	.uleb128	.Ll416-.Ll415
	.byte	15
# [715:5]
	.byte	2
	.uleb128	.Ll417-.Ll416
	.byte	13
# [716:5]
	.byte	2
	.uleb128	.Ll418-.Ll417
	.byte	13
# [717:5]
	.byte	2
	.uleb128	.Ll419-.Ll418
	.byte	13
# [718:5]
	.byte	2
	.uleb128	.Ll420-.Ll419
	.byte	13
# [719:5]
	.byte	2
	.uleb128	.Ll421-.Ll420
	.byte	13
# [720:5]
	.byte	2
	.uleb128	.Ll422-.Ll421
	.byte	13
# [723:5]
	.byte	2
	.uleb128	.Ll423-.Ll422
	.byte	15
# [724:5]
	.byte	2
	.uleb128	.Ll424-.Ll423
	.byte	13
# [725:5]
	.byte	2
	.uleb128	.Ll425-.Ll424
	.byte	13
# [726:5]
	.byte	2
	.uleb128	.Ll426-.Ll425
	.byte	13
# [727:5]
	.byte	2
	.uleb128	.Ll427-.Ll426
	.byte	13
# [730:5]
	.byte	2
	.uleb128	.Ll428-.Ll427
	.byte	15
# [731:5]
	.byte	2
	.uleb128	.Ll429-.Ll428
	.byte	13
# [732:5]
	.byte	2
	.uleb128	.Ll430-.Ll429
	.byte	13
# [733:5]
	.byte	2
	.uleb128	.Ll431-.Ll430
	.byte	13
# [734:5]
	.byte	2
	.uleb128	.Ll432-.Ll431
	.byte	13
# [735:5]
	.byte	2
	.uleb128	.Ll433-.Ll432
	.byte	13
# [736:5]
	.byte	2
	.uleb128	.Ll434-.Ll433
	.byte	13
# [737:5]
	.byte	2
	.uleb128	.Ll435-.Ll434
	.byte	13
# [738:5]
	.byte	2
	.uleb128	.Ll436-.Ll435
	.byte	13
# [739:5]
	.byte	2
	.uleb128	.Ll437-.Ll436
	.byte	13
# [740:5]
	.byte	2
	.uleb128	.Ll438-.Ll437
	.byte	13
# [741:5]
	.byte	2
	.uleb128	.Ll439-.Ll438
	.byte	13
# [742:5]
	.byte	2
	.uleb128	.Ll440-.Ll439
	.byte	13
# [743:5]
	.byte	2
	.uleb128	.Ll441-.Ll440
	.byte	13
# [744:5]
	.byte	2
	.uleb128	.Ll442-.Ll441
	.byte	13
# [745:5]
	.byte	2
	.uleb128	.Ll443-.Ll442
	.byte	13
# [750:5]
	.byte	2
	.uleb128	.Ll444-.Ll443
	.byte	17
# [751:5]
	.byte	2
	.uleb128	.Ll445-.Ll444
	.byte	13
# [752:5]
	.byte	2
	.uleb128	.Ll446-.Ll445
	.byte	13
# [753:5]
	.byte	2
	.uleb128	.Ll447-.Ll446
	.byte	13
# [754:5]
	.byte	2
	.uleb128	.Ll448-.Ll447
	.byte	13
# [755:5]
	.byte	2
	.uleb128	.Ll449-.Ll448
	.byte	13
# [756:5]
	.byte	2
	.uleb128	.Ll450-.Ll449
	.byte	13
# [757:5]
	.byte	2
	.uleb128	.Ll451-.Ll450
	.byte	13
# [758:5]
	.byte	2
	.uleb128	.Ll452-.Ll451
	.byte	13
# [761:5]
	.byte	2
	.uleb128	.Ll453-.Ll452
	.byte	15
# [762:5]
	.byte	2
	.uleb128	.Ll454-.Ll453
	.byte	13
# [763:5]
	.byte	2
	.uleb128	.Ll455-.Ll454
	.byte	13
# [764:5]
	.byte	2
	.uleb128	.Ll456-.Ll455
	.byte	13
# [765:5]
	.byte	2
	.uleb128	.Ll457-.Ll456
	.byte	13
# [766:5]
	.byte	2
	.uleb128	.Ll458-.Ll457
	.byte	13
# [767:5]
	.byte	2
	.uleb128	.Ll459-.Ll458
	.byte	13
# [768:5]
	.byte	2
	.uleb128	.Ll460-.Ll459
	.byte	13
# [769:5]
	.byte	2
	.uleb128	.Ll461-.Ll460
	.byte	13
# [772:5]
	.byte	2
	.uleb128	.Ll462-.Ll461
	.byte	15
# [773:5]
	.byte	2
	.uleb128	.Ll463-.Ll462
	.byte	13
# [774:5]
	.byte	2
	.uleb128	.Ll464-.Ll463
	.byte	13
# [775:5]
	.byte	2
	.uleb128	.Ll465-.Ll464
	.byte	13
# [776:5]
	.byte	2
	.uleb128	.Ll466-.Ll465
	.byte	13
# [777:5]
	.byte	2
	.uleb128	.Ll467-.Ll466
	.byte	13
# [778:5]
	.byte	2
	.uleb128	.Ll468-.Ll467
	.byte	13
# [779:5]
	.byte	2
	.uleb128	.Ll469-.Ll468
	.byte	13
# [780:5]
	.byte	2
	.uleb128	.Ll470-.Ll469
	.byte	13
# [783:5]
	.byte	2
	.uleb128	.Ll471-.Ll470
	.byte	15
# [784:5]
	.byte	2
	.uleb128	.Ll472-.Ll471
	.byte	13
# [785:5]
	.byte	2
	.uleb128	.Ll473-.Ll472
	.byte	13
# [786:5]
	.byte	2
	.uleb128	.Ll474-.Ll473
	.byte	13
# [787:5]
	.byte	2
	.uleb128	.Ll475-.Ll474
	.byte	13
# [788:5]
	.byte	2
	.uleb128	.Ll476-.Ll475
	.byte	13
# [789:5]
	.byte	2
	.uleb128	.Ll477-.Ll476
	.byte	13
# [790:5]
	.byte	2
	.uleb128	.Ll478-.Ll477
	.byte	13
# [791:5]
	.byte	2
	.uleb128	.Ll479-.Ll478
	.byte	13
# [794:5]
	.byte	2
	.uleb128	.Ll480-.Ll479
	.byte	15
# [795:5]
	.byte	2
	.uleb128	.Ll481-.Ll480
	.byte	13
# [796:5]
	.byte	2
	.uleb128	.Ll482-.Ll481
	.byte	13
# [797:5]
	.byte	2
	.uleb128	.Ll483-.Ll482
	.byte	13
# [798:5]
	.byte	2
	.uleb128	.Ll484-.Ll483
	.byte	13
# [799:5]
	.byte	2
	.uleb128	.Ll485-.Ll484
	.byte	13
# [800:5]
	.byte	2
	.uleb128	.Ll486-.Ll485
	.byte	13
# [801:5]
	.byte	2
	.uleb128	.Ll487-.Ll486
	.byte	13
# [802:5]
	.byte	2
	.uleb128	.Ll488-.Ll487
	.byte	13
# [805:5]
	.byte	2
	.uleb128	.Ll489-.Ll488
	.byte	15
# [806:5]
	.byte	2
	.uleb128	.Ll490-.Ll489
	.byte	13
# [807:5]
	.byte	2
	.uleb128	.Ll491-.Ll490
	.byte	13
# [808:5]
	.byte	2
	.uleb128	.Ll492-.Ll491
	.byte	13
# [809:5]
	.byte	2
	.uleb128	.Ll493-.Ll492
	.byte	13
# [810:5]
	.byte	2
	.uleb128	.Ll494-.Ll493
	.byte	13
# [811:5]
	.byte	2
	.uleb128	.Ll495-.Ll494
	.byte	13
# [812:5]
	.byte	2
	.uleb128	.Ll496-.Ll495
	.byte	13
# [813:5]
	.byte	2
	.uleb128	.Ll497-.Ll496
	.byte	13
# [818:5]
	.byte	2
	.uleb128	.Ll498-.Ll497
	.byte	17
# [819:5]
	.byte	2
	.uleb128	.Ll499-.Ll498
	.byte	13
# [820:5]
	.byte	2
	.uleb128	.Ll500-.Ll499
	.byte	13
# [821:5]
	.byte	2
	.uleb128	.Ll501-.Ll500
	.byte	13
# [822:5]
	.byte	2
	.uleb128	.Ll502-.Ll501
	.byte	13
# [823:5]
	.byte	2
	.uleb128	.Ll503-.Ll502
	.byte	13
# [824:5]
	.byte	2
	.uleb128	.Ll504-.Ll503
	.byte	13
# [827:5]
	.byte	2
	.uleb128	.Ll505-.Ll504
	.byte	15
# [828:5]
	.byte	2
	.uleb128	.Ll506-.Ll505
	.byte	13
# [829:5]
	.byte	2
	.uleb128	.Ll507-.Ll506
	.byte	13
# [830:5]
	.byte	2
	.uleb128	.Ll508-.Ll507
	.byte	13
# [831:5]
	.byte	2
	.uleb128	.Ll509-.Ll508
	.byte	13
# [832:5]
	.byte	2
	.uleb128	.Ll510-.Ll509
	.byte	13
# [833:5]
	.byte	2
	.uleb128	.Ll511-.Ll510
	.byte	13
# [838:5]
	.byte	2
	.uleb128	.Ll512-.Ll511
	.byte	17
# [839:5]
	.byte	2
	.uleb128	.Ll513-.Ll512
	.byte	13
# [840:5]
	.byte	2
	.uleb128	.Ll514-.Ll513
	.byte	13
# [841:5]
	.byte	2
	.uleb128	.Ll515-.Ll514
	.byte	13
# [842:5]
	.byte	2
	.uleb128	.Ll516-.Ll515
	.byte	13
# [843:5]
	.byte	2
	.uleb128	.Ll517-.Ll516
	.byte	13
# [844:5]
	.byte	2
	.uleb128	.Ll518-.Ll517
	.byte	13
# [845:5]
	.byte	2
	.uleb128	.Ll519-.Ll518
	.byte	13
# [846:5]
	.byte	2
	.uleb128	.Ll520-.Ll519
	.byte	13
# [847:5]
	.byte	2
	.uleb128	.Ll521-.Ll520
	.byte	13
# [848:5]
	.byte	2
	.uleb128	.Ll522-.Ll521
	.byte	13
# [849:5]
	.byte	2
	.uleb128	.Ll523-.Ll522
	.byte	13
# [850:5]
	.byte	2
	.uleb128	.Ll524-.Ll523
	.byte	13
# [851:5]
	.byte	2
	.uleb128	.Ll525-.Ll524
	.byte	13
# [852:5]
	.byte	2
	.uleb128	.Ll526-.Ll525
	.byte	13
# [855:5]
	.byte	2
	.uleb128	.Ll527-.Ll526
	.byte	15
# [856:5]
	.byte	2
	.uleb128	.Ll528-.Ll527
	.byte	13
# [857:5]
	.byte	2
	.uleb128	.Ll529-.Ll528
	.byte	13
# [858:5]
	.byte	2
	.uleb128	.Ll530-.Ll529
	.byte	13
# [859:5]
	.byte	2
	.uleb128	.Ll531-.Ll530
	.byte	13
# [860:5]
	.byte	2
	.uleb128	.Ll532-.Ll531
	.byte	13
# [861:5]
	.byte	2
	.uleb128	.Ll533-.Ll532
	.byte	13
# [862:5]
	.byte	2
	.uleb128	.Ll534-.Ll533
	.byte	13
# [863:5]
	.byte	2
	.uleb128	.Ll535-.Ll534
	.byte	13
# [864:5]
	.byte	2
	.uleb128	.Ll536-.Ll535
	.byte	13
# [865:5]
	.byte	2
	.uleb128	.Ll537-.Ll536
	.byte	13
# [866:5]
	.byte	2
	.uleb128	.Ll538-.Ll537
	.byte	13
# [867:5]
	.byte	2
	.uleb128	.Ll539-.Ll538
	.byte	13
# [868:5]
	.byte	2
	.uleb128	.Ll540-.Ll539
	.byte	13
# [869:5]
	.byte	2
	.uleb128	.Ll541-.Ll540
	.byte	13
# [870:5]
	.byte	2
	.uleb128	.Ll542-.Ll541
	.byte	13
# [871:5]
	.byte	2
	.uleb128	.Ll543-.Ll542
	.byte	13
# [872:5]
	.byte	2
	.uleb128	.Ll544-.Ll543
	.byte	13
# [873:5]
	.byte	2
	.uleb128	.Ll545-.Ll544
	.byte	13
# [874:5]
	.byte	2
	.uleb128	.Ll546-.Ll545
	.byte	13
# [877:5]
	.byte	2
	.uleb128	.Ll547-.Ll546
	.byte	15
# [878:5]
	.byte	2
	.uleb128	.Ll548-.Ll547
	.byte	13
# [879:5]
	.byte	2
	.uleb128	.Ll549-.Ll548
	.byte	13
# [880:5]
	.byte	2
	.uleb128	.Ll550-.Ll549
	.byte	13
# [881:5]
	.byte	2
	.uleb128	.Ll551-.Ll550
	.byte	13
# [882:5]
	.byte	2
	.uleb128	.Ll552-.Ll551
	.byte	13
# [883:5]
	.byte	2
	.uleb128	.Ll553-.Ll552
	.byte	13
# [886:5]
	.byte	2
	.uleb128	.Ll554-.Ll553
	.byte	15
# [887:5]
	.byte	2
	.uleb128	.Ll555-.Ll554
	.byte	13
# [888:5]
	.byte	2
	.uleb128	.Ll556-.Ll555
	.byte	13
# [894:5]
	.byte	2
	.uleb128	.Ll557-.Ll556
	.byte	18
# [895:5]
	.byte	2
	.uleb128	.Ll558-.Ll557
	.byte	13
# [907:5]
	.byte	2
	.uleb128	.Ll559-.Ll558
	.byte	24
# [908:5]
	.byte	2
	.uleb128	.Ll560-.Ll559
	.byte	13
# [909:5]
	.byte	2
	.uleb128	.Ll561-.Ll560
	.byte	13
# [910:5]
	.byte	2
	.uleb128	.Ll562-.Ll561
	.byte	13
# [911:5]
	.byte	2
	.uleb128	.Ll563-.Ll562
	.byte	13
# [913:5]
	.byte	2
	.uleb128	.Ll564-.Ll563
	.byte	14
# [914:5]
	.byte	2
	.uleb128	.Ll565-.Ll564
	.byte	13
# [915:5]
	.byte	2
	.uleb128	.Ll566-.Ll565
	.byte	13
# [916:5]
	.byte	2
	.uleb128	.Ll567-.Ll566
	.byte	13
# [917:5]
	.byte	2
	.uleb128	.Ll568-.Ll567
	.byte	13
# [919:5]
	.byte	2
	.uleb128	.Ll569-.Ll568
	.byte	14
# [920:5]
	.byte	2
	.uleb128	.Ll570-.Ll569
	.byte	13
# [922:5]
	.byte	2
	.uleb128	.Ll571-.Ll570
	.byte	14
# [923:5]
	.byte	2
	.uleb128	.Ll572-.Ll571
	.byte	13
# [924:5]
	.byte	2
	.uleb128	.Ll573-.Ll572
	.byte	13
# [925:5]
	.byte	2
	.uleb128	.Ll574-.Ll573
	.byte	13
# [926:5]
	.byte	2
	.uleb128	.Ll575-.Ll574
	.byte	13
# [927:5]
	.byte	2
	.uleb128	.Ll576-.Ll575
	.byte	13
# [928:5]
	.byte	2
	.uleb128	.Ll577-.Ll576
	.byte	13
# [929:5]
	.byte	2
	.uleb128	.Ll578-.Ll577
	.byte	13
# [930:5]
	.byte	2
	.uleb128	.Ll579-.Ll578
	.byte	13
# [931:5]
	.byte	2
	.uleb128	.Ll580-.Ll579
	.byte	13
# [932:5]
	.byte	2
	.uleb128	.Ll581-.Ll580
	.byte	13
# [933:5]
	.byte	2
	.uleb128	.Ll582-.Ll581
	.byte	13
# [934:5]
	.byte	2
	.uleb128	.Ll583-.Ll582
	.byte	13
# [936:5]
	.byte	2
	.uleb128	.Ll584-.Ll583
	.byte	14
# [937:5]
	.byte	2
	.uleb128	.Ll585-.Ll584
	.byte	13
# [938:5]
	.byte	2
	.uleb128	.Ll586-.Ll585
	.byte	13
# [939:5]
	.byte	2
	.uleb128	.Ll587-.Ll586
	.byte	13
# [940:5]
	.byte	2
	.uleb128	.Ll588-.Ll587
	.byte	13
# [945:5]
	.byte	2
	.uleb128	.Ll589-.Ll588
	.byte	17
# [946:5]
	.byte	2
	.uleb128	.Ll590-.Ll589
	.byte	13
# [947:5]
	.byte	2
	.uleb128	.Ll591-.Ll590
	.byte	13
# [948:5]
	.byte	2
	.uleb128	.Ll592-.Ll591
	.byte	13
# [949:5]
	.byte	2
	.uleb128	.Ll593-.Ll592
	.byte	13
# [951:5]
	.byte	2
	.uleb128	.Ll594-.Ll593
	.byte	14
# [952:5]
	.byte	2
	.uleb128	.Ll595-.Ll594
	.byte	13
# [953:5]
	.byte	2
	.uleb128	.Ll596-.Ll595
	.byte	13
# [954:5]
	.byte	2
	.uleb128	.Ll597-.Ll596
	.byte	13
# [955:5]
	.byte	2
	.uleb128	.Ll598-.Ll597
	.byte	13
# [956:5]
	.byte	2
	.uleb128	.Ll599-.Ll598
	.byte	13
# [957:5]
	.byte	2
	.uleb128	.Ll600-.Ll599
	.byte	13
# [958:5]
	.byte	2
	.uleb128	.Ll601-.Ll600
	.byte	13
# [959:5]
	.byte	2
	.uleb128	.Ll602-.Ll601
	.byte	13
# [960:5]
	.byte	2
	.uleb128	.Ll603-.Ll602
	.byte	13
# [962:5]
	.byte	2
	.uleb128	.Ll604-.Ll603
	.byte	14
# [964:5]
	.byte	2
	.uleb128	.Ll605-.Ll604
	.byte	14
# [965:5]
	.byte	2
	.uleb128	.Ll606-.Ll605
	.byte	13
# [966:5]
	.byte	2
	.uleb128	.Ll607-.Ll606
	.byte	13
# [967:5]
	.byte	2
	.uleb128	.Ll608-.Ll607
	.byte	13
# [969:5]
	.byte	2
	.uleb128	.Ll609-.Ll608
	.byte	14
# [970:5]
	.byte	2
	.uleb128	.Ll610-.Ll609
	.byte	13
# [971:5]
	.byte	2
	.uleb128	.Ll611-.Ll610
	.byte	13
# [972:5]
	.byte	2
	.uleb128	.Ll612-.Ll611
	.byte	13
# [973:5]
	.byte	2
	.uleb128	.Ll613-.Ll612
	.byte	13
# [974:5]
	.byte	2
	.uleb128	.Ll614-.Ll613
	.byte	13
# [975:5]
	.byte	2
	.uleb128	.Ll615-.Ll614
	.byte	13
# [976:5]
	.byte	2
	.uleb128	.Ll616-.Ll615
	.byte	13
# [977:5]
	.byte	2
	.uleb128	.Ll617-.Ll616
	.byte	13
# [978:5]
	.byte	2
	.uleb128	.Ll618-.Ll617
	.byte	13
# [979:5]
	.byte	2
	.uleb128	.Ll619-.Ll618
	.byte	13
# [980:5]
	.byte	2
	.uleb128	.Ll620-.Ll619
	.byte	13
# [981:5]
	.byte	2
	.uleb128	.Ll621-.Ll620
	.byte	13
# [982:5]
	.byte	2
	.uleb128	.Ll622-.Ll621
	.byte	13
# [989:5]
	.byte	2
	.uleb128	.Ll623-.Ll622
	.byte	19
# [990:5]
	.byte	2
	.uleb128	.Ll624-.Ll623
	.byte	13
# [991:5]
	.byte	2
	.uleb128	.Ll625-.Ll624
	.byte	13
# [992:5]
	.byte	2
	.uleb128	.Ll626-.Ll625
	.byte	13
# [993:5]
	.byte	2
	.uleb128	.Ll627-.Ll626
	.byte	13
# [995:5]
	.byte	2
	.uleb128	.Ll628-.Ll627
	.byte	14
# [996:5]
	.byte	2
	.uleb128	.Ll629-.Ll628
	.byte	13
# [997:5]
	.byte	2
	.uleb128	.Ll630-.Ll629
	.byte	13
# [998:5]
	.byte	2
	.uleb128	.Ll631-.Ll630
	.byte	13
# [1002:5]
	.byte	2
	.uleb128	.Ll632-.Ll631
	.byte	16
# [1003:5]
	.byte	2
	.uleb128	.Ll633-.Ll632
	.byte	13
# [1004:5]
	.byte	2
	.uleb128	.Ll634-.Ll633
	.byte	13
# [1005:5]
	.byte	2
	.uleb128	.Ll635-.Ll634
	.byte	13
# [1006:5]
	.byte	2
	.uleb128	.Ll636-.Ll635
	.byte	13
# [1008:5]
	.byte	2
	.uleb128	.Ll637-.Ll636
	.byte	14
# [1009:5]
	.byte	2
	.uleb128	.Ll638-.Ll637
	.byte	13
# [1010:5]
	.byte	2
	.uleb128	.Ll639-.Ll638
	.byte	13
# [1011:5]
	.byte	2
	.uleb128	.Ll640-.Ll639
	.byte	13
# [1012:5]
	.byte	2
	.uleb128	.Ll641-.Ll640
	.byte	13
# [1013:5]
	.byte	2
	.uleb128	.Ll642-.Ll641
	.byte	13
# [1020:5]
	.byte	2
	.uleb128	.Ll643-.Ll642
	.byte	19
# [1021:5]
	.byte	2
	.uleb128	.Ll644-.Ll643
	.byte	13
# [1023:5]
	.byte	2
	.uleb128	.Ll645-.Ll644
	.byte	14
# [1027:5]
	.byte	2
	.uleb128	.Ll646-.Ll645
	.byte	16
# [1030:5]
	.byte	2
	.uleb128	.Ll647-.Ll646
	.byte	15
# [1031:5]
	.byte	2
	.uleb128	.Ll648-.Ll647
	.byte	13
# [1032:5]
	.byte	2
	.uleb128	.Ll649-.Ll648
	.byte	13
# [1038:5]
	.byte	2
	.uleb128	.Ll650-.Ll649
	.byte	18
# [1040:5]
	.byte	2
	.uleb128	.Ll651-.Ll650
	.byte	14
# [1041:5]
	.byte	2
	.uleb128	.Ll652-.Ll651
	.byte	13
# [1042:5]
	.byte	2
	.uleb128	.Ll653-.Ll652
	.byte	13
# [1043:5]
	.byte	2
	.uleb128	.Ll654-.Ll653
	.byte	13
# [1045:5]
	.byte	2
	.uleb128	.Ll655-.Ll654
	.byte	14
# [1046:5]
	.byte	2
	.uleb128	.Ll656-.Ll655
	.byte	13
# [1050:5]
	.byte	2
	.uleb128	.Ll657-.Ll656
	.byte	16
# [1051:5]
	.byte	2
	.uleb128	.Ll658-.Ll657
	.byte	13
# [1052:5]
	.byte	2
	.uleb128	.Ll659-.Ll658
	.byte	13
# [1053:5]
	.byte	2
	.uleb128	.Ll660-.Ll659
	.byte	13
# [1054:5]
	.byte	2
	.uleb128	.Ll661-.Ll660
	.byte	13
# [1055:5]
	.byte	2
	.uleb128	.Ll662-.Ll661
	.byte	13
# [1056:5]
	.byte	2
	.uleb128	.Ll663-.Ll662
	.byte	13
# [1057:5]
	.byte	2
	.uleb128	.Ll664-.Ll663
	.byte	13
# [1058:5]
	.byte	2
	.uleb128	.Ll665-.Ll664
	.byte	13
# [1061:5]
	.byte	2
	.uleb128	.Ll666-.Ll665
	.byte	15
# [1062:5]
	.byte	2
	.uleb128	.Ll667-.Ll666
	.byte	13
# [1063:5]
	.byte	2
	.uleb128	.Ll668-.Ll667
	.byte	13
# [1065:5]
	.byte	2
	.uleb128	.Ll669-.Ll668
	.byte	14
# [1069:5]
	.byte	2
	.uleb128	.Ll670-.Ll669
	.byte	16
# [1070:5]
	.byte	2
	.uleb128	.Ll671-.Ll670
	.byte	13
# [1071:5]
	.byte	2
	.uleb128	.Ll672-.Ll671
	.byte	13
# [1072:5]
	.byte	2
	.uleb128	.Ll673-.Ll672
	.byte	13
# [1073:5]
	.byte	2
	.uleb128	.Ll674-.Ll673
	.byte	13
# [1074:5]
	.byte	2
	.uleb128	.Ll675-.Ll674
	.byte	13
# [1075:5]
	.byte	2
	.uleb128	.Ll676-.Ll675
	.byte	13
# [1078:5]
	.byte	2
	.uleb128	.Ll677-.Ll676
	.byte	15
# [1079:5]
	.byte	2
	.uleb128	.Ll678-.Ll677
	.byte	13
# [1080:5]
	.byte	2
	.uleb128	.Ll679-.Ll678
	.byte	13
# [1082:5]
	.byte	2
	.uleb128	.Ll680-.Ll679
	.byte	14
# [1086:5]
	.byte	2
	.uleb128	.Ll681-.Ll680
	.byte	16
# [1087:5]
	.byte	2
	.uleb128	.Ll682-.Ll681
	.byte	13
# [1088:5]
	.byte	2
	.uleb128	.Ll683-.Ll682
	.byte	13
# [1089:5]
	.byte	2
	.uleb128	.Ll684-.Ll683
	.byte	13
# [1090:5]
	.byte	2
	.uleb128	.Ll685-.Ll684
	.byte	13
# [1091:5]
	.byte	2
	.uleb128	.Ll686-.Ll685
	.byte	13
# [1092:5]
	.byte	2
	.uleb128	.Ll687-.Ll686
	.byte	13
# [1095:5]
	.byte	2
	.uleb128	.Ll688-.Ll687
	.byte	15
# [1096:5]
	.byte	2
	.uleb128	.Ll689-.Ll688
	.byte	13
# [1097:5]
	.byte	2
	.uleb128	.Ll690-.Ll689
	.byte	13
# [1098:5]
	.byte	2
	.uleb128	.Ll691-.Ll690
	.byte	13
# [1099:5]
	.byte	2
	.uleb128	.Ll692-.Ll691
	.byte	13
# [1100:5]
	.byte	2
	.uleb128	.Ll693-.Ll692
	.byte	13
# [1105:5]
	.byte	2
	.uleb128	.Ll694-.Ll693
	.byte	17
# [1106:5]
	.byte	2
	.uleb128	.Ll695-.Ll694
	.byte	13
# [1109:5]
	.byte	2
	.uleb128	.Ll696-.Ll695
	.byte	15
# [1110:5]
	.byte	2
	.uleb128	.Ll697-.Ll696
	.byte	13
# [1113:5]
	.byte	2
	.uleb128	.Ll698-.Ll697
	.byte	15
# [1114:5]
	.byte	2
	.uleb128	.Ll699-.Ll698
	.byte	13
# [1117:5]
	.byte	2
	.uleb128	.Ll700-.Ll699
	.byte	15
# [1118:5]
	.byte	2
	.uleb128	.Ll701-.Ll700
	.byte	13
# [1121:5]
	.byte	2
	.uleb128	.Ll702-.Ll701
	.byte	15
# [1122:5]
	.byte	2
	.uleb128	.Ll703-.Ll702
	.byte	13
# [1125:5]
	.byte	2
	.uleb128	.Ll704-.Ll703
	.byte	15
# [1126:5]
	.byte	2
	.uleb128	.Ll705-.Ll704
	.byte	13
# [1129:5]
	.byte	2
	.uleb128	.Ll706-.Ll705
	.byte	15
# [1130:5]
	.byte	2
	.uleb128	.Ll707-.Ll706
	.byte	13
# [1133:5]
	.byte	2
	.uleb128	.Ll708-.Ll707
	.byte	15
# [1134:5]
	.byte	2
	.uleb128	.Ll709-.Ll708
	.byte	13
# [1139:5]
	.byte	2
	.uleb128	.Ll710-.Ll709
	.byte	17
# [1140:5]
	.byte	2
	.uleb128	.Ll711-.Ll710
	.byte	13
# [1141:5]
	.byte	2
	.uleb128	.Ll712-.Ll711
	.byte	13
# [1142:5]
	.byte	2
	.uleb128	.Ll713-.Ll712
	.byte	13
# [1143:5]
	.byte	2
	.uleb128	.Ll714-.Ll713
	.byte	13
# [1148:5]
	.byte	2
	.uleb128	.Ll715-.Ll714
	.byte	17
# [1149:5]
	.byte	2
	.uleb128	.Ll716-.Ll715
	.byte	13
# [1150:5]
	.byte	2
	.uleb128	.Ll717-.Ll716
	.byte	13
# [1154:5]
	.byte	2
	.uleb128	.Ll718-.Ll717
	.byte	16
# [1155:5]
	.byte	2
	.uleb128	.Ll719-.Ll718
	.byte	13
# [1156:5]
	.byte	2
	.uleb128	.Ll720-.Ll719
	.byte	13
# [1157:5]
	.byte	2
	.uleb128	.Ll721-.Ll720
	.byte	13
# [1158:5]
	.byte	2
	.uleb128	.Ll722-.Ll721
	.byte	13
# [1160:5]
	.byte	2
	.uleb128	.Ll723-.Ll722
	.byte	14
# [1161:5]
	.byte	2
	.uleb128	.Ll724-.Ll723
	.byte	13
# [1162:5]
	.byte	2
	.uleb128	.Ll725-.Ll724
	.byte	13
# [1163:5]
	.byte	2
	.uleb128	.Ll726-.Ll725
	.byte	13
# [1164:5]
	.byte	2
	.uleb128	.Ll727-.Ll726
	.byte	13
# [1166:1]
	.byte	2
	.uleb128	.Ll728-.Ll727
	.byte	5
	.uleb128	1
	.byte	14
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll729
	.byte	0
	.byte	1
	.byte	1
# ###################
.Ledebug_line0:
# End asmlist al_dwarf_line
# Begin asmlist al_dwarf_aranges

.section .debug_aranges
	.long	.Learanges0-.Lf1
.Lf1:
	.short	2
	.secrel32	.Ldebug_info0
	.byte	8
	.byte	0
	.long	0
	.quad	SOMA_CORE_$$_EXECUTE$TVMSTATE
	.quad	.Lt1-SOMA_CORE_$$_EXECUTE$TVMSTATE
	.quad	SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
	.quad	.Lt2-SOMA_CORE_$$_SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN
	.quad	SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
	.quad	.Lt3-SOMA_CORE$_$SOMA_MATINVERSE$POINTER$INT64$INT64$$BOOLEAN_$$_fin$00000002
	.quad	SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
	.quad	.Lt4-SOMA_CORE_$$_SOMA_SIGMOID$DOUBLE$$DOUBLE
	.quad	SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
	.quad	.Lt5-SOMA_CORE_$$_SOMA_TANH$DOUBLE$$DOUBLE
	.quad	0
	.quad	0
.Learanges0:
# End asmlist al_dwarf_aranges
# Begin asmlist al_dwarf_ranges

.section .debug_ranges
# End asmlist al_dwarf_ranges
# Begin asmlist al_end

.section .text.z_DEBUGEND_$SOMA_CORE,"x"
.globl	DEBUGEND_$SOMA_CORE
DEBUGEND_$SOMA_CORE:
# End asmlist al_end

