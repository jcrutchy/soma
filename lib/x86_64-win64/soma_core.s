	.file "soma_core.pas"
# Begin asmlist al_procedures

.section .text.n_soma_core_$$__nop$tvmstate,"x"
	.balign 16,0x90
SOMA_CORE_$$__NOP$TVMSTATE:
.Lc1:
# [soma_core.pas]
# [19] begin
	movq	%rcx,%rax
# Var State located in register rax
# [20] Inc(State.ip);
	addq	$1,2056(%rax)
# [21] end;
	ret
.Lc2:

.section .text.n_soma_core_$$__push$tvmstate,"x"
	.balign 16,0x90
SOMA_CORE_$$__PUSH$TVMSTATE:
.Lc3:
# [24] begin
	movq	%rcx,%rax
# Var State located in register rax
# [25] Inc(State.ip);
	addq	$1,2056(%rax)
# [26] Inc(State.sp);
	addq	$1,2048(%rax)
# [27] end;
	ret
.Lc4:

.section .text.n_soma_core_$$__pop$tvmstate,"x"
	.balign 16,0x90
SOMA_CORE_$$__POP$TVMSTATE:
.Lc5:
# [30] begin
	movq	%rcx,%rax
# Var State located in register rax
# [31] Inc(State.ip);
	addq	$1,2056(%rax)
# [32] Dec(State.sp);
	subq	$1,2048(%rax)
# [33] end;
	ret
.Lc6:

.section .text.n_soma_core_$$_execute$tvmstate,"x"
	.balign 16,0x90
.globl	SOMA_CORE_$$_EXECUTE$TVMSTATE
SOMA_CORE_$$_EXECUTE$TVMSTATE:
.Lc7:
.seh_proc SOMA_CORE_$$_EXECUTE$TVMSTATE
# [45] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc9:
.seh_stackalloc 40
.seh_endprologue
# Var opcode located in register si
	movq	%rcx,%rbx
# Var State located in register rbx
# [46] while State.ip < GENOME_SIZE do
	jmp	.Lj12
	.balign 8,0x90
.Lj11:
	movq	%rbx,%rax
# [48] opcode := State.genome[State.ip].opcode;
	movq	2056(%rax),%rdx
	movw	2064(%rax,%rdx,8),%si
# [49] if opcode > High(JUMP_TABLE) then Break;
	cmpw	$2,%si
	ja	.Lj13
	.balign 4,0x90
# [50] JUMP_TABLE[opcode](State);
	movq	%rbx,%rcx
	movzwl	%si,%eax
	leaq	TC_$SOMA_CORE_$$_JUMP_TABLE(%rip),%rdx
	call	*(%rdx,%rax,8)
.Lj12:
	cmpq	$1024,2056(%rbx)
	jl	.Lj11
.Lj13:
# [52] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc8:
# End asmlist al_procedures
# Begin asmlist al_rotypedconsts

.section .rodata.n_TC_$SOMA_CORE_$$_JUMP_TABLE,"d"
	.balign 8
TC_$SOMA_CORE_$$_JUMP_TABLE:
	.quad	SOMA_CORE_$$__NOP$TVMSTATE
	.quad	SOMA_CORE_$$__PUSH$TVMSTATE
	.quad	SOMA_CORE_$$__POP$TVMSTATE
# [42] procedure Execute(var State: TVMState);
# End asmlist al_rotypedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_CORE_$$_TOPHANDLER,"d"
	.balign 8
.globl	RTTI_$SOMA_CORE_$$_TOPHANDLER
RTTI_$SOMA_CORE_$$_TOPHANDLER:
	.byte	23,10
# [55] 
	.ascii	"TOpHandler"
	.byte	0,0
	.quad	0
	.byte	1
	.short	1
	.quad	RTTI_$SOMA_TYPES_$$_TVMSTATE$indirect
	.byte	5
	.ascii	"State"
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_RTTI_$SOMA_CORE_$$_TOPHANDLER,"d"
	.balign 8
.globl	RTTI_$SOMA_CORE_$$_TOPHANDLER$indirect
RTTI_$SOMA_CORE_$$_TOPHANDLER$indirect:
	.quad	RTTI_$SOMA_CORE_$$_TOPHANDLER
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc10:
	.long	.Lc12-.Lc11
.Lc11:
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
.Lc12:
	.long	.Lc14-.Lc13
.Lc13:
	.secrel32	.Lc10
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.balign 4,0
.Lc14:
	.long	.Lc16-.Lc15
.Lc15:
	.secrel32	.Lc10
	.quad	.Lc3
	.quad	.Lc4-.Lc3
	.balign 4,0
.Lc16:
	.long	.Lc18-.Lc17
.Lc17:
	.secrel32	.Lc10
	.quad	.Lc5
	.quad	.Lc6-.Lc5
	.balign 4,0
.Lc18:
	.long	.Lc20-.Lc19
.Lc19:
	.secrel32	.Lc10
	.quad	.Lc7
	.quad	.Lc8-.Lc7
	.byte	4
	.long	.Lc9-.Lc7
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc20:
# End asmlist al_dwarf_frame

