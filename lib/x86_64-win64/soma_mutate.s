	.file "soma_mutate.pas"
# Begin asmlist al_begin

.section .debug_line
.Ldebug_linesection0:
.Ldebug_line0:

.section .debug_abbrev
.Ldebug_abbrevsection0:
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$SOMA_MUTATE,"x"
.globl	DEBUGSTART_$SOMA_MUTATE
DEBUGSTART_$SOMA_MUTATE:
# End asmlist al_begin
# Begin asmlist al_procedures

.section .text.n_soma_mutate_$$_xorshift64$qword,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_XORSHIFT64$QWORD
SOMA_MUTATE_$$_XORSHIFT64$QWORD:
.Lc1:
.Ll1:
# [soma_mutate.pas]
# [45] begin
	movq	%rcx,%rax
# Var rng located in register rax
.Ll2:
	movq	(%rax),%rcx
.Ll3:
# [46] rng := rng xor (rng shl 13);
	movq	%rcx,%rdx
	shlq	$13,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
.Ll4:
	movq	%rdx,%rcx
.Ll5:
# [47] rng := rng xor (rng shr 7);
	shrq	$7,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
.Ll6:
	movq	%rdx,%rcx
.Ll7:
# [48] rng := rng xor (rng shl 17);
	shlq	$17,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
.Ll8:
# [49] end;
	ret
.Lc2:
.Lt1:
.Ll9:

.section .text.n_soma_mutate_$$_mutatepointopcode$tgenome$qword,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD:
.Lc3:
# Var idx located in register eax
# Var G located in register rcx
# Var rng located in register rdx
# [55] begin
.Ll10:
# [56] XorShift64(rng);
	movq	(%rdx),%rax
	shlq	$13,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shrq	$7,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shlq	$17,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
.Ll11:
# [57] idx := rng mod GENOME_SIZE;
	movl	(%rdx),%r8d
	andl	$4095,%r8d
# Var idx located in register r8d
.Ll12:
# [58] XorShift64(rng);
	movq	(%rdx),%rax
	shlq	$13,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shrq	$7,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shlq	$17,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
.Ll13:
# [59] G[idx].opcode := VALID_OPCODES[rng mod VALID_OPCODE_COUNT];
	movq	%rax,%r9
	movq	$-825973615240726191,%rax
	mulq	%r9
	shrq	$6,%rdx
	movl	$67,%eax
	imulq	%rax,%rdx
	subq	%rdx,%r9
	andl	%r8d,%r8d
	leaq	TC_$SOMA_TYPES_$$_VALID_OPCODES(%rip),%rax
	movw	(%rax,%r9,2),%ax
	movw	%ax,(%rcx,%r8,8)
.Ll14:
# [60] end;
	ret
.Lc4:
.Lt2:
.Ll15:

.section .text.n_soma_mutate_$$_mutatepointimm$tgenome$qword$longint,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT
SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT:
.Lc5:
# Var idx located in register eax
# Var delta located in register eax
# Var G located in register rcx
# Var rng located in register rdx
# Var max_delta located in register r8d
# [67] begin
.Ll16:
# [68] XorShift64(rng);
	movq	(%rdx),%rax
	shlq	$13,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shrq	$7,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shlq	$17,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
.Ll17:
# [69] idx := rng mod GENOME_SIZE;
	movl	(%rdx),%r9d
	andl	$4095,%r9d
# Var idx located in register r9d
.Ll18:
# [70] XorShift64(rng);
	movq	(%rdx),%rax
	shlq	$13,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shrq	$7,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shlq	$17,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
.Ll19:
# [72] delta := Int32(rng mod UInt64(max_delta * 2 + 1)) - max_delta;
	movslq	%r8d,%rax
	shlq	$1,%rax
	leaq	1(%rax),%r10
	movq	(%rdx),%rax
	xorl	%edx,%edx
	divq	%r10
	subl	%r8d,%edx
# Var delta located in register edx
.Ll20:
# [73] G[idx].imm := G[idx].imm + delta;
	movl	%r9d,%eax
	movl	4(%rcx,%rax,8),%eax
	addl	%edx,%eax
	andl	%r9d,%r9d
	movl	%eax,4(%rcx,%r9,8)
.Ll21:
# [74] end;
	ret
.Lc6:
.Lt3:
.Ll22:

.section .text.n_soma_mutate_$$_mutatenopblock$tgenome$qword$longint,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT
SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT:
.Lc7:
# Var start_idx located in register eax
# Var i located in register edx
# Var G located in register rcx
# Var rng located in register rdx
# Var block_size located in register r8d
# [81] begin
.Ll23:
# [82] if block_size < 1 then block_size := 1;
	cmpl	$1,%r8d
	jnl	.Lj16
	movl	$1,%r8d
	.balign 4,0x90
.Lj16:
.Ll24:
# [83] XorShift64(rng);
	movq	(%rdx),%rax
	shlq	$13,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shrq	$7,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
	shlq	$17,%rax
	xorq	(%rdx),%rax
	movq	%rax,(%rdx)
.Ll25:
# [84] start_idx := rng mod (GENOME_SIZE - block_size);
	movslq	%r8d,%rax
	movl	$4096,%r9d
	subq	%rax,%r9
	movq	(%rdx),%rax
	cqto
	idivq	%r9
# Var start_idx located in register edx
.Ll26:
# [85] for i := start_idx to start_idx + block_size - 1 do
	leal	(%edx,%r8d),%eax
	subl	$1,%eax
	cmpl	%edx,%eax
	jnge	.Lj19
	subl	$1,%edx
	.balign 8,0x90
.Lj20:
	addl	$1,%edx
.Ll27:
# [87] G[i].opcode := OP_NOP;
	movl	%edx,%r8d
	movw	$0,(%rcx,%r8,8)
