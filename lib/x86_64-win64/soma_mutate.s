	.file "soma_mutate.pas"
# Begin asmlist al_procedures

.section .text.n_soma_mutate_$$_xorshift64$qword,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_XORSHIFT64$QWORD
SOMA_MUTATE_$$_XORSHIFT64$QWORD:
.Lc1:
# [soma_mutate.pas]
# [45] begin
	movq	%rcx,%rax
# Var rng located in register rax
	movq	(%rax),%rcx
# [46] rng := rng xor (rng shl 13);
	movq	%rcx,%rdx
	shlq	$13,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
	movq	%rdx,%rcx
# [47] rng := rng xor (rng shr 7);
	shrq	$7,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
	movq	%rdx,%rcx
# [48] rng := rng xor (rng shl 17);
	shlq	$17,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
# [49] end;
	ret
.Lc2:

.section .text.n_soma_mutate_$$_mutatepointopcode$tgenome$qword,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD:
.Lc3:
# Var idx located in register eax
# Var G located in register rcx
# Var rng located in register rdx
# [55] begin
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
# [57] idx := rng mod GENOME_SIZE;
	movl	(%rdx),%r8d
	andl	$4095,%r8d
# Var idx located in register r8d
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
# [60] end;
	ret
.Lc4:

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
# [69] idx := rng mod GENOME_SIZE;
	movl	(%rdx),%r9d
	andl	$4095,%r9d
# Var idx located in register r9d
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
# [72] delta := Int32(rng mod UInt64(max_delta * 2 + 1)) - max_delta;
	movslq	%r8d,%rax
	shlq	$1,%rax
	leaq	1(%rax),%r10
	movq	(%rdx),%rax
	xorl	%edx,%edx
	divq	%r10
	subl	%r8d,%edx
# Var delta located in register edx
# [73] G[idx].imm := G[idx].imm + delta;
	movl	%r9d,%eax
	movl	4(%rcx,%rax,8),%eax
	addl	%edx,%eax
	andl	%r9d,%r9d
	movl	%eax,4(%rcx,%r9,8)
# [74] end;
	ret
.Lc6:

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
# [82] if block_size < 1 then block_size := 1;
	cmpl	$1,%r8d
	jnl	.Lj16
	movl	$1,%r8d
	.balign 4,0x90
.Lj16:
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
# [84] start_idx := rng mod (GENOME_SIZE - block_size);
	movslq	%r8d,%rax
	movl	$4096,%r9d
	subq	%rax,%r9
	movq	(%rdx),%rax
	cqto
	idivq	%r9
# Var start_idx located in register edx
# [85] for i := start_idx to start_idx + block_size - 1 do
	leal	(%edx,%r8d),%eax
	subl	$1,%eax
	cmpl	%edx,%eax
	jnge	.Lj19
	subl	$1,%edx
	.balign 8,0x90
.Lj20:
	addl	$1,%edx
# [87] G[i].opcode := OP_NOP;
	movl	%edx,%r8d
	movw	$0,(%rcx,%r8,8)
# [88] G[i].flags  := 0;
	movl	%edx,%r8d
	movb	$0,2(%rcx,%r8,8)
# [89] G[i].pad    := 0;
	movl	%edx,%r8d
	movb	$0,3(%rcx,%r8,8)
# [90] G[i].imm    := 0;
	movl	%edx,%r8d
	movl	$0,4(%rcx,%r8,8)
	cmpl	%edx,%eax
	jnle	.Lj20
	.balign 4,0x90
.Lj19:
# [92] end;
	ret
.Lc8:

.section .text.n_soma_mutate_$$_mutatecopyblock$tgenome$tgenome$qword$longint,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT:
.Lc9:
.seh_proc SOMA_MUTATE_$$_MUTATECOPYBLOCK$TGENOME$TGENOME$QWORD$LONGINT
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
# [101] if block_size < 1 then block_size := 1;
	cmpl	$1,%r9d
	jnl	.Lj26
	movl	$1,%r9d
	.balign 4,0x90
.Lj26:
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
# [103] src_start := rng mod (GENOME_SIZE - block_size);
	movslq	%r9d,%rax
	movl	$4096,%r11d
	subq	%rax,%r11
	movq	(%r8),%rax
	cqto
	idivq	%r11
	movq	%rdx,%r11
# Var src_start located in register r11d
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
# [105] dst_start := rng mod (GENOME_SIZE - block_size);
	movslq	%r9d,%rax
	movl	$4096,%ebx
	subq	%rax,%rbx
	movq	(%r8),%rax
	cqto
	idivq	%rbx
# Var dst_start located in register edx
# [107] for i := 0 to block_size - 1 do
	leal	-1(%r9d),%eax
	testl	%eax,%eax
	jnge	.Lj30
	movl	$-1,%r8d
	.balign 8,0x90
.Lj31:
	addl	$1,%r8d
# [108] dst[dst_start + i] := src[src_start + i];
	movslq	%edx,%r9
	movslq	%r8d,%rbx
	leaq	(%r9,%rbx),%rsi
	movslq	%r11d,%r9
	addq	%rbx,%r9
	movq	(%r10,%r9,8),%r9
	movq	%r9,(%rcx,%rsi,8)
	cmpl	%r8d,%eax
	jnle	.Lj31
	.balign 4,0x90
.Lj30:
# [109] end;
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc10:

.section .text.n_soma_mutate_$$_mutategenome$tgenome$array_of_tgenome$qword,"x"
	.balign 16,0x90
.globl	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD:
.Lc11:
# Temps allocated between rbp-80 and rbp+0
.seh_proc SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
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
# [121] for i := 0 to High(DEFAULT_MUTATION_PARAMS) do
	movl	$-1,%r14d
	.balign 8,0x90
.Lj36:
	addl	$1,%r14d
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
# [125] if roll > DEFAULT_MUTATION_PARAMS[i].rate then
	movl	%r14d,%eax
	imulq	$24,%rax,%rax
	leaq	TC_$SOMA_MUTATE_$$_DEFAULT_MUTATION_PARAMS(%rip),%rdx
	comisd	8(%rdx,%rax),%xmm6
	jp	.Lj42
	ja	.Lj37
	.balign 4,0x90
.Lj42:
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
# [130] MutatePointOpcode(G, rng);
	movq	%r12,%rdx
	movq	%rbx,%rcx
	call	SOMA_MUTATE_$$_MUTATEPOINTOPCODE$TGENOME$QWORD
	jmp	.Lj44
	.balign 4,0x90
.Lj47:
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
# [139] if Length(source_pool) > 0 then
	leaq	1(%rdi),%rax
	testq	%rax,%rax
	jng	.Lj44
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
# [142] donor_idx := rng mod Length(source_pool);
	leaq	1(%rdi),%rcx
	movq	(%r12),%rax
	cqto
	idivq	%rcx
	movl	%edx,%r13d
# [143] MutateCopyBlock(G, source_pool[donor_idx], rng,
	movslq	%edx,%rax
	shlq	$15,%rax
	leaq	(%rsi,%rax),%rdx
# [144] DEFAULT_MUTATION_PARAMS[i].block_size);
	movl	%r14d,%eax
	imulq	$24,%rax,%rcx
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
	cmpl	$3,%r14d
	jnge	.Lj36
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

