	.file "soma.lpr"
# Begin asmlist al_begin

.section .debug_line
.Ldebug_linesection0:
.Ldebug_line0:

.section .debug_abbrev
.Ldebug_abbrevsection0:
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$P$SOMA,"x"
.globl	DEBUGSTART_$P$SOMA
DEBUGSTART_$P$SOMA:
# End asmlist al_begin
# Begin asmlist al_procedures

.section .text.n_main,"x"
	.balign 16,0x90
.globl	PASCALMAIN
PASCALMAIN:
.globl	main
main:
.Lc1:
.seh_proc main
.Ll1:
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
.Ll2:
# [15] OK        := True;
	movb	$1,%dil
# Var StateSize located in register esi
.Ll3:
# [16] StateSize := SizeOf(TVMState);
	movl	$37184,%esi
.Ll4:
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
.Ll5:
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
.Ll6:
# [20] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll7:
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
.Ll8:
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
.Ll9:
# [30] if (StateSize mod 64) <> 0 then
	movslq	%esi,%rax
	cqto
	movl	$64,%ecx
	idivq	%rcx
	testq	%rdx,%rdx
	je	.Lj4
.Ll10:
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
.Ll11:
# [33] OK := False;
	xorb	%dil,%dil
	jmp	.Lj5
.Lj4:
.Ll12:
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
.Ll13:
# [42] WriteLn('OK   GENOME_OFFSET = 4392');
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
.Ll14:
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
.Ll15:
# [51] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll16:
# [53] if not OK then
	testb	%dil,%dil
	jne	.Lj7
.Ll17:
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
.Ll18:
# [56] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
.Ll19:
# [57] Halt(1);
	movl	$1,%ecx
	call	SYSTEM_$$_HALT$LONGINT
	.balign 4,0x90
.Lj7:
.Ll20:
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
.Ll21:
# [61] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll22:
# [63] HypervisorInit(1);  // start with 4 colonies
	movl	$1,%ecx
	call	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
.Ll23:
# [64] HypervisorRun;      // blocks until Enter pressed
	call	SOMA_HYPERVISOR_$$_HYPERVISORRUN
.Ll24:
# [65] HypervisorStop;
	call	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
.Ll25:
# [67] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll26:
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
.Ll27:
# [69] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
.Ll28:
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
.Lt1:
.Ll29:

.section .fpc.n_links
	.quad	DEBUGSTART_$P$SOMA
	.quad	DEBUGEND_$P$SOMA
	.quad	DEBUGSTART_$SOMA_TYPES
	.quad	DEBUGEND_$SOMA_TYPES
	.quad	DEBUGSTART_$SOMA_CORE
	.quad	DEBUGEND_$SOMA_CORE
	.quad	DEBUGSTART_$SOMA_HYPERVISOR
	.quad	DEBUGEND_$SOMA_HYPERVISOR
	.quad	DEBUGSTART_$SOMA_MUTATE
	.quad	DEBUGEND_$SOMA_MUTATE
	.quad	DEBUGSTART_$SOMA_FITNESS
	.quad	DEBUGEND_$SOMA_FITNESS
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
	.quad	13,0
	.quad	INIT$_$SYSTEM
	.quad	0,0
	.quad	FINALIZE$_$OBJPAS
	.quad	INIT$_$LNFODWRF
	.quad	FINALIZE$_$LNFODWRF
	.quad	INIT$_$FPINTRES
	.quad	0,0
	.quad	FINALIZE$_$WINDIRS
	.quad	INIT$_$SYSUTILS
	.quad	FINALIZE$_$SYSUTILS
	.quad	INIT$_$TYPINFO
	.quad	FINALIZE$_$TYPINFO
	.quad	INIT$_$VARIANTS
	.quad	FINALIZE$_$VARIANTS
	.quad	INIT$_$CLASSES
	.quad	FINALIZE$_$CLASSES
	.quad	INIT$_$FPJSON
	.quad	FINALIZE$_$FPJSON
	.quad	INIT$_$JSONSCANNER
	.quad	FINALIZE$_$JSONSCANNER
	.quad	INIT$_$JSONPARSER
	.quad	FINALIZE$_$JSONPARSER
	.quad	INIT$_$SOMA_HYPERVISOR
	.quad	FINALIZE$_$SOMA_HYPERVISOR

.section .data.n_FPC_THREADVARTABLES,"d"
	.balign 8
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	2
	.quad	THREADVARLIST_$SYSTEM$indirect
	.quad	THREADVARLIST_$CLASSES$indirect

