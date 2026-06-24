	.file "soma_core.pas"
# Begin asmlist al_procedures

.section .text.n_soma_core_$$_execute$tvmstate,"x"
	.balign 16,0x90
.globl	SOMA_CORE_$$_EXECUTE$TVMSTATE
SOMA_CORE_$$_EXECUTE$TVMSTATE:
.Lc1:
.seh_proc SOMA_CORE_$$_EXECUTE$TVMSTATE
# [soma_core.pas]
# [19] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
# Var State located at rbp-8, size=OS_64
# Var JumpTable located at rbp-32, size=OS_NO
	movq	%rcx,-8(%rbp)
# [20] JumpTable[0] := @_NOP;
	leaq	.Lj7(%rip),%rax
	movq	%rax,-32(%rbp)
# [21] JumpTable[1] := @_PUSH;
	leaq	.Lj8(%rip),%rax
	movq	%rax,-24(%rbp)
# [22] JumpTable[2] := @_POP;
	leaq	.Lj9(%rip),%rax
	movq	%rax,-16(%rbp)
#  CPU ATHLON64
# [26] push rbx
	pushq	%rbx
# [27] push r12
	pushq	%r12
# [28] push r13
	pushq	%r13
# [29] push r14
	pushq	%r14
# [31] mov rbx, [State]        // Load State pointer
	movq	-8(%rbp),%rbx
# [32] mov r12, [rbx + 2056]   // Load ip
	movq	2056(%rbx),%r12
# [33] mov r13, [rbx + 2048]   // Load sp
	movq	2048(%rbx),%r13
# [34] lea r14, [rbp - 32]    // Load address of JumpTable on stack
	leaq	-32(%rbp),%r14
.Lj5:
# [37] cmp r12, 1024
	cmpq	$1024,%r12
# [38] jge _Exit
	jge	.Lj6
# [41] lea rax, [rbx + 2064]
	leaq	2064(%rbx),%rax
# [42] movzx rdx, word ptr [rax + r12*8]
	movzwq	(%rax,%r12,8),%rdx
# [45] mov rax, [r14 + rdx*8]
	movq	(%r14,%rdx,8),%rax
# [46] jmp rax
	jmp	*%rax
.Lj7:
# [49] inc r12
	incq	%r12
# [50] jmp _Loop
	jmp	.Lj5
.Lj8:
# [53] inc r12
	incq	%r12
# [54] inc r13
	incq	%r13
# [55] jmp _Loop
	jmp	.Lj5
.Lj9:
# [58] inc r12
	incq	%r12
# [59] dec r13
	decq	%r13
# [60] jmp _Loop
	jmp	.Lj5
.Lj6:
# [63] mov [rbx + 2056], r12
	movq	%r12,2056(%rbx)
# [64] mov [rbx + 2048], r13
	movq	%r13,2048(%rbx)
# [67] pop r14
	popq	%r14
# [68] pop r13
	popq	%r13
# [69] pop r12
	popq	%r12
# [70] pop rbx
	popq	%rbx
#  CPU ATHLON64
# [72] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:
# End asmlist al_procedures
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