.Ll28:
# [88] G[i].flags  := 0;
	movl	%edx,%r8d
	movb	$0,2(%rcx,%r8,8)
.Ll29:
# [89] G[i].pad    := 0;
	movl	%edx,%r8d
	movb	$0,3(%rcx,%r8,8)
.Ll30:
# [90] G[i].imm    := 0;
	movl	%edx,%r8d
	movl	$0,4(%rcx,%r8,8)
.Ll31:
	cmpl	%edx,%eax
	jnle	.Lj20
	.balign 4,0x90
.Lj19:
.Ll32:
# [92] end;
	ret
.Lc8:
.Lt4:
.Ll33:

.section .text.n_soma_mutate_$$_mutatecopyblock$tgenome$tgenome$qword$longint,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT:
.Lc9:
.seh_proc SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
.Ll34:
# [100] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
.seh_endprologue
# Var src_start located in register eax
# Var dst_start located in register eax
# Var i located in register r8d
# Var dst located in register rcx
	movq	%rdx,%r10
# Var src located in register r10
# Var rng located in register r8
# Var block_size located in register r9d
.Ll35:
# [101] if block_size < 1 then block_size := 1;
	cmpl	$1,%r9d
	jnl	.Lj26
	movl	$1,%r9d
	.balign 4,0x90
.Lj26:
.Ll36:
# [102] XorShift64(rng);
	movq	(%r8),%rax
	shlq	$13,%rax
	xorq	(%r8),%rax
	movq	%rax,(%r8)
	shrq	$7,%rax
	xorq	(%r8),%rax
	movq	%rax,(%r8)
	shlq	$17,%rax
	xorq	(%r8),%rax
	movq	%rax,(%r8)
.Ll37:
# [103] src_start := rng mod (GENOME_SIZE - block_size);
	movslq	%r9d,%rax
	movl	$4096,%r11d
	subq	%rax,%r11
	movq	(%r8),%rax
	cqto
	idivq	%r11
	movq	%rdx,%r11
# Var src_start located in register r11d
.Ll38:
# [104] XorShift64(rng);
	movq	(%r8),%rax
	shlq	$13,%rax
	xorq	(%r8),%rax
	movq	%rax,(%r8)
	shrq	$7,%rax
	xorq	(%r8),%rax
	movq	%rax,(%r8)
	shlq	$17,%rax
	xorq	(%r8),%rax
	movq	%rax,(%r8)
.Ll39:
# [105] dst_start := rng mod (GENOME_SIZE - block_size);
	movslq	%r9d,%rax
	movl	$4096,%ebx
	subq	%rax,%rbx
	movq	(%r8),%rax
	cqto
	idivq	%rbx
# Var dst_start located in register edx
.Ll40:
# [107] for i := 0 to block_size - 1 do
	leal	-1(%r9d),%eax
	testl	%eax,%eax
	jnge	.Lj30
	movl	$-1,%r8d
	.balign 8,0x90
.Lj31:
	addl	$1,%r8d
.Ll41:
# [108] dst[dst_start + i] := src[src_start + i];
	movslq	%edx,%r9
	movslq	%r8d,%rbx
	leaq	(%r9,%rbx),%rsi
	movslq	%r11d,%r9
	addq	%rbx,%r9
	movq	(%r10,%r9,8),%r9
	movq	%r9,(%rcx,%rsi,8)
.Ll42:
	cmpl	%r8d,%eax
	jnle	.Lj31
	.balign 4,0x90
.Lj30:
.Ll43:
# [109] end;
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc10:
.Lt5:
.Ll44:

.section .text.n_soma_mutate_$$_mutategenome$tgenome$array_of_tgenome$qword,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD:
.Lc11:
# Temps allocated between rbp-80 and rbp+0
.seh_proc SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
.Ll45:
# [120] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc13:
.Lc14:
	movq	%rsp,%rbp
.Lc15:
	leaq	-112(%rsp),%rsp
.seh_stackalloc 112
	movq	%rbx,-80(%rbp)
	movq	%rdi,-72(%rbp)
	movq	%rsi,-64(%rbp)
	movq	%r12,-56(%rbp)
	movq	%r13,-48(%rbp)
	movq	%r14,-40(%rbp)
	movdqa	%xmm6,-32(%rbp)
.seh_savereg %rbx, 32
.seh_savereg %rdi, 40
.seh_savereg %rsi, 48
.seh_savereg %r12, 56
.seh_savereg %r13, 64
.seh_savereg %r14, 72
.seh_savexmm %xmm6, 80
.seh_endprologue
# Var i located in register eax
# Var roll located in register xmm6
# Var donor_idx located in register r13d
	movq	%rcx,%rbx
# Var G located in register rbx
	movq	%rdx,%rsi
# Var source_pool located in register rsi
	movq	%r8,%rdi
# Var $highSOURCE_POOL located in register rdi
	movq	%r9,%r12
# Var rng located in register r12
# Var i located in register r14d
.Ll46:
# [121] for i := 0 to High(DEFAULT_MUTATION_PARAMS) do
	movl	$-1,%r14d
	.balign 8,0x90
.Lj36:
	addl	$1,%r14d
.Ll47:
# [123] XorShift64(rng);
	movq	(%r12),%rax
	shlq	$13,%rax
	xorq	(%r12),%rax
	movq	%rax,(%r12)
	shrq	$7,%rax
	xorq	(%r12),%rax
	movq	%rax,(%r12)
	shlq	$17,%rax
	xorq	(%r12),%rax
	movq	%rax,(%r12)
