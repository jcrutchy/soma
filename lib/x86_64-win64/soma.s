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
# [14] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rdi
.seh_pushreg %rdi
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-32(%rsp),%rsp
.Lc3:
.seh_stackalloc 32
.seh_endprologue
# Var StateSize located in register eax
# Var OK located in register al
	call	fpc_initializeunits
# Var OK located in register dil
# [15] OK        := True;
	movb	$1,%dil
# Var StateSize located in register esi
# [16] StateSize := SizeOf(TVMState);
	movl	$36928,%esi
# [18] WriteLn('SOMA - Self Organizing Machine Architecture');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld1(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [19] WriteLn('===========================================');
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
# [20] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [21] WriteLn('Startup checks:');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld3(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [28] WriteLn('OK   TInstruction = 8 bytes');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld4(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [30] if (StateSize mod 64) <> 0 then
	movslq	%esi,%rax
	cqto
	movl	$64,%ecx
	idivq	%rcx
	testq	%rdx,%rdx
	je	.Lj4
# [32] WriteLn('FAIL: TVMState = ', StateSize, ' (not 64-byte aligned)');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld5(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA$_Ld6(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [33] OK := False;
	xorb	%dil,%dil
	jmp	.Lj5
.Lj4:
# [35] WriteLn('OK   TVMState = ', StateSize, ' bytes (64-byte aligned)');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld7(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA$_Ld8(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Lj5:
# [42] WriteLn('OK   GENOME_OFFSET = 4136');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld9(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [49] WriteLn('OK   VALID_OPCODE_COUNT = 67');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld10(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [51] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [53] if not OK then
	testb	%dil,%dil
	jne	.Lj7
# [55] WriteLn('Startup checks FAILED. Press Enter to exit.');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld11(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [56] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
# [57] Halt(1);
	movl	$1,%ecx
	call	SYSTEM_$$_HALT$LONGINT
	.balign 4,0x90
.Lj7:
# [60] WriteLn('All checks passed.');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld12(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [61] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [63] HypervisorInit(4);  // start with 4 colonies
	movl	$4,%ecx
	call	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
# [64] HypervisorRun;      // blocks until Enter pressed
	call	SOMA_HYPERVISOR_$$_HYPERVISORRUN
# [65] HypervisorStop;
	call	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
# [67] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [68] WriteLn('Press Enter to exit...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA$_Ld13(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [69] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
# [70] end.
	call	fpc_do_exit
	nop
	leaq	32(%rsp),%rsp
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc2:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 4
# [11] StateSize: Integer;
U_$P$SOMA_$$_STATESIZE:
	.zero 4

.section .bss
# [12] OK:        Boolean;
U_$P$SOMA_$$_OK:
	.zero 1

.section .data.n_INITFINAL,"d"
	.balign 8
.globl	INITFINAL
INITFINAL:
	.quad	6,0
	.quad	INIT$_$SYSTEM
	.quad	0
	.quad	INIT$_$FPINTRES
	.quad	0,0
	.quad	FINALIZE$_$OBJPAS
	.quad	0
	.quad	FINALIZE$_$WINDIRS
	.quad	INIT$_$SYSUTILS
	.quad	FINALIZE$_$SYSUTILS
	.quad	INIT$_$SOMA_HYPERVISOR
	.quad	0

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
	.quad	1
	.quad	RESSTR_$SYSCONST_$$_START$indirect
	.quad	RESSTR_$SYSCONST_$$_END$indirect

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
	.ascii	"+SOMA - Self Organizing Machine Architecture\000"

.section .rodata.n__$SOMA$_Ld2,"d"
	.balign 8
.globl	_$SOMA$_Ld2
_$SOMA$_Ld2:
	.ascii	"+===========================================\000"

.section .rodata.n__$SOMA$_Ld3,"d"
	.balign 8
.globl	_$SOMA$_Ld3
_$SOMA$_Ld3:
	.ascii	"\017Startup checks:\000"

.section .rodata.n__$SOMA$_Ld4,"d"
	.balign 8
.globl	_$SOMA$_Ld4
_$SOMA$_Ld4:
	.ascii	"\033OK   TInstruction = 8 bytes\000"

.section .rodata.n__$SOMA$_Ld5,"d"
	.balign 8
.globl	_$SOMA$_Ld5
_$SOMA$_Ld5:
	.ascii	"\021FAIL: TVMState = \000"

.section .rodata.n__$SOMA$_Ld6,"d"
	.balign 8
.globl	_$SOMA$_Ld6
_$SOMA$_Ld6:
	.ascii	"\026 (not 64-byte aligned)\000"

.section .rodata.n__$SOMA$_Ld7,"d"
	.balign 8
.globl	_$SOMA$_Ld7
_$SOMA$_Ld7:
	.ascii	"\020OK   TVMState = \000"

.section .rodata.n__$SOMA$_Ld8,"d"
	.balign 8
.globl	_$SOMA$_Ld8
_$SOMA$_Ld8:
	.ascii	"\030 bytes (64-byte aligned)\000"

.section .rodata.n__$SOMA$_Ld9,"d"
	.balign 8
.globl	_$SOMA$_Ld9
_$SOMA$_Ld9:
	.ascii	"\031OK   GENOME_OFFSET = 4136\000"

.section .rodata.n__$SOMA$_Ld10,"d"
	.balign 8
.globl	_$SOMA$_Ld10
_$SOMA$_Ld10:
	.ascii	"\034OK   VALID_OPCODE_COUNT = 67\000"

.section .rodata.n__$SOMA$_Ld11,"d"
	.balign 8
.globl	_$SOMA$_Ld11
_$SOMA$_Ld11:
	.ascii	"+Startup checks FAILED. Press Enter to exit.\000"

.section .rodata.n__$SOMA$_Ld12,"d"
	.balign 8
.globl	_$SOMA$_Ld12
_$SOMA$_Ld12:
	.ascii	"\022All checks passed.\000"

.section .rodata.n__$SOMA$_Ld13,"d"
	.balign 8
.globl	_$SOMA$_Ld13
_$SOMA$_Ld13:
	.ascii	"\026Press Enter to exit...\000"
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
	.uleb128	40
	.balign 4,0
.Lc8:
# End asmlist al_dwarf_frame