.section .rodata.n_FPC_RESOURCESTRINGTABLES,"d"
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.quad	10
	.quad	RESSTR_$MATH_$$_START$indirect
	.quad	RESSTR_$MATH_$$_END$indirect
	.quad	RESSTR_$SYSCONST_$$_START$indirect
	.quad	RESSTR_$SYSCONST_$$_END$indirect
	.quad	RESSTR_$FPJSON_$$_START$indirect
	.quad	RESSTR_$FPJSON_$$_END$indirect
	.quad	RESSTR_$JSONPARSER_$$_START$indirect
	.quad	RESSTR_$JSONPARSER_$$_END$indirect
	.quad	RESSTR_$VARIANTS_$$_START$indirect
	.quad	RESSTR_$VARIANTS_$$_END$indirect
	.quad	RESSTR_$CONTNRS_$$_START$indirect
	.quad	RESSTR_$CONTNRS_$$_END$indirect
	.quad	RESSTR_$RTLCONSTS_$$_START$indirect
	.quad	RESSTR_$RTLCONSTS_$$_END$indirect
	.quad	RESSTR_$TYPINFO_$$_START$indirect
	.quad	RESSTR_$TYPINFO_$$_END$indirect
	.quad	RESSTR_$JSONSCANNER_$$_START$indirect
	.quad	RESSTR_$JSONSCANNER_$$_END$indirect
	.quad	RESSTR_$JSONREADER_$$_START$indirect
	.quad	RESSTR_$JSONREADER_$$_END$indirect

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
	.ascii	"\031OK   GENOME_OFFSET = 4392\000"

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
# Begin asmlist al_dwarf_info

.section .debug_info
.Ldebug_info0:
	.long	.Ledebug_info0-.Lf2
.Lf2:
	.short	3
	.secrel32	.Ldebug_abbrev0
	.byte	8
	.uleb128	1
	.ascii	"soma.lpr\000"
	.ascii	"Free Pascal 3.2.2 2026/06/06\000"
	.ascii	"C:/dev/soma/\000"
	.byte	9
	.byte	3
	.secrel32	.Ldebug_line0
	.quad	DEBUGSTART_$P$SOMA
	.quad	DEBUGEND_$P$SOMA
# Syms - Begin Staticsymtable
# Symbol SYSTEM
# Symbol LNFODWRF
# Symbol FPINTRES
# Symbol OBJPAS
# Symbol SOMA_TYPES
# Symbol SOMA_CORE
# Symbol SOMA_HYPERVISOR
# Symbol SOMA_MUTATE
# Symbol SOMA_FITNESS
# Symbol SOMA
# Symbol main
# Symbol STATESIZE
	.uleb128	2
	.ascii	"StateSize\000"
	.byte	2
	.byte	144
	.uleb128	4
	.long	.La1-.Ldebug_info0
# Symbol OK
	.uleb128	2
	.ascii	"OK\000"
	.byte	2
	.byte	144
	.uleb128	5
	.long	.La3-.Ldebug_info0
# Symbol SYSINIT
# Syms - End Staticsymtable
# Procdef $main; Register;
	.uleb128	3
	.ascii	"$main\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	main
	.quad	.Lt1
	.byte	0
# Defs - Begin unit SYSTEM has index 1
# Definition LongInt
.La1:
	.uleb128	4
	.ascii	"LongInt\000"
	.long	.La5-.Ldebug_info0
.La5:
	.uleb128	5
	.ascii	"LongInt\000"
	.byte	5
	.byte	4
.La2:
	.uleb128	6
	.long	.La1-.Ldebug_info0
# Definition Boolean
.La3:
	.uleb128	4
	.ascii	"Boolean\000"
	.long	.La6-.Ldebug_info0
.La6:
	.uleb128	5
	.ascii	"Boolean\000"
	.byte	2
	.byte	1
.La4:
	.uleb128	6
	.long	.La3-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit STRINGS has index 4