.Ll48:
# [124] roll := (rng mod 1000000) / 1000000.0;
	movq	%rax,%rcx
	movq	$4835703278458516699,%rax
	mulq	%rcx
	shrq	$18,%rdx
	movl	$1000000,%eax
	imulq	%rax,%rdx
	subq	%rdx,%rcx
	btq	$63,%rcx
	cvtsi2ssq	%rcx,%xmm0
	jnc	.Lj40
	addss	_$SOMA_MUTATE$_Ld1(%rip),%xmm0
.Lj40:
	divss	_$SOMA_MUTATE$_Ld2(%rip),%xmm0
	cvtss2sd	%xmm0,%xmm6
.Ll49:
# [125] if roll > DEFAULT_MUTATION_PARAMS[i].rate then
	movl	%r14d,%eax
	imulq	$24,%rax,%rax
	leaq	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS(%rip),%rdx
	comisd	8(%rdx,%rax),%xmm6
	jp	.Lj42
	ja	.Lj37
	.balign 4,0x90
.Lj42:
.Ll50:
# [128] case DEFAULT_MUTATION_PARAMS[i].op of
	movl	%r14d,%eax
	imulq	$24,%rax,%rax
	leaq	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS(%rip),%rdx
	movb	(%rdx,%rax),%al
	testb	%al,%al
	je	.Lj46
	subb	$1,%al
	je	.Lj47
	subb	$1,%al
	je	.Lj48
	subb	$1,%al
	je	.Lj49
	jmp	.Lj45
	.balign 4,0x90
.Lj46:
.Ll51:
# [130] MutatePointOpcode(G, rng);
	movq	%r12,%rdx
	movq	%rbx,%rcx
	call	SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
	jmp	.Lj44
	.balign 4,0x90
.Lj47:
.Ll52:
# [133] MutatePointImm(G, rng, DEFAULT_MUTATION_PARAMS[i].imm_delta);
	movl	%r14d,%eax
	imulq	$24,%rax,%rax
	leaq	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS(%rip),%rdx
	movl	16(%rdx,%rax),%r8d
	movq	%r12,%rdx
	movq	%rbx,%rcx
	call	SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT
	jmp	.Lj44
	.balign 4,0x90
.Lj48:
.Ll53:
# [136] MutateNopBlock(G, rng, DEFAULT_MUTATION_PARAMS[i].block_size);
	movl	%r14d,%eax
	imulq	$24,%rax,%rax
	leaq	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS(%rip),%rdx
	movl	20(%rdx,%rax),%r8d
	movq	%r12,%rdx
	movq	%rbx,%rcx
	call	SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT
	jmp	.Lj44
	.balign 4,0x90
.Lj49:
.Ll54:
# [139] if Length(source_pool) > 0 then
	leaq	1(%rdi),%rax
	testq	%rax,%rax
	jng	.Lj44
.Ll55:
# [141] XorShift64(rng);
	movq	(%r12),%rax
	shlq	$13,%rax
	xorq	(%r12),%rax
	movq	%rax,(%r12)
	shrq	$7,%rax
	xorq	(%r12),%rax
	movq	%rax,(%r12)
	shlq	$17,%rax
	xorq	(%r12),%rax
	movq	%rax,(%r12)
.Ll56:
# [142] donor_idx := rng mod Length(source_pool);
	leaq	1(%rdi),%rcx
	movq	(%r12),%rax
	cqto
	idivq	%rcx
	movl	%edx,%r13d
.Ll57:
# [143] MutateCopyBlock(G, source_pool[donor_idx], rng,
	movslq	%edx,%rax
	shlq	$15,%rax
	leaq	(%rsi,%rax),%rdx
.Ll58:
# [144] DEFAULT_MUTATION_PARAMS[i].block_size);
	movl	%r14d,%eax
	imulq	$24,%rax,%rcx
.Ll59:
	leaq	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS(%rip),%rax
	movl	20(%rax,%rcx),%r9d
	movq	%r12,%r8
	movq	%rbx,%rcx
	call	SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
	.balign 4,0x90
	.balign 4,0x90
.Lj45:
	.balign 4,0x90
.Lj44:
.Lj37:
.Ll60:
	cmpl	$3,%r14d
	jnge	.Lj36
.Ll61:
# [148] end;
	movq	-80(%rbp),%rbx
	movq	-72(%rbp),%rdi
	movq	-64(%rbp),%rsi
	movq	-56(%rbp),%r12
	movq	-48(%rbp),%r13
	movq	-40(%rbp),%r14
	movdqa	-32(%rbp),%xmm6
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc12:
.Lt6:
.Ll62:
# End asmlist al_procedures
# Begin asmlist al_typedconsts

.section .data.n_TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS,"d"
	.balign 8
.globl	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS
TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS:
	.byte	0,0,0,0,0,0,0,0
# value: 0d+2.0000000000000000E-002
	.byte	123,20,174,71,225,122,148,63
	.long	0,0
	.byte	1,0,0,0,0,0,0,0
# value: 0d+5.0000000000000003E-002
	.byte	154,153,153,153,153,153,169,63
	.long	16,0
	.byte	2,0,0,0,0,0,0,0
# value: 0d+1.0000000000000000E-002
	.byte	123,20,174,71,225,122,132,63
	.long	0,4
	.byte	3,0,0,0,0,0,0,0
# value: 0d+1.0000000000000000E-002
	.byte	123,20,174,71,225,122,132,63
	.long	0,8
# [33] procedure XorShift64(var rng: UInt64); inline;

.section .rodata.n__$SOMA_MUTATE$_Ld1,"d"
	.balign 8
.globl	_$SOMA_MUTATE$_Ld1
_$SOMA_MUTATE$_Ld1:
	.long	1602224128

.section .rodata.n__$SOMA_MUTATE$_Ld2,"d"
	.balign 4
