	.file "soma_core.pas"
# Begin asmlist al_procedures

.section .text.n_soma_core_$$_execute$tvmstate,"x"
	.balign 16,0x90
.globl	SOMA_CORE_$$_EXECUTE$TVMSTATE
SOMA_CORE_$$_EXECUTE$TVMSTATE:
.Lc1:
.seh_proc SOMA_CORE_$$_EXECUTE$TVMSTATE
# [soma_core.pas]
# [26] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-16(%rsp),%rsp
.seh_stackalloc 16
.seh_endprologue
# Var State located at rbp-8, size=OS_64
	movq	%rcx,-8(%rbp)
.Lj8:
# [28] if State.ip >= GENOME_SIZE then
	movq	-8(%rbp),%rax
	cmpq	$1024,2056(%rax)
	jge	.Lj11
	.balign 4,0x90
#  CPU ATHLON64
# [41] mov rax, State // point to State record
	movq	-8(%rbp),%rax
# [42] mov rcx, [rax + 8192 + 2048 + 8] // load State.ip (simplified offset)
	movq	10248(%rax),%rcx
#  CPU ATHLON64
.Lj5:
# [53] Inc(State.ip);
	movq	-8(%rbp),%rax
	addq	$1,2056(%rax)
# [54] goto _Loop;
	jmp	.Lj8
.Lj6:
# [57] Inc(State.ip);
	movq	-8(%rbp),%rax
	addq	$1,2056(%rax)
# [58] Inc(State.sp);
	movq	-8(%rbp),%rax
	addq	$1,2048(%rax)
# [59] State.stack[State.sp] := State.genome[State.ip - 1].imm;
	movq	-8(%rbp),%rax
	movq	2056(%rax),%rdx
	movslq	2060(%rax,%rdx,8),%rcx
	movq	-8(%rbp),%rdx
	movq	2048(%rax),%rax
	movq	%rcx,(%rdx,%rax,8)
# [60] goto _Loop;
	jmp	.Lj8
.Lj7:
# [63] Inc(State.ip);
	movq	-8(%rbp),%rax
	addq	$1,2056(%rax)
# [64] Dec(State.sp);
	movq	-8(%rbp),%rax
	subq	$1,2048(%rax)
# [65] goto _Loop;
	jmp	.Lj8
.Lj11:
# [68] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:
# End asmlist al_procedures
# Begin asmlist al_typedconsts

.section .data.n_TC_$SOMA_CORE$_$EXECUTE$TVMSTATE_$$_JUMPTABLE,"d"
	.balign 8
TC_$SOMA_CORE$_$EXECUTE$TVMSTATE_$$_JUMPTABLE:
	.quad	.Lj5
	.quad	.Lj6
	.quad	.Lj7
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
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
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
	.secrel32	.Lc6
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
.Lc10:
# End asmlist al_dwarf_frame