# Defs - End unit STRINGS has index 4
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit WINDOWS has index 5
# Defs - End unit WINDOWS has index 5
# Defs - Begin unit EXEINFO has index 3
# Defs - End unit EXEINFO has index 3
# Defs - Begin unit LNFODWRF has index 2
# Defs - End unit LNFODWRF has index 2
# Defs - Begin unit FPINTRES has index 7
# Defs - End unit FPINTRES has index 7
# Defs - Begin unit SOMA_TYPES has index 8
# Defs - End unit SOMA_TYPES has index 8
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
# Defs - Begin unit SOMA_MUTATE has index 11
# Defs - End unit SOMA_MUTATE has index 11
# Defs - Begin unit RTLCONSTS has index 22
# Defs - End unit RTLCONSTS has index 22
# Defs - Begin unit TYPINFO has index 23
# Defs - End unit TYPINFO has index 23
# Defs - Begin unit TYPES has index 25
# Defs - End unit TYPES has index 25
# Defs - Begin unit VARUTILS has index 24
# Defs - End unit VARUTILS has index 24
# Defs - Begin unit VARIANTS has index 20
# Defs - End unit VARIANTS has index 20
# Defs - Begin unit CLASSES has index 19
# Defs - End unit CLASSES has index 19
# Defs - Begin unit CONTNRS has index 21
# Defs - End unit CONTNRS has index 21
# Defs - Begin unit FPJSON has index 17
# Defs - End unit FPJSON has index 17
# Defs - Begin unit JSONSCANNER has index 26
# Defs - End unit JSONSCANNER has index 26
# Defs - Begin unit JSONREADER has index 27
# Defs - End unit JSONREADER has index 27
# Defs - Begin unit JSONPARSER has index 18
# Defs - End unit JSONPARSER has index 18
# Defs - Begin unit SOMA_FITNESS has index 12
# Defs - End unit SOMA_FITNESS has index 12
# Defs - Begin unit SOMA_HYPERVISOR has index 10
# Defs - End unit SOMA_HYPERVISOR has index 10
# Defs - Begin unit SYSINIT has index 28
# Defs - End unit SYSINIT has index 28
# Defs - Begin Staticsymtable
# Defs - End Staticsymtable
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
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 5
	.uleb128	5
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
# Abbrev 6
	.uleb128	6
	.uleb128	16
	.byte	0
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
	.ascii	"soma.lpr\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Lehdebug_line0:
# === header end ===
# function: PASCALMAIN
# function: main
# [14:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	25
# [15:3]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	5
	.uleb128	3
	.byte	13
# [16:3]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	13
# [18:3]
	.byte	2
	.uleb128	.Ll4-.Ll3
	.byte	14
# [19:3]
	.byte	2
	.uleb128	.Ll5-.Ll4
	.byte	13
# [20:3]
	.byte	2
	.uleb128	.Ll6-.Ll5
	.byte	13
# [21:3]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	13
# [28:5]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	5
	.uleb128	5
	.byte	19
# [30:7]
	.byte	2
	.uleb128	.Ll9-.Ll8
	.byte	5
	.uleb128	7
	.byte	14
# [32:5]
	.byte	2
	.uleb128	.Ll10-.Ll9
	.byte	5
	.uleb128	5
	.byte	14
# [33:5]
	.byte	2
	.uleb128	.Ll11-.Ll10
	.byte	13
# [35:5]
	.byte	2
	.uleb128	.Ll12-.Ll11
	.byte	14
# [42:5]
	.byte	2
	.uleb128	.Ll13-.Ll12
	.byte	19
# [49:5]
	.byte	2
	.uleb128	.Ll14-.Ll13
	.byte	19
# [51:3]
	.byte	2
	.uleb128	.Ll15-.Ll14
	.byte	5
	.uleb128	3
	.byte	14
# [53:6]
	.byte	2
	.uleb128	.Ll16-.Ll15
	.byte	5
	.uleb128	6
	.byte	14
# [55:5]
	.byte	2
	.uleb128	.Ll17-.Ll16
	.byte	5
	.uleb128	5
	.byte	14
# [56:5]
	.byte	2
	.uleb128	.Ll18-.Ll17
	.byte	13
# [57:5]
	.byte	2
	.uleb128	.Ll19-.Ll18
	.byte	13
# [60:3]
	.byte	2
	.uleb128	.Ll20-.Ll19
	.byte	5
	.uleb128	3
	.byte	15
# [61:3]
	.byte	2
	.uleb128	.Ll21-.Ll20
	.byte	13
# [63:3]
	.byte	2
	.uleb128	.Ll22-.Ll21
	.byte	14
# [64:3]
	.byte	2
	.uleb128	.Ll23-.Ll22
	.byte	13
# [65:3]
	.byte	2
	.uleb128	.Ll24-.Ll23
	.byte	13
# [67:3]
	.byte	2
	.uleb128	.Ll25-.Ll24
	.byte	14
# [68:3]
	.byte	2
	.uleb128	.Ll26-.Ll25
	.byte	13
# [69:3]
	.byte	2
	.uleb128	.Ll27-.Ll26
	.byte	13
# [70:1]
	.byte	2
	.uleb128	.Ll28-.Ll27
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll29
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
	.quad	main
	.quad	.Lt1-main
	.quad	0
	.quad	0
.Learanges0:
# End asmlist al_dwarf_aranges
# Begin asmlist al_dwarf_ranges

.section .debug_ranges
# End asmlist al_dwarf_ranges
# Begin asmlist al_end

.section .text.z_DEBUGEND_$P$SOMA,"x"
.globl	DEBUGEND_$P$SOMA
DEBUGEND_$P$SOMA:
# End asmlist al_end