.globl	_$SOMA_MUTATE$_Ld2
_$SOMA_MUTATE$_Ld2:
# value: 0d+1.000000000E+06
	.byte	0,36,116,73
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONOP,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP
RTTI_$SOMA_MUTATE_$$_TMUTATIONOP:
	.byte	3,11
# [151] 
	.ascii	"TMutationOp"
	.byte	1
	.long	0,3
	.quad	0
	.byte	13
	.ascii	"moPointOpcode"
	.byte	10
	.ascii	"moPointImm"
	.byte	10
	.ascii	"moNopBlock"
	.byte	11
	.ascii	"moCopyBlock"
	.byte	11
	.ascii	"soma_mutate"
	.byte	0

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o
RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o:
	.long	4,3
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+66
	.long	2
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+55
	.long	1
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+44
	.long	0
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+30

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s
RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s:
	.long	0
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+30
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+44
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+55
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP+66

.section .rodata.n_INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS,"d"
	.balign 8
.globl	INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS
INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS:
	.byte	13,15
	.ascii	"TMutationParams"
	.quad	0
	.long	24
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS
RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS:
	.byte	13,15
	.ascii	"TMutationParams"
	.quad	INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS
	.long	24,4
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	8
	.quad	RTTI_$SYSTEM_$$_LONGINT$indirect
	.quad	16
	.quad	RTTI_$SYSTEM_$$_LONGINT$indirect
	.quad	20
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONOP,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP$indirect
RTTI_$SOMA_MUTATE_$$_TMUTATIONOP$indirect:
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o$indirect
RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o$indirect:
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_s2o

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s$indirect
RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s$indirect:
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONOP_o2s

.section .rodata.n_INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS,"d"
	.balign 8
.globl	INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS$indirect
INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS$indirect:
	.quad	INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS

.section .rodata.n_RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS,"d"
	.balign 8
.globl	RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS$indirect
RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS$indirect:
	.quad	RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc16:
	.long	.Lc18-.Lc17
.Lc17:
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
.Lc18:
	.long	.Lc20-.Lc19
.Lc19:
	.secrel32	.Lc16
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.balign 4,0
.Lc20:
	.long	.Lc22-.Lc21
.Lc21:
	.secrel32	.Lc16
	.quad	.Lc3
	.quad	.Lc4-.Lc3
	.balign 4,0
.Lc22:
	.long	.Lc24-.Lc23
.Lc23:
	.secrel32	.Lc16
	.quad	.Lc5
	.quad	.Lc6-.Lc5
	.balign 4,0
.Lc24:
	.long	.Lc26-.Lc25
.Lc25:
	.secrel32	.Lc16
	.quad	.Lc7
	.quad	.Lc8-.Lc7
	.balign 4,0
.Lc26:
	.long	.Lc28-.Lc27
.Lc27:
	.secrel32	.Lc16
	.quad	.Lc9
	.quad	.Lc10-.Lc9
	.balign 4,0
.Lc28:
	.long	.Lc30-.Lc29
.Lc29:
	.secrel32	.Lc16
	.quad	.Lc11
	.quad	.Lc12-.Lc11
	.byte	4
	.long	.Lc13-.Lc11
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc14-.Lc13
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc15-.Lc14
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc30:
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
# [44] procedure XorShift64(var rng: UInt64); inline;
	.ascii	"soma_mutate.pas\000"
	.ascii	"Free Pascal 3.2.2 2026/06/06\000"
	.ascii	"C:/dev/soma/\000"
	.byte	9
	.byte	3
	.secrel32	.Ldebug_line0
	.quad	DEBUGSTART_$SOMA_MUTATE
	.quad	DEBUGEND_$SOMA_MUTATE
# Syms - Begin unit SOMA_MUTATE has index 11
# Symbol SOMA_MUTATE
# Symbol SYSTEM
# Symbol OBJPAS
# Symbol SOMA_TYPES
# Symbol TMUTATIONOP
# Symbol MOPOINTOPCODE
# Symbol MOPOINTIMM
# Symbol MONOPBLOCK
# Symbol MOCOPYBLOCK
# Symbol TMUTATIONPARAMS
# Symbol DEFAULT_MUTATION_PARAMS
	.uleb128	2
	.ascii	"DEFAULT_MUTATION_PARAMS\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS
	.long	.La5-.Ldebug_info0
# Symbol XORSHIFT64
# Symbol MUTATEPOINTOPCODE
# Symbol MUTATEPOINTIMM
# Symbol MUTATENOPBLOCK
# Symbol MUTATECOPYBLOCK
# Symbol MUTATEGENOME
# Syms - End unit SOMA_MUTATE has index 11
# Syms - Begin Staticsymtable
# Symbol SOMA_MUTATE_$$_init$
# Symbol rttidef$RTTI_$SOMA_MUTATE_$$_TMUTATIONOP
# Symbol rtti_header$11
# Symbol rtti_enum_size_start_rec$00000000
# Symbol rtti_enum_min_max_rec$00000000
# Symbol rtti_enum_basetype_array_rec$00000000
# Symbol rttidef$INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS
# Symbol rtti_header$15
# Symbol rttidef$RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS
# Syms - End Staticsymtable
# Procdef XorShift64(var QWord);
	.uleb128	3
	.ascii	"XorShift64\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_MUTATE_$$_XORSHIFT64$QWORD
	.quad	.Lt1
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	0
	.sleb128	0
	.long	.La23-.Ldebug_info0
	.byte	0
# Procdef MutatePointOpcode(var TGenome;var QWord);
	.uleb128	3
	.ascii	"MutatePointOpcode\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
	.quad	.Lt2
# Symbol G
	.uleb128	4
	.ascii	"G\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La25-.Ldebug_info0
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	1
	.sleb128	0
	.long	.La23-.Ldebug_info0
