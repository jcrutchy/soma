	.file "soma.lpr"
# Begin asmlist al_procedures

.section .text.n_main,"x"
	.balign 16,0x90
.globl	PASCALMAIN
PASCALMAIN:
.globl	main
main:
.Lc1:
.seh_proc main
# [soma.lpr]
# [11] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc3:
.seh_stackalloc 40
.seh_endprologue
# Var StateSize located in register eax
	call	fpc_initializeunits
# Var StateSize located in register esi
# [12] StateSize := SizeOf(soma_types.TVMState);
	movl	$10304,%esi
# [21] Writeln('Alignment check passed! Size is: ', StateSize);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld1(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [22] Writeln('Execution finished. Press Enter to exit...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld2(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [23] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
# [24] end.
	call	fpc_do_exit
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc2:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 4
# [9] StateSize: Integer;
U_$P$SOMA_$$_STATESIZE:
	.zero 4

.section .data.n_INITFINAL,"d"
	.balign 8
.globl	INITFINAL
INITFINAL:
	.quad	3,0
	.quad	INIT$_$SYSTEM
	.quad	0
	.quad	INIT$_$FPINTRES
	.quad	0,0
	.quad	FINALIZE$_$OBJPAS

.section .data.n_FPC_THREADVARTABLES,"d"
	.balign 8
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM$indirect

.section .rodata.n_FPC_RESOURCESTRINGTABLES,"d"
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.quad	0

.section .data.n_FPC_WIDEINITTABLES,"d"
	.balign 8
.globl	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES:
	.quad	0

.section .data.n_FPC_RESSTRINITTABLES,"d"
	.balign 8
.globl	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES:
	.quad	0

.section .fpc.n_version
	.balign 16
__fpc_ident:
	.ascii	"FPC 3.2.2 [2026/06/06] for x86_64 - Win64"

.section .data.n___heapsize,"d"
	.balign 8
.globl	__heapsize
__heapsize:
	.quad	0

.section .data.n___fpc_valgrind,"d"
	.balign 8
.globl	__fpc_valgrind
__fpc_valgrind:
	.byte	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__$SOMA$_Ld1,"d"
	.balign 8
.globl	_$SOMA$_Ld1
_$SOMA$_Ld1:
	.ascii	"!Alignment check passed! Size is: \000"

.section .rodata.n__$SOMA$_Ld2,"d"
	.balign 8
.globl	_$SOMA$_Ld2
_$SOMA$_Ld2:
	.ascii	"*Execution finished. Press Enter to exit...\000"
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc4:
	.long	.Lc6-.Lc5
.Lc5:
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
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
	.secrel32	.Lc4
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc8:
# End asmlist al_dwarf_frame