# Symbol IDX
	.uleb128	5
	.ascii	"idx\000"
	.byte	2
	.byte	144
	.uleb128	8
	.long	.La27-.Ldebug_info0
	.byte	0
# Procdef MutatePointImm(var TGenome;var QWord;LongInt);
	.uleb128	3
	.ascii	"MutatePointImm\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT
	.quad	.Lt3
# Symbol G
	.uleb128	4
	.ascii	"G\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La25-.Ldebug_info0
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	1
	.sleb128	0
	.long	.La23-.Ldebug_info0
# Symbol MAX_DELTA
	.uleb128	4
	.ascii	"max_delta\000"
	.byte	2
	.byte	144
	.uleb128	8
	.long	.La27-.Ldebug_info0
# Symbol IDX
	.uleb128	5
	.ascii	"idx\000"
	.byte	2
	.byte	144
	.uleb128	9
	.long	.La27-.Ldebug_info0
# Symbol DELTA
	.uleb128	5
	.ascii	"delta\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La27-.Ldebug_info0
	.byte	0
# Procdef MutateNopBlock(var TGenome;var QWord;LongInt);
	.uleb128	3
	.ascii	"MutateNopBlock\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT
	.quad	.Lt4
# Symbol G
	.uleb128	4
	.ascii	"G\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La25-.Ldebug_info0
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	1
	.sleb128	0
	.long	.La23-.Ldebug_info0
# Symbol BLOCK_SIZE
	.uleb128	4
	.ascii	"block_size\000"
	.byte	2
	.byte	144
	.uleb128	8
	.long	.La27-.Ldebug_info0
# Symbol START_IDX
	.uleb128	5
	.ascii	"start_idx\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La27-.Ldebug_info0
# Symbol I
	.uleb128	5
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La27-.Ldebug_info0
	.byte	0
# Procdef MutateCopyBlock(var TGenome;const TGenome;var QWord;LongInt);
	.uleb128	3
	.ascii	"MutateCopyBlock\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
	.quad	.Lt5
# Symbol DST
	.uleb128	4
	.ascii	"dst\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La25-.Ldebug_info0
# Symbol SRC
	.uleb128	4
	.ascii	"src\000"
	.byte	3
	.byte	146
	.uleb128	10
	.sleb128	0
	.long	.La25-.Ldebug_info0
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	8
	.sleb128	0
	.long	.La23-.Ldebug_info0
# Symbol BLOCK_SIZE
	.uleb128	4
	.ascii	"block_size\000"
	.byte	2
	.byte	144
	.uleb128	9
	.long	.La27-.Ldebug_info0
# Symbol SRC_START
	.uleb128	5
	.ascii	"src_start\000"
	.byte	2
	.byte	144
	.uleb128	11
	.long	.La27-.Ldebug_info0
# Symbol DST_START
	.uleb128	5
	.ascii	"dst_start\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La27-.Ldebug_info0
# Symbol I
	.uleb128	5
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	8
	.long	.La27-.Ldebug_info0
	.byte	0
# Procdef MutateGenome(var TGenome;const {Open} Array Of TGenome;<const Int64>;var QWord);
	.uleb128	3
	.ascii	"MutateGenome\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
	.quad	.Lt6
# Symbol G
	.uleb128	4
	.ascii	"G\000"
	.byte	3
	.byte	146
	.uleb128	3
	.sleb128	0
	.long	.La25-.Ldebug_info0
# Symbol SOURCE_POOL
	.uleb128	4
	.ascii	"source_pool\000"
	.byte	3
	.byte	146
	.uleb128	4
	.sleb128	0
	.long	.La29-.Ldebug_info0
# Symbol highSOURCE_POOL
	.uleb128	4
	.ascii	"$highSOURCE_POOL\000"
	.byte	2
	.byte	144
	.uleb128	5
	.long	.La31-.Ldebug_info0
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	12
	.sleb128	0
	.long	.La23-.Ldebug_info0
# Symbol I
	.uleb128	5
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	14
	.long	.La27-.Ldebug_info0
# Symbol ROLL
	.uleb128	5
	.ascii	"roll\000"
	.byte	2
	.byte	144
	.uleb128	23
	.long	.La33-.Ldebug_info0
# Symbol DONOR_IDX
	.uleb128	5
	.ascii	"donor_idx\000"
	.byte	2
	.byte	144
	.uleb128	13
	.long	.La27-.Ldebug_info0
# Definition {Open} Array Of TGenome
.La29:
	.uleb128	6
	.long	.La25-.Ldebug_info0
	.uleb128	7
	.sleb128	0
	.uleb128	32768
	.long	.La31-.Ldebug_info0
	.byte	0
.La30:
	.uleb128	8
	.long	.La29-.Ldebug_info0
	.byte	0
# Defs - Begin unit SYSTEM has index 1
# Definition LongInt
.La27:
	.uleb128	9
	.ascii	"LongInt\000"
	.long	.La35-.Ldebug_info0
.La35:
	.uleb128	10
	.ascii	"LongInt\000"
	.byte	5
	.byte	4
.La28:
	.uleb128	8
	.long	.La27-.Ldebug_info0
# Definition QWord
.La23:
	.uleb128	9
	.ascii	"QWord\000"
	.long	.La36-.Ldebug_info0
.La36:
	.uleb128	10
	.ascii	"QWord\000"
	.byte	7
	.byte	8
.La24:
	.uleb128	8
	.long	.La23-.Ldebug_info0
# Definition Int64
.La31:
	.uleb128	9
	.ascii	"Int64\000"
	.long	.La37-.Ldebug_info0
.La37:
	.uleb128	10
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.La32:
	.uleb128	8
	.long	.La31-.Ldebug_info0
# Definition Double
.La33:
	.uleb128	9
	.ascii	"Double\000"
	.long	.La38-.Ldebug_info0
.La38:
	.uleb128	10
	.ascii	"Double\000"
	.byte	4
	.byte	8
.La34:
	.uleb128	8
	.long	.La33-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit SOMA_TYPES has index 8
# Definition TGenome
.La25:
	.uleb128	9
	.ascii	"TGenome\000"
	.long	.La39-.Ldebug_info0
.La39:
	.uleb128	11
	.ascii	"TGenome\000"
	.uleb128	32768
	.long	.La40-.Ldebug_info0
	.uleb128	12
	.sleb128	0
	.sleb128	4095
	.uleb128	8
	.long	.La42-.Ldebug_info0
	.byte	0
.La26:
	.uleb128	8
	.long	.La25-.Ldebug_info0
# Definition TInstruction
.La40:
	.uleb128	9
	.ascii	"TInstruction\000"
	.long	.La44-.Ldebug_info0
.La44:
	.uleb128	13
	.ascii	"TINSTRUCTION\000"
	.uleb128	8
	.uleb128	14
	.ascii	"opcode\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La45-.Ldebug_info0
	.uleb128	14
	.ascii	"flags\000"
	.byte	2
	.byte	35
	.uleb128	2
	.long	.La47-.Ldebug_info0
	.uleb128	14
	.ascii	"pad\000"
	.byte	2
	.byte	35
	.uleb128	3
	.long	.La47-.Ldebug_info0
	.uleb128	14
	.ascii	"imm\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La27-.Ldebug_info0
	.byte	0
.La41:
	.uleb128	8
	.long	.La40-.Ldebug_info0
# Defs - End unit SOMA_TYPES has index 8
# Defs - Begin unit SOMA_MUTATE has index 11
# Definition TMutationOp
.La1:
	.uleb128	9
	.ascii	"TMutationOp\000"
	.long	.La49-.Ldebug_info0
.La49:
	.uleb128	15
	.ascii	"TMutationOp\000"
	.byte	1
	.uleb128	16
	.ascii	"moPointOpcode\000"
	.long	0
	.uleb128	16
	.ascii	"moPointImm\000"
	.long	1
	.uleb128	16
	.ascii	"moNopBlock\000"
	.long	2
	.uleb128	16
	.ascii	"moCopyBlock\000"
	.long	3
	.byte	0
.La2:
	.uleb128	8
	.long	.La1-.Ldebug_info0
# Definition TMutationParams
.La3:
	.uleb128	9
	.ascii	"TMutationParams\000"
	.long	.La50-.Ldebug_info0
.La50:
	.uleb128	13
	.ascii	"TMUTATIONPARAMS\000"
	.uleb128	24
	.uleb128	14
	.ascii	"op\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La1-.Ldebug_info0
	.uleb128	14
	.ascii	"rate\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La33-.Ldebug_info0
	.uleb128	14
	.ascii	"imm_delta\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La27-.Ldebug_info0
	.uleb128	14
	.ascii	"block_size\000"
	.byte	2
	.byte	35
	.uleb128	20
	.long	.La27-.Ldebug_info0
	.byte	0
.La4:
	.uleb128	8
	.long	.La3-.Ldebug_info0
# Definition Array[0..3] Of TMutationParams
.La5:
	.uleb128	17
	.uleb128	96
	.long	.La3-.Ldebug_info0
	.uleb128	12
	.sleb128	0
	.sleb128	3
	.uleb128	24
	.long	.La51-.Ldebug_info0
	.byte	0
.La6:
	.uleb128	8
	.long	.La5-.Ldebug_info0
# Defs - End unit SOMA_MUTATE has index 11
# Defs - Begin Staticsymtable
# Definition <record type>
.La7:
	.uleb128	9
	.ascii	"$rttidef$RTTI_$SOMA_MUTATE_$$_TMUTATIONOP\000"
	.long	.La53-.Ldebug_info0
.La53:
	.uleb128	13
	.ascii	"$RTTIDEF$RTTI_$SOMA_MUTATE_$$_TMUTATIONOP\000"
	.uleb128	91
	.byte	0
.La8:
	.uleb128	8
	.long	.La7-.Ldebug_info0
# Definition <record type>
.La9:
	.uleb128	9
	.ascii	"$rtti_header$11\000"
	.long	.La54-.Ldebug_info0
.La54:
	.uleb128	13
	.ascii	"$RTTI_HEADER$11\000"
	.uleb128	13
	.byte	0
.La10:
	.uleb128	8
	.long	.La9-.Ldebug_info0
# Definition <record type>
.La11:
	.uleb128	9
	.ascii	"$rtti_enum_size_start_rec$00000000\000"
	.long	.La55-.Ldebug_info0
.La55:
	.uleb128	13
	.ascii	"$RTTI_ENUM_SIZE_START_REC$00000000\000"
	.uleb128	78
	.byte	0
.La12:
	.uleb128	8
	.long	.La11-.Ldebug_info0
# Definition <record type>
.La13:
	.uleb128	9
	.ascii	"$rtti_enum_min_max_rec$00000000\000"
	.long	.La56-.Ldebug_info0
.La56:
	.uleb128	13
	.ascii	"$RTTI_ENUM_MIN_MAX_REC$00000000\000"
	.uleb128	77
	.byte	0
.La14:
	.uleb128	8
	.long	.La13-.Ldebug_info0
# Definition <record type>
.La15:
	.uleb128	9
	.ascii	"$rtti_enum_basetype_array_rec$00000000\000"
	.long	.La57-.Ldebug_info0
.La57:
	.uleb128	13
	.ascii	"$RTTI_ENUM_BASETYPE_ARRAY_REC$00000000\000"
	.uleb128	69
	.byte	0
.La16:
	.uleb128	8
	.long	.La15-.Ldebug_info0
# Definition <record type>
.La17:
	.uleb128	9
	.ascii	"$rttidef$INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS\000"
	.long	.La58-.Ldebug_info0
.La58:
	.uleb128	13
	.ascii	"$RTTIDEF$INIT_$SOMA_MUTATE_$$_TMUTATIONPARAMS\000"
	.uleb128	49
	.byte	0
.La18:
	.uleb128	8
	.long	.La17-.Ldebug_info0
# Definition <record type>
.La19:
	.uleb128	9
	.ascii	"$rtti_header$15\000"
	.long	.La59-.Ldebug_info0
.La59:
	.uleb128	13
	.ascii	"$RTTI_HEADER$15\000"
	.uleb128	17
	.byte	0
.La20:
	.uleb128	8
	.long	.La19-.Ldebug_info0
# Definition <record type>
.La21:
	.uleb128	9
	.ascii	"$rttidef$RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS\000"
	.long	.La60-.Ldebug_info0
.La60:
	.uleb128	13
	.ascii	"$RTTIDEF$RTTI_$SOMA_MUTATE_$$_TMUTATIONPARAMS\000"
	.uleb128	97
	.byte	0
.La22:
	.uleb128	8
	.long	.La21-.Ldebug_info0
# Defs - End Staticsymtable
# Definition SmallInt
.La42:
	.uleb128	9
	.ascii	"SmallInt\000"
	.long	.La61-.Ldebug_info0
.La61:
	.uleb128	10
	.ascii	"SmallInt\000"
	.byte	5
	.byte	2
.La43:
	.uleb128	8
	.long	.La42-.Ldebug_info0
# Definition Word
.La45:
	.uleb128	9
	.ascii	"Word\000"
	.long	.La62-.Ldebug_info0
.La62:
	.uleb128	10
	.ascii	"Word\000"
	.byte	7
	.byte	2
.La46:
	.uleb128	8
	.long	.La45-.Ldebug_info0
# Definition Byte
.La47:
	.uleb128	9
	.ascii	"Byte\000"
	.long	.La63-.Ldebug_info0
.La63:
	.uleb128	10
	.ascii	"Byte\000"
	.byte	7
	.byte	1
.La48:
	.uleb128	8
	.long	.La47-.Ldebug_info0
# Definition ShortInt
.La51:
	.uleb128	9
	.ascii	"ShortInt\000"
	.long	.La64-.Ldebug_info0
.La64:
	.uleb128	10
	.ascii	"ShortInt\000"
	.byte	5
	.byte	1
.La52:
	.uleb128	8
	.long	.La51-.Ldebug_info0
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
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	63
	.uleb128	12
	.uleb128	2
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 3
	.uleb128	3
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
# Abbrev 4
	.uleb128	4
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
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 7
	.uleb128	7
	.uleb128	33
	.byte	0
	.uleb128	34
	.uleb128	13
	.uleb128	81
	.uleb128	15
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
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 10
	.uleb128	10
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
# Abbrev 11
	.uleb128	11
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
# Abbrev 12
	.uleb128	12
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
# Abbrev 13
	.uleb128	13
	.uleb128	19
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 14
	.uleb128	14
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
# Abbrev 15
	.uleb128	15
	.uleb128	4
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 16
	.uleb128	16
	.uleb128	40
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	28
	.uleb128	6
	.byte	0
	.byte	0
# Abbrev 17
	.uleb128	17
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
	.ascii	"soma_mutate.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Lehdebug_line0:
# === header end ===
# function: SOMA_MUTATE_$$_XORSHIFT64$QWORD
# [45:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	56
# [45:1]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	1
# [46:18]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	5
	.uleb128	18
	.byte	13
# [45:1]
	.byte	2
	.uleb128	.Ll4-.Ll3
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-1
	.byte	1
# [47:18]
	.byte	2
	.uleb128	.Ll5-.Ll4
	.byte	5
	.uleb128	18
	.byte	14
# [45:1]
	.byte	2
	.uleb128	.Ll6-.Ll5
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-2
	.byte	1
# [48:18]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	5
	.uleb128	18
	.byte	15
# [49:1]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll9
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
# [56:3]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll10
	.byte	5
	.uleb128	3
	.byte	67
# [57:14]
	.byte	2
	.uleb128	.Ll11-.Ll10
	.byte	5
	.uleb128	14
	.byte	13
# [58:3]
	.byte	2
	.uleb128	.Ll12-.Ll11
	.byte	5
	.uleb128	3
	.byte	13
# [59:38]
	.byte	2
	.uleb128	.Ll13-.Ll12
	.byte	5
	.uleb128	38
	.byte	13
# [60:1]
	.byte	2
	.uleb128	.Ll14-.Ll13
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll15
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT
# [68:3]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll16
	.byte	5
	.uleb128	3
	.byte	79
# [69:14]
	.byte	2
	.uleb128	.Ll17-.Ll16
	.byte	5
	.uleb128	14
	.byte	13
# [70:3]
	.byte	2
	.uleb128	.Ll18-.Ll17
	.byte	5
	.uleb128	3
	.byte	13
# [72:33]
	.byte	2
	.uleb128	.Ll19-.Ll18
	.byte	5
	.uleb128	33
	.byte	14
# [73:19]
	.byte	2
	.uleb128	.Ll20-.Ll19
	.byte	5
	.uleb128	19
	.byte	13
# [74:1]
	.byte	2
	.uleb128	.Ll21-.Ll20
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll22
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT
# [82:17]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll23
	.byte	5
	.uleb128	17
	.byte	93
# [83:3]
	.byte	2
	.uleb128	.Ll24-.Ll23
	.byte	5
	.uleb128	3
	.byte	13
# [84:39]
	.byte	2
	.uleb128	.Ll25-.Ll24
	.byte	5
	.uleb128	39
	.byte	13
# [85:35]
	.byte	2
	.uleb128	.Ll26-.Ll25
	.byte	5
	.uleb128	35
	.byte	13
# [87:7]
	.byte	2
	.uleb128	.Ll27-.Ll26
	.byte	5
	.uleb128	7
	.byte	14
# [88:7]
	.byte	2
	.uleb128	.Ll28-.Ll27
	.byte	13
# [89:7]
	.byte	2
	.uleb128	.Ll29-.Ll28
	.byte	13
# [90:7]
	.byte	2
	.uleb128	.Ll30-.Ll29
	.byte	13
# [85:3]
	.byte	2
	.uleb128	.Ll31-.Ll30
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-5
	.byte	1
# [92:1]
	.byte	2
	.uleb128	.Ll32-.Ll31
	.byte	5
	.uleb128	1
	.byte	19
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll33
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
# [100:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll34
	.byte	5
	.uleb128	1
	.byte	111
# [101:17]
	.byte	2
	.uleb128	.Ll35-.Ll34
	.byte	5
	.uleb128	17
	.byte	13
# [102:3]
	.byte	2
	.uleb128	.Ll36-.Ll35
	.byte	5
	.uleb128	3
	.byte	13
# [103:39]
	.byte	2
	.uleb128	.Ll37-.Ll36
	.byte	5
	.uleb128	39
	.byte	13
# [104:3]
	.byte	2
	.uleb128	.Ll38-.Ll37
	.byte	5
	.uleb128	3
	.byte	13
# [105:39]
	.byte	2
	.uleb128	.Ll39-.Ll38
	.byte	5
	.uleb128	39
	.byte	13
# [107:28]
	.byte	2
	.uleb128	.Ll40-.Ll39
	.byte	5
	.uleb128	28
	.byte	14
# [108:9]
	.byte	2
	.uleb128	.Ll41-.Ll40
	.byte	5
	.uleb128	9
	.byte	13
# [107:3]
	.byte	2
	.uleb128	.Ll42-.Ll41
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-1
	.byte	1
# [109:1]
	.byte	2
	.uleb128	.Ll43-.Ll42
	.byte	5
	.uleb128	1
	.byte	14
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll44
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
# [120:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll45
	.byte	5
	.uleb128	1
	.byte	131
# [121:3]
	.byte	2
	.uleb128	.Ll46-.Ll45
	.byte	5
	.uleb128	3
	.byte	13
# [123:5]
	.byte	2
	.uleb128	.Ll47-.Ll46
	.byte	5
	.uleb128	5
	.byte	14
# [124:13]
	.byte	2
	.uleb128	.Ll48-.Ll47
	.byte	5
	.uleb128	13
	.byte	13
# [125:39]
	.byte	2
	.uleb128	.Ll49-.Ll48
	.byte	5
	.uleb128	39
	.byte	13
# [128:34]
	.byte	2
	.uleb128	.Ll50-.Ll49
	.byte	5
	.uleb128	34
	.byte	15
# [130:9]
	.byte	2
	.uleb128	.Ll51-.Ll50
	.byte	5
	.uleb128	9
	.byte	14
# [133:56]
	.byte	2
	.uleb128	.Ll52-.Ll51
	.byte	5
	.uleb128	56
	.byte	15
# [136:56]
	.byte	2
	.uleb128	.Ll53-.Ll52
	.byte	15
# [139:32]
	.byte	2
	.uleb128	.Ll54-.Ll53
	.byte	5
	.uleb128	32
	.byte	15
# [141:11]
	.byte	2
	.uleb128	.Ll55-.Ll54
	.byte	5
	.uleb128	11
	.byte	14
# [142:51]
	.byte	2
	.uleb128	.Ll56-.Ll55
	.byte	5
	.uleb128	51
	.byte	13
# [143:42]
	.byte	2
	.uleb128	.Ll57-.Ll56
	.byte	5
	.uleb128	42
	.byte	13
# [144:52]
	.byte	2
	.uleb128	.Ll58-.Ll57
	.byte	5
	.uleb128	52
	.byte	13
# [143:11]
	.byte	2
	.uleb128	.Ll59-.Ll58
	.byte	5
	.uleb128	11
	.byte	3
	.sleb128	-1
	.byte	1
# [121:3]
	.byte	2
	.uleb128	.Ll60-.Ll59
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-22
	.byte	1
# [148:1]
	.byte	2
	.uleb128	.Ll61-.Ll60
	.byte	5
	.uleb128	1
	.byte	39
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll62
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
	.quad	SOMA_MUTATE_$$_XORSHIFT64$QWORD
	.quad	.Lt1-SOMA_MUTATE_$$_XORSHIFT64$QWORD
	.quad	SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
	.quad	.Lt2-SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
	.quad	SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT
	.quad	.Lt3-SOMA_MUTATE_$$_MUTATEPOINTIMM$TGENOME$QWORD$LONGINT
	.quad	SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT
	.quad	.Lt4-SOMA_MUTATE_$$_MUTATENOPBLOCK$TGENOME$QWORD$LONGINT
	.quad	SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
	.quad	.Lt5-SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
	.quad	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
	.quad	.Lt6-SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
	.quad	0
	.quad	0
.Learanges0:
# End asmlist al_dwarf_aranges
# Begin asmlist al_dwarf_ranges

.section .debug_ranges
# End asmlist al_dwarf_ranges
# Begin asmlist al_end

.section .text.z_DEBUGEND_$SOMA_MUTATE,"x"
.globl	DEBUGEND_$SOMA_MUTATE
DEBUGEND_$SOMA_MUTATE:
# End asmlist al_end

