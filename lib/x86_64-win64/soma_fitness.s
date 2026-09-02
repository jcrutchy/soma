	.file "soma_fitness.pas"
# Begin asmlist al_begin

.section .debug_line
.Ldebug_linesection0:
.Ldebug_line0:

.section .debug_abbrev
.Ldebug_abbrevsection0:
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$SOMA_FITNESS,"x"
.globl	DEBUGSTART_$SOMA_FITNESS
DEBUGSTART_$SOMA_FITNESS:
# End asmlist al_begin
# Begin asmlist al_procedures

.section .text.n_soma_fitness_$$_prim_survival$tvmstate$$double,"x"
	.balign 16,0x90
SOMA_FITNESS_$$_PRIM_SURVIVAL$TVMSTATE$$DOUBLE:
.Lc1:
# Var $result located in register xmm0
# Var survival_score located in register xmm0
# Var activity_score located in register xmm0
.Ll1:
# [soma_fitness.pas]
# [92] begin
	movq	%rcx,%rax
# Var state located in register rax
.Ll2:
# [93] survival_score := state.ip / GENOME_SIZE;
	cvtsi2sdq	4368(%rax),%xmm1
	mulsd	_$SOMA_FITNESS$_Ld1(%rip),%xmm1
# Var survival_score located in register xmm1
.Ll3:
# [94] if survival_score > 1.0 then survival_score := 1.0;
	comisd	_$SOMA_FITNESS$_Ld2(%rip),%xmm1
	jp	.Lj6
	jna	.Lj6
	movsd	_$SOMA_FITNESS$_Ld2(%rip),%xmm1
	.balign 4,0x90
.Lj6:
.Ll4:
# [96] activity_score := state.isp / STACK_SIZE;
	cvtsi2sdq	4352(%rax),%xmm2
	mulsd	_$SOMA_FITNESS$_Ld3(%rip),%xmm2
# Var activity_score located in register xmm2
.Ll5:
# [97] if activity_score > 1.0 then activity_score := 1.0;
	comisd	_$SOMA_FITNESS$_Ld2(%rip),%xmm2
	jp	.Lj9
	jna	.Lj9
	movsd	_$SOMA_FITNESS$_Ld2(%rip),%xmm2
	.balign 4,0x90
.Lj9:
.Ll6:
	movq	4384(%rax),%rax
.Ll7:
# [99] if (state.halt_reason = HR_HALT) or (state.halt_reason = HR_YIELD) then
	cmpq	$1,%rax
	je	.Lj11
	cmpq	$2,%rax
	jne	.Lj13
.Lj11:
.Ll8:
# [100] Result := (survival_score * 0.5) + (activity_score * 0.3) + 0.2
	movapd	%xmm1,%xmm3
	mulsd	_$SOMA_FITNESS$_Ld4(%rip),%xmm3
	movapd	%xmm2,%xmm0
	mulsd	_$SOMA_FITNESS$_Ld5(%rip),%xmm0
	addsd	%xmm3,%xmm0
	addsd	_$SOMA_FITNESS$_Ld6(%rip),%xmm0
	ret
.Lj13:
.Ll9:
# [102] Result := (survival_score * 0.5) + (activity_score * 0.3);
	mulsd	_$SOMA_FITNESS$_Ld4(%rip),%xmm1
	mulsd	_$SOMA_FITNESS$_Ld5(%rip),%xmm2
	addsd	%xmm1,%xmm2
	movapd	%xmm2,%xmm0
.Ll10:
# [103] end;
	ret
.Lc2:
.Lt9:
.Ll11:

.section .text.n_soma_fitness_$$_prim_arraysorted$tvmstate$longint$$double,"x"
	.balign 16,0x90
SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE:
.Lc3:
.seh_proc SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE
.Ll12:
# [115] begin
	pushq	%rbx
.seh_pushreg %rbx
.seh_endprologue
# Var $result located in register xmm0
# Var i located in register r8d
# Var correct_pairs located in register eax
# Var total_pairs located in register eax
# Var state located in register rcx
# Var count located in register edx
.Ll13:
# [116] if count < 2 then
	cmpl	$2,%edx
	jnl	.Lj18
.Ll14:
# [118] Result := 1.0;  // trivially "sorted"
	movsd	_$SOMA_FITNESS$_Ld2(%rip),%xmm0
.Ll15:
# [119] Exit;
	jmp	.Lj15
	.balign 4,0x90
.Lj18:
.Ll16:
# [121] total_pairs := count - 1;
	leal	-1(%edx),%eax
# Var total_pairs located in register eax
# Var correct_pairs located in register ebx
.Ll17:
# [122] correct_pairs := 0;
	xorl	%ebx,%ebx
.Ll18:
# [123] for i := 0 to count - 2 do
	subl	$2,%edx
	testl	%edx,%edx
	jnge	.Lj20
	movl	$-1,%r8d
	.balign 8,0x90
.Lj21:
	addl	$1,%r8d
.Ll19:
	leaq	256(%rcx),%r9
.Ll20:
# [124] if state.istack[i] <= state.istack[i + 1] then
	movslq	%r8d,%r10
	movl	%r8d,%r11d
	movq	8(%r9,%r10,8),%r10
	cmpq	(%r9,%r11,8),%r10
.Ll21:
	jnge	.Lj25
.Ll22:
# [125] Inc(correct_pairs);
	addl	$1,%ebx
	.balign 4,0x90
.Lj25:
.Ll23:
	cmpl	%r8d,%edx
	jnle	.Lj21
	.balign 4,0x90
.Lj20:
.Ll24:
# [126] Result := correct_pairs / total_pairs;
	cvtsi2sdl	%ebx,%xmm1
	cvtsi2sdl	%eax,%xmm2
	divsd	%xmm2,%xmm1
	movapd	%xmm1,%xmm0
.Lj15:
.Ll25:
# [127] end;
	popq	%rbx
	ret
.seh_endproc
.Lc4:
.Lt10:
.Ll26:

.section .text.n_soma_fitness$_$loadfitnesstarget$ansistring$$tfitnesstarget_$$_fin$00000009,"x"
	.balign 16,0x90
SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009:
.Lc5:
.seh_proc SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
.Ll27:
# [147] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc7:
.Lc8:
	movq	%rcx,%rbp
.Lc9:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
.Ll28:
# [146] parser.Free;
	movq	-72(%rbp),%rcx
	call	SYSTEM$_$TOBJECT_$__$$_FREE
.Ll29:
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc6:
.Lt2:
.Ll30:

.section .text.n_soma_fitness$_$loadfitnesstarget$ansistring$$tfitnesstarget_$$_fin$0000000a,"x"
	.balign 16,0x90
SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A:
.Lc10:
.seh_proc SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
.Ll31:
# [150] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc12:
.Lc13:
	movq	%rcx,%rbp
.Lc14:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
.Ll32:
# [149] fs.Free;
	movq	-64(%rbp),%rcx
	call	SYSTEM$_$TOBJECT_$__$$_FREE
.Ll33:
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc11:
.Lt3:
.Ll34:

.section .text.n_soma_fitness$_$loadfitnesstarget$ansistring$$tfitnesstarget_$$_fin$0000000b,"x"
	.balign 16,0x90
SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B:
.Lc15:
.seh_proc SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
.Ll35:
# [194] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc17:
.Lc18:
	movq	%rcx,%rbp
.Lc19:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
.Ll36:
# [193] data.Free;
	movq	-80(%rbp),%rcx
	call	SYSTEM$_$TOBJECT_$__$$_FREE
.Ll37:
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc16:
.Lt4:
.Ll38:

.section .text.n_soma_fitness$_$loadfitnesstarget$ansistring$$tfitnesstarget_$$_fin$0000000c,"x"
	.balign 16,0x90
SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C:
.Lc20:
.seh_proc SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C
.Ll39:
# [195] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc22:
.Lc23:
	movq	%rcx,%rbp
.Lc24:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
.Ll40:
# [139] begin
	leaq	-104(%rbp),%rcx
	call	fpc_ansistr_decr_ref
	leaq	-96(%rbp),%rcx
	call	fpc_ansistr_decr_ref
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc21:
.Lt5:
.Ll41:

.section .text.n_soma_fitness_$$_loadfitnesstarget$ansistring$$tfitnesstarget,"x"
	.balign 16,0x90
.globl	SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET:
.Lc25:
# Temps allocated between rbp-136 and rbp-84
.seh_proc SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
.Ll42:
	pushq	%rbp
.seh_pushreg %rbp
.Lc27:
.Lc28:
	movq	%rsp,%rbp
.Lc29:
	leaq	-176(%rsp),%rsp
.seh_stackalloc 176
	movq	%rbx,-136(%rbp)
.seh_savereg %rbx, 40
.seh_endprologue
# Var path located at rbp-8, size=OS_64
# Var $result located at rbp-16, size=OS_64
# Var jroot located at rbp-24, size=OS_64
# Var jsetup located at rbp-32, size=OS_64
# Var jcriteria located at rbp-40, size=OS_64
# Var jcrit located at rbp-48, size=OS_64
# Var jarr located at rbp-56, size=OS_64
# Var fs located at rbp-64, size=OS_64
# Var parser located at rbp-72, size=OS_64
# Var data located at rbp-80, size=OS_64
# Var i located at rbp-84, size=OS_S32
	movq	%rcx,-16(%rbp)
	movq	%rdx,-8(%rbp)
.Ll43:
	movq	$0,-104(%rbp)
	movq	$0,-96(%rbp)
.Lj40:
	nop
.Lj36:
.Ll44:
# [140] fs := TFileStream.Create(path, fmOpenRead or fmShareDenyWrite);
	movq	-8(%rbp),%rax
	movl	$32,%r9d
	movl	$1,%edx
	leaq	VMT_$CLASSES_$$_TFILESTREAM(%rip),%rcx
	movq	%rax,%r8
	call	CLASSES$_$TFILESTREAM_$__$$_CREATE$ANSISTRING$WORD$$TFILESTREAM
	movq	%rax,-64(%rbp)
.Lj45:
.Ll45:
# [141] try
	nop
.Lj41:
.Ll46:
# [142] parser := TJSONParser.Create(fs);
	movq	-64(%rbp),%r8
	movb	$1,%r9b
	movl	$1,%edx
	leaq	VMT_$JSONPARSER_$$_TJSONPARSER(%rip),%rcx
	call	JSONREADER$_$TBASEJSONREADER_$__$$_CREATE$TSTREAM$BOOLEAN$$TBASEJSONREADER
	movq	%rax,-72(%rbp)
.Lj50:
.Ll47:
# [143] try
	nop
.Lj46:
.Ll48:
# [144] data := parser.Parse;
	movq	-72(%rbp),%rcx
	call	JSONPARSER$_$TJSONPARSER_$__$$_PARSE$$TJSONDATA
	movq	%rax,-80(%rbp)
.Lj48:
.Ll49:
	nop
.Lj47:
	movq	%rbp,%rcx
	call	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
.Lj43:
.Ll50:
	nop
.Lj42:
	movq	%rbp,%rcx
	call	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
.Lj55:
.Ll51:
# [152] try
	nop
.Lj51:
.Ll52:
# [153] jroot := data as TJSONObject;
	movq	-80(%rbp),%rdx
	leaq	VMT_$FPJSON_$$_TJSONOBJECT(%rip),%rcx
	call	fpc_do_as
	movq	%rax,-24(%rbp)
.Ll53:
# [155] Result.name    := jroot.Get('name', 'unnamed');
	movq	%rax,%rcx
	leaq	.Ld7(%rip),%r9
	leaq	.Ld8(%rip),%r8
	leaq	-104(%rbp),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$UTF8STRING$$UTF8STRING
	movq	-104(%rbp),%rdx
	xorl	%r8d,%r8d
	leaq	-96(%rbp),%rcx
	call	fpc_ansistr_to_ansistr
	movq	-96(%rbp),%rdx
	movq	-16(%rbp),%rcx
	call	fpc_ansistr_assign
.Ll54:
# [156] Result.version := jroot.Get('version', 1);
	movq	-24(%rbp),%rcx
	movl	$1,%r8d
	leaq	.Ld9(%rip),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$LONGINT$$LONGINT
	movq	-16(%rbp),%rdx
	movw	%ax,8(%rdx)
.Ll55:
# [158] jsetup := jroot.Objects['setup'];
	movq	-24(%rbp),%rcx
	leaq	.Ld10(%rip),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GETOBJECTS$ANSISTRING$$TJSONOBJECT
	movq	%rax,-32(%rbp)
.Ll56:
# [159] if jsetup <> nil then
	testq	%rax,%rax
	je	.Lj57
.Ll57:
# [161] Result.input_count := jsetup.Get('input_count', 8);
	movq	-32(%rbp),%rcx
	movl	$8,%r8d
	leaq	.Ld11(%rip),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$LONGINT$$LONGINT
	movq	-16(%rbp),%rdx
	movl	%eax,12(%rdx)
.Ll58:
# [162] Result.input_min   := jsetup.Get('input_min', -50);
	movq	-32(%rbp),%rcx
	movl	$-50,%r8d
	leaq	.Ld12(%rip),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$LONGINT$$LONGINT
	movslq	%eax,%rax
	movq	-16(%rbp),%rdx
	movq	%rax,16(%rdx)
.Ll59:
# [163] Result.input_max   := jsetup.Get('input_max', 50);
	movq	-32(%rbp),%rcx
	movl	$50,%r8d
	leaq	.Ld13(%rip),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$LONGINT$$LONGINT
	movslq	%eax,%rax
	movq	-16(%rbp),%rdx
	movq	%rax,24(%rdx)
	jmp	.Lj58
.Lj57:
.Ll60:
# [167] Result.input_count := 8;
	movq	-16(%rbp),%rax
	movl	$8,12(%rax)
.Ll61:
# [168] Result.input_min   := -50;
	movq	-16(%rbp),%rax
	movq	$-50,16(%rax)
.Ll62:
# [169] Result.input_max   := 50;
	movq	-16(%rbp),%rax
	movq	$50,24(%rax)
.Lj58:
.Ll63:
# [172] jarr := jroot.Arrays['criteria'];
	movq	-24(%rbp),%rcx
	leaq	.Ld14(%rip),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GETARRAYS$ANSISTRING$$TJSONARRAY
	movq	%rax,-56(%rbp)
.Ll64:
# [173] if jarr <> nil then
	testq	%rax,%rax
	je	.Lj60
.Ll65:
# [175] SetLength(Result.criteria, jarr.Count);
	movq	-56(%rbp),%rcx
	movq	-56(%rbp),%rax
	movq	(%rax),%rax
	call	*376(%rax)
	movslq	%eax,%rax
	movq	%rax,-112(%rbp)
	leaq	INIT_$SOMA_FITNESS_$$_def00000003(%rip),%rdx
	leaq	-112(%rbp),%r9
	movq	-16(%rbp),%rax
	leaq	32(%rax),%rcx
	movl	$1,%r8d
	call	fpc_dynarray_setlength
.Ll66:
# [176] for i := 0 to jarr.Count - 1 do
	movq	-56(%rbp),%rcx
	movq	-56(%rbp),%rax
	movq	(%rax),%rax
	call	*376(%rax)
	movl	%eax,%ebx
	subl	$1,%ebx
	testl	%ebx,%ebx
	jnge	.Lj66
	movl	$-1,-84(%rbp)
	.balign 8,0x90
.Lj63:
	movl	-84(%rbp),%eax
	addl	$1,%eax
	movl	%eax,-84(%rbp)
.Ll67:
# [178] jcrit := jarr.Objects[i];
	movl	%eax,%edx
	movq	-56(%rbp),%rcx
	call	FPJSON$_$TJSONARRAY_$__$$_GETOBJECTS$LONGINT$$TJSONOBJECT
	movq	%rax,-48(%rbp)
.Ll68:
# [179] Result.criteria[i].metric := jcrit.Get('metric', 'survival');
	movq	%rax,%rcx
	leaq	.Ld15(%rip),%r9
	leaq	.Ld16(%rip),%r8
	leaq	-104(%rbp),%rdx
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$UTF8STRING$$UTF8STRING
	movq	-104(%rbp),%rdx
	xorl	%r8d,%r8d
	leaq	-96(%rbp),%rcx
	call	fpc_ansistr_to_ansistr
	movq	-96(%rbp),%rdx
	movq	-16(%rbp),%rax
	movq	32(%rax),%rcx
	movslq	-84(%rbp),%rax
	shlq	$4,%rax
	addq	%rax,%rcx
	call	fpc_ansistr_assign
.Ll69:
# [180] Result.criteria[i].weight := jcrit.Get('weight', 1.0);
	movsd	_$SOMA_FITNESS$_Ld2(%rip),%xmm0
	movq	-48(%rbp),%rcx
	leaq	.Ld17(%rip),%rdx
	movapd	%xmm0,%xmm2
	call	FPJSON$_$TJSONOBJECT_$__$$_GET$ANSISTRING$DOUBLE$$DOUBLE
	movq	-16(%rbp),%rax
	movq	32(%rax),%rdx
	movslq	-84(%rbp),%rax
	shlq	$4,%rax
	movsd	%xmm0,8(%rdx,%rax)
.Ll70:
	cmpl	-84(%rbp),%ebx
	jnle	.Lj63
	.balign 4,0x90
	jmp	.Lj66
.Lj60:
.Ll71:
# [188] SetLength(Result.criteria, 1);
	movq	$1,-112(%rbp)
	leaq	INIT_$SOMA_FITNESS_$$_def00000003(%rip),%rdx
	leaq	-112(%rbp),%r9
	movq	-16(%rbp),%rax
	leaq	32(%rax),%rcx
	movl	$1,%r8d
	call	fpc_dynarray_setlength
.Ll72:
# [189] Result.criteria[0].metric := 'survival';
	movq	-16(%rbp),%rax
	movq	32(%rax),%rcx
	leaq	.Ld18(%rip),%rdx
	call	fpc_ansistr_assign
.Ll73:
# [190] Result.criteria[0].weight := 1.0;
	movq	-16(%rbp),%rax
	movq	32(%rax),%rax
	movq	_$SOMA_FITNESS$_Ld2(%rip),%rdx
	movq	%rdx,8(%rax)
.Lj66:
.Lj53:
.Ll74:
	nop
.Lj52:
	movq	%rbp,%rcx
	call	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
.Lj38:
.Ll75:
	nop
.Lj37:
	movq	%rbp,%rcx
	call	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C
.Ll76:
	movq	-136(%rbp),%rbx
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_handler __FPC_specific_handler,@unwind
.seh_handlerdata
	.long	4
	.long	0
	.rva	.Lj46
	.rva	.Lj47
	.rva	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
	.long	0
	.rva	.Lj41
	.rva	.Lj42
	.rva	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
	.long	0
	.rva	.Lj51
	.rva	.Lj52
	.rva	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
	.long	0
	.rva	.Lj36
	.rva	.Lj37
	.rva	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C

.section .text.n_soma_fitness_$$_loadfitnesstarget$ansistring$$tfitnesstarget,"x"
.seh_endproc
.Lc26:
.Lt1:
.Ll77:

.section .text.n_soma_fitness_$$_seedfitnessinput$tvmstate$tfitnesstarget$qword,"x"
	.balign 16,0x90
.globl	SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD:
.Lc30:
.seh_proc SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
.Ll78:
# [204] begin
	pushq	%rbx
.seh_pushreg %rbx
.seh_endprologue
# Var i located in register ebx
# Var span located in register rax
# Var state located in register rcx
	movq	%rdx,%r9
# Var target located in register r9
# Var rng located in register r8
.Ll79:
	movq	%r9,%rax
.Ll80:
# [205] span := UInt64(target.input_max - target.input_min + 1);
	movq	%rax,%rdx
	movq	24(%rax),%rax
	movq	16(%rdx),%rdx
	subq	%rdx,%rax
	leaq	1(%rax),%r10
# Var span located in register r10
.Ll81:
# [206] for i := 0 to target.input_count - 1 do
	movl	12(%r9),%eax
	leal	-1(%eax),%r11d
	testl	%r11d,%r11d
	jnge	.Lj70
	movl	$-1,%ebx
	.balign 8,0x90
.Lj71:
	addl	$1,%ebx
.Ll82:
	movq	(%r8),%rdx
.Ll83:
# [208] rng := rng xor (rng shl 13);
	movq	%rdx,%rax
	shlq	$13,%rax
	xorq	%rdx,%rax
	movq	%rax,(%r8)
.Ll84:
	movq	%rax,%rdx
.Ll85:
# [209] rng := rng xor (rng shr 7);
	shrq	$7,%rax
	xorq	%rdx,%rax
	movq	%rax,(%r8)
.Ll86:
	movq	%rax,%rdx
.Ll87:
# [210] rng := rng xor (rng shl 17);
	shlq	$17,%rax
	xorq	%rdx,%rax
	movq	%rax,(%r8)
.Ll88:
# [211] state.istack[i] := target.input_min + Int64(rng mod span);
	xorl	%edx,%edx
	divq	%r10
	addq	16(%r9),%rdx
	movl	%ebx,%eax
	movq	%rdx,256(%rcx,%rax,8)
.Ll89:
	cmpl	%ebx,%r11d
	jnle	.Lj71
	.balign 4,0x90
.Lj70:
.Ll90:
# [213] state.isp := target.input_count - 1;
	movslq	12(%r9),%rax
	subq	$1,%rax
	movq	%rax,4352(%rcx)
.Ll91:
# [214] end;
	popq	%rbx
	ret
.seh_endproc
.Lc31:
.Lt6:
.Ll92:

.section .text.n_soma_fitness$_$evaluatefitnesstarget$tvmstate$tfitnesstarget$array_of_int64$$tfitnessresult_$$_fin$00000011,"x"
	.balign 16,0x90
SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011:
.Lc32:
.seh_proc SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011
.Ll93:
# [262] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc34:
.Lc35:
	movq	%rcx,%rbp
.Lc36:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
.Ll94:
# [224] begin
	leaq	-16(%rbp),%rcx
	call	fpc_ansistr_decr_ref
	movq	-8(%rbp),%rcx
	call	fpc_freemem
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc33:
.Lt8:
.Ll95:

.section .text.n_soma_fitness_$$_evaluatefitnesstarget$tvmstate$tfitnesstarget$array_of_int64$$tfitnessresult,"x"
	.balign 16,0x90
.globl	SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT:
.Lc37:
# Temps allocated between rbp-128 and rbp-8
.seh_proc SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
.Ll96:
	pushq	%rbp
.seh_pushreg %rbp
.Lc39:
.Lc40:
	movq	%rsp,%rbp
.Lc41:
	leaq	-160(%rsp),%rsp
.seh_stackalloc 160
	movq	%rbx,-128(%rbp)
	movq	%rdi,-120(%rbp)
	movq	%rsi,-112(%rbp)
	movq	%r12,-104(%rbp)
	movq	%r13,-96(%rbp)
	movq	%r14,-88(%rbp)
	movdqa	%xmm6,-80(%rbp)
	movdqa	%xmm8,-64(%rbp)
	movdqa	%xmm9,-48(%rbp)
.seh_savereg %rbx, 32
.seh_savereg %rdi, 40
.seh_savereg %rsi, 48
.seh_savereg %r12, 56
.seh_savereg %r13, 64
.seh_savereg %r14, 72
.seh_savexmm %xmm6, 80
.seh_savexmm %xmm8, 96
.seh_savexmm %xmm9, 112
.seh_endprologue
# Var original_input located at rbp-8, size=OS_64
# Var i located in register r14d
# Var metric_idx located in register r13d
# Var weighted_sum located in register xmm6
# Var weight_total located in register xmm9
# Var m located in register xmm8
	movq	%rcx,%rbx
# Var $result located in register rbx
	movq	%rdx,%rsi
# Var state located in register rsi
	movq	%r8,%rdi
# Var target located in register rdi
	movq	%r9,-8(%rbp)
	movq	48(%rbp),%rax
# Var $highORIGINAL_INPUT located in register rax
	movq	-8(%rbp),%r12
	leaq	1(%rax),%r13
	shlq	$3,%r13
	movq	%r13,%rcx
	call	fpc_getmem
	movq	%rax,%r14
	movq	%r13,%r8
	movq	%r14,%rdx
	movq	%r12,%rcx
	call	SYSTEM_$$_MOVE$formal$formal$INT64
	movq	%r14,-8(%rbp)
.Ll97:
	movq	$0,-16(%rbp)
.Lj82:
	nop
.Lj78:
.Ll98:
# [225] FillChar(Result, SizeOf(Result), 0);
	movq	%rbx,%rcx
	xorl	%r8d,%r8d
	movl	$112,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll99:
# [226] Result.version := target.version;
	movw	8(%rdi),%ax
	movw	%ax,104(%rbx)
.Ll100:
# [227] StrPCopy(@Result.tag[0], Copy(target.name, 1, 31));
	movq	(%rdi),%rdx
	movl	$31,%r9d
	movl	$1,%r8d
	leaq	-16(%rbp),%rcx
	call	fpc_ansistr_copy
	movq	-16(%rbp),%rdx
	leaq	72(%rbx),%rcx
	call	SYSUTILS_$$_STRPCOPY$PCHAR$ANSISTRING$$PCHAR
.Ll101:
# [229] weighted_sum := 0.0;
	movsd	_$SOMA_FITNESS$_Ld19(%rip),%xmm6
.Ll102:
# [230] weight_total := 0.0;
	movsd	_$SOMA_FITNESS$_Ld19(%rip),%xmm9
.Ll103:
# [231] metric_idx   := 0;
	xorl	%r13d,%r13d
.Ll104:
# [233] for i := 0 to High(target.criteria) do
	movq	32(%rdi),%rcx
	call	fpc_dynarray_high
	movq	%rax,%r12
	testl	%r12d,%r12d
	jnge	.Lj84
	movl	$-1,%r14d
	.balign 8,0x90
.Lj85:
	addl	$1,%r14d
.Ll105:
# [235] if target.criteria[i].metric = 'survival' then
	movq	32(%rdi),%rdx
	movslq	%r14d,%rax
	shlq	$4,%rax
	movq	(%rdx,%rax),%rcx
	leaq	.Ld18(%rip),%rdx
	call	fpc_ansistr_compare_equal
	testq	%rax,%rax
	jne	.Lj89
.Ll106:
# [236] m := Prim_Survival(state)
	movq	%rsi,%rcx
	call	SOMA_FITNESS_$$_PRIM_SURVIVAL$TVMSTATE$$DOUBLE
	movapd	%xmm0,%xmm8
	jmp	.Lj90
.Lj89:
.Ll107:
# [237] else if target.criteria[i].metric = 'array_sorted' then
	movq	32(%rdi),%rdx
	movslq	%r14d,%rax
	shlq	$4,%rax
	movq	(%rdx,%rax),%rcx
	leaq	.Ld20(%rip),%rdx
	call	fpc_ansistr_compare_equal
	testq	%rax,%rax
	jne	.Lj92
.Ll108:
# [238] m := Prim_ArraySorted(state, target.input_count)
	movl	12(%rdi),%edx
	movq	%rsi,%rcx
	call	SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE
	movapd	%xmm0,%xmm8
	jmp	.Lj93
.Lj92:
.Ll109:
# [240] m := 0.0;  // unknown metric name: contributes nothing, doesn't crash
	movsd	_$SOMA_FITNESS$_Ld19(%rip),%xmm8
.Lj93:
.Lj90:
.Ll110:
# [242] if metric_idx <= High(Result.metrics) then
	cmpl	$7,%r13d
	jnle	.Lj95
.Ll111:
# [244] Result.metrics[metric_idx] := m;
	movl	%r13d,%eax
	movsd	%xmm8,8(%rbx,%rax,8)
.Ll112:
# [245] Inc(metric_idx);
	addl	$1,%r13d
	.balign 4,0x90
.Lj95:
.Ll113:
# [248] weighted_sum := weighted_sum + (m * target.criteria[i].weight);
	movq	32(%rdi),%rdx
	movslq	%r14d,%rax
	shlq	$4,%rax
	movapd	%xmm8,%xmm0
	mulsd	8(%rdx,%rax),%xmm0
	addsd	%xmm0,%xmm6
.Ll114:
# [249] weight_total := weight_total + target.criteria[i].weight;
	movq	32(%rdi),%rdx
	movslq	%r14d,%rax
	shlq	$4,%rax
	addsd	8(%rdx,%rax),%xmm9
.Ll115:
	cmpl	%r14d,%r12d
	jnle	.Lj85
	.balign 4,0x90
.Lj84:
.Ll116:
# [252] if weight_total > 0.0 then
	comisd	_$SOMA_FITNESS$_Ld19(%rip),%xmm9
	jp	.Lj97
	jna	.Lj97
.Ll117:
# [253] Result.score := weighted_sum / weight_total
	movapd	%xmm6,%xmm0
	divsd	%xmm9,%xmm0
	movsd	%xmm0,(%rbx)
	jmp	.Lj99
.Lj97:
.Ll118:
# [255] Result.score := 0.0;
	movq	_$SOMA_FITNESS$_Ld19(%rip),%rax
	movq	%rax,(%rbx)
.Lj99:
.Ll119:
	movq	4384(%rsi),%rax
.Ll120:
# [260] Result.passed := ((state.halt_reason = HR_HALT) or (state.halt_reason = HR_YIELD))
	cmpq	$1,%rax
	je	.Lj100
	cmpq	$2,%rax
	jne	.Lj102
.Lj100:
.Ll121:
# [261] and (Result.score > 0.1);
	movsd	(%rbx),%xmm0
	comisd	_$SOMA_FITNESS$_Ld21(%rip),%xmm0
	jp	.Lj102
	jna	.Lj102
.Ll122:
	movb	$1,106(%rbx)
	jmp	.Lj105
.Lj102:
	movb	$0,106(%rbx)
.Lj105:
.Lj80:
.Ll123:
	nop
.Lj79:
	movq	%rbp,%rcx
	call	SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011
.Ll124:
	movq	-128(%rbp),%rbx
	movq	-120(%rbp),%rdi
	movq	-112(%rbp),%rsi
	movq	-104(%rbp),%r12
	movq	-96(%rbp),%r13
	movq	-88(%rbp),%r14
	movdqa	-80(%rbp),%xmm6
	movdqa	-64(%rbp),%xmm8
	movdqa	-48(%rbp),%xmm9
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_handler __FPC_specific_handler,@unwind
.seh_handlerdata
	.long	1
	.long	0
	.rva	.Lj78
	.rva	.Lj79
	.rva	SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011

.section .text.n_soma_fitness_$$_evaluatefitnesstarget$tvmstate$tfitnesstarget$array_of_int64$$tfitnessresult,"x"
.seh_endproc
.Lc38:
.Lt7:
.Ll125:
# End asmlist al_procedures
# Begin asmlist al_typedconsts

.section .rodata.n__$SOMA_FITNESS$_Ld1,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld1
_$SOMA_FITNESS$_Ld1:
# value: 0d+2.4414062500000000E-004
	.byte	0,0,0,0,0,0,48,63

.section .rodata.n__$SOMA_FITNESS$_Ld2,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld2
_$SOMA_FITNESS$_Ld2:
# value: 0d+1.0000000000000000E+000
	.byte	0,0,0,0,0,0,240,63

.section .rodata.n__$SOMA_FITNESS$_Ld3,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld3
_$SOMA_FITNESS$_Ld3:
# value: 0d+3.9062500000000000E-003
	.byte	0,0,0,0,0,0,112,63

.section .rodata.n__$SOMA_FITNESS$_Ld4,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld4
_$SOMA_FITNESS$_Ld4:
# value: 0d+5.0000000000000000E-001
	.byte	0,0,0,0,0,0,224,63

.section .rodata.n__$SOMA_FITNESS$_Ld5,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld5
_$SOMA_FITNESS$_Ld5:
# value: 0d+2.9999999999999999E-001
	.byte	51,51,51,51,51,51,211,63

.section .rodata.n__$SOMA_FITNESS$_Ld6,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld6
_$SOMA_FITNESS$_Ld6:
# value: 0d+2.0000000000000001E-001
	.byte	154,153,153,153,153,153,201,63

.section .rodata.n_.Ld7,"d"
	.balign 8
.Ld7$strlab:
	.short	65001,1
	.long	0
	.quad	-1,7
.Ld7:
	.ascii	"unnamed\000"

.section .rodata.n_.Ld8,"d"
	.balign 8
.Ld8$strlab:
	.short	0,1
	.long	0
	.quad	-1,4
.Ld8:
	.ascii	"name\000"

.section .rodata.n_.Ld9,"d"
	.balign 8
.Ld9$strlab:
	.short	0,1
	.long	0
	.quad	-1,7
.Ld9:
	.ascii	"version\000"

.section .rodata.n_.Ld10,"d"
	.balign 8
.Ld10$strlab:
	.short	0,1
	.long	0
	.quad	-1,5
.Ld10:
	.ascii	"setup\000"

.section .rodata.n_.Ld11,"d"
	.balign 8
.Ld11$strlab:
	.short	0,1
	.long	0
	.quad	-1,11
.Ld11:
	.ascii	"input_count\000"

.section .rodata.n_.Ld12,"d"
	.balign 8
.Ld12$strlab:
	.short	0,1
	.long	0
	.quad	-1,9
.Ld12:
	.ascii	"input_min\000"

.section .rodata.n_.Ld13,"d"
	.balign 8
.Ld13$strlab:
	.short	0,1
	.long	0
	.quad	-1,9
.Ld13:
	.ascii	"input_max\000"

.section .rodata.n_.Ld14,"d"
	.balign 8
.Ld14$strlab:
	.short	0,1
	.long	0
	.quad	-1,8
.Ld14:
	.ascii	"criteria\000"

.section .rodata.n_.Ld15,"d"
	.balign 8
.Ld15$strlab:
	.short	65001,1
	.long	0
	.quad	-1,8
.Ld15:
	.ascii	"survival\000"

.section .rodata.n_.Ld16,"d"
	.balign 8
.Ld16$strlab:
	.short	0,1
	.long	0
	.quad	-1,6
.Ld16:
	.ascii	"metric\000"

.section .rodata.n_.Ld17,"d"
	.balign 8
.Ld17$strlab:
	.short	0,1
	.long	0
	.quad	-1,6
.Ld17:
	.ascii	"weight\000"

.section .rodata.n_.Ld18,"d"
	.balign 8
.Ld18$strlab:
	.short	0,1
	.long	0
	.quad	-1,8
.Ld18:
	.ascii	"survival\000"

.section .rodata.n__$SOMA_FITNESS$_Ld19,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld19
_$SOMA_FITNESS$_Ld19:
# value: 0d+0.0000000000000000E+000
	.byte	0,0,0,0,0,0,0,0

.section .rodata.n_.Ld20,"d"
	.balign 8
.Ld20$strlab:
	.short	0,1
	.long	0
	.quad	-1,12
.Ld20:
	.ascii	"array_sorted\000"

.section .rodata.n__$SOMA_FITNESS$_Ld21,"d"
	.balign 8
.globl	_$SOMA_FITNESS$_Ld21
_$SOMA_FITNESS$_Ld21:
# value: 0d+1.0000000000000001E-001
	.byte	154,153,153,153,153,153,185,63
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND
RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND:
	.byte	3,14
# [265] 
	.ascii	"TPrimitiveKind"
	.byte	1
	.long	0,1
	.quad	0
	.byte	10
	.ascii	"pkSurvival"
	.byte	13
	.ascii	"pkArraySorted"
	.byte	12
	.ascii	"soma_fitness"
	.byte	0

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o
RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o:
	.long	2,1
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND+44
	.long	0
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND+33

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s
RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s:
	.long	0
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND+33
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND+44

.section .rodata.n_INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION,"d"
	.balign 8
.globl	INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION
INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION:
	.byte	13,17
	.ascii	"TFitnessCriterion"
	.quad	0
	.long	16
	.quad	0,0
	.long	1
	.quad	RTTI_$SYSTEM_$$_ANSISTRING$indirect
	.quad	0

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION
RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION:
	.byte	13,17
	.ascii	"TFitnessCriterion"
	.quad	INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION
	.long	16,2
	.quad	RTTI_$SYSTEM_$$_ANSISTRING$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	8

.section .rodata.n_INIT_$SOMA_FITNESS_$$_def00000003,"d"
	.balign 8
.globl	INIT_$SOMA_FITNESS_$$_def00000003
INIT_$SOMA_FITNESS_$$_def00000003:
	.byte	21,0
	.quad	16
	.quad	INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect
	.long	-1
	.quad	INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect
	.byte	12
	.ascii	"soma_fitness"

.section .rodata.n_INIT_$SOMA_FITNESS_$$_TFITNESSTARGET,"d"
	.balign 8
.globl	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET
INIT_$SOMA_FITNESS_$$_TFITNESSTARGET:
	.byte	13,14
	.ascii	"TFitnessTarget"
	.quad	0
	.long	40
	.quad	0,0
	.long	2
	.quad	RTTI_$SYSTEM_$$_ANSISTRING$indirect
	.quad	0
	.quad	INIT_$SOMA_FITNESS_$$_def00000003$indirect
	.quad	32

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_def00000003,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_def00000003
RTTI_$SOMA_FITNESS_$$_def00000003:
	.byte	21,0
	.quad	16
	.quad	RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect
	.long	-1
	.quad	RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect
	.byte	12
	.ascii	"soma_fitness"

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET
RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET:
	.byte	13,14
	.ascii	"TFitnessTarget"
	.quad	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET
	.long	40,6
	.quad	RTTI_$SYSTEM_$$_ANSISTRING$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_WORD$indirect
	.quad	8
	.quad	RTTI_$SYSTEM_$$_LONGINT$indirect
	.quad	12
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	16
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	24
	.quad	RTTI_$SOMA_FITNESS_$$_def00000003$indirect
	.quad	32
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND$indirect
RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND$indirect:
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o$indirect
RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o$indirect:
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_s2o

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s$indirect
RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s$indirect:
	.quad	RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND_o2s

.section .rodata.n_INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION,"d"
	.balign 8
.globl	INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect
INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect:
	.quad	INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect
RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION$indirect:
	.quad	RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION

.section .rodata.n_INIT_$SOMA_FITNESS_$$_def00000003,"d"
	.balign 8
.globl	INIT_$SOMA_FITNESS_$$_def00000003$indirect
INIT_$SOMA_FITNESS_$$_def00000003$indirect:
	.quad	INIT_$SOMA_FITNESS_$$_def00000003

.section .rodata.n_INIT_$SOMA_FITNESS_$$_TFITNESSTARGET,"d"
	.balign 8
.globl	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET$indirect
INIT_$SOMA_FITNESS_$$_TFITNESSTARGET$indirect:
	.quad	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_def00000003,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_def00000003$indirect
RTTI_$SOMA_FITNESS_$$_def00000003$indirect:
	.quad	RTTI_$SOMA_FITNESS_$$_def00000003

.section .rodata.n_RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET,"d"
	.balign 8
.globl	RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET$indirect
RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET$indirect:
	.quad	RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc42:
	.long	.Lc44-.Lc43
.Lc43:
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
.Lc44:
	.long	.Lc46-.Lc45
.Lc45:
	.secrel32	.Lc42
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.balign 4,0
.Lc46:
	.long	.Lc48-.Lc47
.Lc47:
	.secrel32	.Lc42
	.quad	.Lc3
	.quad	.Lc4-.Lc3
	.balign 4,0
.Lc48:
	.long	.Lc50-.Lc49
.Lc49:
	.secrel32	.Lc42
	.quad	.Lc5
	.quad	.Lc6-.Lc5
	.byte	4
	.long	.Lc7-.Lc5
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc8-.Lc7
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc9-.Lc8
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc50:
	.long	.Lc52-.Lc51
.Lc51:
	.secrel32	.Lc42
	.quad	.Lc10
	.quad	.Lc11-.Lc10
	.byte	4
	.long	.Lc12-.Lc10
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc13-.Lc12
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc14-.Lc13
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc52:
	.long	.Lc54-.Lc53
.Lc53:
	.secrel32	.Lc42
	.quad	.Lc15
	.quad	.Lc16-.Lc15
	.byte	4
	.long	.Lc17-.Lc15
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc18-.Lc17
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc19-.Lc18
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc54:
	.long	.Lc56-.Lc55
.Lc55:
	.secrel32	.Lc42
	.quad	.Lc20
	.quad	.Lc21-.Lc20
	.byte	4
	.long	.Lc22-.Lc20
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc23-.Lc22
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc24-.Lc23
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc56:
	.long	.Lc58-.Lc57
.Lc57:
	.secrel32	.Lc42
	.quad	.Lc25
	.quad	.Lc26-.Lc25
	.byte	4
	.long	.Lc27-.Lc25
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc28-.Lc27
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc29-.Lc28
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc58:
	.long	.Lc60-.Lc59
.Lc59:
	.secrel32	.Lc42
	.quad	.Lc30
	.quad	.Lc31-.Lc30
	.balign 4,0
.Lc60:
	.long	.Lc62-.Lc61
.Lc61:
	.secrel32	.Lc42
	.quad	.Lc32
	.quad	.Lc33-.Lc32
	.byte	4
	.long	.Lc34-.Lc32
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc35-.Lc34
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc36-.Lc35
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc62:
	.long	.Lc64-.Lc63
.Lc63:
	.secrel32	.Lc42
	.quad	.Lc37
	.quad	.Lc38-.Lc37
	.byte	4
	.long	.Lc39-.Lc37
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc40-.Lc39
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc41-.Lc40
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc64:
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
# [89] function Prim_Survival(const state: TVMState): Double;
	.ascii	"soma_fitness.pas\000"
	.ascii	"Free Pascal 3.2.2 2026/06/06\000"
	.ascii	"C:/dev/soma/\000"
	.byte	9
	.byte	3
	.secrel32	.Ldebug_line0
	.quad	DEBUGSTART_$SOMA_FITNESS
	.quad	DEBUGEND_$SOMA_FITNESS
# Syms - Begin unit SOMA_FITNESS has index 12
# Symbol SOMA_FITNESS
# Symbol SYSTEM
# Symbol OBJPAS
# Symbol SOMA_TYPES
# Symbol FPJSON
# Symbol JSONPARSER
# Symbol SYSUTILS
# Symbol CLASSES
# Symbol TPRIMITIVEKIND
# Symbol PKSURVIVAL
# Symbol PKARRAYSORTED
# Symbol TFITNESSCRITERION
# Symbol TFITNESSTARGET
# Symbol LOADFITNESSTARGET
# Symbol SEEDFITNESSINPUT
# Symbol EVALUATEFITNESSTARGET
# Syms - End unit SOMA_FITNESS has index 12
# Syms - Begin Staticsymtable
# Symbol SOMA_FITNESS_$$_init$
# Symbol PRIM_SURVIVAL
# Symbol PRIM_ARRAYSORTED
# Symbol ansistrrec7
# Symbol ansistrrec4
# Symbol ansistrrec5
# Symbol ansistrrec11
# Symbol ansistrrec9
# Symbol ansistrrec8
# Symbol ansistrrec6
# Symbol ansistrrec12
# Symbol rttidef$RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND
# Symbol rtti_header$14
# Symbol rtti_enum_size_start_rec$00000000
# Symbol rtti_enum_min_max_rec$00000000
# Symbol rtti_enum_basetype_array_rec$00000000
# Symbol rttidef$INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION
# Symbol rtti_header$17
# Symbol rttidef$RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION
# Symbol rttidef$INIT_$SOMA_FITNESS_$$_def00000003
# Symbol rtti_dyn_array$
# Symbol rttidef$INIT_$SOMA_FITNESS_$$_TFITNESSTARGET
# Symbol rttidef$RTTI_$SOMA_FITNESS_$$_def00000003
# Symbol rttidef$RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET
# Syms - End Staticsymtable
# Procdef LoadFitnessTarget(<var TFitnessTarget>;const AnsiString):<record type>;
	.uleb128	2
	.ascii	"LoadFitnessTarget\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La5-.Ldebug_info0
	.quad	SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
	.quad	.Lt1
# Symbol result
	.uleb128	3
	.ascii	"$result\000"
	.byte	3
	.byte	118
	.sleb128	-16
	.byte	6
	.long	.La5-.Ldebug_info0
# Symbol PATH
	.uleb128	4
	.ascii	"path\000"
	.byte	2
	.byte	118
	.sleb128	-8
	.long	.La49-.Ldebug_info0
# Symbol LOADFITNESSTARGET
	.uleb128	3
	.ascii	"LOADFITNESSTARGET\000"
	.byte	3
	.byte	118
	.sleb128	-16
	.byte	6
	.long	.La5-.Ldebug_info0
# Symbol RESULT
	.uleb128	3
	.ascii	"RESULT\000"
	.byte	3
	.byte	118
	.sleb128	-16
	.byte	6
	.long	.La5-.Ldebug_info0
# Symbol JROOT
	.uleb128	3
	.ascii	"jroot\000"
	.byte	2
	.byte	118
	.sleb128	-24
	.long	.La51-.Ldebug_info0
# Symbol JSETUP
	.uleb128	3
	.ascii	"jsetup\000"
	.byte	2
	.byte	118
	.sleb128	-32
	.long	.La51-.Ldebug_info0
# Symbol JCRITERIA
# Symbol JCRIT
	.uleb128	3
	.ascii	"jcrit\000"
	.byte	2
	.byte	118
	.sleb128	-48
	.long	.La51-.Ldebug_info0
# Symbol JARR
	.uleb128	3
	.ascii	"jarr\000"
	.byte	2
	.byte	118
	.sleb128	-56
	.long	.La54-.Ldebug_info0
# Symbol FS
	.uleb128	3
	.ascii	"fs\000"
	.byte	2
	.byte	118
	.sleb128	-64
	.long	.La57-.Ldebug_info0
# Symbol PARSER
	.uleb128	3
	.ascii	"parser\000"
	.byte	3
	.byte	118
	.sleb128	-72
	.long	.La60-.Ldebug_info0
# Symbol DATA
	.uleb128	3
	.ascii	"data\000"
	.byte	3
	.byte	118
	.sleb128	-80
	.long	.La63-.Ldebug_info0
# Symbol I
	.uleb128	3
	.ascii	"i\000"
	.byte	3
	.byte	118
	.sleb128	-84
	.long	.La66-.Ldebug_info0
# Symbol fin$00000009
# Symbol fin$0000000A
# Symbol fin$0000000B
# Symbol fin$0000000C
	.byte	0
# Procdef $fin$00000009(<^untyped>) is nested; Register;
	.uleb128	5
	.ascii	"$fin$00000009\000"
	.byte	1
	.byte	65
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
	.quad	.Lt2
# Symbol parentfp
	.uleb128	4
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La68-.Ldebug_info0
	.byte	0
# Procdef $fin$0000000A(<^untyped>) is nested; Register;
	.uleb128	5
	.ascii	"$fin$0000000A\000"
	.byte	1
	.byte	65
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
	.quad	.Lt3
# Symbol parentfp
	.uleb128	4
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La68-.Ldebug_info0
	.byte	0
# Procdef $fin$0000000B(<^untyped>) is nested; Register;
	.uleb128	5
	.ascii	"$fin$0000000B\000"
	.byte	1
	.byte	65
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
	.quad	.Lt4
# Symbol parentfp
	.uleb128	4
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La68-.Ldebug_info0
	.byte	0
# Procdef $fin$0000000C(<^untyped>) is nested; Register;
	.uleb128	5
	.ascii	"$fin$0000000C\000"
	.byte	1
	.byte	65
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C
	.quad	.Lt5
# Symbol parentfp
	.uleb128	4
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La68-.Ldebug_info0
	.byte	0
# Procdef SeedFitnessInput(var TVMState;const TFitnessTarget;var QWord);
	.uleb128	6
	.ascii	"SeedFitnessInput\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
	.quad	.Lt6
# Symbol STATE
	.uleb128	4
	.ascii	"state\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La70-.Ldebug_info0
# Symbol TARGET
	.uleb128	4
	.ascii	"target\000"
	.byte	3
	.byte	146
	.uleb128	9
	.sleb128	0
	.long	.La5-.Ldebug_info0
# Symbol RNG
	.uleb128	4
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	8
	.sleb128	0
	.long	.La72-.Ldebug_info0
# Symbol I
	.uleb128	3
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La66-.Ldebug_info0
# Symbol SPAN
	.uleb128	3
	.ascii	"span\000"
	.byte	2
	.byte	144
	.uleb128	10
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef EvaluateFitnessTarget(<var TFitnessResult>;const TVMState;const TFitnessTarget;{Open} Array Of Int64;<const Int64>):<record type>;
	.uleb128	2
	.ascii	"EvaluateFitnessTarget\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La74-.Ldebug_info0
	.quad	SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
	.quad	.Lt7
# Symbol result
	.uleb128	3
	.ascii	"$result\000"
	.byte	3
	.byte	146
	.uleb128	3
	.sleb128	0
	.long	.La74-.Ldebug_info0
# Symbol STATE
	.uleb128	4
	.ascii	"state\000"
	.byte	3
	.byte	146
	.uleb128	4
	.sleb128	0
	.long	.La70-.Ldebug_info0
# Symbol TARGET
	.uleb128	4
	.ascii	"target\000"
	.byte	3
	.byte	146
	.uleb128	5
	.sleb128	0
	.long	.La5-.Ldebug_info0
# Symbol ORIGINAL_INPUT
	.uleb128	4
	.ascii	"original_input\000"
	.byte	3
	.byte	118
	.sleb128	-8
	.byte	6
	.long	.La76-.Ldebug_info0
# Symbol highORIGINAL_INPUT
	.uleb128	4
	.ascii	"$highORIGINAL_INPUT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La78-.Ldebug_info0
# Symbol EVALUATEFITNESSTARGET
	.uleb128	3
	.ascii	"EVALUATEFITNESSTARGET\000"
	.byte	3
	.byte	146
	.uleb128	3
	.sleb128	0
	.long	.La74-.Ldebug_info0
# Symbol RESULT
	.uleb128	3
	.ascii	"RESULT\000"
	.byte	3
	.byte	146
	.uleb128	3
	.sleb128	0
	.long	.La74-.Ldebug_info0
# Symbol I
	.uleb128	3
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	14
	.long	.La66-.Ldebug_info0
# Symbol METRIC_IDX
	.uleb128	3
	.ascii	"metric_idx\000"
	.byte	2
	.byte	144
	.uleb128	13
	.long	.La66-.Ldebug_info0
# Symbol WEIGHTED_SUM
	.uleb128	3
	.ascii	"weighted_sum\000"
	.byte	2
	.byte	144
	.uleb128	23
	.long	.La80-.Ldebug_info0
# Symbol WEIGHT_TOTAL
	.uleb128	3
	.ascii	"weight_total\000"
	.byte	2
	.byte	144
	.uleb128	26
	.long	.La80-.Ldebug_info0
# Symbol M
	.uleb128	3
	.ascii	"m\000"
	.byte	2
	.byte	144
	.uleb128	25
	.long	.La80-.Ldebug_info0
# Symbol fin$00000011
# Definition {Open} Array Of Int64
.La76:
	.uleb128	7
	.long	.La78-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	8
	.long	.La78-.Ldebug_info0
	.byte	0
.La77:
	.uleb128	9
	.long	.La76-.Ldebug_info0
	.byte	0
# Procdef $fin$00000011(<^untyped>) is nested; Register;
	.uleb128	5
	.ascii	"$fin$00000011\000"
	.byte	1
	.byte	65
	.quad	SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011
	.quad	.Lt8
# Symbol parentfp
	.uleb128	4
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La68-.Ldebug_info0
	.byte	0
# Procdef Prim_Survival(const TVMState):Double;
	.uleb128	10
	.ascii	"Prim_Survival\000"
	.byte	1
	.byte	65
	.long	.La80-.Ldebug_info0
	.quad	SOMA_FITNESS_$$_PRIM_SURVIVAL$TVMSTATE$$DOUBLE
	.quad	.Lt9
# Symbol STATE
	.uleb128	4
	.ascii	"state\000"
	.byte	3
	.byte	146
	.uleb128	0
	.sleb128	0
	.long	.La70-.Ldebug_info0
# Symbol result
	.uleb128	3
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La80-.Ldebug_info0
# Symbol PRIM_SURVIVAL
	.uleb128	3
	.ascii	"PRIM_SURVIVAL\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La80-.Ldebug_info0
# Symbol RESULT
	.uleb128	3
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La80-.Ldebug_info0
# Symbol SURVIVAL_SCORE
	.uleb128	3
	.ascii	"survival_score\000"
	.byte	2
	.byte	144
	.uleb128	18
	.long	.La80-.Ldebug_info0
# Symbol ACTIVITY_SCORE
	.uleb128	3
	.ascii	"activity_score\000"
	.byte	2
	.byte	144
	.uleb128	19
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef Prim_ArraySorted(const TVMState;LongInt):Double;
	.uleb128	10
	.ascii	"Prim_ArraySorted\000"
	.byte	1
	.byte	65
	.long	.La80-.Ldebug_info0
	.quad	SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE
	.quad	.Lt10
# Symbol STATE
	.uleb128	4
	.ascii	"state\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La70-.Ldebug_info0
# Symbol COUNT
	.uleb128	4
	.ascii	"count\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La66-.Ldebug_info0
# Symbol result
	.uleb128	3
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La80-.Ldebug_info0
# Symbol PRIM_ARRAYSORTED
	.uleb128	3
	.ascii	"PRIM_ARRAYSORTED\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La80-.Ldebug_info0
# Symbol RESULT
	.uleb128	3
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La80-.Ldebug_info0
# Symbol I
	.uleb128	3
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	8
	.long	.La66-.Ldebug_info0
# Symbol CORRECT_PAIRS
	.uleb128	3
	.ascii	"correct_pairs\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La66-.Ldebug_info0
# Symbol TOTAL_PAIRS
	.uleb128	3
	.ascii	"total_pairs\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La66-.Ldebug_info0
	.byte	0
# Defs - Begin unit SYSTEM has index 1
# Definition LongInt
.La66:
	.uleb128	11
	.ascii	"LongInt\000"
	.long	.La82-.Ldebug_info0
.La82:
	.uleb128	12
	.ascii	"LongInt\000"
	.byte	5
	.byte	4
.La67:
	.uleb128	9
	.long	.La66-.Ldebug_info0
# Definition QWord
.La72:
	.uleb128	11
	.ascii	"QWord\000"
	.long	.La83-.Ldebug_info0
.La83:
	.uleb128	12
	.ascii	"QWord\000"
	.byte	7
	.byte	8
.La73:
	.uleb128	9
	.long	.La72-.Ldebug_info0
# Definition Int64
.La78:
	.uleb128	11
	.ascii	"Int64\000"
	.long	.La84-.Ldebug_info0
.La84:
	.uleb128	12
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.La79:
	.uleb128	9
	.long	.La78-.Ldebug_info0
# Definition AnsiString
.La49:
	.uleb128	11
	.ascii	"AnsiString\000"
	.long	.La85-.Ldebug_info0
.La85:
	.uleb128	13
	.ascii	"AnsiString\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La86-.Ldebug_info0
	.uleb128	14
	.uleb128	1
	.byte	13
	.byte	151
	.byte	6
	.byte	18
	.byte	40
	.short	4
	.byte	48
	.byte	47
	.short	3
	.byte	56
	.byte	28
	.byte	6
	.byte	0
.La50:
	.uleb128	9
	.long	.La49-.Ldebug_info0
# Definition Double
.La80:
	.uleb128	11
	.ascii	"Double\000"
	.long	.La88-.Ldebug_info0
.La88:
	.uleb128	12
	.ascii	"Double\000"
	.byte	4
	.byte	8
.La81:
	.uleb128	9
	.long	.La80-.Ldebug_info0
# Definition ^untyped
.La68:
	.uleb128	11
	.ascii	"$parentfp_void_pointer\000"
	.long	.La89-.Ldebug_info0
.La89:
	.uleb128	15
.La69:
	.uleb128	9
	.long	.La68-.Ldebug_info0
# Definition Char
.La86:
	.uleb128	11
	.ascii	"Char\000"
	.long	.La90-.Ldebug_info0
.La90:
	.uleb128	12
	.ascii	"Char\000"
	.byte	8
	.byte	1
.La87:
	.uleb128	9
	.long	.La86-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit SOMA_TYPES has index 8
# Definition TVMState
.La70:
	.uleb128	11
	.ascii	"TVMState\000"
	.long	.La91-.Ldebug_info0
.La91:
	.uleb128	16
	.ascii	"TVMSTATE\000"
	.uleb128	37184
	.uleb128	17
	.ascii	"guard\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La92-.Ldebug_info0
	.uleb128	17
	.ascii	"istack\000"
	.byte	3
	.byte	35
	.uleb128	256
	.long	.La94-.Ldebug_info0
	.uleb128	17
	.ascii	"fstack\000"
	.byte	3
	.byte	35
	.uleb128	2304
	.long	.La96-.Ldebug_info0
	.uleb128	17
	.ascii	"isp\000"
	.byte	3
	.byte	35
	.uleb128	4352
	.long	.La78-.Ldebug_info0
	.uleb128	17
	.ascii	"fsp\000"
	.byte	3
	.byte	35
	.uleb128	4360
	.long	.La78-.Ldebug_info0
	.uleb128	17
	.ascii	"ip\000"
	.byte	3
	.byte	35
	.uleb128	4368
	.long	.La78-.Ldebug_info0
	.uleb128	17
	.ascii	"rng_state\000"
	.byte	3
	.byte	35
	.uleb128	4376
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"halt_reason\000"
	.byte	3
	.byte	35
	.uleb128	4384
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"genome\000"
	.byte	3
	.byte	35
	.uleb128	4392
	.long	.La98-.Ldebug_info0
	.uleb128	17
	.ascii	"exec_count\000"
	.byte	4
	.byte	35
	.uleb128	37160
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"pad\000"
	.byte	4
	.byte	35
	.uleb128	37168
	.long	.La100-.Ldebug_info0
	.byte	0
.La71:
	.uleb128	9
	.long	.La70-.Ldebug_info0
# Definition TFitnessResult
.La74:
	.uleb128	11
	.ascii	"TFitnessResult\000"
	.long	.La102-.Ldebug_info0
.La102:
	.uleb128	16
	.ascii	"TFITNESSRESULT\000"
	.uleb128	112
	.uleb128	17
	.ascii	"score\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La80-.Ldebug_info0
	.uleb128	17
	.ascii	"metrics\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La103-.Ldebug_info0
	.uleb128	17
	.ascii	"tag\000"
	.byte	2
	.byte	35
	.uleb128	72
	.long	.La105-.Ldebug_info0
	.uleb128	17
	.ascii	"version\000"
	.byte	2
	.byte	35
	.uleb128	104
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"passed\000"
	.byte	2
	.byte	35
	.uleb128	106
	.long	.La109-.Ldebug_info0
	.byte	0
.La75:
	.uleb128	9
	.long	.La74-.Ldebug_info0
# Definition TGenome
.La98:
	.uleb128	11
	.ascii	"TGenome\000"
	.long	.La111-.Ldebug_info0
.La111:
	.uleb128	18
	.ascii	"TGenome\000"
	.uleb128	32768
	.long	.La112-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	4095
	.uleb128	8
	.long	.La114-.Ldebug_info0
	.byte	0
.La99:
	.uleb128	9
	.long	.La98-.Ldebug_info0
# Definition TInstruction
.La112:
	.uleb128	11
	.ascii	"TInstruction\000"
	.long	.La116-.Ldebug_info0
.La116:
	.uleb128	16
	.ascii	"TINSTRUCTION\000"
	.uleb128	8
	.uleb128	17
	.ascii	"opcode\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"flags\000"
	.byte	2
	.byte	35
	.uleb128	2
	.long	.La117-.Ldebug_info0
	.uleb128	17
	.ascii	"pad\000"
	.byte	2
	.byte	35
	.uleb128	3
	.long	.La117-.Ldebug_info0
	.uleb128	17
	.ascii	"imm\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La66-.Ldebug_info0
	.byte	0
.La113:
	.uleb128	9
	.long	.La112-.Ldebug_info0
# Defs - End unit SOMA_TYPES has index 8
# Defs - Begin unit WINDOWS has index 5
# Defs - End unit WINDOWS has index 5
# Defs - Begin unit SYSCONST has index 15
# Defs - End unit SYSCONST has index 15
# Defs - Begin unit WINDIRS has index 16
# Defs - End unit WINDIRS has index 16
# Defs - Begin unit SYSUTILS has index 14
# Defs - End unit SYSUTILS has index 14
# Defs - Begin unit RTLCONSTS has index 22
# Defs - End unit RTLCONSTS has index 22
# Defs - Begin unit TYPINFO has index 23
# Defs - End unit TYPINFO has index 23
# Defs - Begin unit MATH has index 13
# Defs - End unit MATH has index 13
# Defs - Begin unit TYPES has index 25
# Defs - End unit TYPES has index 25
# Defs - Begin unit VARUTILS has index 24
# Defs - End unit VARUTILS has index 24
# Defs - Begin unit VARIANTS has index 20
# Defs - End unit VARIANTS has index 20
# Defs - Begin unit CLASSES has index 19
# Definition TFileStream
.La57:
	.uleb128	11
	.ascii	"TFileStream\000"
	.long	.La119-.Ldebug_info0
.La119:
	.uleb128	20
	.long	.La59-.Ldebug_info0
.La59:
	.uleb128	21
	.ascii	"TFileStream\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La122-.Ldebug_info0
	.uleb128	23
	.ascii	"FFileName\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"FileName\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La49-.Ldebug_info0
# Procdef constructor Create(<TFileStream>;<Class Of TFileStream>;const AnsiString;Word);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La57-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La57-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La123-.Ldebug_info0
# Symbol AFILENAME
	.uleb128	26
	.ascii	"AFileName\000"
	.long	.La49-.Ldebug_info0
# Symbol MODE
	.uleb128	26
	.ascii	"Mode\000"
	.long	.La107-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TFileStream>;<Class Of TFileStream>;const AnsiString;Word;LongWord);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La57-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La57-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La125-.Ldebug_info0
# Symbol AFILENAME
	.uleb128	26
	.ascii	"AFileName\000"
	.long	.La49-.Ldebug_info0
# Symbol MODE
	.uleb128	26
	.ascii	"Mode\000"
	.long	.La107-.Ldebug_info0
# Symbol RIGHTS
	.uleb128	26
	.ascii	"Rights\000"
	.long	.La127-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TFileStream>;<Class Of TFileStream>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La57-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La129-.Ldebug_info0
	.byte	0
	.byte	0
.La58:
	.uleb128	9
	.long	.La57-.Ldebug_info0
# Definition THandleStream
.La120:
	.uleb128	11
	.ascii	"THandleStream\000"
	.long	.La131-.Ldebug_info0
.La131:
	.uleb128	20
	.long	.La122-.Ldebug_info0
.La122:
	.uleb128	21
	.ascii	"THandleStream\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La134-.Ldebug_info0
	.uleb128	23
	.ascii	"FHandle\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La72-.Ldebug_info0
	.uleb128	23
	.ascii	"Handle\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La72-.Ldebug_info0
# Procdef SetSize(<THandleStream>;LongInt);
	.uleb128	28
	.ascii	"SetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol NEWSIZE
	.uleb128	26
	.ascii	"NewSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetSize(<THandleStream>;const Int64);
	.uleb128	28
	.ascii	"SetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol NEWSIZE
	.uleb128	26
	.ascii	"NewSize\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<THandleStream>;<Class Of THandleStream>;QWord);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La135-.Ldebug_info0
# Symbol AHANDLE
	.uleb128	26
	.ascii	"AHandle\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef Read(<THandleStream>;var <Formal type>;LongInt):LongInt;
	.uleb128	29
	.ascii	"Read\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Write(<THandleStream>;const <Formal type>;LongInt):LongInt;
	.uleb128	29
	.ascii	"Write\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Seek(<THandleStream>;const Int64;TSeekOrigin):Int64;
	.uleb128	29
	.ascii	"Seek\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La120-.Ldebug_info0
# Symbol OFFSET
	.uleb128	26
	.ascii	"Offset\000"
	.long	.La78-.Ldebug_info0
# Symbol ORIGIN
	.uleb128	26
	.ascii	"Origin\000"
	.long	.La139-.Ldebug_info0
	.byte	0
	.byte	0
.La121:
	.uleb128	9
	.long	.La120-.Ldebug_info0
# Definition TSeekOrigin
.La139:
	.uleb128	11
	.ascii	"TSeekOrigin\000"
	.long	.La141-.Ldebug_info0
.La141:
	.uleb128	30
	.ascii	"TSeekOrigin\000"
	.byte	4
	.uleb128	31
	.ascii	"soBeginning\000"
	.long	0
	.uleb128	31
	.ascii	"soCurrent\000"
	.long	1
	.uleb128	31
	.ascii	"soEnd\000"
	.long	2
	.byte	0
.La140:
	.uleb128	9
	.long	.La139-.Ldebug_info0
# Definition TStream
.La132:
	.uleb128	11
	.ascii	"TStream\000"
	.long	.La142-.Ldebug_info0
.La142:
	.uleb128	20
	.long	.La134-.Ldebug_info0
.La134:
	.uleb128	21
	.ascii	"TStream\000"
	.uleb128	8
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
# Procdef InvalidSeek(<TStream>);
	.uleb128	28
	.ascii	"InvalidSeek\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef Discard(<TStream>;const Int64);
	.uleb128	32
	.ascii	"Discard\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef DiscardLarge(<TStream>;Int64;const LongInt);
	.uleb128	32
	.ascii	"DiscardLarge\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La78-.Ldebug_info0
# Symbol MAXBUFFERSIZE
	.uleb128	26
	.ascii	"MaxBufferSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef FakeSeekForward(<TStream>;Int64;const TSeekOrigin;const Int64);
	.uleb128	32
	.ascii	"FakeSeekForward\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol OFFSET
	.uleb128	26
	.ascii	"Offset\000"
	.long	.La78-.Ldebug_info0
# Symbol ORIGIN
	.uleb128	26
	.ascii	"Origin\000"
	.long	.La139-.Ldebug_info0
# Symbol POS
	.uleb128	26
	.ascii	"Pos\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef GetPosition(<TStream>):Int64;
	.uleb128	33
	.ascii	"GetPosition\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef SetPosition(<TStream>;const Int64);
	.uleb128	28
	.ascii	"SetPosition\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol POS
	.uleb128	26
	.ascii	"Pos\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef GetSize(<TStream>):Int64;
	.uleb128	33
	.ascii	"GetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef SetSize64(<TStream>;const Int64);
	.uleb128	28
	.ascii	"SetSize64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol NEWSIZE
	.uleb128	26
	.ascii	"NewSize\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetSize(<TStream>;LongInt);
	.uleb128	28
	.ascii	"SetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol NEWSIZE
	.uleb128	26
	.ascii	"NewSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetSize(<TStream>;const Int64);
	.uleb128	28
	.ascii	"SetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol NEWSIZE
	.uleb128	26
	.ascii	"NewSize\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef ReadNotImplemented(<TStream>);
	.uleb128	32
	.ascii	"ReadNotImplemented\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef WriteNotImplemented(<TStream>);
	.uleb128	32
	.ascii	"WriteNotImplemented\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef Read(<TStream>;var <Formal type>;LongInt):LongInt;
	.uleb128	29
	.ascii	"Read\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Write(<TStream>;const <Formal type>;LongInt):LongInt;
	.uleb128	29
	.ascii	"Write\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Seek(<TStream>;LongInt;Word):LongInt;
	.uleb128	29
	.ascii	"Seek\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol OFFSET
	.uleb128	26
	.ascii	"Offset\000"
	.long	.La66-.Ldebug_info0
# Symbol ORIGIN
	.uleb128	26
	.ascii	"Origin\000"
	.long	.La107-.Ldebug_info0
	.byte	0
# Procdef Seek(<TStream>;const Int64;TSeekOrigin):Int64;
	.uleb128	29
	.ascii	"Seek\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol OFFSET
	.uleb128	26
	.ascii	"Offset\000"
	.long	.La78-.Ldebug_info0
# Symbol ORIGIN
	.uleb128	26
	.ascii	"Origin\000"
	.long	.La139-.Ldebug_info0
	.byte	0
# Procdef ReadBuffer(<TStream>;var <Formal type>;LongInt);
	.uleb128	34
	.ascii	"ReadBuffer\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef WriteBuffer(<TStream>;const <Formal type>;LongInt);
	.uleb128	34
	.ascii	"WriteBuffer\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef CopyFrom(<TStream>;TStream;Int64):Int64;
	.uleb128	24
	.ascii	"CopyFrom\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La132-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef ReadComponent(<TStream>;TComponent):TComponent;
	.uleb128	24
	.ascii	"ReadComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ReadComponentRes(<TStream>;TComponent):TComponent;
	.uleb128	24
	.ascii	"ReadComponentRes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteComponent(<TStream>;TComponent);
	.uleb128	34
	.ascii	"WriteComponent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteComponentRes(<TStream>;const AnsiString;TComponent);
	.uleb128	34
	.ascii	"WriteComponentRes\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol RESNAME
	.uleb128	26
	.ascii	"ResName\000"
	.long	.La49-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteDescendent(<TStream>;TComponent;TComponent);
	.uleb128	34
	.ascii	"WriteDescendent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
# Symbol ANCESTOR
	.uleb128	26
	.ascii	"Ancestor\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteDescendentRes(<TStream>;const AnsiString;TComponent;TComponent);
	.uleb128	34
	.ascii	"WriteDescendentRes\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol RESNAME
	.uleb128	26
	.ascii	"ResName\000"
	.long	.La49-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
# Symbol ANCESTOR
	.uleb128	26
	.ascii	"Ancestor\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteResourceHeader(<TStream>;const AnsiString;var LongInt);
	.uleb128	34
	.ascii	"WriteResourceHeader\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol RESNAME
	.uleb128	26
	.ascii	"ResName\000"
	.long	.La49-.Ldebug_info0
# Symbol FIXUPINFO
	.uleb128	26
	.ascii	"FixupInfo\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef FixupResourceHeader(<TStream>;LongInt);
	.uleb128	34
	.ascii	"FixupResourceHeader\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol FIXUPINFO
	.uleb128	26
	.ascii	"FixupInfo\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ReadResHeader(<TStream>);
	.uleb128	34
	.ascii	"ReadResHeader\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef ReadByte(<TStream>):Byte;
	.uleb128	24
	.ascii	"ReadByte\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La117-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef ReadWord(<TStream>):Word;
	.uleb128	24
	.ascii	"ReadWord\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La107-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef ReadDWord(<TStream>):DWord;
	.uleb128	24
	.ascii	"ReadDWord\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La127-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef ReadQWord(<TStream>):QWord;
	.uleb128	24
	.ascii	"ReadQWord\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef ReadAnsiString(<TStream>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"ReadAnsiString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef WriteByte(<TStream>;Byte);
	.uleb128	34
	.ascii	"WriteByte\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol B
	.uleb128	26
	.ascii	"b\000"
	.long	.La117-.Ldebug_info0
	.byte	0
# Procdef WriteWord(<TStream>;Word);
	.uleb128	34
	.ascii	"WriteWord\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol W
	.uleb128	26
	.ascii	"w\000"
	.long	.La107-.Ldebug_info0
	.byte	0
# Procdef WriteDWord(<TStream>;LongWord);
	.uleb128	34
	.ascii	"WriteDWord\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol D
	.uleb128	26
	.ascii	"d\000"
	.long	.La127-.Ldebug_info0
	.byte	0
# Procdef WriteQWord(<TStream>;QWord);
	.uleb128	34
	.ascii	"WriteQWord\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol Q
	.uleb128	26
	.ascii	"q\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef WriteAnsiString(<TStream>;const AnsiString);
	.uleb128	27
	.ascii	"WriteAnsiString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La132-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
	.byte	0
.La133:
	.uleb128	9
	.long	.La132-.Ldebug_info0
# Definition TComponent
.La146:
	.uleb128	11
	.ascii	"TComponent\000"
	.long	.La149-.Ldebug_info0
.La149:
	.uleb128	20
	.long	.La148-.Ldebug_info0
.La148:
	.uleb128	21
	.ascii	"TComponent\000"
	.uleb128	96
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La152-.Ldebug_info0
	.uleb128	23
	.ascii	"FOwner\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FName\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"FTag\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La78-.Ldebug_info0
	.uleb128	23
	.ascii	"FComponents\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"FFreeNotifies\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"FDesignInfo\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FVCLComObject\000"
	.byte	2
	.byte	35
	.uleb128	72
	.byte	3
	.long	.La156-.Ldebug_info0
	.uleb128	23
	.ascii	"FComponentState\000"
	.byte	2
	.byte	35
	.uleb128	80
	.byte	3
	.long	.La158-.Ldebug_info0
	.uleb128	23
	.ascii	"FComponentStyle\000"
	.byte	2
	.byte	35
	.uleb128	84
	.byte	2
	.long	.La160-.Ldebug_info0
	.uleb128	23
	.ascii	"ComponentState\000"
	.byte	2
	.byte	35
	.uleb128	80
	.byte	3
	.long	.La158-.Ldebug_info0
	.uleb128	23
	.ascii	"ComponentStyle\000"
	.byte	2
	.byte	35
	.uleb128	84
	.byte	2
	.long	.La160-.Ldebug_info0
	.uleb128	23
	.ascii	"DesignInfo\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"Owner\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"VCLComObject\000"
	.byte	2
	.byte	35
	.uleb128	72
	.byte	3
	.long	.La156-.Ldebug_info0
	.uleb128	23
	.ascii	"Name\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"Tag\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La78-.Ldebug_info0
# Procdef GetComObject(<TComponent>;<var IUnknown>):IUnknown;
	.uleb128	36
	.ascii	"GetComObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La162-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La162-.Ldebug_info0
	.byte	0
# Procdef GetComponent(<TComponent>;LongInt):TComponent;
	.uleb128	36
	.ascii	"GetComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetComponentCount(<TComponent>):LongInt;
	.uleb128	36
	.ascii	"GetComponentCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetComponentIndex(<TComponent>):LongInt;
	.uleb128	36
	.ascii	"GetComponentIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Insert(<TComponent>;TComponent);
	.uleb128	32
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ReadLeft(<TComponent>;TReader);
	.uleb128	32
	.ascii	"ReadLeft\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol READER
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadTop(<TComponent>;TReader);
	.uleb128	32
	.ascii	"ReadTop\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol READER
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef Remove(<TComponent>;TComponent);
	.uleb128	32
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef RemoveNotification(<TComponent>;TComponent);
	.uleb128	32
	.ascii	"RemoveNotification\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef SetComponentIndex(<TComponent>;LongInt);
	.uleb128	32
	.ascii	"SetComponentIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetReference(<TComponent>;Boolean);
	.uleb128	32
	.ascii	"SetReference\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ENABLE
	.uleb128	26
	.ascii	"Enable\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef WriteLeft(<TComponent>;TWriter);
	.uleb128	32
	.ascii	"WriteLeft\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol WRITER
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef WriteTop(<TComponent>;TWriter);
	.uleb128	32
	.ascii	"WriteTop\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol WRITER
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef ChangeName(<TComponent>;const AnsiString);
	.uleb128	32
	.ascii	"ChangeName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol NEWNAME
	.uleb128	26
	.ascii	"NewName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef DefineProperties(<TComponent>;TFiler);
	.uleb128	28
	.ascii	"DefineProperties\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol FILER
	.uleb128	26
	.ascii	"Filer\000"
	.long	.La171-.Ldebug_info0
	.byte	0
# Procdef GetChildren(<TComponent>;TGetChildProc;TComponent);
	.uleb128	28
	.ascii	"GetChildren\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol PROC
	.uleb128	26
	.ascii	"Proc\000"
	.long	.La174-.Ldebug_info0
# Symbol ROOT
	.uleb128	26
	.ascii	"Root\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetChildOwner(<TComponent>):TComponent;
	.uleb128	33
	.ascii	"GetChildOwner\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetChildParent(<TComponent>):TComponent;
	.uleb128	33
	.ascii	"GetChildParent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetOwner(<TComponent>):TPersistent;
	.uleb128	33
	.ascii	"GetOwner\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La150-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Loaded(<TComponent>);
	.uleb128	28
	.ascii	"Loaded\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Loading(<TComponent>);
	.uleb128	28
	.ascii	"Loading\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Notification(<TComponent>;TComponent;TOperation);
	.uleb128	28
	.ascii	"Notification\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
# Symbol OPERATION
	.uleb128	26
	.ascii	"Operation\000"
	.long	.La176-.Ldebug_info0
	.byte	0
# Procdef PaletteCreated(<TComponent>);
	.uleb128	28
	.ascii	"PaletteCreated\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ReadState(<TComponent>;TReader);
	.uleb128	28
	.ascii	"ReadState\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol READER
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef SetAncestor(<TComponent>;Boolean);
	.uleb128	32
	.ascii	"SetAncestor\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetDesigning(<TComponent>;Boolean;Boolean=`TRUE`);
	.uleb128	32
	.ascii	"SetDesigning\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
# Symbol SETCHILDREN
	.uleb128	26
	.ascii	"SetChildren\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetDesignInstance(<TComponent>;Boolean);
	.uleb128	32
	.ascii	"SetDesignInstance\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetInline(<TComponent>;Boolean);
	.uleb128	32
	.ascii	"SetInline\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetName(<TComponent>;const AnsiString);
	.uleb128	28
	.ascii	"SetName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol NEWNAME
	.uleb128	26
	.ascii	"NewName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetChildOrder(<TComponent>;TComponent;LongInt);
	.uleb128	28
	.ascii	"SetChildOrder\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol CHILD
	.uleb128	26
	.ascii	"Child\000"
	.long	.La146-.Ldebug_info0
# Symbol ORDER
	.uleb128	26
	.ascii	"Order\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetParentComponent(<TComponent>;TComponent);
	.uleb128	28
	.ascii	"SetParentComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Updating(<TComponent>);
	.uleb128	28
	.ascii	"Updating\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Updated(<TComponent>);
	.uleb128	28
	.ascii	"Updated\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef class UpdateRegistry(<Class Of TComponent>;Boolean;const AnsiString;const AnsiString);
	.uleb128	28
	.ascii	"UpdateRegistry\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.byte	2
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La178-.Ldebug_info0
# Symbol REGISTER
	.uleb128	26
	.ascii	"Register\000"
	.long	.La109-.Ldebug_info0
# Symbol CLASSID
	.uleb128	26
	.ascii	"ClassID\000"
	.long	.La49-.Ldebug_info0
# Symbol PROGID
	.uleb128	26
	.ascii	"ProgID\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef ValidateRename(<TComponent>;TComponent;const AnsiString;const AnsiString);
	.uleb128	28
	.ascii	"ValidateRename\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
# Symbol CURNAME
	.uleb128	26
	.ascii	"CurName\000"
	.long	.La49-.Ldebug_info0
# Symbol NEWNAME
	.uleb128	26
	.ascii	"NewName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef ValidateContainer(<TComponent>;TComponent);
	.uleb128	28
	.ascii	"ValidateContainer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ValidateInsert(<TComponent>;TComponent);
	.uleb128	28
	.ascii	"ValidateInsert\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef QueryInterface(<TComponent>;constref TGuid;out <Formal type>):LongInt; StdCall;
	.uleb128	37
	.ascii	"QueryInterface\000"
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
	.byte	2
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol IID
	.uleb128	26
	.ascii	"IID\000"
	.long	.La182-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"Obj\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef _AddRef(<TComponent>):LongInt; StdCall;
	.uleb128	38
	.ascii	"_AddRef\000"
	.byte	1
	.byte	1
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef _Release(<TComponent>):LongInt; StdCall;
	.uleb128	38
	.ascii	"_Release\000"
	.byte	1
	.byte	1
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef iicrGetComponent(<TComponent>):TComponent;
	.uleb128	36
	.ascii	"iicrGetComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetTypeInfoCount(<TComponent>;out LongInt):LongInt; StdCall;
	.uleb128	38
	.ascii	"GetTypeInfoCount\000"
	.byte	1
	.byte	1
	.byte	2
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetTypeInfo(<TComponent>;LongInt;LongInt;out <Formal type>):LongInt; StdCall;
	.uleb128	38
	.ascii	"GetTypeInfo\000"
	.byte	1
	.byte	1
	.byte	2
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol LOCALEID
	.uleb128	26
	.ascii	"LocaleID\000"
	.long	.La66-.Ldebug_info0
# Symbol TYPEINFO
	.uleb128	26
	.ascii	"TypeInfo\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef GetIDsOfNames(<TComponent>;const TGuid;Pointer;LongInt;LongInt;Pointer):LongInt; StdCall;
	.uleb128	38
	.ascii	"GetIDsOfNames\000"
	.byte	1
	.byte	1
	.byte	2
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol IID
	.uleb128	26
	.ascii	"IID\000"
	.long	.La182-.Ldebug_info0
# Symbol NAMES
	.uleb128	26
	.ascii	"Names\000"
	.long	.La156-.Ldebug_info0
# Symbol NAMECOUNT
	.uleb128	26
	.ascii	"NameCount\000"
	.long	.La66-.Ldebug_info0
# Symbol LOCALEID
	.uleb128	26
	.ascii	"LocaleID\000"
	.long	.La66-.Ldebug_info0
# Symbol DISPIDS
	.uleb128	26
	.ascii	"DispIDs\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Invoke(<TComponent>;LongInt;const TGuid;LongInt;Word;var <Formal type>;Pointer;Pointer;Pointer):LongInt; StdCall;
	.uleb128	38
	.ascii	"Invoke\000"
	.byte	1
	.byte	1
	.byte	2
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol DISPID
	.uleb128	26
	.ascii	"DispID\000"
	.long	.La66-.Ldebug_info0
# Symbol IID
	.uleb128	26
	.ascii	"IID\000"
	.long	.La182-.Ldebug_info0
# Symbol LOCALEID
	.uleb128	26
	.ascii	"LocaleID\000"
	.long	.La66-.Ldebug_info0
# Symbol FLAGS
	.uleb128	26
	.ascii	"Flags\000"
	.long	.La107-.Ldebug_info0
# Symbol PARAMS
	.uleb128	26
	.ascii	"Params\000"
	.long	.La137-.Ldebug_info0
# Symbol VARRESULT
	.uleb128	26
	.ascii	"VarResult\000"
	.long	.La156-.Ldebug_info0
# Symbol EXCEPINFO
	.uleb128	26
	.ascii	"ExcepInfo\000"
	.long	.La156-.Ldebug_info0
# Symbol ARGERR
	.uleb128	26
	.ascii	"ArgErr\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef WriteState(<TComponent>;TWriter);
	.uleb128	27
	.ascii	"WriteState\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol WRITER
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TComponent>;<Class Of TComponent>;TComponent);
	.uleb128	29
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	392
	.byte	34
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La184-.Ldebug_info0
# Symbol AOWNER
	.uleb128	26
	.ascii	"AOwner\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TComponent>;<Class Of TComponent>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La186-.Ldebug_info0
	.byte	0
# Procdef BeforeDestruction(<TComponent>);
	.uleb128	27
	.ascii	"BeforeDestruction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	144
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef DestroyComponents(<TComponent>);
	.uleb128	34
	.ascii	"DestroyComponents\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Destroying(<TComponent>);
	.uleb128	34
	.ascii	"Destroying\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ExecuteAction(<TComponent>;TBasicAction):Boolean;
	.uleb128	29
	.ascii	"ExecuteAction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACTION
	.uleb128	26
	.ascii	"Action\000"
	.long	.La188-.Ldebug_info0
	.byte	0
# Procdef FindComponent(<TComponent>;const AnsiString):TComponent;
	.uleb128	24
	.ascii	"FindComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef FreeNotification(<TComponent>;TComponent);
	.uleb128	34
	.ascii	"FreeNotification\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef RemoveFreeNotification(<TComponent>;TComponent);
	.uleb128	34
	.ascii	"RemoveFreeNotification\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef FreeOnRelease(<TComponent>);
	.uleb128	34
	.ascii	"FreeOnRelease\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TComponent>):TComponentEnumerator;
	.uleb128	24
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La191-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetNamePath(<TComponent>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"GetNamePath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetParentComponent(<TComponent>):TComponent;
	.uleb128	29
	.ascii	"GetParentComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	408
	.byte	34
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef HasParent(<TComponent>):Boolean;
	.uleb128	29
	.ascii	"HasParent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef InsertComponent(<TComponent>;TComponent);
	.uleb128	34
	.ascii	"InsertComponent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef RemoveComponent(<TComponent>;TComponent);
	.uleb128	34
	.ascii	"RemoveComponent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef SafeCallException(<TComponent>;TObject;Pointer):LongInt;
	.uleb128	29
	.ascii	"SafeCallException\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	120
	.byte	34
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol EXCEPTOBJECT
	.uleb128	26
	.ascii	"ExceptObject\000"
	.long	.La143-.Ldebug_info0
# Symbol EXCEPTADDR
	.uleb128	26
	.ascii	"ExceptAddr\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef SetSubComponent(<TComponent>;Boolean);
	.uleb128	34
	.ascii	"SetSubComponent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ASUBCOMPONENT
	.uleb128	26
	.ascii	"ASubComponent\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef UpdateAction(<TComponent>;TBasicAction):Boolean;
	.uleb128	29
	.ascii	"UpdateAction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	424
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol ACTION
	.uleb128	26
	.ascii	"Action\000"
	.long	.La188-.Ldebug_info0
	.byte	0
# Procdef IsImplementorOf(<TComponent>;const IUnknown):Boolean;
	.uleb128	24
	.ascii	"IsImplementorOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol INTF
	.uleb128	26
	.ascii	"Intf\000"
	.long	.La162-.Ldebug_info0
	.byte	0
# Procdef ReferenceInterface(<TComponent>;const IUnknown;TOperation);
	.uleb128	34
	.ascii	"ReferenceInterface\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol INTF
	.uleb128	26
	.ascii	"intf\000"
	.long	.La162-.Ldebug_info0
# Symbol OP
	.uleb128	26
	.ascii	"op\000"
	.long	.La176-.Ldebug_info0
	.byte	0
	.byte	0
.La147:
	.uleb128	9
	.long	.La146-.Ldebug_info0
# Definition TFPList
.La153:
	.uleb128	11
	.ascii	"TFPList\000"
	.long	.La194-.Ldebug_info0
.La194:
	.uleb128	20
	.long	.La155-.Ldebug_info0
.La155:
	.uleb128	21
	.ascii	"TFPList\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FList\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La195-.Ldebug_info0
	.uleb128	23
	.ascii	"FCount\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FCapacity\000"
	.byte	2
	.byte	35
	.uleb128	20
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"Capacity\000"
	.byte	2
	.byte	35
	.uleb128	20
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"Count\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"List\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La195-.Ldebug_info0
# Procdef CopyMove(<TFPList>;TFPList);
	.uleb128	32
	.ascii	"CopyMove\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"aList\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef MergeMove(<TFPList>;TFPList);
	.uleb128	32
	.ascii	"MergeMove\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"aList\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef DoCopy(<TFPList>;TFPList;TFPList);
	.uleb128	32
	.ascii	"DoCopy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef DoSrcUnique(<TFPList>;TFPList;TFPList);
	.uleb128	32
	.ascii	"DoSrcUnique\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef DoAnd(<TFPList>;TFPList;TFPList);
	.uleb128	32
	.ascii	"DoAnd\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef DoDestUnique(<TFPList>;TFPList;TFPList);
	.uleb128	32
	.ascii	"DoDestUnique\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef DoOr(<TFPList>;TFPList;TFPList);
	.uleb128	32
	.ascii	"DoOr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef DoXOr(<TFPList>;TFPList;TFPList);
	.uleb128	32
	.ascii	"DoXOr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Get(<TFPList>;LongInt):^untyped;
	.uleb128	36
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Put(<TFPList>;LongInt;Pointer);
	.uleb128	32
	.ascii	"Put\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef SetCapacity(<TFPList>;LongInt);
	.uleb128	32
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetCount(<TFPList>;LongInt);
	.uleb128	32
	.ascii	"SetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol NEWCOUNT
	.uleb128	26
	.ascii	"NewCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef RaiseIndexError(<TFPList>;LongInt);
	.uleb128	32
	.ascii	"RaiseIndexError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef CheckIndex(<TFPList>;LongInt);
	.uleb128	32
	.ascii	"CheckIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TFPList>;<Class Of TFPList>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La197-.Ldebug_info0
	.byte	0
# Procdef AddList(<TFPList>;TFPList);
	.uleb128	34
	.ascii	"AddList\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"AList\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Add(<TFPList>;Pointer):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Clear(<TFPList>);
	.uleb128	34
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Delete(<TFPList>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef class Error(<Class Of TFPList>;const AnsiString;Int64);
	.uleb128	34
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La199-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Exchange(<TFPList>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Exchange\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Expand(<TFPList>):TFPList;
	.uleb128	24
	.ascii	"Expand\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Extract(<TFPList>;Pointer):^untyped;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef First(<TFPList>):^untyped;
	.uleb128	24
	.ascii	"First\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TFPList>):TFPListEnumerator;
	.uleb128	24
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La201-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TFPList>;Pointer):LongInt;
	.uleb128	24
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef IndexOfItem(<TFPList>;Pointer;TDirection):LongInt;
	.uleb128	24
	.ascii	"IndexOfItem\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
# Symbol DIRECTION
	.uleb128	26
	.ascii	"Direction\000"
	.long	.La204-.Ldebug_info0
	.byte	0
# Procdef Insert(<TFPList>;LongInt;Pointer);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Last(<TFPList>):^untyped;
	.uleb128	24
	.ascii	"Last\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Move(<TFPList>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Move\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol CURINDEX
	.uleb128	26
	.ascii	"CurIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol NEWINDEX
	.uleb128	26
	.ascii	"NewIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Assign(<TFPList>;TFPList;TListAssignOp=`0`;TFPList=`nil`);
	.uleb128	34
	.ascii	"Assign\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol LISTA
	.uleb128	26
	.ascii	"ListA\000"
	.long	.La153-.Ldebug_info0
# Symbol AOPERATOR
	.uleb128	26
	.ascii	"AOperator\000"
	.long	.La206-.Ldebug_info0
# Symbol LISTB
	.uleb128	26
	.ascii	"ListB\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Remove(<TFPList>;Pointer):LongInt;
	.uleb128	24
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Pack(<TFPList>);
	.uleb128	34
	.ascii	"Pack\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef Sort(<TFPList>;TListSortCompare);
	.uleb128	34
	.ascii	"Sort\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol COMPARE
	.uleb128	26
	.ascii	"Compare\000"
	.long	.La208-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPList>;TListCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La210-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPList>;TListStaticCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La153-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La212-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
	.byte	0
.La154:
	.uleb128	9
	.long	.La153-.Ldebug_info0
# Definition TFPListEnumerator
.La201:
	.uleb128	11
	.ascii	"TFPListEnumerator\000"
	.long	.La214-.Ldebug_info0
.La214:
	.uleb128	20
	.long	.La203-.Ldebug_info0
.La203:
	.uleb128	21
	.ascii	"TFPListEnumerator\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FList\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"FPosition\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
# Procdef constructor Create(<TFPListEnumerator>;<Class Of TFPListEnumerator>;TFPList);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La201-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La201-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La215-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"AList\000"
	.long	.La153-.Ldebug_info0
	.byte	0
# Procdef GetCurrent(<TFPListEnumerator>):^untyped;
	.uleb128	24
	.ascii	"GetCurrent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La201-.Ldebug_info0
	.byte	0
# Procdef MoveNext(<TFPListEnumerator>):Boolean;
	.uleb128	24
	.ascii	"MoveNext\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La201-.Ldebug_info0
	.byte	0
	.byte	0
.La202:
	.uleb128	9
	.long	.La201-.Ldebug_info0
# Definition TDirection
.La204:
	.uleb128	11
	.ascii	"TDirection\000"
	.long	.La217-.Ldebug_info0
.La217:
	.uleb128	30
	.ascii	"TDirection\000"
	.byte	4
	.uleb128	31
	.ascii	"FromBeginning\000"
	.long	0
	.uleb128	31
	.ascii	"FromEnd\000"
	.long	1
	.byte	0
.La205:
	.uleb128	9
	.long	.La204-.Ldebug_info0
# Definition TPersistent
.La150:
	.uleb128	11
	.ascii	"TPersistent\000"
	.long	.La218-.Ldebug_info0
.La218:
	.uleb128	20
	.long	.La152-.Ldebug_info0
.La152:
	.uleb128	21
	.ascii	"TPersistent\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FObservers\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La153-.Ldebug_info0
# Procdef AssignError(<TPersistent>;TPersistent);
	.uleb128	32
	.ascii	"AssignError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef AssignTo(<TPersistent>;TPersistent);
	.uleb128	28
	.ascii	"AssignTo\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol DEST
	.uleb128	26
	.ascii	"Dest\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef DefineProperties(<TPersistent>;TFiler);
	.uleb128	28
	.ascii	"DefineProperties\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol FILER
	.uleb128	26
	.ascii	"Filer\000"
	.long	.La171-.Ldebug_info0
	.byte	0
# Procdef GetOwner(<TPersistent>):TPersistent;
	.uleb128	33
	.ascii	"GetOwner\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La150-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TPersistent>;<Class Of TPersistent>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La219-.Ldebug_info0
	.byte	0
# Procdef Assign(<TPersistent>;TPersistent);
	.uleb128	27
	.ascii	"Assign\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef FPOAttachObserver(<TPersistent>;TObject);
	.uleb128	34
	.ascii	"FPOAttachObserver\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol AOBSERVER
	.uleb128	26
	.ascii	"AObserver\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef FPODetachObserver(<TPersistent>;TObject);
	.uleb128	34
	.ascii	"FPODetachObserver\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol AOBSERVER
	.uleb128	26
	.ascii	"AObserver\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef FPONotifyObservers(<TPersistent>;TObject;TFPObservedOperation;Pointer);
	.uleb128	34
	.ascii	"FPONotifyObservers\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol ASENDER
	.uleb128	26
	.ascii	"ASender\000"
	.long	.La143-.Ldebug_info0
# Symbol AOPERATION
	.uleb128	26
	.ascii	"AOperation\000"
	.long	.La221-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef GetNamePath(<TPersistent>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"GetNamePath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
	.byte	0
.La151:
	.uleb128	9
	.long	.La150-.Ldebug_info0
# Definition TOperation
.La176:
	.uleb128	11
	.ascii	"TOperation\000"
	.long	.La223-.Ldebug_info0
.La223:
	.uleb128	30
	.ascii	"TOperation\000"
	.byte	4
	.uleb128	31
	.ascii	"opInsert\000"
	.long	0
	.uleb128	31
	.ascii	"opRemove\000"
	.long	1
	.byte	0
.La177:
	.uleb128	9
	.long	.La176-.Ldebug_info0
# Definition TComponentState
.La158:
	.uleb128	11
	.ascii	"TComponentState\000"
	.long	.La224-.Ldebug_info0
.La224:
	.uleb128	39
	.ascii	"TComponentState\000"
	.short	4
	.long	.La225-.Ldebug_info0
.La225:
	.uleb128	40
	.sleb128	0
	.sleb128	10
	.long	.La226-.Ldebug_info0
.La159:
	.uleb128	9
	.long	.La158-.Ldebug_info0
# Definition TComponentStyle
.La160:
	.uleb128	11
	.ascii	"TComponentStyle\000"
	.long	.La228-.Ldebug_info0
.La228:
	.uleb128	39
	.ascii	"TComponentStyle\000"
	.short	4
	.long	.La229-.Ldebug_info0
.La229:
	.uleb128	40
	.sleb128	0
	.sleb128	3
	.long	.La230-.Ldebug_info0
.La161:
	.uleb128	9
	.long	.La160-.Ldebug_info0
# Definition <procedure variable type of procedure(TComponent) of object;Register>
.La174:
	.uleb128	11
	.ascii	"TGetChildProc\000"
	.long	.La232-.Ldebug_info0
.La232:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La233-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La233:
	.uleb128	42
	.ascii	"TGetChildProc\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Child\000"
	.long	.La146-.Ldebug_info0
	.byte	0
.La175:
	.uleb128	9
	.long	.La174-.Ldebug_info0
# Definition TComponentEnumerator
.La191:
	.uleb128	11
	.ascii	"TComponentEnumerator\000"
	.long	.La234-.Ldebug_info0
.La234:
	.uleb128	20
	.long	.La193-.Ldebug_info0
.La193:
	.uleb128	21
	.ascii	"TComponentEnumerator\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FComponent\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FPosition\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
# Procdef constructor Create(<TComponentEnumerator>;<Class Of TComponentEnumerator>;TComponent);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La191-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La191-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La235-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef GetCurrent(<TComponentEnumerator>):TComponent;
	.uleb128	24
	.ascii	"GetCurrent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La191-.Ldebug_info0
	.byte	0
# Procdef MoveNext(<TComponentEnumerator>):Boolean;
	.uleb128	24
	.ascii	"MoveNext\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La191-.Ldebug_info0
	.byte	0
	.byte	0
.La192:
	.uleb128	9
	.long	.La191-.Ldebug_info0
# Definition TBasicAction
.La188:
	.uleb128	11
	.ascii	"TBasicAction\000"
	.long	.La237-.Ldebug_info0
.La237:
	.uleb128	20
	.long	.La190-.Ldebug_info0
.La190:
	.uleb128	21
	.ascii	"TBasicAction\000"
	.uleb128	160
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La148-.Ldebug_info0
	.uleb128	23
	.ascii	"FActionComponent\000"
	.byte	2
	.byte	35
	.uleb128	96
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnChange\000"
	.byte	2
	.byte	35
	.uleb128	104
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnExecute\000"
	.byte	2
	.byte	35
	.uleb128	120
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnUpdate\000"
	.byte	3
	.byte	35
	.uleb128	136
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"FClients\000"
	.byte	3
	.byte	35
	.uleb128	152
	.byte	2
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"OnChange\000"
	.byte	2
	.byte	35
	.uleb128	104
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"ActionComponent\000"
	.byte	2
	.byte	35
	.uleb128	96
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"OnExecute\000"
	.byte	2
	.byte	35
	.uleb128	120
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"OnUpdate\000"
	.byte	3
	.byte	35
	.uleb128	136
	.byte	3
	.long	.La238-.Ldebug_info0
# Procdef Change(<TBasicAction>);
	.uleb128	28
	.ascii	"Change\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	432
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
	.byte	0
# Procdef SetOnExecute(<TBasicAction>;TNotifyEvent);
	.uleb128	28
	.ascii	"SetOnExecute\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	440
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La238-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TBasicAction>;<Class Of TBasicAction>;TComponent);
	.uleb128	29
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	392
	.byte	34
	.long	.La188-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La240-.Ldebug_info0
# Symbol AOWNER
	.uleb128	26
	.ascii	"AOwner\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TBasicAction>;<Class Of TBasicAction>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La242-.Ldebug_info0
	.byte	0
# Procdef HandlesTarget(<TBasicAction>;TObject):Boolean;
	.uleb128	29
	.ascii	"HandlesTarget\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	448
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol TARGET
	.uleb128	26
	.ascii	"Target\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef UpdateTarget(<TBasicAction>;TObject);
	.uleb128	27
	.ascii	"UpdateTarget\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	456
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol TARGET
	.uleb128	26
	.ascii	"Target\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef ExecuteTarget(<TBasicAction>;TObject);
	.uleb128	27
	.ascii	"ExecuteTarget\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	464
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol TARGET
	.uleb128	26
	.ascii	"Target\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Execute(<TBasicAction>):Boolean;
	.uleb128	29
	.ascii	"Execute\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	472
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
	.byte	0
# Procdef RegisterChanges(<TBasicAction>;TBasicActionLink);
	.uleb128	34
	.ascii	"RegisterChanges\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La244-.Ldebug_info0
	.byte	0
# Procdef UnRegisterChanges(<TBasicAction>;TBasicActionLink);
	.uleb128	34
	.ascii	"UnRegisterChanges\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La244-.Ldebug_info0
	.byte	0
# Procdef Update(<TBasicAction>):Boolean;
	.uleb128	29
	.ascii	"Update\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	480
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La188-.Ldebug_info0
	.byte	0
	.byte	0
.La189:
	.uleb128	9
	.long	.La188-.Ldebug_info0
# Definition TBasicActionLink
.La244:
	.uleb128	11
	.ascii	"TBasicActionLink\000"
	.long	.La247-.Ldebug_info0
.La247:
	.uleb128	20
	.long	.La246-.Ldebug_info0
.La246:
	.uleb128	21
	.ascii	"TBasicActionLink\000"
	.uleb128	32
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnChange\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"FAction\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	2
	.long	.La188-.Ldebug_info0
	.uleb128	23
	.ascii	"Action\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	2
	.long	.La188-.Ldebug_info0
	.uleb128	23
	.ascii	"OnChange\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La238-.Ldebug_info0
# Procdef AssignClient(<TBasicActionLink>;TObject);
	.uleb128	28
	.ascii	"AssignClient\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
# Symbol ACLIENT
	.uleb128	26
	.ascii	"AClient\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Change(<TBasicActionLink>);
	.uleb128	28
	.ascii	"Change\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
	.byte	0
# Procdef IsOnExecuteLinked(<TBasicActionLink>):Boolean;
	.uleb128	33
	.ascii	"IsOnExecuteLinked\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
	.byte	0
# Procdef SetAction(<TBasicActionLink>;TBasicAction);
	.uleb128	28
	.ascii	"SetAction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La188-.Ldebug_info0
	.byte	0
# Procdef SetOnExecute(<TBasicActionLink>;TNotifyEvent);
	.uleb128	28
	.ascii	"SetOnExecute\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La238-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TBasicActionLink>;<Class Of TBasicActionLink>;TObject);
	.uleb128	29
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.long	.La244-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La248-.Ldebug_info0
# Symbol ACLIENT
	.uleb128	26
	.ascii	"AClient\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TBasicActionLink>;<Class Of TBasicActionLink>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La250-.Ldebug_info0
	.byte	0
# Procdef Execute(<TBasicActionLink>;TComponent=`nil`):Boolean;
	.uleb128	29
	.ascii	"Execute\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
# Symbol ACOMPONENT
	.uleb128	26
	.ascii	"AComponent\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef Update(<TBasicActionLink>):Boolean;
	.uleb128	29
	.ascii	"Update\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La244-.Ldebug_info0
	.byte	0
	.byte	0
.La245:
	.uleb128	9
	.long	.La244-.Ldebug_info0
# Definition <procedure variable type of procedure(TObject) of object;Register>
.La238:
	.uleb128	11
	.ascii	"TNotifyEvent\000"
	.long	.La252-.Ldebug_info0
.La252:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La253-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La253:
	.uleb128	42
	.ascii	"TNotifyEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Sender\000"
	.long	.La143-.Ldebug_info0
	.byte	0
.La239:
	.uleb128	9
	.long	.La238-.Ldebug_info0
# Definition TFPObservedOperation
.La221:
	.uleb128	11
	.ascii	"TFPObservedOperation\000"
	.long	.La254-.Ldebug_info0
.La254:
	.uleb128	30
	.ascii	"TFPObservedOperation\000"
	.byte	4
	.uleb128	31
	.ascii	"ooChange\000"
	.long	0
	.uleb128	31
	.ascii	"ooFree\000"
	.long	1
	.uleb128	31
	.ascii	"ooAddItem\000"
	.long	2
	.uleb128	31
	.ascii	"ooDeleteItem\000"
	.long	3
	.uleb128	31
	.ascii	"ooCustom\000"
	.long	4
	.byte	0
.La222:
	.uleb128	9
	.long	.La221-.Ldebug_info0
# Definition TFiler
.La171:
	.uleb128	11
	.ascii	"TFiler\000"
	.long	.La255-.Ldebug_info0
.La255:
	.uleb128	20
	.long	.La173-.Ldebug_info0
.La173:
	.uleb128	21
	.ascii	"TFiler\000"
	.uleb128	40
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FRoot\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FLookupRoot\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FAncestor\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La150-.Ldebug_info0
	.uleb128	23
	.ascii	"FIgnoreChildren\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"Root\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"LookupRoot\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"Ancestor\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La150-.Ldebug_info0
	.uleb128	23
	.ascii	"IgnoreChildren\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La109-.Ldebug_info0
# Procdef SetRoot(<TFiler>;TComponent);
	.uleb128	28
	.ascii	"SetRoot\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La171-.Ldebug_info0
# Symbol AROOT
	.uleb128	26
	.ascii	"ARoot\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef DefineProperty(<TFiler>;const AnsiString;TReaderProc;TWriterProc;Boolean);
	.uleb128	27
	.ascii	"DefineProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La171-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol READDATA
	.uleb128	26
	.ascii	"ReadData\000"
	.long	.La256-.Ldebug_info0
# Symbol WRITEDATA
	.uleb128	26
	.ascii	"WriteData\000"
	.long	.La258-.Ldebug_info0
# Symbol HASDATA
	.uleb128	26
	.ascii	"HasData\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef DefineBinaryProperty(<TFiler>;const AnsiString;TStreamProc;TStreamProc;Boolean);
	.uleb128	27
	.ascii	"DefineBinaryProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La171-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol READDATA
	.uleb128	26
	.ascii	"ReadData\000"
	.long	.La260-.Ldebug_info0
# Symbol WRITEDATA
	.uleb128	26
	.ascii	"WriteData\000"
	.long	.La260-.Ldebug_info0
# Symbol HASDATA
	.uleb128	26
	.ascii	"HasData\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef FlushBuffer(<TFiler>);
	.uleb128	27
	.ascii	"FlushBuffer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La171-.Ldebug_info0
	.byte	0
	.byte	0
.La172:
	.uleb128	9
	.long	.La171-.Ldebug_info0
# Definition TReader
.La165:
	.uleb128	11
	.ascii	"TReader\000"
	.long	.La262-.Ldebug_info0
.La262:
	.uleb128	20
	.long	.La167-.Ldebug_info0
.La167:
	.uleb128	21
	.ascii	"TReader\000"
	.uleb128	296
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La173-.Ldebug_info0
	.uleb128	23
	.ascii	"FDriver\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La263-.Ldebug_info0
	.uleb128	23
	.ascii	"FOwner\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FParent\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FFixups\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La143-.Ldebug_info0
	.uleb128	23
	.ascii	"FLoaded\000"
	.byte	2
	.byte	35
	.uleb128	72
	.byte	3
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"FLock\000"
	.byte	2
	.byte	35
	.uleb128	80
	.byte	3
	.long	.La266-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnFindMethod\000"
	.byte	2
	.byte	35
	.uleb128	120
	.byte	3
	.long	.La268-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnSetMethodProperty\000"
	.byte	3
	.byte	35
	.uleb128	136
	.byte	3
	.long	.La270-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnSetName\000"
	.byte	3
	.byte	35
	.uleb128	152
	.byte	3
	.long	.La272-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnReferenceName\000"
	.byte	3
	.byte	35
	.uleb128	168
	.byte	3
	.long	.La274-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnAncestorNotFound\000"
	.byte	3
	.byte	35
	.uleb128	184
	.byte	3
	.long	.La276-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnError\000"
	.byte	3
	.byte	35
	.uleb128	200
	.byte	3
	.long	.La278-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnPropertyNotFound\000"
	.byte	3
	.byte	35
	.uleb128	216
	.byte	3
	.long	.La280-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnFindComponentClass\000"
	.byte	3
	.byte	35
	.uleb128	232
	.byte	3
	.long	.La282-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnCreateComponent\000"
	.byte	3
	.byte	35
	.uleb128	248
	.byte	3
	.long	.La284-.Ldebug_info0
	.uleb128	23
	.ascii	"FPropName\000"
	.byte	3
	.byte	35
	.uleb128	264
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"FCanHandleExcepts\000"
	.byte	3
	.byte	35
	.uleb128	272
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnReadStringProperty\000"
	.byte	3
	.byte	35
	.uleb128	280
	.byte	3
	.long	.La286-.Ldebug_info0
	.uleb128	23
	.ascii	"PropName\000"
	.byte	3
	.byte	35
	.uleb128	264
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"CanHandleExceptions\000"
	.byte	3
	.byte	35
	.uleb128	272
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"Driver\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La263-.Ldebug_info0
	.uleb128	23
	.ascii	"Owner\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"Parent\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"OnError\000"
	.byte	3
	.byte	35
	.uleb128	200
	.byte	3
	.long	.La278-.Ldebug_info0
	.uleb128	23
	.ascii	"OnPropertyNotFound\000"
	.byte	3
	.byte	35
	.uleb128	216
	.byte	3
	.long	.La280-.Ldebug_info0
	.uleb128	23
	.ascii	"OnFindMethod\000"
	.byte	2
	.byte	35
	.uleb128	120
	.byte	3
	.long	.La268-.Ldebug_info0
	.uleb128	23
	.ascii	"OnSetMethodProperty\000"
	.byte	3
	.byte	35
	.uleb128	136
	.byte	3
	.long	.La270-.Ldebug_info0
	.uleb128	23
	.ascii	"OnSetName\000"
	.byte	3
	.byte	35
	.uleb128	152
	.byte	3
	.long	.La272-.Ldebug_info0
	.uleb128	23
	.ascii	"OnReferenceName\000"
	.byte	3
	.byte	35
	.uleb128	168
	.byte	3
	.long	.La274-.Ldebug_info0
	.uleb128	23
	.ascii	"OnAncestorNotFound\000"
	.byte	3
	.byte	35
	.uleb128	184
	.byte	3
	.long	.La276-.Ldebug_info0
	.uleb128	23
	.ascii	"OnCreateComponent\000"
	.byte	3
	.byte	35
	.uleb128	248
	.byte	3
	.long	.La284-.Ldebug_info0
	.uleb128	23
	.ascii	"OnFindComponentClass\000"
	.byte	3
	.byte	35
	.uleb128	232
	.byte	3
	.long	.La282-.Ldebug_info0
	.uleb128	23
	.ascii	"OnReadStringProperty\000"
	.byte	3
	.byte	35
	.uleb128	280
	.byte	3
	.long	.La286-.Ldebug_info0
# Procdef DoFixupReferences(<TReader>);
	.uleb128	32
	.ascii	"DoFixupReferences\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef FindComponentClass(<TReader>;const AnsiString):Class Of TComponent;
	.uleb128	36
	.ascii	"FindComponentClass\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La288-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol ACLASSNAME
	.uleb128	26
	.ascii	"AClassName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Lock(<TReader>);
	.uleb128	32
	.ascii	"Lock\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef Unlock(<TReader>);
	.uleb128	32
	.ascii	"Unlock\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef Error(<TReader>;const AnsiString):Boolean;
	.uleb128	33
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol MESSAGE
	.uleb128	26
	.ascii	"Message\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef FindMethod(<TReader>;TComponent;const AnsiString):^untyped;
	.uleb128	33
	.ascii	"FindMethod\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol AROOT
	.uleb128	26
	.ascii	"ARoot\000"
	.long	.La146-.Ldebug_info0
# Symbol AMETHODNAME
	.uleb128	26
	.ascii	"AMethodName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef ReadProperty(<TReader>;TPersistent);
	.uleb128	32
	.ascii	"ReadProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol AINSTANCE
	.uleb128	26
	.ascii	"AInstance\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef ReadPropValue(<TReader>;TPersistent;Pointer);
	.uleb128	32
	.ascii	"ReadPropValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
# Symbol PROPINFO
	.uleb128	26
	.ascii	"PropInfo\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef PropertyError(<TReader>);
	.uleb128	32
	.ascii	"PropertyError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadData(<TReader>;TComponent);
	.uleb128	32
	.ascii	"ReadData\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef CreateDriver(<TReader>;TStream;LongInt):TAbstractObjectReader;
	.uleb128	33
	.ascii	"CreateDriver\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La263-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol BUFSIZE
	.uleb128	26
	.ascii	"BufSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TReader>;<Class Of TReader>;TStream;LongInt);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La290-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol BUFSIZE
	.uleb128	26
	.ascii	"BufSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TReader>;<Class Of TReader>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La292-.Ldebug_info0
	.byte	0
# Procdef FlushBuffer(<TReader>);
	.uleb128	27
	.ascii	"FlushBuffer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef BeginReferences(<TReader>);
	.uleb128	34
	.ascii	"BeginReferences\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef CheckValue(<TReader>;TValueType);
	.uleb128	34
	.ascii	"CheckValue\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La294-.Ldebug_info0
	.byte	0
# Procdef DefineProperty(<TReader>;const AnsiString;TReaderProc;TWriterProc;Boolean);
	.uleb128	27
	.ascii	"DefineProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol AREADDATA
	.uleb128	26
	.ascii	"AReadData\000"
	.long	.La256-.Ldebug_info0
# Symbol WRITEDATA
	.uleb128	26
	.ascii	"WriteData\000"
	.long	.La258-.Ldebug_info0
# Symbol HASDATA
	.uleb128	26
	.ascii	"HasData\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef DefineBinaryProperty(<TReader>;const AnsiString;TStreamProc;TStreamProc;Boolean);
	.uleb128	27
	.ascii	"DefineBinaryProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol AREADDATA
	.uleb128	26
	.ascii	"AReadData\000"
	.long	.La260-.Ldebug_info0
# Symbol WRITEDATA
	.uleb128	26
	.ascii	"WriteData\000"
	.long	.La260-.Ldebug_info0
# Symbol HASDATA
	.uleb128	26
	.ascii	"HasData\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef EndOfList(<TReader>):Boolean;
	.uleb128	24
	.ascii	"EndOfList\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef EndReferences(<TReader>);
	.uleb128	34
	.ascii	"EndReferences\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef FixupReferences(<TReader>);
	.uleb128	34
	.ascii	"FixupReferences\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef NextValue(<TReader>):<enumeration type>;
	.uleb128	24
	.ascii	"NextValue\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La294-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef Read(<TReader>;var <Formal type>;LongInt);
	.uleb128	27
	.ascii	"Read\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol BUF
	.uleb128	26
	.ascii	"Buf\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ReadBoolean(<TReader>):Boolean;
	.uleb128	24
	.ascii	"ReadBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadChar(<TReader>):Char;
	.uleb128	24
	.ascii	"ReadChar\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La86-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadWideChar(<TReader>):WideChar;
	.uleb128	24
	.ascii	"ReadWideChar\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La296-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadUnicodeChar(<TReader>):WideChar;
	.uleb128	24
	.ascii	"ReadUnicodeChar\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La296-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadCollection(<TReader>;TCollection);
	.uleb128	34
	.ascii	"ReadCollection\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol COLLECTION
	.uleb128	26
	.ascii	"Collection\000"
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef ReadComponent(<TReader>;TComponent):TComponent;
	.uleb128	24
	.ascii	"ReadComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ReadComponents(<TReader>;TComponent;TComponent;TReadComponentsProc);
	.uleb128	34
	.ascii	"ReadComponents\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol AOWNER
	.uleb128	26
	.ascii	"AOwner\000"
	.long	.La146-.Ldebug_info0
# Symbol APARENT
	.uleb128	26
	.ascii	"AParent\000"
	.long	.La146-.Ldebug_info0
# Symbol PROC
	.uleb128	26
	.ascii	"Proc\000"
	.long	.La301-.Ldebug_info0
	.byte	0
# Procdef ReadFloat(<TReader>):Double;
	.uleb128	24
	.ascii	"ReadFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadSingle(<TReader>):Single;
	.uleb128	24
	.ascii	"ReadSingle\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La303-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadDate(<TReader>):Double;
	.uleb128	24
	.ascii	"ReadDate\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La305-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadCurrency(<TReader>):Currency;
	.uleb128	24
	.ascii	"ReadCurrency\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La307-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadIdent(<TReader>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"ReadIdent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef ReadInteger(<TReader>):LongInt;
	.uleb128	24
	.ascii	"ReadInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadInt64(<TReader>):Int64;
	.uleb128	24
	.ascii	"ReadInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadSet(<TReader>;Pointer):LongInt;
	.uleb128	24
	.ascii	"ReadSet\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol ENUMTYPE
	.uleb128	26
	.ascii	"EnumType\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef ReadListBegin(<TReader>);
	.uleb128	34
	.ascii	"ReadListBegin\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadListEnd(<TReader>);
	.uleb128	34
	.ascii	"ReadListEnd\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadRootComponent(<TReader>;TComponent):TComponent;
	.uleb128	24
	.ascii	"ReadRootComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La146-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol AROOT
	.uleb128	26
	.ascii	"ARoot\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef ReadVariant(<TReader>;<var Variant>):Variant;
	.uleb128	24
	.ascii	"ReadVariant\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef ReadSignature(<TReader>);
	.uleb128	34
	.ascii	"ReadSignature\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef ReadString(<TReader>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"ReadString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef ReadWideString(<TReader>;<var WideString>):WideString;
	.uleb128	24
	.ascii	"ReadWideString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La311-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La311-.Ldebug_info0
	.byte	0
# Procdef ReadUnicodeString(<TReader>;<var UnicodeString>):UnicodeString;
	.uleb128	24
	.ascii	"ReadUnicodeString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef ReadValue(<TReader>):<enumeration type>;
	.uleb128	24
	.ascii	"ReadValue\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La294-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef CopyValue(<TReader>;TWriter);
	.uleb128	34
	.ascii	"CopyValue\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La165-.Ldebug_info0
# Symbol WRITER
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.byte	0
	.byte	0
.La166:
	.uleb128	9
	.long	.La165-.Ldebug_info0
# Definition TWriter
.La168:
	.uleb128	11
	.ascii	"TWriter\000"
	.long	.La315-.Ldebug_info0
.La315:
	.uleb128	20
	.long	.La170-.Ldebug_info0
.La170:
	.uleb128	21
	.ascii	"TWriter\000"
	.uleb128	136
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La173-.Ldebug_info0
	.uleb128	23
	.ascii	"FDriver\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La316-.Ldebug_info0
	.uleb128	23
	.ascii	"FDestroyDriver\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FRootAncestor\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"FPropPath\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"FAncestors\000"
	.byte	2
	.byte	35
	.uleb128	72
	.byte	3
	.long	.La319-.Ldebug_info0
	.uleb128	23
	.ascii	"FAncestorPos\000"
	.byte	2
	.byte	35
	.uleb128	80
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FCurrentPos\000"
	.byte	2
	.byte	35
	.uleb128	84
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnFindAncestor\000"
	.byte	2
	.byte	35
	.uleb128	88
	.byte	3
	.long	.La322-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnWriteMethodProperty\000"
	.byte	2
	.byte	35
	.uleb128	104
	.byte	3
	.long	.La324-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnWriteStringProperty\000"
	.byte	2
	.byte	35
	.uleb128	120
	.byte	3
	.long	.La286-.Ldebug_info0
	.uleb128	23
	.ascii	"RootAncestor\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La146-.Ldebug_info0
	.uleb128	23
	.ascii	"OnFindAncestor\000"
	.byte	2
	.byte	35
	.uleb128	88
	.byte	3
	.long	.La322-.Ldebug_info0
	.uleb128	23
	.ascii	"OnWriteMethodProperty\000"
	.byte	2
	.byte	35
	.uleb128	104
	.byte	3
	.long	.La324-.Ldebug_info0
	.uleb128	23
	.ascii	"OnWriteStringProperty\000"
	.byte	2
	.byte	35
	.uleb128	120
	.byte	3
	.long	.La286-.Ldebug_info0
	.uleb128	23
	.ascii	"Driver\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La316-.Ldebug_info0
	.uleb128	23
	.ascii	"PropertyPath\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La49-.Ldebug_info0
# Procdef AddToAncestorList(<TWriter>;TComponent);
	.uleb128	32
	.ascii	"AddToAncestorList\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteComponentData(<TWriter>;TComponent);
	.uleb128	32
	.ascii	"WriteComponentData\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef DetermineAncestor(<TWriter>;TComponent);
	.uleb128	32
	.ascii	"DetermineAncestor\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef DoFindAncestor(<TWriter>;TComponent);
	.uleb128	32
	.ascii	"DoFindAncestor\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef SetRoot(<TWriter>;TComponent);
	.uleb128	28
	.ascii	"SetRoot\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol AROOT
	.uleb128	26
	.ascii	"ARoot\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteBinary(<TWriter>;TStreamProc);
	.uleb128	32
	.ascii	"WriteBinary\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol AWRITEDATA
	.uleb128	26
	.ascii	"AWriteData\000"
	.long	.La260-.Ldebug_info0
	.byte	0
# Procdef WriteProperty(<TWriter>;TPersistent;Pointer);
	.uleb128	32
	.ascii	"WriteProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
# Symbol PROPINFO
	.uleb128	26
	.ascii	"PropInfo\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef WriteProperties(<TWriter>;TPersistent);
	.uleb128	32
	.ascii	"WriteProperties\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef WriteChildren(<TWriter>;TComponent);
	.uleb128	32
	.ascii	"WriteChildren\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef CreateDriver(<TWriter>;TStream;LongInt):TAbstractObjectWriter;
	.uleb128	33
	.ascii	"CreateDriver\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
	.long	.La316-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol BUFSIZE
	.uleb128	26
	.ascii	"BufSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TWriter>;<Class Of TWriter>;TAbstractObjectWriter);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La326-.Ldebug_info0
# Symbol ADRIVER
	.uleb128	26
	.ascii	"ADriver\000"
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TWriter>;<Class Of TWriter>;TStream;LongInt);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La328-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol BUFSIZE
	.uleb128	26
	.ascii	"BufSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TWriter>;<Class Of TWriter>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La330-.Ldebug_info0
	.byte	0
# Procdef FlushBuffer(<TWriter>);
	.uleb128	27
	.ascii	"FlushBuffer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef DefineProperty(<TWriter>;const AnsiString;TReaderProc;TWriterProc;Boolean);
	.uleb128	27
	.ascii	"DefineProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol READDATA
	.uleb128	26
	.ascii	"ReadData\000"
	.long	.La256-.Ldebug_info0
# Symbol AWRITEDATA
	.uleb128	26
	.ascii	"AWriteData\000"
	.long	.La258-.Ldebug_info0
# Symbol HASDATA
	.uleb128	26
	.ascii	"HasData\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef DefineBinaryProperty(<TWriter>;const AnsiString;TStreamProc;TStreamProc;Boolean);
	.uleb128	27
	.ascii	"DefineBinaryProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol READDATA
	.uleb128	26
	.ascii	"ReadData\000"
	.long	.La260-.Ldebug_info0
# Symbol AWRITEDATA
	.uleb128	26
	.ascii	"AWriteData\000"
	.long	.La260-.Ldebug_info0
# Symbol HASDATA
	.uleb128	26
	.ascii	"HasData\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Write(<TWriter>;const <Formal type>;LongInt);
	.uleb128	27
	.ascii	"Write\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef WriteBoolean(<TWriter>;Boolean);
	.uleb128	34
	.ascii	"WriteBoolean\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef WriteCollection(<TWriter>;TCollection);
	.uleb128	34
	.ascii	"WriteCollection\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef WriteComponent(<TWriter>;TComponent);
	.uleb128	34
	.ascii	"WriteComponent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteChar(<TWriter>;Char);
	.uleb128	34
	.ascii	"WriteChar\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La86-.Ldebug_info0
	.byte	0
# Procdef WriteWideChar(<TWriter>;WideChar);
	.uleb128	34
	.ascii	"WriteWideChar\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La296-.Ldebug_info0
	.byte	0
# Procdef WriteDescendent(<TWriter>;TComponent;TComponent);
	.uleb128	34
	.ascii	"WriteDescendent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol AROOT
	.uleb128	26
	.ascii	"ARoot\000"
	.long	.La146-.Ldebug_info0
# Symbol AANCESTOR
	.uleb128	26
	.ascii	"AAncestor\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteFloat(<TWriter>;const Double);
	.uleb128	34
	.ascii	"WriteFloat\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef WriteSingle(<TWriter>;const Single);
	.uleb128	34
	.ascii	"WriteSingle\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La303-.Ldebug_info0
	.byte	0
# Procdef WriteDate(<TWriter>;const TDateTime);
	.uleb128	34
	.ascii	"WriteDate\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La305-.Ldebug_info0
	.byte	0
# Procdef WriteCurrency(<TWriter>;const Currency);
	.uleb128	34
	.ascii	"WriteCurrency\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La307-.Ldebug_info0
	.byte	0
# Procdef WriteIdent(<TWriter>;const AnsiString);
	.uleb128	34
	.ascii	"WriteIdent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol IDENT
	.uleb128	26
	.ascii	"Ident\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef WriteInteger(<TWriter>;LongInt);
	.uleb128	34
	.ascii	"WriteInteger\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef WriteInteger(<TWriter>;Int64);
	.uleb128	34
	.ascii	"WriteInteger\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef WriteSet(<TWriter>;LongInt;Pointer);
	.uleb128	34
	.ascii	"WriteSet\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La66-.Ldebug_info0
# Symbol SETTYPE
	.uleb128	26
	.ascii	"SetType\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef WriteListBegin(<TWriter>);
	.uleb128	34
	.ascii	"WriteListBegin\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef WriteListEnd(<TWriter>);
	.uleb128	34
	.ascii	"WriteListEnd\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef WriteSignature(<TWriter>);
	.uleb128	34
	.ascii	"WriteSignature\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef WriteRootComponent(<TWriter>;TComponent);
	.uleb128	34
	.ascii	"WriteRootComponent\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol AROOT
	.uleb128	26
	.ascii	"ARoot\000"
	.long	.La146-.Ldebug_info0
	.byte	0
# Procdef WriteString(<TWriter>;const AnsiString);
	.uleb128	34
	.ascii	"WriteString\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef WriteWideString(<TWriter>;const WideString);
	.uleb128	34
	.ascii	"WriteWideString\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La311-.Ldebug_info0
	.byte	0
# Procdef WriteUnicodeString(<TWriter>;const UnicodeString);
	.uleb128	34
	.ascii	"WriteUnicodeString\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef WriteVariant(<TWriter>;const Variant);
	.uleb128	34
	.ascii	"WriteVariant\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La168-.Ldebug_info0
# Symbol VARVALUE
	.uleb128	26
	.ascii	"VarValue\000"
	.long	.La309-.Ldebug_info0
	.byte	0
	.byte	0
.La169:
	.uleb128	9
	.long	.La168-.Ldebug_info0
# Definition PPointerList
.La195:
	.uleb128	11
	.ascii	"PPointerList\000"
	.long	.La332-.Ldebug_info0
.La332:
	.uleb128	20
	.long	.La333-.Ldebug_info0
.La196:
	.uleb128	9
	.long	.La195-.Ldebug_info0
# Definition TPointerList
.La333:
	.uleb128	11
	.ascii	"TPointerList\000"
	.long	.La335-.Ldebug_info0
.La335:
	.uleb128	18
	.ascii	"TPointerList\000"
	.uleb128	1073741816
	.long	.La156-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	134217726
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.byte	0
.La334:
	.uleb128	9
	.long	.La333-.Ldebug_info0
# Definition <procedure variable type of function(Pointer;Pointer):LongInt;Register>
.La208:
	.uleb128	11
	.ascii	"TListSortCompare\000"
	.long	.La336-.Ldebug_info0
.La336:
	.uleb128	43
	.ascii	"TListSortCompare\000"
	.byte	1
	.long	.La66-.Ldebug_info0
	.uleb128	26
	.ascii	"Item1\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Item2\000"
	.long	.La156-.Ldebug_info0
	.byte	0
.La209:
	.uleb128	9
	.long	.La208-.Ldebug_info0
# Definition TListAssignOp
.La206:
	.uleb128	11
	.ascii	"TListAssignOp\000"
	.long	.La337-.Ldebug_info0
.La337:
	.uleb128	30
	.ascii	"TListAssignOp\000"
	.byte	4
	.uleb128	31
	.ascii	"laCopy\000"
	.long	0
	.uleb128	31
	.ascii	"laAnd\000"
	.long	1
	.uleb128	31
	.ascii	"laOr\000"
	.long	2
	.uleb128	31
	.ascii	"laXor\000"
	.long	3
	.uleb128	31
	.ascii	"laSrcUnique\000"
	.long	4
	.uleb128	31
	.ascii	"laDestUnique\000"
	.long	5
	.byte	0
.La207:
	.uleb128	9
	.long	.La206-.Ldebug_info0
# Definition TCollection
.La298:
	.uleb128	11
	.ascii	"TCollection\000"
	.long	.La338-.Ldebug_info0
.La338:
	.uleb128	20
	.long	.La300-.Ldebug_info0
.La300:
	.uleb128	21
	.ascii	"TCollection\000"
	.uleb128	56
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La152-.Ldebug_info0
	.uleb128	23
	.ascii	"FItemClass\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La339-.Ldebug_info0
	.uleb128	23
	.ascii	"FItems\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"FUpdateCount\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FNextID\000"
	.byte	2
	.byte	35
	.uleb128	44
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FPropName\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"UpdateCount\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"ItemClass\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La339-.Ldebug_info0
# Procdef GetCount(<TCollection>):LongInt;
	.uleb128	36
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef GetPropName(<TCollection>;<var AnsiString>):AnsiString;
	.uleb128	36
	.ascii	"GetPropName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef InsertItem(<TCollection>;TCollectionItem);
	.uleb128	32
	.ascii	"InsertItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef RemoveItem(<TCollection>;TCollectionItem);
	.uleb128	32
	.ascii	"RemoveItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef DoClear(<TCollection>);
	.uleb128	32
	.ascii	"DoClear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef GetAttrCount(<TCollection>):LongInt;
	.uleb128	33
	.ascii	"GetAttrCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef GetAttr(<TCollection>;<var AnsiString>;LongInt):AnsiString;
	.uleb128	33
	.ascii	"GetAttr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetItemAttr(<TCollection>;<var AnsiString>;LongInt;LongInt):AnsiString;
	.uleb128	33
	.ascii	"GetItemAttr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ITEMINDEX
	.uleb128	26
	.ascii	"ItemIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Changed(<TCollection>);
	.uleb128	32
	.ascii	"Changed\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef GetItem(<TCollection>;LongInt):TCollectionItem;
	.uleb128	36
	.ascii	"GetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La341-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetItem(<TCollection>;LongInt;TCollectionItem);
	.uleb128	32
	.ascii	"SetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef SetItemName(<TCollection>;TCollectionItem);
	.uleb128	28
	.ascii	"SetItemName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef SetPropName(<TCollection>);
	.uleb128	28
	.ascii	"SetPropName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef Update(<TCollection>;TCollectionItem);
	.uleb128	28
	.ascii	"Update\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef Notify(<TCollection>;TCollectionItem;TCollectionNotification);
	.uleb128	28
	.ascii	"Notify\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La341-.Ldebug_info0
# Symbol ACTION
	.uleb128	26
	.ascii	"Action\000"
	.long	.La344-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TCollection>;<Class Of TCollection>;TCollectionItemClass);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La346-.Ldebug_info0
# Symbol AITEMCLASS
	.uleb128	26
	.ascii	"AItemClass\000"
	.long	.La339-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TCollection>;<Class Of TCollection>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La348-.Ldebug_info0
	.byte	0
# Procdef Owner(<TCollection>):TPersistent;
	.uleb128	24
	.ascii	"Owner\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La150-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef Add(<TCollection>):TCollectionItem;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef Assign(<TCollection>;TPersistent);
	.uleb128	27
	.ascii	"Assign\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef BeginUpdate(<TCollection>);
	.uleb128	27
	.ascii	"BeginUpdate\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef Clear(<TCollection>);
	.uleb128	34
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef EndUpdate(<TCollection>);
	.uleb128	27
	.ascii	"EndUpdate\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef Delete(<TCollection>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TCollection>):TCollectionEnumerator;
	.uleb128	24
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La350-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef GetNamePath(<TCollection>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"GetNamePath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Insert(<TCollection>;LongInt):TCollectionItem;
	.uleb128	24
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef FindItemID(<TCollection>;LongInt):TCollectionItem;
	.uleb128	24
	.ascii	"FindItemID\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol ID
	.uleb128	26
	.ascii	"ID\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Exchange(<TCollection>;const LongInt;const LongInt);
	.uleb128	34
	.ascii	"Exchange\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Move(<TCollection>;const LongInt;const LongInt);
	.uleb128	34
	.ascii	"Move\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Sort(<TCollection>;const TCollectionSortCompare);
	.uleb128	34
	.ascii	"Sort\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La298-.Ldebug_info0
# Symbol COMPARE
	.uleb128	26
	.ascii	"Compare\000"
	.long	.La353-.Ldebug_info0
	.byte	0
	.byte	0
.La299:
	.uleb128	9
	.long	.La298-.Ldebug_info0
# Definition TCollectionItem
.La341:
	.uleb128	11
	.ascii	"TCollectionItem\000"
	.long	.La355-.Ldebug_info0
.La355:
	.uleb128	20
	.long	.La343-.Ldebug_info0
.La343:
	.uleb128	21
	.ascii	"TCollectionItem\000"
	.uleb128	40
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La152-.Ldebug_info0
	.uleb128	23
	.ascii	"FCollection\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La298-.Ldebug_info0
	.uleb128	23
	.ascii	"FID\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FUpdateCount\000"
	.byte	2
	.byte	35
	.uleb128	36
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"UpdateCount\000"
	.byte	2
	.byte	35
	.uleb128	36
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"Collection\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La298-.Ldebug_info0
	.uleb128	23
	.ascii	"ID\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La66-.Ldebug_info0
# Procdef GetIndex(<TCollectionItem>):LongInt;
	.uleb128	36
	.ascii	"GetIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef SetCollection(<TCollectionItem>;TCollection);
	.uleb128	28
	.ascii	"SetCollection\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef Changed(<TCollectionItem>;Boolean);
	.uleb128	32
	.ascii	"Changed\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol ALLITEMS
	.uleb128	26
	.ascii	"AllItems\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef GetOwner(<TCollectionItem>):TPersistent;
	.uleb128	33
	.ascii	"GetOwner\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La150-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
	.byte	0
# Procdef GetDisplayName(<TCollectionItem>;<var AnsiString>):AnsiString;
	.uleb128	33
	.ascii	"GetDisplayName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetIndex(<TCollectionItem>;LongInt);
	.uleb128	28
	.ascii	"SetIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetDisplayName(<TCollectionItem>;const AnsiString);
	.uleb128	28
	.ascii	"SetDisplayName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TCollectionItem>;<Class Of TCollectionItem>;TCollection);
	.uleb128	29
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.long	.La341-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La356-.Ldebug_info0
# Symbol ACOLLECTION
	.uleb128	26
	.ascii	"ACollection\000"
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TCollectionItem>;<Class Of TCollectionItem>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La358-.Ldebug_info0
	.byte	0
# Procdef GetNamePath(<TCollectionItem>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"GetNamePath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
	.byte	0
.La342:
	.uleb128	9
	.long	.La341-.Ldebug_info0
# Definition TCollectionEnumerator
.La350:
	.uleb128	11
	.ascii	"TCollectionEnumerator\000"
	.long	.La360-.Ldebug_info0
.La360:
	.uleb128	20
	.long	.La352-.Ldebug_info0
.La352:
	.uleb128	21
	.ascii	"TCollectionEnumerator\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FCollection\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La298-.Ldebug_info0
	.uleb128	23
	.ascii	"FPosition\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
# Procdef constructor Create(<TCollectionEnumerator>;<Class Of TCollectionEnumerator>;TCollection);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La350-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La350-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La361-.Ldebug_info0
# Symbol ACOLLECTION
	.uleb128	26
	.ascii	"ACollection\000"
	.long	.La298-.Ldebug_info0
	.byte	0
# Procdef GetCurrent(<TCollectionEnumerator>):TCollectionItem;
	.uleb128	24
	.ascii	"GetCurrent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La341-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La350-.Ldebug_info0
	.byte	0
# Procdef MoveNext(<TCollectionEnumerator>):Boolean;
	.uleb128	24
	.ascii	"MoveNext\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La350-.Ldebug_info0
	.byte	0
	.byte	0
.La351:
	.uleb128	9
	.long	.La350-.Ldebug_info0
# Definition TCollectionItemClass
.La339:
	.uleb128	11
	.ascii	"TCollectionItemClass\000"
	.long	.La363-.Ldebug_info0
.La363:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La340:
	.uleb128	9
	.long	.La339-.Ldebug_info0
# Definition TCollectionNotification
.La344:
	.uleb128	11
	.ascii	"TCollectionNotification\000"
	.long	.La366-.Ldebug_info0
.La366:
	.uleb128	30
	.ascii	"TCollectionNotification\000"
	.byte	4
	.uleb128	31
	.ascii	"cnAdded\000"
	.long	0
	.uleb128	31
	.ascii	"cnExtracting\000"
	.long	1
	.uleb128	31
	.ascii	"cnDeleting\000"
	.long	2
	.byte	0
.La345:
	.uleb128	9
	.long	.La344-.Ldebug_info0
# Definition <procedure variable type of function(TCollectionItem;TCollectionItem):LongInt;Register>
.La353:
	.uleb128	11
	.ascii	"TCollectionSortCompare\000"
	.long	.La367-.Ldebug_info0
.La367:
	.uleb128	43
	.ascii	"TCollectionSortCompare\000"
	.byte	1
	.long	.La66-.Ldebug_info0
	.uleb128	26
	.ascii	"Item1\000"
	.long	.La341-.Ldebug_info0
	.uleb128	26
	.ascii	"Item2\000"
	.long	.La341-.Ldebug_info0
	.byte	0
.La354:
	.uleb128	9
	.long	.La353-.Ldebug_info0
# Definition TStringList
.La319:
	.uleb128	11
	.ascii	"TStringList\000"
	.long	.La368-.Ldebug_info0
.La368:
	.uleb128	20
	.long	.La321-.Ldebug_info0
.La321:
	.uleb128	21
	.ascii	"TStringList\000"
	.uleb128	144
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La371-.Ldebug_info0
	.uleb128	23
	.ascii	"FList\000"
	.byte	2
	.byte	35
	.uleb128	80
	.byte	3
	.long	.La372-.Ldebug_info0
	.uleb128	23
	.ascii	"FCount\000"
	.byte	2
	.byte	35
	.uleb128	88
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FCapacity\000"
	.byte	2
	.byte	35
	.uleb128	92
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnChange\000"
	.byte	2
	.byte	35
	.uleb128	96
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"FOnChanging\000"
	.byte	2
	.byte	35
	.uleb128	112
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"FDuplicates\000"
	.byte	3
	.byte	35
	.uleb128	128
	.byte	3
	.long	.La374-.Ldebug_info0
	.uleb128	23
	.ascii	"FCaseSensitive\000"
	.byte	3
	.byte	35
	.uleb128	132
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FForceSort\000"
	.byte	3
	.byte	35
	.uleb128	133
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FOwnsObjects\000"
	.byte	3
	.byte	35
	.uleb128	134
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FSortStyle\000"
	.byte	3
	.byte	35
	.uleb128	136
	.byte	3
	.long	.La376-.Ldebug_info0
	.uleb128	23
	.ascii	"Duplicates\000"
	.byte	3
	.byte	35
	.uleb128	128
	.byte	3
	.long	.La374-.Ldebug_info0
	.uleb128	23
	.ascii	"CaseSensitive\000"
	.byte	3
	.byte	35
	.uleb128	132
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"OnChange\000"
	.byte	2
	.byte	35
	.uleb128	96
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"OnChanging\000"
	.byte	2
	.byte	35
	.uleb128	112
	.byte	3
	.long	.La238-.Ldebug_info0
	.uleb128	23
	.ascii	"OwnsObjects\000"
	.byte	3
	.byte	35
	.uleb128	134
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"SortStyle\000"
	.byte	3
	.byte	35
	.uleb128	136
	.byte	3
	.long	.La376-.Ldebug_info0
# Procdef ExchangeItemsInt(<TStringList>;LongInt;LongInt);
	.uleb128	32
	.ascii	"ExchangeItemsInt\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetSorted(<TStringList>):Boolean;
	.uleb128	36
	.ascii	"GetSorted\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef Grow(<TStringList>);
	.uleb128	32
	.ascii	"Grow\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef InternalClear(<TStringList>;LongInt=`0`;Boolean=`FALSE`);
	.uleb128	32
	.ascii	"InternalClear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol FROMINDEX
	.uleb128	26
	.ascii	"FromIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CLEARONLY
	.uleb128	26
	.ascii	"ClearOnly\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef QuickSort(<TStringList>;LongInt;LongInt;TStringListSortCompare);
	.uleb128	32
	.ascii	"QuickSort\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol L
	.uleb128	26
	.ascii	"L\000"
	.long	.La66-.Ldebug_info0
# Symbol R
	.uleb128	26
	.ascii	"R\000"
	.long	.La66-.Ldebug_info0
# Symbol COMPAREFN
	.uleb128	26
	.ascii	"CompareFn\000"
	.long	.La378-.Ldebug_info0
	.byte	0
# Procdef SetSorted(<TStringList>;Boolean);
	.uleb128	32
	.ascii	"SetSorted\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetCaseSensitive(<TStringList>;Boolean);
	.uleb128	32
	.ascii	"SetCaseSensitive\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol B
	.uleb128	26
	.ascii	"b\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetSortStyle(<TStringList>;TStringsSortStyle);
	.uleb128	32
	.ascii	"SetSortStyle\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La376-.Ldebug_info0
	.byte	0
# Procdef CheckIndex(<TStringList>;LongInt);
	.uleb128	32
	.ascii	"CheckIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ExchangeItems(<TStringList>;LongInt;LongInt);
	.uleb128	28
	.ascii	"ExchangeItems\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	552
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Changed(<TStringList>);
	.uleb128	28
	.ascii	"Changed\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	560
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef Changing(<TStringList>);
	.uleb128	28
	.ascii	"Changing\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	568
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef Get(<TStringList>;<var AnsiString>;LongInt):AnsiString;
	.uleb128	33
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCapacity(<TStringList>):LongInt;
	.uleb128	33
	.ascii	"GetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef GetCount(<TStringList>):LongInt;
	.uleb128	33
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef GetObject(<TStringList>;LongInt):TObject;
	.uleb128	33
	.ascii	"GetObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Put(<TStringList>;LongInt;const AnsiString);
	.uleb128	28
	.ascii	"Put\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef PutObject(<TStringList>;LongInt;TObject);
	.uleb128	28
	.ascii	"PutObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef SetCapacity(<TStringList>;LongInt);
	.uleb128	28
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetUpdateState(<TStringList>;Boolean);
	.uleb128	28
	.ascii	"SetUpdateState\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol UPDATING
	.uleb128	26
	.ascii	"Updating\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef InsertItem(<TStringList>;LongInt;const AnsiString);
	.uleb128	28
	.ascii	"InsertItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	576
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef InsertItem(<TStringList>;LongInt;const AnsiString;TObject);
	.uleb128	28
	.ascii	"InsertItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	584
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol O
	.uleb128	26
	.ascii	"O\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef DoCompareText(<TStringList>;const AnsiString;const AnsiString):Int64;
	.uleb128	33
	.ascii	"DoCompareText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol S1
	.uleb128	26
	.ascii	"s1\000"
	.long	.La49-.Ldebug_info0
# Symbol S2
	.uleb128	26
	.ascii	"s2\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TStringList>;<Class Of TStringList>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La380-.Ldebug_info0
	.byte	0
# Procdef Add(<TStringList>;const AnsiString):LongInt;
	.uleb128	29
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Clear(<TStringList>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	392
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef Delete(<TStringList>;LongInt);
	.uleb128	27
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Exchange(<TStringList>;LongInt;LongInt);
	.uleb128	27
	.ascii	"Exchange\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	408
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Find(<TStringList>;const AnsiString;out LongInt):Boolean;
	.uleb128	29
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	592
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TStringList>;const AnsiString):LongInt;
	.uleb128	29
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	424
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Insert(<TStringList>;LongInt;const AnsiString);
	.uleb128	27
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	456
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Sort(<TStringList>);
	.uleb128	27
	.ascii	"Sort\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	600
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
	.byte	0
# Procdef CustomSort(<TStringList>;TStringListSortCompare);
	.uleb128	27
	.ascii	"CustomSort\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	608
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La319-.Ldebug_info0
# Symbol COMPAREFN
	.uleb128	26
	.ascii	"CompareFn\000"
	.long	.La378-.Ldebug_info0
	.byte	0
	.byte	0
.La320:
	.uleb128	9
	.long	.La319-.Ldebug_info0
# Definition <procedure variable type of function(TStringList;LongInt;LongInt):LongInt;Register>
.La378:
	.uleb128	11
	.ascii	"TStringListSortCompare\000"
	.long	.La382-.Ldebug_info0
.La382:
	.uleb128	43
	.ascii	"TStringListSortCompare\000"
	.byte	1
	.long	.La66-.Ldebug_info0
	.uleb128	26
	.ascii	"List\000"
	.long	.La319-.Ldebug_info0
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
.La379:
	.uleb128	9
	.long	.La378-.Ldebug_info0
# Definition PStringItemList
.La372:
	.uleb128	11
	.ascii	"PStringItemList\000"
	.long	.La383-.Ldebug_info0
.La383:
	.uleb128	20
	.long	.La384-.Ldebug_info0
.La373:
	.uleb128	9
	.long	.La372-.Ldebug_info0
# Definition TStringItemList
.La384:
	.uleb128	11
	.ascii	"TStringItemList\000"
	.long	.La386-.Ldebug_info0
.La386:
	.uleb128	18
	.ascii	"TStringItemList\000"
	.uleb128	2147483648
	.long	.La387-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	134217727
	.uleb128	16
	.long	.La66-.Ldebug_info0
	.byte	0
.La385:
	.uleb128	9
	.long	.La384-.Ldebug_info0
# Definition TStringsSortStyle
.La376:
	.uleb128	11
	.ascii	"TStringsSortStyle\000"
	.long	.La389-.Ldebug_info0
.La389:
	.uleb128	30
	.ascii	"TStringsSortStyle\000"
	.byte	4
	.uleb128	31
	.ascii	"sslNone\000"
	.long	0
	.uleb128	31
	.ascii	"sslUser\000"
	.long	1
	.uleb128	31
	.ascii	"sslAuto\000"
	.long	2
	.byte	0
.La377:
	.uleb128	9
	.long	.La376-.Ldebug_info0
# Definition TValueType
.La294:
	.uleb128	11
	.ascii	"TValueType\000"
	.long	.La390-.Ldebug_info0
.La390:
	.uleb128	30
	.ascii	"TValueType\000"
	.byte	4
	.uleb128	31
	.ascii	"vaNull\000"
	.long	0
	.uleb128	31
	.ascii	"vaList\000"
	.long	1
	.uleb128	31
	.ascii	"vaInt8\000"
	.long	2
	.uleb128	31
	.ascii	"vaInt16\000"
	.long	3
	.uleb128	31
	.ascii	"vaInt32\000"
	.long	4
	.uleb128	31
	.ascii	"vaExtended\000"
	.long	5
	.uleb128	31
	.ascii	"vaString\000"
	.long	6
	.uleb128	31
	.ascii	"vaIdent\000"
	.long	7
	.uleb128	31
	.ascii	"vaFalse\000"
	.long	8
	.uleb128	31
	.ascii	"vaTrue\000"
	.long	9
	.uleb128	31
	.ascii	"vaBinary\000"
	.long	10
	.uleb128	31
	.ascii	"vaSet\000"
	.long	11
	.uleb128	31
	.ascii	"vaLString\000"
	.long	12
	.uleb128	31
	.ascii	"vaNil\000"
	.long	13
	.uleb128	31
	.ascii	"vaCollection\000"
	.long	14
	.uleb128	31
	.ascii	"vaSingle\000"
	.long	15
	.uleb128	31
	.ascii	"vaCurrency\000"
	.long	16
	.uleb128	31
	.ascii	"vaDate\000"
	.long	17
	.uleb128	31
	.ascii	"vaWString\000"
	.long	18
	.uleb128	31
	.ascii	"vaInt64\000"
	.long	19
	.uleb128	31
	.ascii	"vaUTF8String\000"
	.long	20
	.uleb128	31
	.ascii	"vaUString\000"
	.long	21
	.uleb128	31
	.ascii	"vaQWord\000"
	.long	22
	.byte	0
.La295:
	.uleb128	9
	.long	.La294-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader) of object;Register>
.La256:
	.uleb128	11
	.ascii	"TReaderProc\000"
	.long	.La391-.Ldebug_info0
.La391:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La392-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La392:
	.uleb128	42
	.ascii	"TReaderProc\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.byte	0
.La257:
	.uleb128	9
	.long	.La256-.Ldebug_info0
# Definition <procedure variable type of procedure(TWriter) of object;Register>
.La258:
	.uleb128	11
	.ascii	"TWriterProc\000"
	.long	.La393-.Ldebug_info0
.La393:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La394-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La394:
	.uleb128	42
	.ascii	"TWriterProc\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.byte	0
.La259:
	.uleb128	9
	.long	.La258-.Ldebug_info0
# Definition <procedure variable type of procedure(TStream) of object;Register>
.La260:
	.uleb128	11
	.ascii	"TStreamProc\000"
	.long	.La395-.Ldebug_info0
.La395:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La396-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La396:
	.uleb128	42
	.ascii	"TStreamProc\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
	.byte	0
.La261:
	.uleb128	9
	.long	.La260-.Ldebug_info0
# Definition TComponentClass
.La288:
	.uleb128	11
	.ascii	"TComponentClass\000"
	.long	.La397-.Ldebug_info0
.La397:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La289:
	.uleb128	9
	.long	.La288-.Ldebug_info0
# Definition TAbstractObjectReader
.La263:
	.uleb128	11
	.ascii	"TAbstractObjectReader\000"
	.long	.La398-.Ldebug_info0
.La398:
	.uleb128	20
	.long	.La265-.Ldebug_info0
.La265:
	.uleb128	21
	.ascii	"TAbstractObjectReader\000"
	.uleb128	8
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
# Procdef FlushBuffer(<TAbstractObjectReader>);
	.uleb128	27
	.ascii	"FlushBuffer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef NextValue(<TAbstractObjectReader>):<enumeration type>;
	.uleb128	29
	.ascii	"NextValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.long	.La294-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadValue(<TAbstractObjectReader>):<enumeration type>;
	.uleb128	29
	.ascii	"ReadValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.long	.La294-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef BeginRootComponent(<TAbstractObjectReader>);
	.uleb128	27
	.ascii	"BeginRootComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef BeginComponent(<TAbstractObjectReader>;var TFilerFlags;var LongInt;var AnsiString;var AnsiString);
	.uleb128	27
	.ascii	"BeginComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol FLAGS
	.uleb128	26
	.ascii	"Flags\000"
	.long	.La399-.Ldebug_info0
# Symbol ACHILDPOS
	.uleb128	26
	.ascii	"AChildPos\000"
	.long	.La66-.Ldebug_info0
# Symbol COMPCLASSNAME
	.uleb128	26
	.ascii	"CompClassName\000"
	.long	.La49-.Ldebug_info0
# Symbol COMPNAME
	.uleb128	26
	.ascii	"CompName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef BeginProperty(<TAbstractObjectReader>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"BeginProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Read(<TAbstractObjectReader>;var <Formal type>;LongInt);
	.uleb128	27
	.ascii	"Read\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol BUF
	.uleb128	26
	.ascii	"Buf\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ReadBinary(<TAbstractObjectReader>;const TMemoryStream);
	.uleb128	27
	.ascii	"ReadBinary\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol DESTDATA
	.uleb128	26
	.ascii	"DestData\000"
	.long	.La401-.Ldebug_info0
	.byte	0
# Procdef ReadFloat(<TAbstractObjectReader>):Double;
	.uleb128	29
	.ascii	"ReadFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadSingle(<TAbstractObjectReader>):Single;
	.uleb128	29
	.ascii	"ReadSingle\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.long	.La303-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadDate(<TAbstractObjectReader>):Double;
	.uleb128	29
	.ascii	"ReadDate\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.long	.La305-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadCurrency(<TAbstractObjectReader>):Currency;
	.uleb128	29
	.ascii	"ReadCurrency\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.long	.La307-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadIdent(<TAbstractObjectReader>;<var AnsiString>;TValueType):AnsiString;
	.uleb128	29
	.ascii	"ReadIdent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol VALUETYPE
	.uleb128	26
	.ascii	"ValueType\000"
	.long	.La294-.Ldebug_info0
	.byte	0
# Procdef ReadInt8(<TAbstractObjectReader>):ShortInt;
	.uleb128	29
	.ascii	"ReadInt8\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.long	.La404-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadInt16(<TAbstractObjectReader>):SmallInt;
	.uleb128	29
	.ascii	"ReadInt16\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.long	.La114-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadInt32(<TAbstractObjectReader>):LongInt;
	.uleb128	29
	.ascii	"ReadInt32\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadInt64(<TAbstractObjectReader>):Int64;
	.uleb128	29
	.ascii	"ReadInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadSet(<TAbstractObjectReader>;Pointer):LongInt;
	.uleb128	29
	.ascii	"ReadSet\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol ENUMTYPE
	.uleb128	26
	.ascii	"EnumType\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef ReadSignature(<TAbstractObjectReader>);
	.uleb128	27
	.ascii	"ReadSignature\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
# Procdef ReadStr(<TAbstractObjectReader>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"ReadStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef ReadString(<TAbstractObjectReader>;<var AnsiString>;TValueType):AnsiString;
	.uleb128	29
	.ascii	"ReadString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol STRINGTYPE
	.uleb128	26
	.ascii	"StringType\000"
	.long	.La294-.Ldebug_info0
	.byte	0
# Procdef ReadWideString(<TAbstractObjectReader>;<var WideString>):WideString;
	.uleb128	29
	.ascii	"ReadWideString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
	.long	.La311-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La311-.Ldebug_info0
	.byte	0
# Procdef ReadUnicodeString(<TAbstractObjectReader>;<var UnicodeString>):UnicodeString;
	.uleb128	29
	.ascii	"ReadUnicodeString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef SkipComponent(<TAbstractObjectReader>;Boolean);
	.uleb128	27
	.ascii	"SkipComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
# Symbol SKIPCOMPONENTINFOS
	.uleb128	26
	.ascii	"SkipComponentInfos\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SkipValue(<TAbstractObjectReader>);
	.uleb128	27
	.ascii	"SkipValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	392
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La263-.Ldebug_info0
	.byte	0
	.byte	0
.La264:
	.uleb128	9
	.long	.La263-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;const AnsiString;var Pointer;var Boolean) of object;Register>
.La268:
	.uleb128	11
	.ascii	"TFindMethodEvent\000"
	.long	.La406-.Ldebug_info0
.La406:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La407-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La407:
	.uleb128	42
	.ascii	"TFindMethodEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"MethodName\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"Address\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Error\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La269:
	.uleb128	9
	.long	.La268-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;TPersistent;PPropInfo;const AnsiString;var Boolean) of object;Register>
.La270:
	.uleb128	11
	.ascii	"TSetMethodPropertyEvent\000"
	.long	.La408-.Ldebug_info0
.La408:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La409-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La409:
	.uleb128	42
	.ascii	"TSetMethodPropertyEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
	.uleb128	26
	.ascii	"PropInfo\000"
	.long	.La410-.Ldebug_info0
	.uleb128	26
	.ascii	"TheMethodName\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"Handled\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La271:
	.uleb128	9
	.long	.La270-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;TComponent;var AnsiString) of object;Register>
.La272:
	.uleb128	11
	.ascii	"TSetNameEvent\000"
	.long	.La412-.Ldebug_info0
.La412:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La413-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La413:
	.uleb128	42
	.ascii	"TSetNameEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La273:
	.uleb128	9
	.long	.La272-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;var AnsiString) of object;Register>
.La274:
	.uleb128	11
	.ascii	"TReferenceNameEvent\000"
	.long	.La414-.Ldebug_info0
.La414:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La415-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La415:
	.uleb128	42
	.ascii	"TReferenceNameEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La275:
	.uleb128	9
	.long	.La274-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;const AnsiString;TPersistentClass;var TComponent) of object;Register>
.La276:
	.uleb128	11
	.ascii	"TAncestorNotFoundEvent\000"
	.long	.La416-.Ldebug_info0
.La416:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La417-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La417:
	.uleb128	42
	.ascii	"TAncestorNotFoundEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"ComponentName\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"ComponentClass\000"
	.long	.La418-.Ldebug_info0
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
.La277:
	.uleb128	9
	.long	.La276-.Ldebug_info0
# Definition <procedure variable type of procedure(TComponent) of object;Register>
.La301:
	.uleb128	11
	.ascii	"TReadComponentsProc\000"
	.long	.La420-.Ldebug_info0
.La420:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La421-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La421:
	.uleb128	42
	.ascii	"TReadComponentsProc\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
.La302:
	.uleb128	9
	.long	.La301-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;const AnsiString;var Boolean) of object;Register>
.La278:
	.uleb128	11
	.ascii	"TReaderError\000"
	.long	.La422-.Ldebug_info0
.La422:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La423-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La423:
	.uleb128	42
	.ascii	"TReaderError\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"Message\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"Handled\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La279:
	.uleb128	9
	.long	.La278-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;TPersistent;var AnsiString;Boolean;var Boolean;var Boolean) of object;Register>
.La280:
	.uleb128	11
	.ascii	"TPropertyNotFoundEvent\000"
	.long	.La424-.Ldebug_info0
.La424:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La425-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La425:
	.uleb128	42
	.ascii	"TPropertyNotFoundEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
	.uleb128	26
	.ascii	"PropName\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"IsPath\000"
	.long	.La109-.Ldebug_info0
	.uleb128	26
	.ascii	"Handled\000"
	.long	.La109-.Ldebug_info0
	.uleb128	26
	.ascii	"Skip\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La281:
	.uleb128	9
	.long	.La280-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;const AnsiString;var TComponentClass) of object;Register>
.La282:
	.uleb128	11
	.ascii	"TFindComponentClassEvent\000"
	.long	.La426-.Ldebug_info0
.La426:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La427-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La427:
	.uleb128	42
	.ascii	"TFindComponentClassEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"ClassName\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"ComponentClass\000"
	.long	.La288-.Ldebug_info0
	.byte	0
.La283:
	.uleb128	9
	.long	.La282-.Ldebug_info0
# Definition <procedure variable type of procedure(TReader;TComponentClass;var TComponent) of object;Register>
.La284:
	.uleb128	11
	.ascii	"TCreateComponentEvent\000"
	.long	.La428-.Ldebug_info0
.La428:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La429-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La429:
	.uleb128	42
	.ascii	"TCreateComponentEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.uleb128	26
	.ascii	"ComponentClass\000"
	.long	.La288-.Ldebug_info0
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.byte	0
.La285:
	.uleb128	9
	.long	.La284-.Ldebug_info0
# Definition <procedure variable type of procedure(TObject;const TPersistent;PPropInfo;var AnsiString) of object;Register>
.La286:
	.uleb128	11
	.ascii	"TReadWriteStringPropertyEvent\000"
	.long	.La430-.Ldebug_info0
.La430:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La431-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La431:
	.uleb128	42
	.ascii	"TReadWriteStringPropertyEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Sender\000"
	.long	.La143-.Ldebug_info0
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
	.uleb128	26
	.ascii	"PropInfo\000"
	.long	.La410-.Ldebug_info0
	.uleb128	26
	.ascii	"Content\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La287:
	.uleb128	9
	.long	.La286-.Ldebug_info0
# Definition TAbstractObjectWriter
.La316:
	.uleb128	11
	.ascii	"TAbstractObjectWriter\000"
	.long	.La432-.Ldebug_info0
.La432:
	.uleb128	20
	.long	.La318-.Ldebug_info0
.La318:
	.uleb128	21
	.ascii	"TAbstractObjectWriter\000"
	.uleb128	8
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
# Procdef BeginCollection(<TAbstractObjectWriter>);
	.uleb128	27
	.ascii	"BeginCollection\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef BeginComponent(<TAbstractObjectWriter>;TComponent;TFilerFlags;LongInt);
	.uleb128	27
	.ascii	"BeginComponent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol COMPONENT
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
# Symbol FLAGS
	.uleb128	26
	.ascii	"Flags\000"
	.long	.La399-.Ldebug_info0
# Symbol CHILDPOS
	.uleb128	26
	.ascii	"ChildPos\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef WriteSignature(<TAbstractObjectWriter>);
	.uleb128	27
	.ascii	"WriteSignature\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef BeginList(<TAbstractObjectWriter>);
	.uleb128	27
	.ascii	"BeginList\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef EndList(<TAbstractObjectWriter>);
	.uleb128	27
	.ascii	"EndList\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef BeginProperty(<TAbstractObjectWriter>;const AnsiString);
	.uleb128	27
	.ascii	"BeginProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol PROPNAME
	.uleb128	26
	.ascii	"PropName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef EndProperty(<TAbstractObjectWriter>);
	.uleb128	27
	.ascii	"EndProperty\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef FlushBuffer(<TAbstractObjectWriter>);
	.uleb128	27
	.ascii	"FlushBuffer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
	.byte	0
# Procdef Write(<TAbstractObjectWriter>;const <Formal type>;LongInt);
	.uleb128	27
	.ascii	"Write\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef WriteBinary(<TAbstractObjectWriter>;const <Formal type>;LongInt);
	.uleb128	27
	.ascii	"WriteBinary\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef WriteBoolean(<TAbstractObjectWriter>;Boolean);
	.uleb128	27
	.ascii	"WriteBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef WriteFloat(<TAbstractObjectWriter>;const Double);
	.uleb128	27
	.ascii	"WriteFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef WriteSingle(<TAbstractObjectWriter>;const Single);
	.uleb128	27
	.ascii	"WriteSingle\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La303-.Ldebug_info0
	.byte	0
# Procdef WriteDate(<TAbstractObjectWriter>;const TDateTime);
	.uleb128	27
	.ascii	"WriteDate\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La305-.Ldebug_info0
	.byte	0
# Procdef WriteCurrency(<TAbstractObjectWriter>;const Currency);
	.uleb128	27
	.ascii	"WriteCurrency\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La307-.Ldebug_info0
	.byte	0
# Procdef WriteIdent(<TAbstractObjectWriter>;const AnsiString);
	.uleb128	27
	.ascii	"WriteIdent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol IDENT
	.uleb128	26
	.ascii	"Ident\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef WriteInteger(<TAbstractObjectWriter>;Int64);
	.uleb128	27
	.ascii	"WriteInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef WriteUInt64(<TAbstractObjectWriter>;QWord);
	.uleb128	27
	.ascii	"WriteUInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef WriteVariant(<TAbstractObjectWriter>;const Variant);
	.uleb128	27
	.ascii	"WriteVariant\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef WriteMethodName(<TAbstractObjectWriter>;const AnsiString);
	.uleb128	27
	.ascii	"WriteMethodName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef WriteSet(<TAbstractObjectWriter>;LongInt;Pointer);
	.uleb128	27
	.ascii	"WriteSet\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La66-.Ldebug_info0
# Symbol SETTYPE
	.uleb128	26
	.ascii	"SetType\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef WriteString(<TAbstractObjectWriter>;const AnsiString);
	.uleb128	27
	.ascii	"WriteString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef WriteWideString(<TAbstractObjectWriter>;const WideString);
	.uleb128	27
	.ascii	"WriteWideString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La311-.Ldebug_info0
	.byte	0
# Procdef WriteUnicodeString(<TAbstractObjectWriter>;const UnicodeString);
	.uleb128	27
	.ascii	"WriteUnicodeString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La316-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La313-.Ldebug_info0
	.byte	0
	.byte	0
.La317:
	.uleb128	9
	.long	.La316-.Ldebug_info0
# Definition <procedure variable type of procedure(TWriter;TComponent;const AnsiString;var TComponent;var TComponent) of object;Register>
.La322:
	.uleb128	11
	.ascii	"TFindAncestorEvent\000"
	.long	.La433-.Ldebug_info0
.La433:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La434-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La434:
	.uleb128	42
	.ascii	"TFindAncestorEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.uleb128	26
	.ascii	"Component\000"
	.long	.La146-.Ldebug_info0
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"Ancestor\000"
	.long	.La146-.Ldebug_info0
	.uleb128	26
	.ascii	"RootAncestor\000"
	.long	.La146-.Ldebug_info0
	.byte	0
.La323:
	.uleb128	9
	.long	.La322-.Ldebug_info0
# Definition <procedure variable type of procedure(TWriter;TPersistent;PPropInfo;const TMethod;const TMethod;var Boolean) of object;Register>
.La324:
	.uleb128	11
	.ascii	"TWriteMethodPropertyEvent\000"
	.long	.La435-.Ldebug_info0
.La435:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La436-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La436:
	.uleb128	42
	.ascii	"TWriteMethodPropertyEvent\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.uleb128	26
	.ascii	"Instance\000"
	.long	.La150-.Ldebug_info0
	.uleb128	26
	.ascii	"PropInfo\000"
	.long	.La410-.Ldebug_info0
	.uleb128	26
	.ascii	"MethodValue\000"
	.long	.La437-.Ldebug_info0
	.uleb128	26
	.ascii	"DefMethodValue\000"
	.long	.La437-.Ldebug_info0
	.uleb128	26
	.ascii	"Handled\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La325:
	.uleb128	9
	.long	.La324-.Ldebug_info0
# Definition <enumeration type>
.La226:
	.uleb128	44
	.byte	4
	.uleb128	31
	.ascii	"csLoading\000"
	.long	0
	.uleb128	31
	.ascii	"csReading\000"
	.long	1
	.uleb128	31
	.ascii	"csWriting\000"
	.long	2
	.uleb128	31
	.ascii	"csDestroying\000"
	.long	3
	.uleb128	31
	.ascii	"csDesigning\000"
	.long	4
	.uleb128	31
	.ascii	"csAncestor\000"
	.long	5
	.uleb128	31
	.ascii	"csUpdating\000"
	.long	6
	.uleb128	31
	.ascii	"csFixups\000"
	.long	7
	.uleb128	31
	.ascii	"csFreeNotification\000"
	.long	8
	.uleb128	31
	.ascii	"csInline\000"
	.long	9
	.uleb128	31
	.ascii	"csDesignInstance\000"
	.long	10
	.byte	0
.La227:
	.uleb128	9
	.long	.La226-.Ldebug_info0
# Definition <enumeration type>
.La230:
	.uleb128	44
	.byte	4
	.uleb128	31
	.ascii	"csInheritable\000"
	.long	0
	.uleb128	31
	.ascii	"csCheckPropAvail\000"
	.long	1
	.uleb128	31
	.ascii	"csSubComponent\000"
	.long	2
	.uleb128	31
	.ascii	"csTransient\000"
	.long	3
	.byte	0
.La231:
	.uleb128	9
	.long	.La230-.Ldebug_info0
# Definition TPersistentClass
.La418:
	.uleb128	11
	.ascii	"TPersistentClass\000"
	.long	.La439-.Ldebug_info0
.La439:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La419:
	.uleb128	9
	.long	.La418-.Ldebug_info0
# Definition TStrings
.La369:
	.uleb128	11
	.ascii	"TStrings\000"
	.long	.La440-.Ldebug_info0
.La440:
	.uleb128	20
	.long	.La371-.Ldebug_info0
.La371:
	.uleb128	21
	.ascii	"TStrings\000"
	.uleb128	80
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La152-.Ldebug_info0
	.uleb128	23
	.ascii	"FDefaultEncoding\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La441-.Ldebug_info0
	.uleb128	23
	.ascii	"FEncoding\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La441-.Ldebug_info0
	.uleb128	23
	.ascii	"FMissingNameValueSeparatorAction\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La444-.Ldebug_info0
	.uleb128	23
	.ascii	"FSpecialCharsInited\000"
	.byte	2
	.byte	35
	.uleb128	44
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FAlwaysQuote\000"
	.byte	2
	.byte	35
	.uleb128	45
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FQuoteChar\000"
	.byte	2
	.byte	35
	.uleb128	46
	.byte	3
	.long	.La86-.Ldebug_info0
	.uleb128	23
	.ascii	"FDelimiter\000"
	.byte	2
	.byte	35
	.uleb128	47
	.byte	3
	.long	.La86-.Ldebug_info0
	.uleb128	23
	.ascii	"FNameValueSeparator\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La86-.Ldebug_info0
	.uleb128	23
	.ascii	"FUpdateCount\000"
	.byte	2
	.byte	35
	.uleb128	52
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FAdapter\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La446-.Ldebug_info0
	.uleb128	23
	.ascii	"FLBS\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La449-.Ldebug_info0
	.uleb128	23
	.ascii	"FOptions\000"
	.byte	2
	.byte	35
	.uleb128	68
	.byte	3
	.long	.La451-.Ldebug_info0
	.uleb128	23
	.ascii	"FLineBreak\000"
	.byte	2
	.byte	35
	.uleb128	72
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"UpdateCount\000"
	.byte	2
	.byte	35
	.uleb128	52
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"AlwaysQuote\000"
	.byte	2
	.byte	35
	.uleb128	45
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"DefaultEncoding\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La441-.Ldebug_info0
	.uleb128	23
	.ascii	"Encoding\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La441-.Ldebug_info0
	.uleb128	23
	.ascii	"Options\000"
	.byte	2
	.byte	35
	.uleb128	68
	.byte	3
	.long	.La451-.Ldebug_info0
	.uleb128	23
	.ascii	"StringsAdapter\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La446-.Ldebug_info0
# Procdef GetCommaText(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	36
	.ascii	"GetCommaText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetLineBreakCharLBS(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	36
	.ascii	"GetLineBreakCharLBS\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetMissingNameValueSeparatorAction(<TStrings>):<enumeration type>;
	.uleb128	36
	.ascii	"GetMissingNameValueSeparatorAction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La444-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetName(<TStrings>;<var AnsiString>;LongInt):AnsiString;
	.uleb128	36
	.ascii	"GetName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetStrictDelimiter(<TStrings>):Boolean;
	.uleb128	36
	.ascii	"GetStrictDelimiter\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetTrailingLineBreak(<TStrings>):Boolean;
	.uleb128	36
	.ascii	"GetTrailingLineBreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetUseLocale(<TStrings>):Boolean;
	.uleb128	36
	.ascii	"GetUseLocale\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetValue(<TStrings>;<var AnsiString>;const AnsiString):AnsiString;
	.uleb128	36
	.ascii	"GetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetWriteBOM(<TStrings>):Boolean;
	.uleb128	36
	.ascii	"GetWriteBOM\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetLBS(<TStrings>):<enumeration type>;
	.uleb128	36
	.ascii	"GetLBS\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La449-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef SetDefaultEncoding(<TStrings>;const TEncoding);
	.uleb128	32
	.ascii	"SetDefaultEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ADEFAULTENCODING
	.uleb128	26
	.ascii	"ADefaultEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef SetEncoding(<TStrings>;const TEncoding);
	.uleb128	32
	.ascii	"SetEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef SetLBS(<TStrings>;TTextLineBreakStyle);
	.uleb128	32
	.ascii	"SetLBS\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La449-.Ldebug_info0
	.byte	0
# Procdef ReadData(<TStrings>;TReader);
	.uleb128	32
	.ascii	"ReadData\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol READER
	.uleb128	26
	.ascii	"Reader\000"
	.long	.La165-.Ldebug_info0
	.byte	0
# Procdef SetCommaText(<TStrings>;const AnsiString);
	.uleb128	32
	.ascii	"SetCommaText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetMissingNameValueSeparatorAction(<TStrings>;TMissingNameValueSeparatorAction);
	.uleb128	32
	.ascii	"SetMissingNameValueSeparatorAction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La444-.Ldebug_info0
	.byte	0
# Procdef SetStringsAdapter(<TStrings>;const IStringsAdapter);
	.uleb128	32
	.ascii	"SetStringsAdapter\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La446-.Ldebug_info0
	.byte	0
# Procdef SetStrictDelimiter(<TStrings>;Boolean);
	.uleb128	32
	.ascii	"SetStrictDelimiter\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetTrailingLineBreak(<TStrings>;Boolean);
	.uleb128	32
	.ascii	"SetTrailingLineBreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetUseLocale(<TStrings>;Boolean);
	.uleb128	32
	.ascii	"SetUseLocale\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetWriteBOM(<TStrings>;Boolean);
	.uleb128	32
	.ascii	"SetWriteBOM\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetValue(<TStrings>;const AnsiString;const AnsiString);
	.uleb128	32
	.ascii	"SetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetDelimiter(<TStrings>;Char);
	.uleb128	32
	.ascii	"SetDelimiter\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol C
	.uleb128	26
	.ascii	"c\000"
	.long	.La86-.Ldebug_info0
	.byte	0
# Procdef SetQuoteChar(<TStrings>;Char);
	.uleb128	32
	.ascii	"SetQuoteChar\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol C
	.uleb128	26
	.ascii	"c\000"
	.long	.La86-.Ldebug_info0
	.byte	0
# Procdef SetNameValueSeparator(<TStrings>;Char);
	.uleb128	32
	.ascii	"SetNameValueSeparator\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol C
	.uleb128	26
	.ascii	"c\000"
	.long	.La86-.Ldebug_info0
	.byte	0
# Procdef WriteData(<TStrings>;TWriter);
	.uleb128	32
	.ascii	"WriteData\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol WRITER
	.uleb128	26
	.ascii	"Writer\000"
	.long	.La168-.Ldebug_info0
	.byte	0
# Procdef DoSetTextStr(<TStrings>;const AnsiString;Boolean);
	.uleb128	32
	.ascii	"DoSetTextStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
# Symbol DOCLEAR
	.uleb128	26
	.ascii	"DoClear\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef GetDelimiter(<TStrings>):Char;
	.uleb128	36
	.ascii	"GetDelimiter\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La86-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetNameValueSeparator(<TStrings>):Char;
	.uleb128	36
	.ascii	"GetNameValueSeparator\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La86-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetQuoteChar(<TStrings>):Char;
	.uleb128	36
	.ascii	"GetQuoteChar\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La86-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetLineBreak(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	36
	.ascii	"GetLineBreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetLineBreak(<TStrings>;const AnsiString);
	.uleb128	32
	.ascii	"SetLineBreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetSkipLastLineBreak(<TStrings>):Boolean;
	.uleb128	36
	.ascii	"GetSkipLastLineBreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef SetSkipLastLineBreak(<TStrings>;const Boolean);
	.uleb128	32
	.ascii	"SetSkipLastLineBreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef DoSetDelimitedText(<TStrings>;const AnsiString;Boolean;Boolean;Char;Char);
	.uleb128	32
	.ascii	"DoSetDelimitedText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La49-.Ldebug_info0
# Symbol DOCLEAR
	.uleb128	26
	.ascii	"DoClear\000"
	.long	.La109-.Ldebug_info0
# Symbol ASTRICTDELIMITER
	.uleb128	26
	.ascii	"aStrictDelimiter\000"
	.long	.La109-.Ldebug_info0
# Symbol AQUOTECHAR
	.uleb128	26
	.ascii	"aQuoteChar\000"
	.long	.La86-.Ldebug_info0
# Symbol ADELIMITER
	.uleb128	26
	.ascii	"aDelimiter\000"
	.long	.La86-.Ldebug_info0
	.byte	0
# Procdef CompareStrings(<TStrings>;const AnsiString;const AnsiString):LongInt;
	.uleb128	33
	.ascii	"CompareStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S1
	.uleb128	26
	.ascii	"s1\000"
	.long	.La49-.Ldebug_info0
# Symbol S2
	.uleb128	26
	.ascii	"s2\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef DefineProperties(<TStrings>;TFiler);
	.uleb128	28
	.ascii	"DefineProperties\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILER
	.uleb128	26
	.ascii	"Filer\000"
	.long	.La171-.Ldebug_info0
	.byte	0
# Procdef Error(<TStrings>;const AnsiString;LongInt);
	.uleb128	32
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Error(<TStrings>;const PAnsiString;LongInt);
	.uleb128	32
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La453-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Get(<TStrings>;<var AnsiString>;LongInt):AnsiString;
	.uleb128	33
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCapacity(<TStrings>):LongInt;
	.uleb128	33
	.ascii	"GetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetCount(<TStrings>):LongInt;
	.uleb128	33
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetObject(<TStrings>;LongInt):TObject;
	.uleb128	33
	.ascii	"GetObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetTextStr(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	33
	.ascii	"GetTextStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Put(<TStrings>;LongInt;const AnsiString);
	.uleb128	28
	.ascii	"Put\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef PutObject(<TStrings>;LongInt;TObject);
	.uleb128	28
	.ascii	"PutObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef SetCapacity(<TStrings>;LongInt);
	.uleb128	28
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetTextStr(<TStrings>;const AnsiString);
	.uleb128	28
	.ascii	"SetTextStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetUpdateState(<TStrings>;Boolean);
	.uleb128	28
	.ascii	"SetUpdateState\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol UPDATING
	.uleb128	26
	.ascii	"Updating\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef DoCompareText(<TStrings>;const AnsiString;const AnsiString):Int64;
	.uleb128	33
	.ascii	"DoCompareText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S1
	.uleb128	26
	.ascii	"s1\000"
	.long	.La49-.Ldebug_info0
# Symbol S2
	.uleb128	26
	.ascii	"s2\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetDelimitedText(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	36
	.ascii	"GetDelimitedText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetDelimitedText(<TStrings>;const AnsiString);
	.uleb128	32
	.ascii	"SetDelimitedText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetValueFromIndex(<TStrings>;<var AnsiString>;LongInt):AnsiString;
	.uleb128	36
	.ascii	"GetValueFromIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetValueFromIndex(<TStrings>;LongInt;const AnsiString);
	.uleb128	32
	.ascii	"SetValueFromIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef CheckSpecialChars(<TStrings>);
	.uleb128	32
	.ascii	"CheckSpecialChars\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef class GetNextLine(<Class Of TStrings>;const AnsiString;var AnsiString;var Int64):Boolean;
	.uleb128	36
	.ascii	"GetNextLine\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La455-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol P
	.uleb128	26
	.ascii	"P\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef GetNextLinebreak(<TStrings>;const AnsiString;var AnsiString;var Int64):Boolean;
	.uleb128	36
	.ascii	"GetNextLinebreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol P
	.uleb128	26
	.ascii	"P\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef class GetNextLine(<Class Of TStrings>;const AnsiString;var AnsiString;var LongInt):Boolean;
	.uleb128	36
	.ascii	"GetNextLine\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La457-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol P
	.uleb128	26
	.ascii	"P\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetNextLinebreak(<TStrings>;const AnsiString;var AnsiString;var LongInt):Boolean;
	.uleb128	36
	.ascii	"GetNextLinebreak\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol VALUE
	.uleb128	26
	.ascii	"Value\000"
	.long	.La49-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol P
	.uleb128	26
	.ascii	"P\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TStrings>;<Class Of TStrings>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La459-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TStrings>;<Class Of TStrings>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La461-.Ldebug_info0
	.byte	0
# Procdef ToObjectArray(<TStrings>;<var TObjectDynArray>;LongInt;LongInt):{Dynamic} Array Of TObject;
	.uleb128	24
	.ascii	"ToObjectArray\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La463-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La463-.Ldebug_info0
# Symbol ASTART
	.uleb128	26
	.ascii	"aStart\000"
	.long	.La66-.Ldebug_info0
# Symbol AEND
	.uleb128	26
	.ascii	"aEnd\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ToObjectArray(<TStrings>;<var TObjectDynArray>):{Dynamic} Array Of TObject;
	.uleb128	24
	.ascii	"ToObjectArray\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La463-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La463-.Ldebug_info0
	.byte	0
# Procdef ToStringArray(<TStrings>;<var TStringDynArray>;LongInt;LongInt):{Dynamic} Array Of AnsiString;
	.uleb128	24
	.ascii	"ToStringArray\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La465-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La465-.Ldebug_info0
# Symbol ASTART
	.uleb128	26
	.ascii	"aStart\000"
	.long	.La66-.Ldebug_info0
# Symbol AEND
	.uleb128	26
	.ascii	"aEnd\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ToStringArray(<TStrings>;<var TStringDynArray>):{Dynamic} Array Of AnsiString;
	.uleb128	24
	.ascii	"ToStringArray\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La465-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La465-.Ldebug_info0
	.byte	0
# Procdef Add(<TStrings>;const AnsiString):LongInt;
	.uleb128	29
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef AddObject(<TStrings>;const AnsiString;TObject):LongInt;
	.uleb128	29
	.ascii	"AddObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Add(<TStrings>;const AnsiString;const Array Of Const;<const Int64>):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FMT
	.uleb128	26
	.ascii	"Fmt\000"
	.long	.La49-.Ldebug_info0
# Symbol ARGS
	.uleb128	26
	.ascii	"Args\000"
	.long	.La467-.Ldebug_info0
# Symbol highARGS
	.uleb128	26
	.ascii	"$highARGS\000"
	.long	.La78-.Ldebug_info0
# Definition Array Of Const
.La467:
	.uleb128	7
	.long	.La469-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.byte	0
.La468:
	.uleb128	9
	.long	.La467-.Ldebug_info0
	.byte	0
# Procdef AddObject(<TStrings>;const AnsiString;Array Of Const;<const Int64>;TObject):LongInt;
	.uleb128	24
	.ascii	"AddObject\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FMT
	.uleb128	26
	.ascii	"Fmt\000"
	.long	.La49-.Ldebug_info0
# Symbol ARGS
	.uleb128	26
	.ascii	"Args\000"
	.long	.La471-.Ldebug_info0
# Symbol highARGS
	.uleb128	26
	.ascii	"$highARGS\000"
	.long	.La78-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
# Definition Array Of Const
.La471:
	.uleb128	7
	.long	.La469-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.byte	0
.La472:
	.uleb128	9
	.long	.La471-.Ldebug_info0
	.byte	0
# Procdef AddPair(<TStrings>;const AnsiString;const AnsiString):TStrings;
	.uleb128	24
	.ascii	"AddPair\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef AddPair(<TStrings>;const AnsiString;const AnsiString;TObject):TStrings;
	.uleb128	24
	.ascii	"AddPair\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La49-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef AddStrings(<TStrings>;TStrings);
	.uleb128	27
	.ascii	"AddStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef AddStrings(<TStrings>;TStrings;Boolean);
	.uleb128	34
	.ascii	"AddStrings\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La369-.Ldebug_info0
# Symbol CLEARFIRST
	.uleb128	26
	.ascii	"ClearFirst\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef AddStrings(<TStrings>;const {Open} Array Of AnsiString;<const Int64>);
	.uleb128	27
	.ascii	"AddStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La473-.Ldebug_info0
# Symbol highTHESTRINGS
	.uleb128	26
	.ascii	"$highTHESTRINGS\000"
	.long	.La78-.Ldebug_info0
# Definition {Open} Array Of AnsiString
.La473:
	.uleb128	7
	.long	.La49-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	8
	.long	.La78-.Ldebug_info0
	.byte	0
.La474:
	.uleb128	9
	.long	.La473-.Ldebug_info0
	.byte	0
# Procdef AddStrings(<TStrings>;const {Open} Array Of AnsiString;<const Int64>;Boolean);
	.uleb128	34
	.ascii	"AddStrings\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La475-.Ldebug_info0
# Symbol highTHESTRINGS
	.uleb128	26
	.ascii	"$highTHESTRINGS\000"
	.long	.La78-.Ldebug_info0
# Symbol CLEARFIRST
	.uleb128	26
	.ascii	"ClearFirst\000"
	.long	.La109-.Ldebug_info0
# Definition {Open} Array Of AnsiString
.La475:
	.uleb128	7
	.long	.La49-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	8
	.long	.La78-.Ldebug_info0
	.byte	0
.La476:
	.uleb128	9
	.long	.La475-.Ldebug_info0
	.byte	0
# Procdef SetStrings(<TStrings>;TStrings);
	.uleb128	27
	.ascii	"SetStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef SetStrings(<TStrings>;{Open} Array Of AnsiString;<const Int64>);
	.uleb128	27
	.ascii	"SetStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La477-.Ldebug_info0
# Symbol highTHESTRINGS
	.uleb128	26
	.ascii	"$highTHESTRINGS\000"
	.long	.La78-.Ldebug_info0
# Definition {Open} Array Of AnsiString
.La477:
	.uleb128	7
	.long	.La49-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	8
	.long	.La78-.Ldebug_info0
	.byte	0
.La478:
	.uleb128	9
	.long	.La477-.Ldebug_info0
	.byte	0
# Procdef AddText(<TStrings>;const AnsiString);
	.uleb128	27
	.ascii	"AddText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef AddCommaText(<TStrings>;const AnsiString);
	.uleb128	34
	.ascii	"AddCommaText\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef AddDelimitedText(<TStrings>;const AnsiString;Char;Boolean);
	.uleb128	34
	.ascii	"AddDelimitedText\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol ADELIMITER
	.uleb128	26
	.ascii	"ADelimiter\000"
	.long	.La86-.Ldebug_info0
# Symbol ASTRICTDELIMITER
	.uleb128	26
	.ascii	"AStrictDelimiter\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef AddDelimitedText(<TStrings>;const AnsiString);
	.uleb128	34
	.ascii	"AddDelimitedText\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Append(<TStrings>;const AnsiString);
	.uleb128	34
	.ascii	"Append\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Assign(<TStrings>;TPersistent);
	.uleb128	27
	.ascii	"Assign\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La150-.Ldebug_info0
	.byte	0
# Procdef BeginUpdate(<TStrings>);
	.uleb128	34
	.ascii	"BeginUpdate\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Clear(<TStrings>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	392
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Delete(<TStrings>;LongInt);
	.uleb128	27
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef EndUpdate(<TStrings>);
	.uleb128	34
	.ascii	"EndUpdate\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Equals(<TStrings>;TObject):Boolean;
	.uleb128	29
	.ascii	"Equals\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	176
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"Obj\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Equals(<TStrings>;TStrings):Boolean;
	.uleb128	24
	.ascii	"Equals\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THESTRINGS
	.uleb128	26
	.ascii	"TheStrings\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Exchange(<TStrings>;LongInt;LongInt);
	.uleb128	27
	.ascii	"Exchange\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	408
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ExtractName(<TStrings>;<var AnsiString>;const AnsiString):AnsiString;
	.uleb128	24
	.ascii	"ExtractName\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Filter(<TStrings>;TStringsFilterMethod;TStrings);
	.uleb128	34
	.ascii	"Filter\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AFILTER
	.uleb128	26
	.ascii	"aFilter\000"
	.long	.La479-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"aList\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Filter(<TStrings>;TStringsFilterMethod):TStrings;
	.uleb128	24
	.ascii	"Filter\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AFILTER
	.uleb128	26
	.ascii	"aFilter\000"
	.long	.La479-.Ldebug_info0
	.byte	0
# Procdef Fill(<TStrings>;const AnsiString;LongInt;LongInt);
	.uleb128	34
	.ascii	"Fill\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"aValue\000"
	.long	.La49-.Ldebug_info0
# Symbol ASTART
	.uleb128	26
	.ascii	"aStart\000"
	.long	.La66-.Ldebug_info0
# Symbol AEND
	.uleb128	26
	.ascii	"aEnd\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ForEach(<TStrings>;TStringsForEachMethod);
	.uleb128	34
	.ascii	"ForEach\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ACALLBACK
	.uleb128	26
	.ascii	"aCallback\000"
	.long	.La481-.Ldebug_info0
	.byte	0
# Procdef ForEach(<TStrings>;TStringsForEachMethodEx);
	.uleb128	34
	.ascii	"ForEach\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ACALLBACK
	.uleb128	26
	.ascii	"aCallback\000"
	.long	.La483-.Ldebug_info0
	.byte	0
# Procdef ForEach(<TStrings>;TStringsForEachMethodExObj);
	.uleb128	34
	.ascii	"ForEach\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ACALLBACK
	.uleb128	26
	.ascii	"aCallback\000"
	.long	.La485-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TStrings>):TStringsEnumerator;
	.uleb128	24
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La487-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetNameValue(<TStrings>;LongInt;out AnsiString;out AnsiString);
	.uleb128	34
	.ascii	"GetNameValue\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetText(<TStrings>):^Char;
	.uleb128	29
	.ascii	"GetText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La490-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TStrings>;const AnsiString):LongInt;
	.uleb128	29
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	424
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TStrings>;const AnsiString;LongInt):LongInt;
	.uleb128	29
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	432
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol ASTART
	.uleb128	26
	.ascii	"aStart\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef IndexOfName(<TStrings>;const AnsiString):LongInt;
	.uleb128	29
	.ascii	"IndexOfName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	440
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"Name\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef IndexOfObject(<TStrings>;TObject):LongInt;
	.uleb128	29
	.ascii	"IndexOfObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	448
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Insert(<TStrings>;LongInt;const AnsiString);
	.uleb128	27
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	456
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef InsertObject(<TStrings>;LongInt;const AnsiString;TObject);
	.uleb128	34
	.ascii	"InsertObject\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef LastIndexOf(<TStrings>;const AnsiString;LongInt):LongInt;
	.uleb128	29
	.ascii	"LastIndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	464
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol ASTART
	.uleb128	26
	.ascii	"aStart\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef LastIndexOf(<TStrings>;const AnsiString):LongInt;
	.uleb128	24
	.ascii	"LastIndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef LoadFromFile(<TStrings>;const AnsiString);
	.uleb128	27
	.ascii	"LoadFromFile\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	472
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef LoadFromFile(<TStrings>;const AnsiString;Boolean);
	.uleb128	34
	.ascii	"LoadFromFile\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
# Symbol IGNOREENCODING
	.uleb128	26
	.ascii	"IgnoreEncoding\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef LoadFromFile(<TStrings>;const AnsiString;TEncoding);
	.uleb128	27
	.ascii	"LoadFromFile\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	480
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef LoadFromStream(<TStrings>;TStream);
	.uleb128	27
	.ascii	"LoadFromStream\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	488
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef LoadFromStream(<TStrings>;TStream;Boolean);
	.uleb128	34
	.ascii	"LoadFromStream\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol IGNOREENCODING
	.uleb128	26
	.ascii	"IgnoreEncoding\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef LoadFromStream(<TStrings>;TStream;TEncoding);
	.uleb128	27
	.ascii	"LoadFromStream\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	496
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef Map(<TStrings>;TStringsMapMethod;TStrings);
	.uleb128	34
	.ascii	"Map\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AMAP
	.uleb128	26
	.ascii	"aMap\000"
	.long	.La492-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"aList\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Map(<TStrings>;TStringsMapMethod):TStrings;
	.uleb128	24
	.ascii	"Map\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol AMAP
	.uleb128	26
	.ascii	"aMap\000"
	.long	.La492-.Ldebug_info0
	.byte	0
# Procdef Move(<TStrings>;LongInt;LongInt);
	.uleb128	27
	.ascii	"Move\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	504
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol CURINDEX
	.uleb128	26
	.ascii	"CurIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol NEWINDEX
	.uleb128	26
	.ascii	"NewIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Pop(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"Pop\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Reduce(<TStrings>;<var AnsiString>;TStringsReduceMethod;const AnsiString):AnsiString;
	.uleb128	24
	.ascii	"Reduce\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol AREDUCEMETHOD
	.uleb128	26
	.ascii	"aReduceMethod\000"
	.long	.La494-.Ldebug_info0
# Symbol STARTINGVALUE
	.uleb128	26
	.ascii	"startingValue\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Reverse(<TStrings>):TStrings;
	.uleb128	24
	.ascii	"Reverse\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Reverse(<TStrings>;TStrings);
	.uleb128	34
	.ascii	"Reverse\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"aList\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef SaveToFile(<TStrings>;const AnsiString);
	.uleb128	27
	.ascii	"SaveToFile\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	512
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SaveToFile(<TStrings>;const AnsiString;Boolean);
	.uleb128	34
	.ascii	"SaveToFile\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
# Symbol IGNOREENCODING
	.uleb128	26
	.ascii	"IgnoreEncoding\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SaveToFile(<TStrings>;const AnsiString;TEncoding);
	.uleb128	27
	.ascii	"SaveToFile\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	520
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef SaveToStream(<TStrings>;TStream);
	.uleb128	27
	.ascii	"SaveToStream\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	528
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef SaveToStream(<TStrings>;TStream;Boolean);
	.uleb128	34
	.ascii	"SaveToStream\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol IGNOREENCODING
	.uleb128	26
	.ascii	"IgnoreEncoding\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SaveToStream(<TStrings>;TStream;TEncoding);
	.uleb128	27
	.ascii	"SaveToStream\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	536
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef Shift(<TStrings>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"Shift\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Slice(<TStrings>;LongInt;TStrings);
	.uleb128	34
	.ascii	"Slice\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FROMINDEX
	.uleb128	26
	.ascii	"fromIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol ALIST
	.uleb128	26
	.ascii	"aList\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef Slice(<TStrings>;LongInt):TStrings;
	.uleb128	24
	.ascii	"Slice\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol FROMINDEX
	.uleb128	26
	.ascii	"fromIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetText(<TStrings>;PChar);
	.uleb128	27
	.ascii	"SetText\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	544
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La369-.Ldebug_info0
# Symbol THETEXT
	.uleb128	26
	.ascii	"TheText\000"
	.long	.La490-.Ldebug_info0
	.byte	0
	.byte	0
.La370:
	.uleb128	9
	.long	.La369-.Ldebug_info0
# Definition IStringsAdapter
.La446:
	.uleb128	11
	.ascii	"IStringsAdapter\000"
	.long	.La496-.Ldebug_info0
.La496:
	.uleb128	45
	.ascii	"IStringsAdapter\000"
	.uleb128	0
	.byte	2
	.byte	151
	.byte	6
	.byte	2
	.byte	151
	.byte	6
	.uleb128	46
	.long	.La162-.Ldebug_info0
	.byte	0
.La447:
	.uleb128	9
	.long	.La446-.Ldebug_info0
# Definition TStringsEnumerator
.La487:
	.uleb128	11
	.ascii	"TStringsEnumerator\000"
	.long	.La497-.Ldebug_info0
.La497:
	.uleb128	20
	.long	.La489-.Ldebug_info0
.La489:
	.uleb128	21
	.ascii	"TStringsEnumerator\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FStrings\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La369-.Ldebug_info0
	.uleb128	23
	.ascii	"FPosition\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
# Procdef constructor Create(<TStringsEnumerator>;<Class Of TStringsEnumerator>;TStrings);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La487-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La487-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La498-.Ldebug_info0
# Symbol ASTRINGS
	.uleb128	26
	.ascii	"AStrings\000"
	.long	.La369-.Ldebug_info0
	.byte	0
# Procdef GetCurrent(<TStringsEnumerator>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"GetCurrent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La487-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef MoveNext(<TStringsEnumerator>):Boolean;
	.uleb128	24
	.ascii	"MoveNext\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La487-.Ldebug_info0
	.byte	0
	.byte	0
.La488:
	.uleb128	9
	.long	.La487-.Ldebug_info0
# Definition <procedure variable type of function(const AnsiString):Boolean of object;Register>
.La479:
	.uleb128	11
	.ascii	"TStringsFilterMethod\000"
	.long	.La500-.Ldebug_info0
.La500:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La501-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La501:
	.uleb128	43
	.ascii	"TStringsFilterMethod\000"
	.byte	1
	.long	.La109-.Ldebug_info0
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"s\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La480:
	.uleb128	9
	.long	.La479-.Ldebug_info0
# Definition <procedure variable type of function(const AnsiString;const AnsiString):AnsiString of object;Register>
.La494:
	.uleb128	11
	.ascii	"TStringsReduceMethod\000"
	.long	.La502-.Ldebug_info0
.La502:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La503-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La503:
	.uleb128	43
	.ascii	"TStringsReduceMethod\000"
	.byte	1
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"s1\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"s2\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La495:
	.uleb128	9
	.long	.La494-.Ldebug_info0
# Definition <procedure variable type of function(const AnsiString):AnsiString of object;Register>
.La492:
	.uleb128	11
	.ascii	"TStringsMapMethod\000"
	.long	.La504-.Ldebug_info0
.La504:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La505-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La505:
	.uleb128	43
	.ascii	"TStringsMapMethod\000"
	.byte	1
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"s\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La493:
	.uleb128	9
	.long	.La492-.Ldebug_info0
# Definition <procedure variable type of procedure(const AnsiString;const LongInt;TObject) of object;Register>
.La485:
	.uleb128	11
	.ascii	"TStringsForEachMethodExObj\000"
	.long	.La506-.Ldebug_info0
.La506:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La507-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La507:
	.uleb128	42
	.ascii	"TStringsForEachMethodExObj\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"CurrentValue\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"index\000"
	.long	.La66-.Ldebug_info0
	.uleb128	26
	.ascii	"Obj\000"
	.long	.La143-.Ldebug_info0
	.byte	0
.La486:
	.uleb128	9
	.long	.La485-.Ldebug_info0
# Definition <procedure variable type of procedure(const AnsiString;const LongInt) of object;Register>
.La483:
	.uleb128	11
	.ascii	"TStringsForEachMethodEx\000"
	.long	.La508-.Ldebug_info0
.La508:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La509-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La509:
	.uleb128	42
	.ascii	"TStringsForEachMethodEx\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"CurrentValue\000"
	.long	.La49-.Ldebug_info0
	.uleb128	26
	.ascii	"index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
.La484:
	.uleb128	9
	.long	.La483-.Ldebug_info0
# Definition <procedure variable type of procedure(const AnsiString) of object;Register>
.La481:
	.uleb128	11
	.ascii	"TStringsForEachMethod\000"
	.long	.La510-.Ldebug_info0
.La510:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La511-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La511:
	.uleb128	42
	.ascii	"TStringsForEachMethod\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"CurrentValue\000"
	.long	.La49-.Ldebug_info0
	.byte	0
.La482:
	.uleb128	9
	.long	.La481-.Ldebug_info0
# Definition TMissingNameValueSeparatorAction
.La444:
	.uleb128	11
	.ascii	"TMissingNameValueSeparatorAction\000"
	.long	.La512-.Ldebug_info0
.La512:
	.uleb128	30
	.ascii	"TMissingNameValueSeparatorAction\000"
	.byte	4
	.uleb128	31
	.ascii	"mnvaValue\000"
	.long	0
	.uleb128	31
	.ascii	"mnvaName\000"
	.long	1
	.uleb128	31
	.ascii	"mnvaEmpty\000"
	.long	2
	.uleb128	31
	.ascii	"mnvaError\000"
	.long	3
	.byte	0
.La445:
	.uleb128	9
	.long	.La444-.Ldebug_info0
# Definition TStringsOptions
.La451:
	.uleb128	11
	.ascii	"TStringsOptions\000"
	.long	.La513-.Ldebug_info0
.La513:
	.uleb128	39
	.ascii	"TStringsOptions\000"
	.short	4
	.long	.La514-.Ldebug_info0
.La514:
	.uleb128	40
	.sleb128	0
	.sleb128	4
	.long	.La515-.Ldebug_info0
.La452:
	.uleb128	9
	.long	.La451-.Ldebug_info0
# Definition TStringItem
.La387:
	.uleb128	11
	.ascii	"TStringItem\000"
	.long	.La517-.Ldebug_info0
.La517:
	.uleb128	16
	.ascii	"TSTRINGITEM\000"
	.uleb128	16
	.uleb128	17
	.ascii	"FString\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La49-.Ldebug_info0
	.uleb128	17
	.ascii	"FObject\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La388:
	.uleb128	9
	.long	.La387-.Ldebug_info0
# Definition TMemoryStream
.La401:
	.uleb128	11
	.ascii	"TMemoryStream\000"
	.long	.La518-.Ldebug_info0
.La518:
	.uleb128	20
	.long	.La403-.Ldebug_info0
.La403:
	.uleb128	21
	.ascii	"TMemoryStream\000"
	.uleb128	40
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La521-.Ldebug_info0
	.uleb128	23
	.ascii	"FCapacity\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La78-.Ldebug_info0
	.uleb128	23
	.ascii	"Capacity\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La78-.Ldebug_info0
# Procdef SetCapacity(<TMemoryStream>;Int64);
	.uleb128	32
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Realloc(<TMemoryStream>;var Int64):^untyped;
	.uleb128	33
	.ascii	"Realloc\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TMemoryStream>;<Class Of TMemoryStream>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La522-.Ldebug_info0
	.byte	0
# Procdef Clear(<TMemoryStream>);
	.uleb128	34
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
	.byte	0
# Procdef LoadFromStream(<TMemoryStream>;TStream);
	.uleb128	34
	.ascii	"LoadFromStream\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef LoadFromFile(<TMemoryStream>;const AnsiString);
	.uleb128	34
	.ascii	"LoadFromFile\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetSize(<TMemoryStream>;const Int64);
	.uleb128	27
	.ascii	"SetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol NEWSIZE
	.uleb128	26
	.ascii	"NewSize\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Write(<TMemoryStream>;const <Formal type>;LongInt):LongInt;
	.uleb128	29
	.ascii	"Write\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La401-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
	.byte	0
.La402:
	.uleb128	9
	.long	.La401-.Ldebug_info0
# Definition TFilerFlags
.La399:
	.uleb128	11
	.ascii	"TFilerFlags\000"
	.long	.La524-.Ldebug_info0
.La524:
	.uleb128	39
	.ascii	"TFilerFlags\000"
	.short	4
	.long	.La525-.Ldebug_info0
.La525:
	.uleb128	40
	.sleb128	0
	.sleb128	2
	.long	.La526-.Ldebug_info0
.La400:
	.uleb128	9
	.long	.La399-.Ldebug_info0
# Definition TStringsOption
.La515:
	.uleb128	11
	.ascii	"TStringsOption\000"
	.long	.La528-.Ldebug_info0
.La528:
	.uleb128	30
	.ascii	"TStringsOption\000"
	.byte	4
	.uleb128	31
	.ascii	"soStrictDelimiter\000"
	.long	0
	.uleb128	31
	.ascii	"soWriteBOM\000"
	.long	1
	.uleb128	31
	.ascii	"soTrailingLineBreak\000"
	.long	2
	.uleb128	31
	.ascii	"soUseLocale\000"
	.long	3
	.uleb128	31
	.ascii	"soPreserveBOM\000"
	.long	4
	.byte	0
.La516:
	.uleb128	9
	.long	.La515-.Ldebug_info0
# Definition TCustomMemoryStream
.La519:
	.uleb128	11
	.ascii	"TCustomMemoryStream\000"
	.long	.La529-.Ldebug_info0
.La529:
	.uleb128	20
	.long	.La521-.Ldebug_info0
.La521:
	.uleb128	21
	.ascii	"TCustomMemoryStream\000"
	.uleb128	32
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La134-.Ldebug_info0
	.uleb128	23
	.ascii	"FMemory\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La156-.Ldebug_info0
	.uleb128	23
	.ascii	"FSize\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La78-.Ldebug_info0
	.uleb128	23
	.ascii	"FPosition\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La78-.Ldebug_info0
	.uleb128	23
	.ascii	"Memory\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La156-.Ldebug_info0
# Procdef GetSize(<TCustomMemoryStream>):Int64;
	.uleb128	33
	.ascii	"GetSize\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
	.byte	0
# Procdef GetPosition(<TCustomMemoryStream>):Int64;
	.uleb128	33
	.ascii	"GetPosition\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
	.byte	0
# Procdef SetPointer(<TCustomMemoryStream>;Pointer;Int64);
	.uleb128	32
	.ascii	"SetPointer\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
# Symbol PTR
	.uleb128	26
	.ascii	"Ptr\000"
	.long	.La156-.Ldebug_info0
# Symbol ASIZE
	.uleb128	26
	.ascii	"ASize\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Read(<TCustomMemoryStream>;var <Formal type>;LongInt):LongInt;
	.uleb128	29
	.ascii	"Read\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La137-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Seek(<TCustomMemoryStream>;const Int64;TSeekOrigin):Int64;
	.uleb128	29
	.ascii	"Seek\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
# Symbol OFFSET
	.uleb128	26
	.ascii	"Offset\000"
	.long	.La78-.Ldebug_info0
# Symbol ORIGIN
	.uleb128	26
	.ascii	"Origin\000"
	.long	.La139-.Ldebug_info0
	.byte	0
# Procdef SaveToStream(<TCustomMemoryStream>;TStream);
	.uleb128	34
	.ascii	"SaveToStream\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
# Symbol STREAM
	.uleb128	26
	.ascii	"Stream\000"
	.long	.La132-.Ldebug_info0
	.byte	0
# Procdef SaveToFile(<TCustomMemoryStream>;const AnsiString);
	.uleb128	34
	.ascii	"SaveToFile\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La519-.Ldebug_info0
# Symbol FILENAME
	.uleb128	26
	.ascii	"FileName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
	.byte	0
.La520:
	.uleb128	9
	.long	.La519-.Ldebug_info0
# Definition TFilerFlag
.La526:
	.uleb128	11
	.ascii	"TFilerFlag\000"
	.long	.La530-.Ldebug_info0
.La530:
	.uleb128	30
	.ascii	"TFilerFlag\000"
	.byte	4
	.uleb128	31
	.ascii	"ffInherited\000"
	.long	0
	.uleb128	31
	.ascii	"ffChildPos\000"
	.long	1
	.uleb128	31
	.ascii	"ffInline\000"
	.long	2
	.byte	0
.La527:
	.uleb128	9
	.long	.La526-.Ldebug_info0
# Defs - End unit CLASSES has index 19
# Defs - Begin unit CONTNRS has index 21
# Defs - End unit CONTNRS has index 21
# Defs - Begin unit FPJSON has index 17
# Definition TJSONData
.La63:
	.uleb128	11
	.ascii	"TJSONData\000"
	.long	.La531-.Ldebug_info0
.La531:
	.uleb128	20
	.long	.La65-.Ldebug_info0
.La65:
	.uleb128	21
	.ascii	"TJSONData\000"
	.uleb128	8
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
# Procdef class DetermineElementSeparators(<Class Of TJSONData>);
	.uleb128	32
	.ascii	"DetermineElementSeparators\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La532-.Ldebug_info0
	.byte	0
# Procdef class GetCompressedJSON:Boolean; Static;
	.uleb128	36
	.ascii	"GetCompressedJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef class SetCompressedJSON(Boolean); Static;
	.uleb128	32
	.ascii	"SetCompressedJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef class DoError(<Class Of TJSONData>;const AnsiString);
	.uleb128	32
	.ascii	"DoError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La534-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef class DoError(<Class Of TJSONData>;const AnsiString;const Array Of Const;<const Int64>);
	.uleb128	32
	.ascii	"DoError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La536-.Ldebug_info0
# Symbol FMT
	.uleb128	26
	.ascii	"Fmt\000"
	.long	.La49-.Ldebug_info0
# Symbol ARGS
	.uleb128	26
	.ascii	"Args\000"
	.long	.La538-.Ldebug_info0
# Symbol highARGS
	.uleb128	26
	.ascii	"$highARGS\000"
	.long	.La78-.Ldebug_info0
# Definition Array Of Const
.La538:
	.uleb128	7
	.long	.La469-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.byte	0
.La539:
	.uleb128	9
	.long	.La538-.Ldebug_info0
	.byte	0
# Procdef DoFindPath(<TJSONData>;const UTF8String;out UTF8String):TJSONData;
	.uleb128	33
	.ascii	"DoFindPath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol APATH
	.uleb128	26
	.ascii	"APath\000"
	.long	.La540-.Ldebug_info0
# Symbol NOTFOUND
	.uleb128	26
	.ascii	"NotFound\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetAsBoolean(<TJSONData>):Boolean;
	.uleb128	33
	.ascii	"GetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetAsFloat(<TJSONData>):Double;
	.uleb128	33
	.ascii	"GetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetAsInteger(<TJSONData>):LongInt;
	.uleb128	33
	.ascii	"GetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetIsNull(<TJSONData>):Boolean;
	.uleb128	33
	.ascii	"GetIsNull\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetAsInt64(<TJSONData>):Int64;
	.uleb128	33
	.ascii	"GetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetAsQWord(<TJSONData>):QWord;
	.uleb128	33
	.ascii	"GetAsQWord\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetAsUnicodeString(<TJSONData>;<var UnicodeString>):UnicodeString;
	.uleb128	33
	.ascii	"GetAsUnicodeString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef SetAsInt64(<TJSONData>;const Int64);
	.uleb128	28
	.ascii	"SetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetAsQword(<TJSONData>;const QWord);
	.uleb128	28
	.ascii	"SetAsQword\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetAsUnicodeString(<TJSONData>;const UnicodeString);
	.uleb128	28
	.ascii	"SetAsUnicodeString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef SetAsBoolean(<TJSONData>;const Boolean);
	.uleb128	28
	.ascii	"SetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetAsFloat(<TJSONData>;const Double);
	.uleb128	28
	.ascii	"SetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetAsInteger(<TJSONData>;const LongInt);
	.uleb128	28
	.ascii	"SetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAsJSON(<TJSONData>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetAsString(<TJSONData>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef SetAsString(<TJSONData>;const UTF8String);
	.uleb128	28
	.ascii	"SetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetValue(<TJSONData>;<var Variant>):Variant;
	.uleb128	33
	.ascii	"GetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.byte	2
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef SetValue(<TJSONData>;const Variant);
	.uleb128	28
	.ascii	"SetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef GetItem(<TJSONData>;LongInt):TJSONData;
	.uleb128	33
	.ascii	"GetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
	.byte	2
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetItem(<TJSONData>;LongInt;const TJSONData);
	.uleb128	28
	.ascii	"SetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef DoFormatJSON(<TJSONData>;<var UTF8String>;TFormatOptions;LongInt;LongInt):AnsiString;
	.uleb128	33
	.ascii	"DoFormatJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol OPTIONS
	.uleb128	26
	.ascii	"Options\000"
	.long	.La542-.Ldebug_info0
# Symbol CURRENTINDENT
	.uleb128	26
	.ascii	"CurrentIndent\000"
	.long	.La66-.Ldebug_info0
# Symbol INDENT
	.uleb128	26
	.ascii	"Indent\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCount(<TJSONData>):LongInt;
	.uleb128	33
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef class JSONType(<Class Of TJSONData>):<enumeration type>;
	.uleb128	29
	.ascii	"JSONType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
	.long	.La544-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La546-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONData>;<Class Of TJSONData>);
	.uleb128	29
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	392
	.byte	34
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La548-.Ldebug_info0
	.byte	0
# Procdef Clear(<TJSONData>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef DumpJSON(<TJSONData>;TMemoryStream);
	.uleb128	34
	.ascii	"DumpJSON\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La401-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TJSONData>):TBaseJSONEnumerator;
	.uleb128	29
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	408
	.byte	34
	.long	.La550-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef FindPath(<TJSONData>;const UTF8String):TJSONData;
	.uleb128	24
	.ascii	"FindPath\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol APATH
	.uleb128	26
	.ascii	"APath\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetPath(<TJSONData>;const UTF8String):TJSONData;
	.uleb128	24
	.ascii	"GetPath\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol APATH
	.uleb128	26
	.ascii	"APath\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef Clone(<TJSONData>):TJSONData;
	.uleb128	29
	.ascii	"Clone\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef FormatJSON(<TJSONData>;<var UTF8String>;TFormatOptions=`<set>`;LongInt=`2`):AnsiString;
	.uleb128	24
	.ascii	"FormatJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol OPTIONS
	.uleb128	26
	.ascii	"Options\000"
	.long	.La542-.Ldebug_info0
# Symbol INDENTSIZE
	.uleb128	26
	.ascii	"Indentsize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
	.byte	0
.La64:
	.uleb128	9
	.long	.La63-.Ldebug_info0
# Definition TBaseJSONEnumerator
.La550:
	.uleb128	11
	.ascii	"TBaseJSONEnumerator\000"
	.long	.La553-.Ldebug_info0
.La553:
	.uleb128	20
	.long	.La552-.Ldebug_info0
.La552:
	.uleb128	21
	.ascii	"TBaseJSONEnumerator\000"
	.uleb128	8
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
# Procdef GetCurrent(<TBaseJSONEnumerator>;<var TJSONEnum>):<record type>;
	.uleb128	29
	.ascii	"GetCurrent\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.long	.La554-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La550-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La554-.Ldebug_info0
	.byte	0
# Procdef MoveNext(<TBaseJSONEnumerator>):Boolean;
	.uleb128	29
	.ascii	"MoveNext\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La550-.Ldebug_info0
	.byte	0
	.byte	0
.La551:
	.uleb128	9
	.long	.La550-.Ldebug_info0
# Definition TJSONObject
.La51:
	.uleb128	11
	.ascii	"TJSONObject\000"
	.long	.La556-.Ldebug_info0
.La556:
	.uleb128	20
	.long	.La53-.Ldebug_info0
.La53:
	.uleb128	21
	.ascii	"TJSONObject\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La65-.Ldebug_info0
	.uleb128	23
	.ascii	"FHash\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La557-.Ldebug_info0
# Procdef DoAdd(<TJSONObject>;const UTF8String;TJSONData;Boolean=`TRUE`):LongInt;
	.uleb128	36
	.ascii	"DoAdd\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
# Symbol FREEONERROR
	.uleb128	26
	.ascii	"FreeOnError\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef class DetermineElementQuotes(<Class Of TJSONObject>);
	.uleb128	32
	.ascii	"DetermineElementQuotes\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La560-.Ldebug_info0
	.byte	0
# Procdef GetArrays(<TJSONObject>;const AnsiString):TJSONArray;
	.uleb128	36
	.ascii	"GetArrays\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La54-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetBooleans(<TJSONObject>;const AnsiString):Boolean;
	.uleb128	36
	.ascii	"GetBooleans\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetElements(<TJSONObject>;const AnsiString):TJSONData;
	.uleb128	36
	.ascii	"GetElements\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetFloats(<TJSONObject>;const AnsiString):Double;
	.uleb128	36
	.ascii	"GetFloats\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetIntegers(<TJSONObject>;const AnsiString):LongInt;
	.uleb128	36
	.ascii	"GetIntegers\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetIsNull(<TJSONObject>;const AnsiString):Boolean;
	.uleb128	36
	.ascii	"GetIsNull\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetNameOf(<TJSONObject>;<var UTF8String>;LongInt):AnsiString;
	.uleb128	36
	.ascii	"GetNameOf\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetObjects(<TJSONObject>;const AnsiString):TJSONObject;
	.uleb128	36
	.ascii	"GetObjects\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La51-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetStrings(<TJSONObject>;<var UTF8String>;const AnsiString):AnsiString;
	.uleb128	36
	.ascii	"GetStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetTypes(<TJSONObject>;const AnsiString):<enumeration type>;
	.uleb128	36
	.ascii	"GetTypes\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La544-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetArrays(<TJSONObject>;const AnsiString;const TJSONArray);
	.uleb128	32
	.ascii	"SetArrays\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef SetBooleans(<TJSONObject>;const AnsiString;const Boolean);
	.uleb128	32
	.ascii	"SetBooleans\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetElements(<TJSONObject>;const AnsiString;const TJSONData);
	.uleb128	32
	.ascii	"SetElements\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef SetFloats(<TJSONObject>;const AnsiString;const Double);
	.uleb128	32
	.ascii	"SetFloats\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetIntegers(<TJSONObject>;const AnsiString;const LongInt);
	.uleb128	32
	.ascii	"SetIntegers\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetInt64s(<TJSONObject>;const AnsiString):Int64;
	.uleb128	36
	.ascii	"GetInt64s\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetUnicodeStrings(<TJSONObject>;<var UnicodeString>;const AnsiString):UnicodeString;
	.uleb128	36
	.ascii	"GetUnicodeStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetQWords(<TJSONObject>;AnsiString):QWord;
	.uleb128	36
	.ascii	"GetQWords\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef SetInt64s(<TJSONObject>;const AnsiString;const Int64);
	.uleb128	32
	.ascii	"SetInt64s\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetQWords(<TJSONObject>;AnsiString;QWord);
	.uleb128	32
	.ascii	"SetQWords\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetUnicodeStrings(<TJSONObject>;const AnsiString;const UnicodeString);
	.uleb128	32
	.ascii	"SetUnicodeStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef SetIsNull(<TJSONObject>;const AnsiString;const Boolean);
	.uleb128	32
	.ascii	"SetIsNull\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetObjects(<TJSONObject>;const AnsiString;const TJSONObject);
	.uleb128	32
	.ascii	"SetObjects\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef SetStrings(<TJSONObject>;const AnsiString;const UTF8String);
	.uleb128	32
	.ascii	"SetStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef class GetUnquotedMemberNames:Boolean; Static;
	.uleb128	36
	.ascii	"GetUnquotedMemberNames\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef class SetUnquotedMemberNames(Boolean); Static;
	.uleb128	32
	.ascii	"SetUnquotedMemberNames\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef DoFindPath(<TJSONObject>;const UTF8String;out UTF8String):TJSONData;
	.uleb128	33
	.ascii	"DoFindPath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol APATH
	.uleb128	26
	.ascii	"APath\000"
	.long	.La540-.Ldebug_info0
# Symbol NOTFOUND
	.uleb128	26
	.ascii	"NotFound\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef Converterror(<TJSONObject>;Boolean);
	.uleb128	32
	.ascii	"Converterror\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol FROM
	.uleb128	26
	.ascii	"From\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef GetAsBoolean(<TJSONObject>):Boolean;
	.uleb128	33
	.ascii	"GetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef GetAsFloat(<TJSONObject>):Double;
	.uleb128	33
	.ascii	"GetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef GetAsInteger(<TJSONObject>):LongInt;
	.uleb128	33
	.ascii	"GetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef GetAsInt64(<TJSONObject>):Int64;
	.uleb128	33
	.ascii	"GetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef GetAsQWord(<TJSONObject>):QWord;
	.uleb128	33
	.ascii	"GetAsQWord\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef SetAsInt64(<TJSONObject>;const Int64);
	.uleb128	28
	.ascii	"SetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetAsQword(<TJSONObject>;const QWord);
	.uleb128	28
	.ascii	"SetAsQword\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetAsBoolean(<TJSONObject>;const Boolean);
	.uleb128	28
	.ascii	"SetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetAsFloat(<TJSONObject>;const Double);
	.uleb128	28
	.ascii	"SetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetAsInteger(<TJSONObject>;const LongInt);
	.uleb128	28
	.ascii	"SetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAsJSON(<TJSONObject>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetAsString(<TJSONObject>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef SetAsString(<TJSONObject>;const UTF8String);
	.uleb128	28
	.ascii	"SetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetValue(<TJSONObject>;<var Variant>):Variant;
	.uleb128	33
	.ascii	"GetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.byte	2
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef SetValue(<TJSONObject>;const Variant);
	.uleb128	28
	.ascii	"SetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef GetCount(<TJSONObject>):LongInt;
	.uleb128	33
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef GetItem(<TJSONObject>;LongInt):TJSONData;
	.uleb128	33
	.ascii	"GetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
	.byte	2
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetItem(<TJSONObject>;LongInt;const TJSONData);
	.uleb128	28
	.ascii	"SetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef DoFormatJSON(<TJSONObject>;<var UTF8String>;TFormatOptions;LongInt;LongInt):AnsiString;
	.uleb128	33
	.ascii	"DoFormatJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol OPTIONS
	.uleb128	26
	.ascii	"Options\000"
	.long	.La542-.Ldebug_info0
# Symbol CURRENTINDENT
	.uleb128	26
	.ascii	"CurrentIndent\000"
	.long	.La66-.Ldebug_info0
# Symbol INDENT
	.uleb128	26
	.ascii	"Indent\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONObject>;<Class Of TJSONObject>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La562-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONObject>;<Class Of TJSONObject>;const Array Of Const;<const Int64>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La564-.Ldebug_info0
# Symbol ELEMENTS
	.uleb128	26
	.ascii	"Elements\000"
	.long	.La566-.Ldebug_info0
# Symbol highELEMENTS
	.uleb128	26
	.ascii	"$highELEMENTS\000"
	.long	.La78-.Ldebug_info0
# Definition Array Of Const
.La566:
	.uleb128	7
	.long	.La469-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.byte	0
.La567:
	.uleb128	9
	.long	.La566-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TJSONObject>;<Class Of TJSONObject>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La568-.Ldebug_info0
	.byte	0
# Procdef class JSONType(<Class Of TJSONObject>):<enumeration type>;
	.uleb128	29
	.ascii	"JSONType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
	.long	.La544-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La570-.Ldebug_info0
	.byte	0
# Procdef Clone(<TJSONObject>):TJSONData;
	.uleb128	29
	.ascii	"Clone\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TJSONObject>):TBaseJSONEnumerator;
	.uleb128	29
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	408
	.byte	34
	.long	.La550-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef Iterate(<TJSONObject>;TJSONObjectIterator;TObject);
	.uleb128	34
	.ascii	"Iterate\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ITERATOR
	.uleb128	26
	.ascii	"Iterator\000"
	.long	.La572-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TJSONObject>;TJSONData):LongInt;
	.uleb128	24
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef IndexOfName(<TJSONObject>;const UTF8String;Boolean=`FALSE`):LongInt;
	.uleb128	24
	.ascii	"IndexOfName\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol CASEINSENSITIVE
	.uleb128	26
	.ascii	"CaseInsensitive\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const AnsiString):TJSONData;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const AnsiString;TJSONtype):TJSONData;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ATYPE
	.uleb128	26
	.ascii	"AType\000"
	.long	.La544-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const UTF8String;out TJSONData):Boolean;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol KEY
	.uleb128	26
	.ascii	"key\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const UTF8String;out TJSONObject):Boolean;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol KEY
	.uleb128	26
	.ascii	"key\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const UTF8String;out TJSONArray):Boolean;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol KEY
	.uleb128	26
	.ascii	"key\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const UTF8String;out TJSONString):Boolean;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol KEY
	.uleb128	26
	.ascii	"key\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const UTF8String;out TJSONBoolean):Boolean;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol KEY
	.uleb128	26
	.ascii	"key\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef Find(<TJSONObject>;const UTF8String;out TJSONNumber):Boolean;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol KEY
	.uleb128	26
	.ascii	"key\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La580-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;<var Variant>;const AnsiString):Variant;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;Double):Double;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;LongInt):LongInt;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;Int64):Int64;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;QWord):QWord;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;<var UnicodeString>;const AnsiString;UnicodeString):UnicodeString;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;Boolean):Boolean;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;<var UTF8String>;const AnsiString;UTF8String):AnsiString;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;TJSONArray):TJSONArray;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Get(<TJSONObject>;const AnsiString;TJSONObject):TJSONObject;
	.uleb128	24
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol ADEFAULT
	.uleb128	26
	.ascii	"ADefault\000"
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef Clear(<TJSONObject>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;TJSONData):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;Boolean):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;Double):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;const UTF8String):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const AnsiString;UnicodeString):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;Int64):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"Avalue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;QWord):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"Avalue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;LongInt):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"Avalue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONObject>;const UTF8String;TJSONArray):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Delete(<TJSONObject>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Delete(<TJSONObject>;const AnsiString);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Remove(<TJSONObject>;TJSONData);
	.uleb128	34
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Extract(<TJSONObject>;LongInt):TJSONData;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Extract(<TJSONObject>;const AnsiString):TJSONData;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La51-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La49-.Ldebug_info0
	.byte	0
	.byte	0
.La52:
	.uleb128	9
	.long	.La51-.Ldebug_info0
# Definition TJSONArray
.La54:
	.uleb128	11
	.ascii	"TJSONArray\000"
	.long	.La583-.Ldebug_info0
.La583:
	.uleb128	20
	.long	.La56-.Ldebug_info0
.La56:
	.uleb128	21
	.ascii	"TJSONArray\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La65-.Ldebug_info0
	.uleb128	23
	.ascii	"FList\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La584-.Ldebug_info0
# Procdef GetArrays(<TJSONArray>;LongInt):TJSONArray;
	.uleb128	36
	.ascii	"GetArrays\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La54-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetBooleans(<TJSONArray>;LongInt):Boolean;
	.uleb128	36
	.ascii	"GetBooleans\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetFloats(<TJSONArray>;LongInt):Double;
	.uleb128	36
	.ascii	"GetFloats\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetIntegers(<TJSONArray>;LongInt):LongInt;
	.uleb128	36
	.ascii	"GetIntegers\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetNulls(<TJSONArray>;LongInt):Boolean;
	.uleb128	36
	.ascii	"GetNulls\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetObjects(<TJSONArray>;LongInt):TJSONObject;
	.uleb128	36
	.ascii	"GetObjects\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La51-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetStrings(<TJSONArray>;<var UTF8String>;LongInt):AnsiString;
	.uleb128	36
	.ascii	"GetStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetTypes(<TJSONArray>;LongInt):<enumeration type>;
	.uleb128	36
	.ascii	"GetTypes\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La544-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetInt64s(<TJSONArray>;LongInt):Int64;
	.uleb128	36
	.ascii	"GetInt64s\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetQWords(<TJSONArray>;LongInt):QWord;
	.uleb128	36
	.ascii	"GetQWords\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetUnicodeStrings(<TJSONArray>;<var UnicodeString>;LongInt):UnicodeString;
	.uleb128	36
	.ascii	"GetUnicodeStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetInt64s(<TJSONArray>;LongInt;const Int64);
	.uleb128	32
	.ascii	"SetInt64s\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetQWords(<TJSONArray>;LongInt;QWord);
	.uleb128	32
	.ascii	"SetQWords\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetUnicodeStrings(<TJSONArray>;LongInt;const UnicodeString);
	.uleb128	32
	.ascii	"SetUnicodeStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef SetArrays(<TJSONArray>;LongInt;const TJSONArray);
	.uleb128	32
	.ascii	"SetArrays\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef SetBooleans(<TJSONArray>;LongInt;const Boolean);
	.uleb128	32
	.ascii	"SetBooleans\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetFloats(<TJSONArray>;LongInt;const Double);
	.uleb128	32
	.ascii	"SetFloats\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetIntegers(<TJSONArray>;LongInt;const LongInt);
	.uleb128	32
	.ascii	"SetIntegers\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetObjects(<TJSONArray>;LongInt;const TJSONObject);
	.uleb128	32
	.ascii	"SetObjects\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef SetStrings(<TJSONArray>;LongInt;const UTF8String);
	.uleb128	32
	.ascii	"SetStrings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef DoFindPath(<TJSONArray>;const UTF8String;out UTF8String):TJSONData;
	.uleb128	33
	.ascii	"DoFindPath\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol APATH
	.uleb128	26
	.ascii	"APath\000"
	.long	.La540-.Ldebug_info0
# Symbol NOTFOUND
	.uleb128	26
	.ascii	"NotFound\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef Converterror(<TJSONArray>;Boolean);
	.uleb128	32
	.ascii	"Converterror\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol FROM
	.uleb128	26
	.ascii	"From\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef GetAsBoolean(<TJSONArray>):Boolean;
	.uleb128	33
	.ascii	"GetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef GetAsFloat(<TJSONArray>):Double;
	.uleb128	33
	.ascii	"GetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef GetAsInteger(<TJSONArray>):LongInt;
	.uleb128	33
	.ascii	"GetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef GetAsInt64(<TJSONArray>):Int64;
	.uleb128	33
	.ascii	"GetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef GetAsQWord(<TJSONArray>):QWord;
	.uleb128	33
	.ascii	"GetAsQWord\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef SetAsInt64(<TJSONArray>;const Int64);
	.uleb128	28
	.ascii	"SetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetAsQword(<TJSONArray>;const QWord);
	.uleb128	28
	.ascii	"SetAsQword\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetAsBoolean(<TJSONArray>;const Boolean);
	.uleb128	28
	.ascii	"SetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetAsFloat(<TJSONArray>;const Double);
	.uleb128	28
	.ascii	"SetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetAsInteger(<TJSONArray>;const LongInt);
	.uleb128	28
	.ascii	"SetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAsJSON(<TJSONArray>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetAsString(<TJSONArray>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef SetAsString(<TJSONArray>;const UTF8String);
	.uleb128	28
	.ascii	"SetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetValue(<TJSONArray>;<var Variant>):Variant;
	.uleb128	33
	.ascii	"GetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.byte	2
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef SetValue(<TJSONArray>;const Variant);
	.uleb128	28
	.ascii	"SetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef GetCount(<TJSONArray>):LongInt;
	.uleb128	33
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	376
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef GetItem(<TJSONArray>;LongInt):TJSONData;
	.uleb128	33
	.ascii	"GetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	352
	.byte	34
	.byte	2
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetItem(<TJSONArray>;LongInt;const TJSONData);
	.uleb128	28
	.ascii	"SetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	360
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef DoFormatJSON(<TJSONArray>;<var UTF8String>;TFormatOptions;LongInt;LongInt):AnsiString;
	.uleb128	33
	.ascii	"DoFormatJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	368
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
# Symbol OPTIONS
	.uleb128	26
	.ascii	"Options\000"
	.long	.La542-.Ldebug_info0
# Symbol CURRENTINDENT
	.uleb128	26
	.ascii	"CurrentIndent\000"
	.long	.La66-.Ldebug_info0
# Symbol INDENT
	.uleb128	26
	.ascii	"Indent\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONArray>;<Class Of TJSONArray>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La587-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONArray>;<Class Of TJSONArray>;const Array Of Const;<const Int64>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La589-.Ldebug_info0
# Symbol ELEMENTS
	.uleb128	26
	.ascii	"Elements\000"
	.long	.La591-.Ldebug_info0
# Symbol highELEMENTS
	.uleb128	26
	.ascii	"$highELEMENTS\000"
	.long	.La78-.Ldebug_info0
# Definition Array Of Const
.La591:
	.uleb128	7
	.long	.La469-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.byte	0
.La592:
	.uleb128	9
	.long	.La591-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TJSONArray>;<Class Of TJSONArray>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La593-.Ldebug_info0
	.byte	0
# Procdef class JSONType(<Class Of TJSONArray>):<enumeration type>;
	.uleb128	29
	.ascii	"JSONType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
	.long	.La544-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La595-.Ldebug_info0
	.byte	0
# Procdef Clone(<TJSONArray>):TJSONData;
	.uleb128	29
	.ascii	"Clone\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Iterate(<TJSONArray>;TJSONArrayIterator;TObject);
	.uleb128	34
	.ascii	"Iterate\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol ITERATOR
	.uleb128	26
	.ascii	"Iterator\000"
	.long	.La597-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TJSONArray>;TJSONData):LongInt;
	.uleb128	24
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"obj\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef GetEnumerator(<TJSONArray>):TBaseJSONEnumerator;
	.uleb128	29
	.ascii	"GetEnumerator\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	408
	.byte	34
	.long	.La550-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Clear(<TJSONArray>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;TJSONData):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;LongInt):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol I
	.uleb128	26
	.ascii	"I\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;Int64):Int64;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol I
	.uleb128	26
	.ascii	"I\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;QWord):QWord;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol I
	.uleb128	26
	.ascii	"I\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;const UnicodeString):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;const AnsiString):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;Double):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol F
	.uleb128	26
	.ascii	"F\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;Boolean):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol B
	.uleb128	26
	.ascii	"B\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;TJSONArray):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol ANARRAY
	.uleb128	26
	.ascii	"AnArray\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Add(<TJSONArray>;TJSONObject):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol ANOBJECT
	.uleb128	26
	.ascii	"AnObject\000"
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef Delete(<TJSONArray>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Exchange(<TJSONArray>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Exchange\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Extract(<TJSONArray>;TJSONData):TJSONData;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Extract(<TJSONArray>;LongInt):TJSONData;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;TJSONData);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol I
	.uleb128	26
	.ascii	"I\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;Int64);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol I
	.uleb128	26
	.ascii	"I\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;QWord);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol I
	.uleb128	26
	.ascii	"I\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;const UnicodeString);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;const AnsiString);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;Double);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol F
	.uleb128	26
	.ascii	"F\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;Boolean);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol B
	.uleb128	26
	.ascii	"B\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;TJSONArray);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ANARRAY
	.uleb128	26
	.ascii	"AnArray\000"
	.long	.La54-.Ldebug_info0
	.byte	0
# Procdef Insert(<TJSONArray>;LongInt;TJSONObject);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ANOBJECT
	.uleb128	26
	.ascii	"AnObject\000"
	.long	.La51-.Ldebug_info0
	.byte	0
# Procdef Move(<TJSONArray>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Move\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol CURINDEX
	.uleb128	26
	.ascii	"CurIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol NEWINDEX
	.uleb128	26
	.ascii	"NewIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Remove(<TJSONArray>;TJSONData);
	.uleb128	34
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef Sort(<TJSONArray>;TListSortCompare);
	.uleb128	34
	.ascii	"Sort\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La54-.Ldebug_info0
# Symbol COMPARE
	.uleb128	26
	.ascii	"Compare\000"
	.long	.La208-.Ldebug_info0
	.byte	0
	.byte	0
.La55:
	.uleb128	9
	.long	.La54-.Ldebug_info0
# Definition <procedure variable type of procedure(const UTF8String;TJSONData;TObject;var Boolean) of object;Register>
.La572:
	.uleb128	11
	.ascii	"TJSONObjectIterator\000"
	.long	.La599-.Ldebug_info0
.La599:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La600-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La600:
	.uleb128	42
	.ascii	"TJSONObjectIterator\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"AName\000"
	.long	.La540-.Ldebug_info0
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.uleb128	26
	.ascii	"Data\000"
	.long	.La143-.Ldebug_info0
	.uleb128	26
	.ascii	"Continue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La573:
	.uleb128	9
	.long	.La572-.Ldebug_info0
# Definition TJSONtype
.La544:
	.uleb128	11
	.ascii	"TJSONtype\000"
	.long	.La601-.Ldebug_info0
.La601:
	.uleb128	30
	.ascii	"TJSONtype\000"
	.byte	4
	.uleb128	31
	.ascii	"jtUnknown\000"
	.long	0
	.uleb128	31
	.ascii	"jtNumber\000"
	.long	1
	.uleb128	31
	.ascii	"jtString\000"
	.long	2
	.uleb128	31
	.ascii	"jtBoolean\000"
	.long	3
	.uleb128	31
	.ascii	"jtNull\000"
	.long	4
	.uleb128	31
	.ascii	"jtArray\000"
	.long	5
	.uleb128	31
	.ascii	"jtObject\000"
	.long	6
	.byte	0
.La545:
	.uleb128	9
	.long	.La544-.Ldebug_info0
# Definition TFormatOptions
.La542:
	.uleb128	11
	.ascii	"TFormatOptions\000"
	.long	.La602-.Ldebug_info0
.La602:
	.uleb128	39
	.ascii	"TFormatOptions\000"
	.short	4
	.long	.La603-.Ldebug_info0
.La603:
	.uleb128	40
	.sleb128	0
	.sleb128	5
	.long	.La604-.Ldebug_info0
.La543:
	.uleb128	9
	.long	.La542-.Ldebug_info0
# Definition TJSONEnum
.La554:
	.uleb128	11
	.ascii	"TJSONEnum\000"
	.long	.La606-.Ldebug_info0
.La606:
	.uleb128	16
	.ascii	"TJSONENUM\000"
	.uleb128	24
	.uleb128	17
	.ascii	"Key\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La540-.Ldebug_info0
	.uleb128	17
	.ascii	"KeyNum\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"Value\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La63-.Ldebug_info0
	.byte	0
.La555:
	.uleb128	9
	.long	.La554-.Ldebug_info0
# Definition TJSONNumber
.La580:
	.uleb128	11
	.ascii	"TJSONNumber\000"
	.long	.La607-.Ldebug_info0
.La607:
	.uleb128	20
	.long	.La582-.Ldebug_info0
.La582:
	.uleb128	21
	.ascii	"TJSONNumber\000"
	.uleb128	8
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La65-.Ldebug_info0
# Procdef class JSONType(<Class Of TJSONNumber>):<enumeration type>;
	.uleb128	29
	.ascii	"JSONType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
	.long	.La544-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La608-.Ldebug_info0
	.byte	0
# Procdef class NumberType(<Class Of TJSONNumber>):<enumeration type>;
	.uleb128	29
	.ascii	"NumberType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	424
	.byte	34
	.long	.La610-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La612-.Ldebug_info0
	.byte	0
	.byte	0
.La581:
	.uleb128	9
	.long	.La580-.Ldebug_info0
# Definition TJSONString
.La574:
	.uleb128	11
	.ascii	"TJSONString\000"
	.long	.La614-.Ldebug_info0
.La614:
	.uleb128	20
	.long	.La576-.Ldebug_info0
.La576:
	.uleb128	21
	.ascii	"TJSONString\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La65-.Ldebug_info0
	.uleb128	23
	.ascii	"FValue\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La540-.Ldebug_info0
# Procdef GetValue(<TJSONString>;<var Variant>):Variant;
	.uleb128	33
	.ascii	"GetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.byte	2
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef SetValue(<TJSONString>;const Variant);
	.uleb128	28
	.ascii	"SetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef GetAsBoolean(<TJSONString>):Boolean;
	.uleb128	33
	.ascii	"GetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef GetAsFloat(<TJSONString>):Double;
	.uleb128	33
	.ascii	"GetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef GetAsInteger(<TJSONString>):LongInt;
	.uleb128	33
	.ascii	"GetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef GetAsInt64(<TJSONString>):Int64;
	.uleb128	33
	.ascii	"GetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef GetAsQWord(<TJSONString>):QWord;
	.uleb128	33
	.ascii	"GetAsQWord\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef SetAsInt64(<TJSONString>;const Int64);
	.uleb128	28
	.ascii	"SetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetAsQword(<TJSONString>;const QWord);
	.uleb128	28
	.ascii	"SetAsQword\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetAsBoolean(<TJSONString>;const Boolean);
	.uleb128	28
	.ascii	"SetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetAsFloat(<TJSONString>;const Double);
	.uleb128	28
	.ascii	"SetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetAsInteger(<TJSONString>;const LongInt);
	.uleb128	28
	.ascii	"SetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAsJSON(<TJSONString>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetAsString(<TJSONString>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef SetAsString(<TJSONString>;const UTF8String);
	.uleb128	28
	.ascii	"SetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONString>;<Class Of TJSONString>;const UTF8String);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La615-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONString>;<Class Of TJSONString>;const UnicodeString);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La617-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef class JSONType(<Class Of TJSONString>):<enumeration type>;
	.uleb128	29
	.ascii	"JSONType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
	.long	.La544-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La619-.Ldebug_info0
	.byte	0
# Procdef Clear(<TJSONString>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
# Procdef Clone(<TJSONString>):TJSONData;
	.uleb128	29
	.ascii	"Clone\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La574-.Ldebug_info0
	.byte	0
	.byte	0
.La575:
	.uleb128	9
	.long	.La574-.Ldebug_info0
# Definition TJSONBoolean
.La577:
	.uleb128	11
	.ascii	"TJSONBoolean\000"
	.long	.La621-.Ldebug_info0
.La621:
	.uleb128	20
	.long	.La579-.Ldebug_info0
.La579:
	.uleb128	21
	.ascii	"TJSONBoolean\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La65-.Ldebug_info0
	.uleb128	23
	.ascii	"FValue\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La109-.Ldebug_info0
# Procdef GetValue(<TJSONBoolean>;<var Variant>):Variant;
	.uleb128	33
	.ascii	"GetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	336
	.byte	34
	.byte	2
	.long	.La309-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef SetValue(<TJSONBoolean>;const Variant);
	.uleb128	28
	.ascii	"SetValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	344
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La309-.Ldebug_info0
	.byte	0
# Procdef GetAsBoolean(<TJSONBoolean>):Boolean;
	.uleb128	33
	.ascii	"GetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef GetAsFloat(<TJSONBoolean>):Double;
	.uleb128	33
	.ascii	"GetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La80-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef GetAsInteger(<TJSONBoolean>):LongInt;
	.uleb128	33
	.ascii	"GetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef GetAsInt64(<TJSONBoolean>):Int64;
	.uleb128	33
	.ascii	"GetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef GetAsQWord(<TJSONBoolean>):QWord;
	.uleb128	33
	.ascii	"GetAsQWord\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La72-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef SetAsInt64(<TJSONBoolean>;const Int64);
	.uleb128	28
	.ascii	"SetAsInt64\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef SetAsQword(<TJSONBoolean>;const QWord);
	.uleb128	28
	.ascii	"SetAsQword\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef SetAsBoolean(<TJSONBoolean>;const Boolean);
	.uleb128	28
	.ascii	"SetAsBoolean\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetAsFloat(<TJSONBoolean>;const Double);
	.uleb128	28
	.ascii	"SetAsFloat\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef SetAsInteger(<TJSONBoolean>;const LongInt);
	.uleb128	28
	.ascii	"SetAsInteger\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	304
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAsJSON(<TJSONBoolean>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsJSON\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	312
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef GetAsString(<TJSONBoolean>;<var UTF8String>):AnsiString;
	.uleb128	33
	.ascii	"GetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	320
	.byte	34
	.byte	2
	.long	.La540-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef SetAsString(<TJSONBoolean>;const UTF8String);
	.uleb128	28
	.ascii	"SetAsString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	328
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONBoolean>;<Class Of TJSONBoolean>;Boolean);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La622-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef class JSONType(<Class Of TJSONBoolean>):<enumeration type>;
	.uleb128	29
	.ascii	"JSONType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	384
	.byte	34
	.long	.La544-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La624-.Ldebug_info0
	.byte	0
# Procdef Clear(<TJSONBoolean>);
	.uleb128	27
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	400
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
# Procdef Clone(<TJSONBoolean>):TJSONData;
	.uleb128	29
	.ascii	"Clone\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	416
	.byte	34
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La577-.Ldebug_info0
	.byte	0
	.byte	0
.La578:
	.uleb128	9
	.long	.La577-.Ldebug_info0
# Definition <procedure variable type of procedure(TJSONData;TObject;var Boolean) of object;Register>
.La597:
	.uleb128	11
	.ascii	"TJSONArrayIterator\000"
	.long	.La626-.Ldebug_info0
.La626:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La627-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La627:
	.uleb128	42
	.ascii	"TJSONArrayIterator\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"Item\000"
	.long	.La63-.Ldebug_info0
	.uleb128	26
	.ascii	"Data\000"
	.long	.La143-.Ldebug_info0
	.uleb128	26
	.ascii	"Continue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
.La598:
	.uleb128	9
	.long	.La597-.Ldebug_info0
# Definition TFormatOption
.La604:
	.uleb128	11
	.ascii	"TFormatOption\000"
	.long	.La628-.Ldebug_info0
.La628:
	.uleb128	30
	.ascii	"TFormatOption\000"
	.byte	4
	.uleb128	31
	.ascii	"foSingleLineArray\000"
	.long	0
	.uleb128	31
	.ascii	"foSingleLineObject\000"
	.long	1
	.uleb128	31
	.ascii	"foDoNotQuoteMembers\000"
	.long	2
	.uleb128	31
	.ascii	"foUseTabchar\000"
	.long	3
	.uleb128	31
	.ascii	"foSkipWhiteSpace\000"
	.long	4
	.uleb128	31
	.ascii	"foSkipWhiteSpaceOnlyLeading\000"
	.long	5
	.byte	0
.La605:
	.uleb128	9
	.long	.La604-.Ldebug_info0
# Definition TJSONNumberType
.La610:
	.uleb128	11
	.ascii	"TJSONNumberType\000"
	.long	.La629-.Ldebug_info0
.La629:
	.uleb128	30
	.ascii	"TJSONNumberType\000"
	.byte	4
	.uleb128	31
	.ascii	"ntFloat\000"
	.long	0
	.uleb128	31
	.ascii	"ntInteger\000"
	.long	1
	.uleb128	31
	.ascii	"ntInt64\000"
	.long	2
	.uleb128	31
	.ascii	"ntQWord\000"
	.long	3
	.byte	0
.La611:
	.uleb128	9
	.long	.La610-.Ldebug_info0
# Defs - End unit FPJSON has index 17
# Defs - Begin unit JSONSCANNER has index 26
# Defs - End unit JSONSCANNER has index 26
# Defs - Begin unit JSONREADER has index 27
# Defs - End unit JSONREADER has index 27
# Defs - Begin unit JSONPARSER has index 18
# Definition TJSONParser
.La60:
	.uleb128	11
	.ascii	"TJSONParser\000"
	.long	.La630-.Ldebug_info0
.La630:
	.uleb128	20
	.long	.La62-.Ldebug_info0
.La62:
	.uleb128	21
	.ascii	"TJSONParser\000"
	.uleb128	56
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La633-.Ldebug_info0
	.uleb128	23
	.ascii	"FStack\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La634-.Ldebug_info0
	.uleb128	23
	.ascii	"FStackPos\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FStruct\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La63-.Ldebug_info0
	.uleb128	23
	.ascii	"FValue\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La63-.Ldebug_info0
	.uleb128	23
	.ascii	"FKey\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La540-.Ldebug_info0
# Procdef Pop(<TJSONParser>;TJSONtype);
	.uleb128	32
	.ascii	"Pop\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol ATYPE
	.uleb128	26
	.ascii	"aType\000"
	.long	.La544-.Ldebug_info0
	.byte	0
# Procdef Push(<TJSONParser>;TJSONData);
	.uleb128	32
	.ascii	"Push\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef NewValue(<TJSONParser>;TJSONData):TJSONData;
	.uleb128	36
	.ascii	"NewValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La63-.Ldebug_info0
	.byte	0
# Procdef KeyValue(<TJSONParser>;const UTF8String);
	.uleb128	28
	.ascii	"KeyValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AKEY
	.uleb128	26
	.ascii	"AKey\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef StringValue(<TJSONParser>;const UTF8String);
	.uleb128	28
	.ascii	"StringValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef NullValue(<TJSONParser>);
	.uleb128	28
	.ascii	"NullValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
	.byte	0
# Procdef FloatValue(<TJSONParser>;const Double);
	.uleb128	28
	.ascii	"FloatValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef BooleanValue(<TJSONParser>;const Boolean);
	.uleb128	28
	.ascii	"BooleanValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef NumberValue(<TJSONParser>;const UTF8String);
	.uleb128	28
	.ascii	"NumberValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef IntegerValue(<TJSONParser>;const LongInt);
	.uleb128	28
	.ascii	"IntegerValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Int64Value(<TJSONParser>;const Int64);
	.uleb128	28
	.ascii	"Int64Value\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef QWordValue(<TJSONParser>;const QWord);
	.uleb128	28
	.ascii	"QWordValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef StartArray(<TJSONParser>);
	.uleb128	28
	.ascii	"StartArray\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
	.byte	0
# Procdef StartObject(<TJSONParser>);
	.uleb128	28
	.ascii	"StartObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
	.byte	0
# Procdef EndArray(<TJSONParser>);
	.uleb128	28
	.ascii	"EndArray\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
	.byte	0
# Procdef EndObject(<TJSONParser>);
	.uleb128	28
	.ascii	"EndObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
	.byte	0
# Procdef Parse(<TJSONParser>):TJSONData;
	.uleb128	24
	.ascii	"Parse\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La63-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La60-.Ldebug_info0
	.byte	0
	.byte	0
.La61:
	.uleb128	9
	.long	.La60-.Ldebug_info0
# Defs - End unit JSONPARSER has index 18
# Defs - Begin unit SOMA_FITNESS has index 12
# Definition TPrimitiveKind
.La1:
	.uleb128	11
	.ascii	"TPrimitiveKind\000"
	.long	.La636-.Ldebug_info0
.La636:
	.uleb128	30
	.ascii	"TPrimitiveKind\000"
	.byte	1
	.uleb128	31
	.ascii	"pkSurvival\000"
	.long	0
	.uleb128	31
	.ascii	"pkArraySorted\000"
	.long	1
	.byte	0
.La2:
	.uleb128	9
	.long	.La1-.Ldebug_info0
# Definition TFitnessCriterion
.La3:
	.uleb128	11
	.ascii	"TFitnessCriterion\000"
	.long	.La637-.Ldebug_info0
.La637:
	.uleb128	16
	.ascii	"TFITNESSCRITERION\000"
	.uleb128	16
	.uleb128	17
	.ascii	"metric\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La49-.Ldebug_info0
	.uleb128	17
	.ascii	"weight\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La80-.Ldebug_info0
	.byte	0
.La4:
	.uleb128	9
	.long	.La3-.Ldebug_info0
# Definition TFitnessTarget
.La5:
	.uleb128	11
	.ascii	"TFitnessTarget\000"
	.long	.La638-.Ldebug_info0
.La638:
	.uleb128	16
	.ascii	"TFITNESSTARGET\000"
	.uleb128	40
	.uleb128	17
	.ascii	"name\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La49-.Ldebug_info0
	.uleb128	17
	.ascii	"version\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"input_count\000"
	.byte	2
	.byte	35
	.uleb128	12
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"input_min\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.uleb128	17
	.ascii	"input_max\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La78-.Ldebug_info0
	.uleb128	17
	.ascii	"criteria\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La639-.Ldebug_info0
	.byte	0
.La6:
	.uleb128	9
	.long	.La5-.Ldebug_info0
# Defs - End unit SOMA_FITNESS has index 12
# Defs - Begin Staticsymtable
# Definition <record type>
.La7:
	.uleb128	11
	.ascii	"$ansistrrec7\000"
	.long	.La641-.Ldebug_info0
.La641:
	.uleb128	16
	.ascii	"$ANSISTRREC7\000"
	.uleb128	40
	.byte	0
.La8:
	.uleb128	9
	.long	.La7-.Ldebug_info0
# Definition <record type>
.La9:
	.uleb128	11
	.ascii	"$ansistrrec4\000"
	.long	.La642-.Ldebug_info0
.La642:
	.uleb128	16
	.ascii	"$ANSISTRREC4\000"
	.uleb128	37
	.byte	0
.La10:
	.uleb128	9
	.long	.La9-.Ldebug_info0
# Definition <record type>
.La11:
	.uleb128	11
	.ascii	"$ansistrrec5\000"
	.long	.La643-.Ldebug_info0
.La643:
	.uleb128	16
	.ascii	"$ANSISTRREC5\000"
	.uleb128	38
	.byte	0
.La12:
	.uleb128	9
	.long	.La11-.Ldebug_info0
# Definition <record type>
.La13:
	.uleb128	11
	.ascii	"$ansistrrec11\000"
	.long	.La644-.Ldebug_info0
.La644:
	.uleb128	16
	.ascii	"$ANSISTRREC11\000"
	.uleb128	44
	.byte	0
.La14:
	.uleb128	9
	.long	.La13-.Ldebug_info0
# Definition <record type>
.La15:
	.uleb128	11
	.ascii	"$ansistrrec9\000"
	.long	.La645-.Ldebug_info0
.La645:
	.uleb128	16
	.ascii	"$ANSISTRREC9\000"
	.uleb128	42
	.byte	0
.La16:
	.uleb128	9
	.long	.La15-.Ldebug_info0
# Definition <record type>
.La17:
	.uleb128	11
	.ascii	"$ansistrrec8\000"
	.long	.La646-.Ldebug_info0
.La646:
	.uleb128	16
	.ascii	"$ANSISTRREC8\000"
	.uleb128	41
	.byte	0
.La18:
	.uleb128	9
	.long	.La17-.Ldebug_info0
# Definition <record type>
.La19:
	.uleb128	11
	.ascii	"$ansistrrec6\000"
	.long	.La647-.Ldebug_info0
.La647:
	.uleb128	16
	.ascii	"$ANSISTRREC6\000"
	.uleb128	39
	.byte	0
.La20:
	.uleb128	9
	.long	.La19-.Ldebug_info0
# Definition <record type>
.La21:
	.uleb128	11
	.ascii	"$ansistrrec12\000"
	.long	.La648-.Ldebug_info0
.La648:
	.uleb128	16
	.ascii	"$ANSISTRREC12\000"
	.uleb128	45
	.byte	0
.La22:
	.uleb128	9
	.long	.La21-.Ldebug_info0
# Definition <record type>
.La23:
	.uleb128	11
	.ascii	"$rttidef$RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND\000"
	.long	.La649-.Ldebug_info0
.La649:
	.uleb128	16
	.ascii	"$RTTIDEF$RTTI_$SOMA_FITNESS_$$_TPRIMITIVEKIND\000"
	.uleb128	72
	.byte	0
.La24:
	.uleb128	9
	.long	.La23-.Ldebug_info0
# Definition <record type>
.La25:
	.uleb128	11
	.ascii	"$rtti_header$14\000"
	.long	.La650-.Ldebug_info0
.La650:
	.uleb128	16
	.ascii	"$RTTI_HEADER$14\000"
	.uleb128	16
	.byte	0
.La26:
	.uleb128	9
	.long	.La25-.Ldebug_info0
# Definition <record type>
.La27:
	.uleb128	11
	.ascii	"$rtti_enum_size_start_rec$00000000\000"
	.long	.La651-.Ldebug_info0
.La651:
	.uleb128	16
	.ascii	"$RTTI_ENUM_SIZE_START_REC$00000000\000"
	.uleb128	56
	.byte	0
.La28:
	.uleb128	9
	.long	.La27-.Ldebug_info0
# Definition <record type>
.La29:
	.uleb128	11
	.ascii	"$rtti_enum_min_max_rec$00000000\000"
	.long	.La652-.Ldebug_info0
.La652:
	.uleb128	16
	.ascii	"$RTTI_ENUM_MIN_MAX_REC$00000000\000"
	.uleb128	55
	.byte	0
.La30:
	.uleb128	9
	.long	.La29-.Ldebug_info0
# Definition <record type>
.La31:
	.uleb128	11
	.ascii	"$rtti_enum_basetype_array_rec$00000000\000"
	.long	.La653-.Ldebug_info0
.La653:
	.uleb128	16
	.ascii	"$RTTI_ENUM_BASETYPE_ARRAY_REC$00000000\000"
	.uleb128	47
	.byte	0
.La32:
	.uleb128	9
	.long	.La31-.Ldebug_info0
# Definition <record type>
.La33:
	.uleb128	11
	.ascii	"$rttidef$INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION\000"
	.long	.La654-.Ldebug_info0
.La654:
	.uleb128	16
	.ascii	"$RTTIDEF$INIT_$SOMA_FITNESS_$$_TFITNESSCRITERION\000"
	.uleb128	67
	.byte	0
.La34:
	.uleb128	9
	.long	.La33-.Ldebug_info0
# Definition <record type>
.La35:
	.uleb128	11
	.ascii	"$rtti_header$17\000"
	.long	.La655-.Ldebug_info0
.La655:
	.uleb128	16
	.ascii	"$RTTI_HEADER$17\000"
	.uleb128	19
	.byte	0
.La36:
	.uleb128	9
	.long	.La35-.Ldebug_info0
# Definition <record type>
.La37:
	.uleb128	11
	.ascii	"$rttidef$RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION\000"
	.long	.La656-.Ldebug_info0
.La656:
	.uleb128	16
	.ascii	"$RTTIDEF$RTTI_$SOMA_FITNESS_$$_TFITNESSCRITERION\000"
	.uleb128	67
	.byte	0
.La38:
	.uleb128	9
	.long	.La37-.Ldebug_info0
# Definition <record type>
.La39:
	.uleb128	11
	.ascii	"$rttidef$INIT_$SOMA_FITNESS_$$_def00000003\000"
	.long	.La657-.Ldebug_info0
.La657:
	.uleb128	16
	.ascii	"$RTTIDEF$INIT_$SOMA_FITNESS_$$_DEF00000003\000"
	.uleb128	43
	.byte	0
.La40:
	.uleb128	9
	.long	.La39-.Ldebug_info0
# Definition <record type>
.La41:
	.uleb128	11
	.ascii	"$rtti_dyn_array$\000"
	.long	.La658-.Ldebug_info0
.La658:
	.uleb128	16
	.ascii	"$RTTI_DYN_ARRAY$\000"
	.uleb128	41
	.byte	0
.La42:
	.uleb128	9
	.long	.La41-.Ldebug_info0
# Definition <record type>
.La43:
	.uleb128	11
	.ascii	"$rttidef$INIT_$SOMA_FITNESS_$$_TFITNESSTARGET\000"
	.long	.La659-.Ldebug_info0
.La659:
	.uleb128	16
	.ascii	"$RTTIDEF$INIT_$SOMA_FITNESS_$$_TFITNESSTARGET\000"
	.uleb128	80
	.byte	0
.La44:
	.uleb128	9
	.long	.La43-.Ldebug_info0
# Definition <record type>
.La45:
	.uleb128	11
	.ascii	"$rttidef$RTTI_$SOMA_FITNESS_$$_def00000003\000"
	.long	.La660-.Ldebug_info0
.La660:
	.uleb128	16
	.ascii	"$RTTIDEF$RTTI_$SOMA_FITNESS_$$_DEF00000003\000"
	.uleb128	43
	.byte	0
.La46:
	.uleb128	9
	.long	.La45-.Ldebug_info0
# Definition <record type>
.La47:
	.uleb128	11
	.ascii	"$rttidef$RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET\000"
	.long	.La661-.Ldebug_info0
.La661:
	.uleb128	16
	.ascii	"$RTTIDEF$RTTI_$SOMA_FITNESS_$$_TFITNESSTARGET\000"
	.uleb128	128
	.byte	0
.La48:
	.uleb128	9
	.long	.La47-.Ldebug_info0
# Defs - End Staticsymtable
# Definition TVMState.Array[0..255] Of Byte
.La92:
	.uleb128	47
	.uleb128	256
	.long	.La117-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	255
	.uleb128	1
	.long	.La117-.Ldebug_info0
	.byte	0
.La93:
	.uleb128	9
	.long	.La92-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Int64
.La94:
	.uleb128	47
	.uleb128	2048
	.long	.La78-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La117-.Ldebug_info0
	.byte	0
.La95:
	.uleb128	9
	.long	.La94-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Double
.La96:
	.uleb128	47
	.uleb128	2048
	.long	.La80-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La117-.Ldebug_info0
	.byte	0
.La97:
	.uleb128	9
	.long	.La96-.Ldebug_info0
# Definition TVMState.Array[0..15] Of Byte
.La100:
	.uleb128	47
	.uleb128	16
	.long	.La117-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	15
	.uleb128	1
	.long	.La404-.Ldebug_info0
	.byte	0
.La101:
	.uleb128	9
	.long	.La100-.Ldebug_info0
# Definition TFitnessResult.Array[0..7] Of Double
.La103:
	.uleb128	47
	.uleb128	64
	.long	.La80-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	7
	.uleb128	8
	.long	.La404-.Ldebug_info0
	.byte	0
.La104:
	.uleb128	9
	.long	.La103-.Ldebug_info0
# Definition TFitnessResult.Array[0..31] Of Char
.La105:
	.uleb128	47
	.uleb128	32
	.long	.La86-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	31
	.uleb128	1
	.long	.La404-.Ldebug_info0
	.byte	0
.La106:
	.uleb128	9
	.long	.La105-.Ldebug_info0
# Definition Word
.La107:
	.uleb128	11
	.ascii	"Word\000"
	.long	.La662-.Ldebug_info0
.La662:
	.uleb128	12
	.ascii	"Word\000"
	.byte	7
	.byte	2
.La108:
	.uleb128	9
	.long	.La107-.Ldebug_info0
# Definition Boolean
.La109:
	.uleb128	11
	.ascii	"Boolean\000"
	.long	.La663-.Ldebug_info0
.La663:
	.uleb128	12
	.ascii	"Boolean\000"
	.byte	2
	.byte	1
.La110:
	.uleb128	9
	.long	.La109-.Ldebug_info0
# Definition SmallInt
.La114:
	.uleb128	11
	.ascii	"SmallInt\000"
	.long	.La664-.Ldebug_info0
.La664:
	.uleb128	12
	.ascii	"SmallInt\000"
	.byte	5
	.byte	2
.La115:
	.uleb128	9
	.long	.La114-.Ldebug_info0
# Definition Byte
.La117:
	.uleb128	11
	.ascii	"Byte\000"
	.long	.La665-.Ldebug_info0
.La665:
	.uleb128	12
	.ascii	"Byte\000"
	.byte	7
	.byte	1
.La118:
	.uleb128	9
	.long	.La117-.Ldebug_info0
# Definition TFileStream.Class Of TFileStream
.La123:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La124:
	.uleb128	9
	.long	.La123-.Ldebug_info0
# Definition TFileStream.Class Of TFileStream
.La125:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La126:
	.uleb128	9
	.long	.La125-.Ldebug_info0
# Definition LongWord
.La127:
	.uleb128	11
	.ascii	"LongWord\000"
	.long	.La666-.Ldebug_info0
.La666:
	.uleb128	12
	.ascii	"LongWord\000"
	.byte	7
	.byte	4
.La128:
	.uleb128	9
	.long	.La127-.Ldebug_info0
# Definition TFileStream.Class Of TFileStream
.La129:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La130:
	.uleb128	9
	.long	.La129-.Ldebug_info0
# Definition THandleStream.Class Of THandleStream
.La135:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La136:
	.uleb128	9
	.long	.La135-.Ldebug_info0
# Definition <Formal type>
.La137:
	.uleb128	11
	.ascii	"$formal\000"
	.long	.La667-.Ldebug_info0
.La667:
	.uleb128	48
.La138:
	.uleb128	9
	.long	.La137-.Ldebug_info0
# Definition TObject
.La143:
	.uleb128	11
	.ascii	"TObject\000"
	.long	.La668-.Ldebug_info0
.La668:
	.uleb128	20
	.long	.La145-.Ldebug_info0
.La145:
	.uleb128	21
	.ascii	"TObject\000"
	.uleb128	8
	.uleb128	49
	.byte	1
	.ascii	"_vptr$TOBJECT\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La156-.Ldebug_info0
# Procdef constructor Create(<TObject>;<Class Of TObject>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La669-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TObject>;<Class Of TObject>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La671-.Ldebug_info0
	.byte	0
# Procdef class newinstance(<Class Of TObject>):TObject;
	.uleb128	29
	.ascii	"newinstance\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	104
	.byte	34
	.long	.La143-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La673-.Ldebug_info0
	.byte	0
# Procdef FreeInstance(<TObject>);
	.uleb128	27
	.ascii	"FreeInstance\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	112
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef SafeCallException(<TObject>;TObject;Pointer):LongInt;
	.uleb128	29
	.ascii	"SafeCallException\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	120
	.byte	34
	.long	.La180-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol EXCEPTOBJECT
	.uleb128	26
	.ascii	"exceptobject\000"
	.long	.La143-.Ldebug_info0
# Symbol EXCEPTADDR
	.uleb128	26
	.ascii	"exceptaddr\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef DefaultHandler(<TObject>;var <Formal type>);
	.uleb128	27
	.ascii	"DefaultHandler\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	128
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol MESSAGE
	.uleb128	26
	.ascii	"message\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef Free(<TObject>);
	.uleb128	34
	.ascii	"Free\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef class InitInstance(<Class Of TObject>;Pointer):TObject;
	.uleb128	24
	.ascii	"InitInstance\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La675-.Ldebug_info0
# Symbol INSTANCE
	.uleb128	26
	.ascii	"instance\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef CleanupInstance(<TObject>);
	.uleb128	34
	.ascii	"CleanupInstance\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef class ClassType(<Class Of TObject>):Class Of TObject;
	.uleb128	24
	.ascii	"ClassType\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La677-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La679-.Ldebug_info0
	.byte	0
# Procdef class ClassInfo(<Class Of TObject>):^untyped;
	.uleb128	24
	.ascii	"ClassInfo\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La681-.Ldebug_info0
	.byte	0
# Procdef class ClassName(<Class Of TObject>;<var ShortString>):ShortString;
	.uleb128	24
	.ascii	"ClassName\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La683-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La685-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef class ClassNameIs(<Class Of TObject>;const ShortString):Boolean;
	.uleb128	24
	.ascii	"ClassNameIs\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La687-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"name\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef class ClassParent(<Class Of TObject>):Class Of TObject;
	.uleb128	24
	.ascii	"ClassParent\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La677-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La689-.Ldebug_info0
	.byte	0
# Procdef class InstanceSize(<Class Of TObject>):Int64;
	.uleb128	24
	.ascii	"InstanceSize\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La78-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La691-.Ldebug_info0
	.byte	0
# Procdef class InheritsFrom(<Class Of TObject>;TClass):Boolean;
	.uleb128	24
	.ascii	"InheritsFrom\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La693-.Ldebug_info0
# Symbol ACLASS
	.uleb128	26
	.ascii	"aclass\000"
	.long	.La677-.Ldebug_info0
	.byte	0
# Procdef class StringMessageTable(<Class Of TObject>):^TStringMessageTable;
	.uleb128	24
	.ascii	"StringMessageTable\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La695-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La697-.Ldebug_info0
	.byte	0
# Procdef class MethodAddress(<Class Of TObject>;const ShortString):^untyped;
	.uleb128	24
	.ascii	"MethodAddress\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La699-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"name\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef class MethodName(<Class Of TObject>;<var ShortString>;Pointer):ShortString;
	.uleb128	24
	.ascii	"MethodName\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La683-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La701-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La683-.Ldebug_info0
# Symbol ADDRESS
	.uleb128	26
	.ascii	"address\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef FieldAddress(<TObject>;const ShortString):^untyped;
	.uleb128	24
	.ascii	"FieldAddress\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol NAME
	.uleb128	26
	.ascii	"name\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef AfterConstruction(<TObject>);
	.uleb128	27
	.ascii	"AfterConstruction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	136
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef BeforeDestruction(<TObject>);
	.uleb128	27
	.ascii	"BeforeDestruction\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	144
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef DefaultHandlerStr(<TObject>;var <Formal type>);
	.uleb128	27
	.ascii	"DefaultHandlerStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	152
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol MESSAGE
	.uleb128	26
	.ascii	"message\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef Dispatch(<TObject>;var <Formal type>);
	.uleb128	27
	.ascii	"Dispatch\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	160
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol MESSAGE
	.uleb128	26
	.ascii	"message\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef DispatchStr(<TObject>;var <Formal type>);
	.uleb128	27
	.ascii	"DispatchStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	168
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol MESSAGE
	.uleb128	26
	.ascii	"message\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef GetInterface(<TObject>;const TGuid;out <Formal type>):Boolean;
	.uleb128	24
	.ascii	"GetInterface\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol IID
	.uleb128	26
	.ascii	"iid\000"
	.long	.La182-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"obj\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef GetInterface(<TObject>;const ShortString;out <Formal type>):Boolean;
	.uleb128	24
	.ascii	"GetInterface\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol IIDSTR
	.uleb128	26
	.ascii	"iidstr\000"
	.long	.La683-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"obj\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef GetInterfaceByStr(<TObject>;const ShortString;out <Formal type>):Boolean;
	.uleb128	24
	.ascii	"GetInterfaceByStr\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol IIDSTR
	.uleb128	26
	.ascii	"iidstr\000"
	.long	.La683-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"obj\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef GetInterfaceWeak(<TObject>;const TGuid;out <Formal type>):Boolean;
	.uleb128	24
	.ascii	"GetInterfaceWeak\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol IID
	.uleb128	26
	.ascii	"iid\000"
	.long	.La182-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"obj\000"
	.long	.La137-.Ldebug_info0
	.byte	0
# Procdef class GetInterfaceEntry(<Class Of TObject>;const TGuid):^tinterfaceentry;
	.uleb128	24
	.ascii	"GetInterfaceEntry\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La703-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La705-.Ldebug_info0
# Symbol IID
	.uleb128	26
	.ascii	"iid\000"
	.long	.La182-.Ldebug_info0
	.byte	0
# Procdef class GetInterfaceEntryByStr(<Class Of TObject>;const ShortString):^tinterfaceentry;
	.uleb128	24
	.ascii	"GetInterfaceEntryByStr\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La703-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La707-.Ldebug_info0
# Symbol IIDSTR
	.uleb128	26
	.ascii	"iidstr\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef class GetInterfaceTable(<Class Of TObject>):^tinterfacetable;
	.uleb128	24
	.ascii	"GetInterfaceTable\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La709-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La711-.Ldebug_info0
	.byte	0
# Procdef class UnitName(<Class Of TObject>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"UnitName\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La713-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef class QualifiedClassName(<Class Of TObject>;<var AnsiString>):AnsiString;
	.uleb128	24
	.ascii	"QualifiedClassName\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La715-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Equals(<TObject>;TObject):Boolean;
	.uleb128	29
	.ascii	"Equals\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	176
	.byte	34
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"Obj\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef GetHashCode(<TObject>):Int64;
	.uleb128	29
	.ascii	"GetHashCode\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	184
	.byte	34
	.long	.La78-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef ToString(<TObject>;<var AnsiString>):AnsiString;
	.uleb128	29
	.ascii	"ToString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	192
	.byte	34
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
	.byte	0
.La144:
	.uleb128	9
	.long	.La143-.Ldebug_info0
# Definition Pointer
.La156:
	.uleb128	11
	.ascii	"Pointer\000"
	.long	.La717-.Ldebug_info0
.La717:
	.uleb128	15
.La157:
	.uleb128	9
	.long	.La156-.Ldebug_info0
# Definition IUnknown
.La162:
	.uleb128	11
	.ascii	"IUnknown\000"
	.long	.La718-.Ldebug_info0
.La718:
	.uleb128	45
	.ascii	"IUnknown\000"
	.uleb128	0
	.byte	2
	.byte	151
	.byte	6
	.byte	2
	.byte	151
	.byte	6
	.byte	0
.La163:
	.uleb128	9
	.long	.La162-.Ldebug_info0
# Definition TComponent.Class Of TComponent
.La178:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La179:
	.uleb128	9
	.long	.La178-.Ldebug_info0
# Definition HRESULT
.La180:
	.uleb128	11
	.ascii	"HRESULT\000"
	.long	.La719-.Ldebug_info0
.La719:
	.uleb128	12
	.ascii	"HRESULT\000"
	.byte	5
	.byte	4
.La181:
	.uleb128	9
	.long	.La180-.Ldebug_info0
# Definition TGuid
.La182:
	.uleb128	11
	.ascii	"TGuid\000"
	.long	.La720-.Ldebug_info0
.La720:
	.uleb128	16
	.ascii	"TGUID\000"
	.uleb128	16
	.uleb128	17
	.ascii	"Data1\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La127-.Ldebug_info0
	.uleb128	17
	.ascii	"Data2\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"Data3\000"
	.byte	2
	.byte	35
	.uleb128	6
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"Data4\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La721-.Ldebug_info0
	.uleb128	17
	.ascii	"D1\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La127-.Ldebug_info0
	.uleb128	17
	.ascii	"D2\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"D3\000"
	.byte	2
	.byte	35
	.uleb128	6
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"D4\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La723-.Ldebug_info0
	.uleb128	17
	.ascii	"time_low\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La127-.Ldebug_info0
	.uleb128	17
	.ascii	"time_mid\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"time_hi_and_version\000"
	.byte	2
	.byte	35
	.uleb128	6
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"clock_seq_hi_and_reserved\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La117-.Ldebug_info0
	.uleb128	17
	.ascii	"clock_seq_low\000"
	.byte	2
	.byte	35
	.uleb128	9
	.long	.La117-.Ldebug_info0
	.uleb128	17
	.ascii	"node\000"
	.byte	2
	.byte	35
	.uleb128	10
	.long	.La725-.Ldebug_info0
	.byte	0
.La183:
	.uleb128	9
	.long	.La182-.Ldebug_info0
# Definition TComponent.Class Of TComponent
.La184:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La185:
	.uleb128	9
	.long	.La184-.Ldebug_info0
# Definition TComponent.Class Of TComponent
.La186:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La187:
	.uleb128	9
	.long	.La186-.Ldebug_info0
# Definition TFPList.Class Of TFPList
.La197:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La198:
	.uleb128	9
	.long	.La197-.Ldebug_info0
# Definition TFPList.Class Of TFPList
.La199:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La200:
	.uleb128	9
	.long	.La199-.Ldebug_info0
# Definition <procedure variable type of procedure(Pointer;Pointer) of object;Register>
.La210:
	.uleb128	11
	.ascii	"TListCallback\000"
	.long	.La727-.Ldebug_info0
.La727:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La728-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La728:
	.uleb128	42
	.ascii	"TListCallback\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"data\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
.La211:
	.uleb128	9
	.long	.La210-.Ldebug_info0
# Definition <procedure variable type of procedure(Pointer;Pointer);Register>
.La212:
	.uleb128	11
	.ascii	"TListStaticCallback\000"
	.long	.La729-.Ldebug_info0
.La729:
	.uleb128	42
	.ascii	"TListStaticCallback\000"
	.byte	1
	.uleb128	26
	.ascii	"data\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
.La213:
	.uleb128	9
	.long	.La212-.Ldebug_info0
# Definition TFPListEnumerator.Class Of TFPListEnumerator
.La215:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La216:
	.uleb128	9
	.long	.La215-.Ldebug_info0
# Definition TPersistent.Class Of TPersistent
.La219:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La220:
	.uleb128	9
	.long	.La219-.Ldebug_info0
# Definition TComponentEnumerator.Class Of TComponentEnumerator
.La235:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La236:
	.uleb128	9
	.long	.La235-.Ldebug_info0
# Definition TBasicAction.Class Of TBasicAction
.La240:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La241:
	.uleb128	9
	.long	.La240-.Ldebug_info0
# Definition TBasicAction.Class Of TBasicAction
.La242:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La243:
	.uleb128	9
	.long	.La242-.Ldebug_info0
# Definition TBasicActionLink.Class Of TBasicActionLink
.La248:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La249:
	.uleb128	9
	.long	.La248-.Ldebug_info0
# Definition TBasicActionLink.Class Of TBasicActionLink
.La250:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La251:
	.uleb128	9
	.long	.La250-.Ldebug_info0
# Definition TRTLCriticalSection
.La266:
	.uleb128	11
	.ascii	"TRTLCriticalSection\000"
	.long	.La730-.Ldebug_info0
.La730:
	.uleb128	16
	.ascii	"TRTLCRITICALSECTION\000"
	.uleb128	40
	.uleb128	17
	.ascii	"DebugInfo\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"LockCount\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"RecursionCount\000"
	.byte	2
	.byte	35
	.uleb128	12
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"OwningThread\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"LockSemaphore\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"SpinCount\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La72-.Ldebug_info0
	.byte	0
.La267:
	.uleb128	9
	.long	.La266-.Ldebug_info0
# Definition TReader.Class Of TReader
.La290:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La291:
	.uleb128	9
	.long	.La290-.Ldebug_info0
# Definition TReader.Class Of TReader
.La292:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La293:
	.uleb128	9
	.long	.La292-.Ldebug_info0
# Definition WideChar
.La296:
	.uleb128	11
	.ascii	"WideChar\000"
	.long	.La731-.Ldebug_info0
.La731:
	.uleb128	12
	.ascii	"WideChar\000"
	.byte	8
	.byte	2
.La297:
	.uleb128	9
	.long	.La296-.Ldebug_info0
# Definition Single
.La303:
	.uleb128	11
	.ascii	"Single\000"
	.long	.La732-.Ldebug_info0
.La732:
	.uleb128	12
	.ascii	"Single\000"
	.byte	4
	.byte	4
.La304:
	.uleb128	9
	.long	.La303-.Ldebug_info0
# Definition TDateTime
.La305:
	.uleb128	11
	.ascii	"TDateTime\000"
	.long	.La733-.Ldebug_info0
.La733:
	.uleb128	12
	.ascii	"TDateTime\000"
	.byte	4
	.byte	8
.La306:
	.uleb128	9
	.long	.La305-.Ldebug_info0
# Definition Currency
.La307:
	.uleb128	11
	.ascii	"Currency\000"
	.long	.La734-.Ldebug_info0
.La734:
	.uleb128	12
	.ascii	"Currency\000"
	.byte	5
	.byte	8
.La308:
	.uleb128	9
	.long	.La307-.Ldebug_info0
# Definition Variant
.La309:
	.uleb128	11
	.ascii	"Variant\000"
	.long	.La735-.Ldebug_info0
.La735:
	.uleb128	16
	.ascii	"Variant\000"
	.uleb128	24
	.uleb128	50
	.long	.La736-.Ldebug_info0
.La736:
	.uleb128	17
	.ascii	"vtype\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La107-.Ldebug_info0
	.uleb128	51
	.uleb128	0
	.byte	0
	.uleb128	51
	.uleb128	1
	.byte	0
	.uleb128	51
	.uleb128	2
	.uleb128	17
	.ascii	"vsmallint\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La114-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	3
	.uleb128	17
	.ascii	"vinteger\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	4
	.uleb128	17
	.ascii	"vsingle\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La303-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	5
	.uleb128	17
	.ascii	"vdouble\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La80-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	6
	.uleb128	17
	.ascii	"vcurrency\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La307-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	7
	.uleb128	17
	.ascii	"vdate\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La305-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	8
	.uleb128	17
	.ascii	"volestr\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La737-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	9
	.uleb128	17
	.ascii	"vdispatch\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	10
	.uleb128	17
	.ascii	"verror\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La180-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	11
	.uleb128	17
	.ascii	"vboolean\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La739-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	12
	.byte	0
	.uleb128	51
	.uleb128	13
	.uleb128	17
	.ascii	"vunknown\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	14
	.byte	0
	.uleb128	51
	.uleb128	16
	.uleb128	17
	.ascii	"vshortint\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La404-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	17
	.uleb128	17
	.ascii	"vbyte\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La117-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	18
	.uleb128	17
	.ascii	"vword\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La107-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	19
	.uleb128	17
	.ascii	"vlongword\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La127-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	20
	.uleb128	17
	.ascii	"vint64\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La78-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	21
	.uleb128	17
	.ascii	"vqword\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La72-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	36
	.uleb128	17
	.ascii	"vrecord\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	72
	.byte	0
	.uleb128	51
	.uleb128	256
	.uleb128	17
	.ascii	"vstring\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	257
	.uleb128	17
	.ascii	"vany\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	8192
	.uleb128	17
	.ascii	"varray\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La741-.Ldebug_info0
	.byte	0
	.uleb128	51
	.uleb128	16384
	.uleb128	17
	.ascii	"vpointer\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
	.byte	0
	.byte	0
.La310:
	.uleb128	9
	.long	.La309-.Ldebug_info0
# Definition WideString
.La311:
	.uleb128	11
	.ascii	"WideString\000"
	.long	.La743-.Ldebug_info0
.La743:
	.uleb128	13
	.ascii	"WideString\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La296-.Ldebug_info0
	.uleb128	14
	.uleb128	1
	.byte	16
	.byte	151
	.byte	6
	.byte	18
	.byte	40
	.short	4
	.byte	48
	.byte	47
	.short	6
	.byte	52
	.byte	28
	.byte	148
	.byte	4
	.byte	49
	.byte	37
	.byte	0
.La312:
	.uleb128	9
	.long	.La311-.Ldebug_info0
# Definition UnicodeString
.La313:
	.uleb128	11
	.ascii	"UnicodeString\000"
	.long	.La744-.Ldebug_info0
.La744:
	.uleb128	13
	.ascii	"UnicodeString\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La296-.Ldebug_info0
	.uleb128	14
	.uleb128	1
	.byte	13
	.byte	151
	.byte	6
	.byte	18
	.byte	40
	.short	4
	.byte	48
	.byte	47
	.short	3
	.byte	56
	.byte	28
	.byte	6
	.byte	0
.La314:
	.uleb128	9
	.long	.La313-.Ldebug_info0
# Definition TWriter.Class Of TWriter
.La326:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La327:
	.uleb128	9
	.long	.La326-.Ldebug_info0
# Definition TWriter.Class Of TWriter
.La328:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La329:
	.uleb128	9
	.long	.La328-.Ldebug_info0
# Definition TWriter.Class Of TWriter
.La330:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La331:
	.uleb128	9
	.long	.La330-.Ldebug_info0
# Definition TCollection.Class Of TCollection
.La346:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La347:
	.uleb128	9
	.long	.La346-.Ldebug_info0
# Definition TCollection.Class Of TCollection
.La348:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La349:
	.uleb128	9
	.long	.La348-.Ldebug_info0
# Definition TCollectionItem.Class Of TCollectionItem
.La356:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La357:
	.uleb128	9
	.long	.La356-.Ldebug_info0
# Definition TCollectionItem.Class Of TCollectionItem
.La358:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La359:
	.uleb128	9
	.long	.La358-.Ldebug_info0
# Definition TCollectionEnumerator.Class Of TCollectionEnumerator
.La361:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La362:
	.uleb128	9
	.long	.La361-.Ldebug_info0
# Definition <record type>
.La364:
	.uleb128	11
	.ascii	"$__vtbl_ptr_type\000"
	.long	.La745-.Ldebug_info0
.La745:
	.uleb128	52
	.uleb128	40
	.byte	0
.La365:
	.uleb128	9
	.long	.La364-.Ldebug_info0
# Definition TDuplicates
.La374:
	.uleb128	11
	.ascii	"TDuplicates\000"
	.long	.La746-.Ldebug_info0
.La746:
	.uleb128	30
	.ascii	"TDuplicates\000"
	.byte	4
	.uleb128	31
	.ascii	"dupIgnore\000"
	.long	0
	.uleb128	31
	.ascii	"dupAccept\000"
	.long	1
	.uleb128	31
	.ascii	"dupError\000"
	.long	2
	.byte	0
.La375:
	.uleb128	9
	.long	.La374-.Ldebug_info0
# Definition TStringList.Class Of TStringList
.La380:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La381:
	.uleb128	9
	.long	.La380-.Ldebug_info0
# Definition ShortInt
.La404:
	.uleb128	11
	.ascii	"ShortInt\000"
	.long	.La747-.Ldebug_info0
.La747:
	.uleb128	12
	.ascii	"ShortInt\000"
	.byte	5
	.byte	1
.La405:
	.uleb128	9
	.long	.La404-.Ldebug_info0
# Definition PPropInfo
.La410:
	.uleb128	11
	.ascii	"PPropInfo\000"
	.long	.La748-.Ldebug_info0
.La748:
	.uleb128	20
	.long	.La749-.Ldebug_info0
.La411:
	.uleb128	9
	.long	.La410-.Ldebug_info0
# Definition TMethod
.La437:
	.uleb128	11
	.ascii	"TMethod\000"
	.long	.La751-.Ldebug_info0
.La751:
	.uleb128	16
	.ascii	"TMETHOD\000"
	.uleb128	16
	.uleb128	17
	.ascii	"Code\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"Data\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
.La438:
	.uleb128	9
	.long	.La437-.Ldebug_info0
# Definition TEncoding
.La441:
	.uleb128	11
	.ascii	"TEncoding\000"
	.long	.La752-.Ldebug_info0
.La752:
	.uleb128	20
	.long	.La443-.Ldebug_info0
.La443:
	.uleb128	21
	.ascii	"TEncoding\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FIsSingleByte\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	2
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FMaxCharSize\000"
	.byte	2
	.byte	35
	.uleb128	12
	.byte	2
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"IsSingleByte\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	2
	.long	.La109-.Ldebug_info0
# Procdef class GetANSI:TEncoding; Static;
	.uleb128	36
	.ascii	"GetANSI\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetASCII:TEncoding; Static;
	.uleb128	36
	.ascii	"GetASCII\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetBigEndianUnicode:TEncoding; Static;
	.uleb128	36
	.ascii	"GetBigEndianUnicode\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetDefault:TEncoding; Static;
	.uleb128	36
	.ascii	"GetDefault\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetSystemEncoding:TEncoding; Static;
	.uleb128	36
	.ascii	"GetSystemEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetUnicode:TEncoding; Static;
	.uleb128	36
	.ascii	"GetUnicode\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetUTF7:TEncoding; Static;
	.uleb128	36
	.ascii	"GetUTF7\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetUTF8:TEncoding; Static;
	.uleb128	36
	.ascii	"GetUTF8\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class constructor $create;
	.uleb128	32
	.ascii	"$create\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.byte	0
# Procdef class destructor $destroy;
	.uleb128	32
	.ascii	"$destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.byte	0
# Procdef class FreeEncodings(<Class Of TEncoding>);
	.uleb128	32
	.ascii	"FreeEncodings\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La753-.Ldebug_info0
	.byte	0
# Procdef GetByteCount(<TEncoding>;PUnicodeChar;LongInt):LongInt;
	.uleb128	33
	.ascii	"GetByteCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La755-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetBytes(<TEncoding>;PUnicodeChar;LongInt;PByte;LongInt):LongInt;
	.uleb128	33
	.ascii	"GetBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La755-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La757-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCharCount(<TEncoding>;PByte;LongInt):LongInt;
	.uleb128	33
	.ascii	"GetCharCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La757-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetChars(<TEncoding>;PByte;LongInt;PUnicodeChar;LongInt):LongInt;
	.uleb128	33
	.ascii	"GetChars\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La757-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La755-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAnsiBytes(<TEncoding>;<var TBytes>;PChar;LongInt):{Dynamic} Array Of Byte;
	.uleb128	33
	.ascii	"GetAnsiBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La490-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAnsiString(<TEncoding>;<var AnsiString>;PByte;LongInt):AnsiString;
	.uleb128	33
	.ascii	"GetAnsiString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La757-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCodePage(<TEncoding>):DWord;
	.uleb128	33
	.ascii	"GetCodePage\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
	.long	.La127-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef GetEncodingName(<TEncoding>;<var UnicodeString>):UnicodeString;
	.uleb128	33
	.ascii	"GetEncodingName\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef Clone(<TEncoding>):TEncoding;
	.uleb128	29
	.ascii	"Clone\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.long	.La441-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class Convert(<Class Of TEncoding>;<var TBytes>;TEncoding;TEncoding;const TBytes):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"Convert\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La761-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La441-.Ldebug_info0
# Symbol DESTINATION
	.uleb128	26
	.ascii	"Destination\000"
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
	.byte	0
# Procdef class Convert(<Class Of TEncoding>;<var TBytes>;TEncoding;TEncoding;const TBytes;LongInt;LongInt):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"Convert\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La763-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La441-.Ldebug_info0
# Symbol DESTINATION
	.uleb128	26
	.ascii	"Destination\000"
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol STARTINDEX
	.uleb128	26
	.ascii	"StartIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol COUNT
	.uleb128	26
	.ascii	"Count\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef class IsStandardEncoding(TEncoding):Boolean; Static;
	.uleb128	24
	.ascii	"IsStandardEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La109-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetBufferEncoding(const TBytes;var TEncoding):LongInt; Static;
	.uleb128	24
	.ascii	"GetBufferEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La759-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef class GetBufferEncoding(const TBytes;var TEncoding;TEncoding):LongInt; Static;
	.uleb128	24
	.ascii	"GetBufferEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol BUFFER
	.uleb128	26
	.ascii	"Buffer\000"
	.long	.La759-.Ldebug_info0
# Symbol AENCODING
	.uleb128	26
	.ascii	"AEncoding\000"
	.long	.La441-.Ldebug_info0
# Symbol ADEFAULTENCODING
	.uleb128	26
	.ascii	"ADefaultEncoding\000"
	.long	.La441-.Ldebug_info0
	.byte	0
# Procdef GetByteCount(<TEncoding>;const TUnicodeCharArray):LongInt;
	.uleb128	24
	.ascii	"GetByteCount\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La765-.Ldebug_info0
	.byte	0
# Procdef GetByteCount(<TEncoding>;const TUnicodeCharArray;LongInt;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetByteCount\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La765-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetByteCount(<TEncoding>;const UnicodeString):LongInt;
	.uleb128	24
	.ascii	"GetByteCount\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef GetByteCount(<TEncoding>;const UnicodeString;LongInt;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetByteCount\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La313-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetBytes(<TEncoding>;<var TBytes>;const TUnicodeCharArray):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"GetBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La765-.Ldebug_info0
	.byte	0
# Procdef GetBytes(<TEncoding>;<var TBytes>;const TUnicodeCharArray;LongInt;LongInt):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"GetBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La765-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetBytes(<TEncoding>;const TUnicodeCharArray;LongInt;LongInt;const TBytes;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La765-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetBytes(<TEncoding>;<var TBytes>;const UnicodeString):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"GetBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef GetBytes(<TEncoding>;const UnicodeString;LongInt;LongInt;const TBytes;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La313-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCharCount(<TEncoding>;const TBytes):LongInt;
	.uleb128	24
	.ascii	"GetCharCount\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
	.byte	0
# Procdef GetCharCount(<TEncoding>;const TBytes;LongInt;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetCharCount\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetChars(<TEncoding>;<var TUnicodeCharArray>;const TBytes):{Dynamic} Array Of WideChar;
	.uleb128	24
	.ascii	"GetChars\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La765-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La765-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
	.byte	0
# Procdef GetChars(<TEncoding>;<var TUnicodeCharArray>;const TBytes;LongInt;LongInt):{Dynamic} Array Of WideChar;
	.uleb128	24
	.ascii	"GetChars\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La765-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La765-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetChars(<TEncoding>;const TBytes;LongInt;LongInt;const TUnicodeCharArray;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetChars\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARS
	.uleb128	26
	.ascii	"Chars\000"
	.long	.La765-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef class GetEncoding(LongInt):TEncoding; Static;
	.uleb128	24
	.ascii	"GetEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CODEPAGE
	.uleb128	26
	.ascii	"CodePage\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef class GetEncoding(const UnicodeString):TEncoding; Static;
	.uleb128	24
	.ascii	"GetEncoding\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol ENCODINGNAME
	.uleb128	26
	.ascii	"EncodingName\000"
	.long	.La313-.Ldebug_info0
	.byte	0
# Procdef GetMaxByteCount(<TEncoding>;LongInt):LongInt;
	.uleb128	29
	.ascii	"GetMaxByteCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetMaxCharCount(<TEncoding>;LongInt):LongInt;
	.uleb128	29
	.ascii	"GetMaxCharCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetPreamble(<TEncoding>;<var TBytes>):{Dynamic} Array Of Byte;
	.uleb128	29
	.ascii	"GetPreamble\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
	.byte	0
# Procdef GetString(<TEncoding>;<var UnicodeString>;const TBytes):UnicodeString;
	.uleb128	24
	.ascii	"GetString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
	.byte	0
# Procdef GetString(<TEncoding>;<var UnicodeString>;const TBytes;LongInt;LongInt):UnicodeString;
	.uleb128	24
	.ascii	"GetString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La313-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La313-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAnsiBytes(<TEncoding>;<var TBytes>;const AnsiString):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"GetAnsiBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetAnsiBytes(<TEncoding>;<var TBytes>;const AnsiString;LongInt;LongInt):{Dynamic} Array Of Byte;
	.uleb128	24
	.ascii	"GetAnsiBytes\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La759-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La759-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"S\000"
	.long	.La49-.Ldebug_info0
# Symbol CHARINDEX
	.uleb128	26
	.ascii	"CharIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol CHARCOUNT
	.uleb128	26
	.ascii	"CharCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetAnsiString(<TEncoding>;<var AnsiString>;const TBytes):AnsiString;
	.uleb128	24
	.ascii	"GetAnsiString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
	.byte	0
# Procdef GetAnsiString(<TEncoding>;<var AnsiString>;const TBytes;LongInt;LongInt):AnsiString;
	.uleb128	24
	.ascii	"GetAnsiString\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La441-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
# Symbol BYTES
	.uleb128	26
	.ascii	"Bytes\000"
	.long	.La759-.Ldebug_info0
# Symbol BYTEINDEX
	.uleb128	26
	.ascii	"ByteIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol BYTECOUNT
	.uleb128	26
	.ascii	"ByteCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
	.byte	0
.La442:
	.uleb128	9
	.long	.La441-.Ldebug_info0
# Definition TTextLineBreakStyle
.La449:
	.uleb128	11
	.ascii	"TTextLineBreakStyle\000"
	.long	.La767-.Ldebug_info0
.La767:
	.uleb128	30
	.ascii	"TTextLineBreakStyle\000"
	.byte	4
	.uleb128	31
	.ascii	"tlbsLF\000"
	.long	0
	.uleb128	31
	.ascii	"tlbsCRLF\000"
	.long	1
	.uleb128	31
	.ascii	"tlbsCR\000"
	.long	2
	.byte	0
.La450:
	.uleb128	9
	.long	.La449-.Ldebug_info0
# Definition PAnsiString
.La453:
	.uleb128	11
	.ascii	"PAnsiString\000"
	.long	.La768-.Ldebug_info0
.La768:
	.uleb128	20
	.long	.La49-.Ldebug_info0
.La454:
	.uleb128	9
	.long	.La453-.Ldebug_info0
# Definition TStrings.Class Of TStrings
.La455:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La456:
	.uleb128	9
	.long	.La455-.Ldebug_info0
# Definition TStrings.Class Of TStrings
.La457:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La458:
	.uleb128	9
	.long	.La457-.Ldebug_info0
# Definition TStrings.Class Of TStrings
.La459:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La460:
	.uleb128	9
	.long	.La459-.Ldebug_info0
# Definition TStrings.Class Of TStrings
.La461:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La462:
	.uleb128	9
	.long	.La461-.Ldebug_info0
# Definition TObjectDynArray
.La463:
	.uleb128	11
	.ascii	"TObjectDynArray\000"
	.long	.La769-.Ldebug_info0
.La769:
	.uleb128	13
	.ascii	"TObjectDynArray\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La143-.Ldebug_info0
	.uleb128	53
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
	.long	.La66-.Ldebug_info0
	.byte	0
.La464:
	.uleb128	9
	.long	.La463-.Ldebug_info0
# Definition TStringDynArray
.La465:
	.uleb128	11
	.ascii	"TStringDynArray\000"
	.long	.La770-.Ldebug_info0
.La770:
	.uleb128	13
	.ascii	"TStringDynArray\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La49-.Ldebug_info0
	.uleb128	53
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
	.long	.La66-.Ldebug_info0
	.byte	0
.La466:
	.uleb128	9
	.long	.La465-.Ldebug_info0
# Definition TVarRec
.La469:
	.uleb128	11
	.ascii	"TVarRec\000"
	.long	.La771-.Ldebug_info0
.La771:
	.uleb128	16
	.ascii	"TVARREC\000"
	.uleb128	16
	.uleb128	17
	.ascii	"VType\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La78-.Ldebug_info0
	.uleb128	17
	.ascii	"VInteger\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"VBoolean\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La109-.Ldebug_info0
	.uleb128	17
	.ascii	"VChar\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La86-.Ldebug_info0
	.uleb128	17
	.ascii	"VWideChar\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La296-.Ldebug_info0
	.uleb128	17
	.ascii	"VExtended\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La772-.Ldebug_info0
	.uleb128	17
	.ascii	"VString\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La774-.Ldebug_info0
	.uleb128	17
	.ascii	"VPointer\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"VPChar\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La490-.Ldebug_info0
	.uleb128	17
	.ascii	"VObject\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.uleb128	17
	.ascii	"VClass\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La677-.Ldebug_info0
	.uleb128	17
	.ascii	"VPWideChar\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La737-.Ldebug_info0
	.uleb128	17
	.ascii	"VAnsiString\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"VCurrency\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La776-.Ldebug_info0
	.uleb128	17
	.ascii	"VVariant\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La778-.Ldebug_info0
	.uleb128	17
	.ascii	"VInterface\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"VWideString\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"VInt64\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La780-.Ldebug_info0
	.uleb128	17
	.ascii	"VUnicodeString\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"VQWord\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La782-.Ldebug_info0
	.byte	0
.La470:
	.uleb128	9
	.long	.La469-.Ldebug_info0
# Definition PChar
.La490:
	.uleb128	11
	.ascii	"PChar\000"
	.long	.La784-.Ldebug_info0
.La784:
	.uleb128	20
	.long	.La86-.Ldebug_info0
.La491:
	.uleb128	9
	.long	.La490-.Ldebug_info0
# Definition TStringsEnumerator.Class Of TStringsEnumerator
.La498:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La499:
	.uleb128	9
	.long	.La498-.Ldebug_info0
# Definition TMemoryStream.Class Of TMemoryStream
.La522:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La523:
	.uleb128	9
	.long	.La522-.Ldebug_info0
# Definition TJSONData.Class Of TJSONData
.La532:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La533:
	.uleb128	9
	.long	.La532-.Ldebug_info0
# Definition TJSONData.Class Of TJSONData
.La534:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La535:
	.uleb128	9
	.long	.La534-.Ldebug_info0
# Definition TJSONData.Class Of TJSONData
.La536:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La537:
	.uleb128	9
	.long	.La536-.Ldebug_info0
# Definition UTF8String
.La540:
	.uleb128	11
	.ascii	"UTF8String\000"
	.long	.La785-.Ldebug_info0
.La785:
	.uleb128	13
	.ascii	"AnsiString\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La86-.Ldebug_info0
	.uleb128	14
	.uleb128	1
	.byte	13
	.byte	151
	.byte	6
	.byte	18
	.byte	40
	.short	4
	.byte	48
	.byte	47
	.short	3
	.byte	56
	.byte	28
	.byte	6
	.byte	0
.La541:
	.uleb128	9
	.long	.La540-.Ldebug_info0
# Definition TJSONData.Class Of TJSONData
.La546:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La547:
	.uleb128	9
	.long	.La546-.Ldebug_info0
# Definition TJSONData.Class Of TJSONData
.La548:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La549:
	.uleb128	9
	.long	.La548-.Ldebug_info0
# Definition TFPHashObjectList
.La557:
	.uleb128	11
	.ascii	"TFPHashObjectList\000"
	.long	.La786-.Ldebug_info0
.La786:
	.uleb128	20
	.long	.La559-.Ldebug_info0
.La559:
	.uleb128	21
	.ascii	"TFPHashObjectList\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FFreeObjects\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FHashList\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La787-.Ldebug_info0
	.uleb128	23
	.ascii	"OwnsObjects\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"List\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La787-.Ldebug_info0
# Procdef GetCount(<TFPHashObjectList>):LongInt;
	.uleb128	36
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
	.byte	0
# Procdef SetCount(<TFPHashObjectList>;const LongInt);
	.uleb128	32
	.ascii	"SetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetItem(<TFPHashObjectList>;LongInt):TObject;
	.uleb128	36
	.ascii	"GetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetItem(<TFPHashObjectList>;LongInt;TObject);
	.uleb128	32
	.ascii	"SetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef SetCapacity(<TFPHashObjectList>;LongInt);
	.uleb128	32
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCapacity(<TFPHashObjectList>):LongInt;
	.uleb128	36
	.ascii	"GetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TFPHashObjectList>;<Class Of TFPHashObjectList>;Boolean=`TRUE`);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La790-.Ldebug_info0
# Symbol FREEOBJECTS
	.uleb128	26
	.ascii	"FreeObjects\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TFPHashObjectList>;<Class Of TFPHashObjectList>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La792-.Ldebug_info0
	.byte	0
# Procdef Clear(<TFPHashObjectList>);
	.uleb128	34
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
	.byte	0
# Procdef Add(<TFPHashObjectList>;const ShortString;TObject):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef NameOfIndex(<TFPHashObjectList>;<var ShortString>;LongInt):ShortString;
	.uleb128	24
	.ascii	"NameOfIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La683-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La683-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef HashOfIndex(<TFPHashObjectList>;LongInt):DWord;
	.uleb128	24
	.ascii	"HashOfIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La127-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetNextCollision(<TFPHashObjectList>;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetNextCollision\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Delete(<TFPHashObjectList>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Expand(<TFPHashObjectList>):TFPHashObjectList;
	.uleb128	24
	.ascii	"Expand\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
	.byte	0
# Procdef Extract(<TFPHashObjectList>;TObject):TObject;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Remove(<TFPHashObjectList>;TObject):LongInt;
	.uleb128	24
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TFPHashObjectList>;TObject):LongInt;
	.uleb128	24
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Find(<TFPHashObjectList>;const ShortString):TObject;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"s\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef FindIndexOf(<TFPHashObjectList>;const ShortString):LongInt;
	.uleb128	24
	.ascii	"FindIndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"s\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef FindWithHash(<TFPHashObjectList>;const ShortString;LongWord):^untyped;
	.uleb128	24
	.ascii	"FindWithHash\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
# Symbol AHASH
	.uleb128	26
	.ascii	"AHash\000"
	.long	.La127-.Ldebug_info0
	.byte	0
# Procdef Rename(<TFPHashObjectList>;const ShortString;const ShortString):LongInt;
	.uleb128	24
	.ascii	"Rename\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol AOLDNAME
	.uleb128	26
	.ascii	"AOldName\000"
	.long	.La683-.Ldebug_info0
# Symbol ANEWNAME
	.uleb128	26
	.ascii	"ANewName\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef FindInstanceOf(<TFPHashObjectList>;TClass;Boolean;LongInt):LongInt;
	.uleb128	24
	.ascii	"FindInstanceOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol ACLASS
	.uleb128	26
	.ascii	"AClass\000"
	.long	.La677-.Ldebug_info0
# Symbol AEXACT
	.uleb128	26
	.ascii	"AExact\000"
	.long	.La109-.Ldebug_info0
# Symbol ASTARTAT
	.uleb128	26
	.ascii	"AStartAt\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Pack(<TFPHashObjectList>);
	.uleb128	34
	.ascii	"Pack\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
	.byte	0
# Procdef ShowStatistics(<TFPHashObjectList>);
	.uleb128	34
	.ascii	"ShowStatistics\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPHashObjectList>;TObjectListCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La794-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPHashObjectList>;TObjectListStaticCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La557-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La796-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
	.byte	0
.La558:
	.uleb128	9
	.long	.La557-.Ldebug_info0
# Definition TJSONObject.Class Of TJSONObject
.La560:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La561:
	.uleb128	9
	.long	.La560-.Ldebug_info0
# Definition TJSONObject.Class Of TJSONObject
.La562:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La563:
	.uleb128	9
	.long	.La562-.Ldebug_info0
# Definition TJSONObject.Class Of TJSONObject
.La564:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La565:
	.uleb128	9
	.long	.La564-.Ldebug_info0
# Definition TJSONObject.Class Of TJSONObject
.La568:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La569:
	.uleb128	9
	.long	.La568-.Ldebug_info0
# Definition TJSONObject.Class Of TJSONObject
.La570:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La571:
	.uleb128	9
	.long	.La570-.Ldebug_info0
# Definition TFPObjectList
.La584:
	.uleb128	11
	.ascii	"TFPObjectList\000"
	.long	.La798-.Ldebug_info0
.La798:
	.uleb128	20
	.long	.La586-.Ldebug_info0
.La586:
	.uleb128	21
	.ascii	"TFPObjectList\000"
	.uleb128	24
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FFreeObjects\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"FList\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La153-.Ldebug_info0
	.uleb128	23
	.ascii	"OwnsObjects\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La109-.Ldebug_info0
	.uleb128	23
	.ascii	"List\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La153-.Ldebug_info0
# Procdef GetCount(<TFPObjectList>):LongInt;
	.uleb128	36
	.ascii	"GetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef SetCount(<TFPObjectList>;const LongInt);
	.uleb128	32
	.ascii	"SetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetItem(<TFPObjectList>;LongInt):TObject;
	.uleb128	36
	.ascii	"GetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetItem(<TFPObjectList>;LongInt;TObject);
	.uleb128	32
	.ascii	"SetItem\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef SetCapacity(<TFPObjectList>;LongInt);
	.uleb128	32
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetCapacity(<TFPObjectList>):LongInt;
	.uleb128	36
	.ascii	"GetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TFPObjectList>;<Class Of TFPObjectList>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La799-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TFPObjectList>;<Class Of TFPObjectList>;Boolean);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La801-.Ldebug_info0
# Symbol FREEOBJECTS
	.uleb128	26
	.ascii	"FreeObjects\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TFPObjectList>;<Class Of TFPObjectList>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La803-.Ldebug_info0
	.byte	0
# Procdef Clear(<TFPObjectList>);
	.uleb128	34
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef Add(<TFPObjectList>;TObject):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Delete(<TFPObjectList>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Exchange(<TFPObjectList>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Exchange\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol INDEX1
	.uleb128	26
	.ascii	"Index1\000"
	.long	.La66-.Ldebug_info0
# Symbol INDEX2
	.uleb128	26
	.ascii	"Index2\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Expand(<TFPObjectList>):TFPObjectList;
	.uleb128	24
	.ascii	"Expand\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef Extract(<TFPObjectList>;TObject):TObject;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef Remove(<TFPObjectList>;TObject):LongInt;
	.uleb128	24
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TFPObjectList>;TObject):LongInt;
	.uleb128	24
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef FindInstanceOf(<TFPObjectList>;TClass;Boolean;LongInt):LongInt;
	.uleb128	24
	.ascii	"FindInstanceOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol ACLASS
	.uleb128	26
	.ascii	"AClass\000"
	.long	.La677-.Ldebug_info0
# Symbol AEXACT
	.uleb128	26
	.ascii	"AExact\000"
	.long	.La109-.Ldebug_info0
# Symbol ASTARTAT
	.uleb128	26
	.ascii	"AStartAt\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Insert(<TFPObjectList>;LongInt;TObject);
	.uleb128	34
	.ascii	"Insert\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol AOBJECT
	.uleb128	26
	.ascii	"AObject\000"
	.long	.La143-.Ldebug_info0
	.byte	0
# Procdef First(<TFPObjectList>):TObject;
	.uleb128	24
	.ascii	"First\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef Last(<TFPObjectList>):TObject;
	.uleb128	24
	.ascii	"Last\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La143-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef Move(<TFPObjectList>;LongInt;LongInt);
	.uleb128	34
	.ascii	"Move\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol CURINDEX
	.uleb128	26
	.ascii	"CurIndex\000"
	.long	.La66-.Ldebug_info0
# Symbol NEWINDEX
	.uleb128	26
	.ascii	"NewIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Assign(<TFPObjectList>;TFPObjectList);
	.uleb128	34
	.ascii	"Assign\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol OBJ
	.uleb128	26
	.ascii	"Obj\000"
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef Pack(<TFPObjectList>);
	.uleb128	34
	.ascii	"Pack\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
	.byte	0
# Procdef Sort(<TFPObjectList>;TListSortCompare);
	.uleb128	34
	.ascii	"Sort\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol COMPARE
	.uleb128	26
	.ascii	"Compare\000"
	.long	.La208-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPObjectList>;TObjectListCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La794-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPObjectList>;TObjectListStaticCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La584-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La796-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
	.byte	0
.La585:
	.uleb128	9
	.long	.La584-.Ldebug_info0
# Definition TJSONArray.Class Of TJSONArray
.La587:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La588:
	.uleb128	9
	.long	.La587-.Ldebug_info0
# Definition TJSONArray.Class Of TJSONArray
.La589:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La590:
	.uleb128	9
	.long	.La589-.Ldebug_info0
# Definition TJSONArray.Class Of TJSONArray
.La593:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La594:
	.uleb128	9
	.long	.La593-.Ldebug_info0
# Definition TJSONArray.Class Of TJSONArray
.La595:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La596:
	.uleb128	9
	.long	.La595-.Ldebug_info0
# Definition TJSONNumber.Class Of TJSONNumber
.La608:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La609:
	.uleb128	9
	.long	.La608-.Ldebug_info0
# Definition TJSONNumber.Class Of TJSONNumber
.La612:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La613:
	.uleb128	9
	.long	.La612-.Ldebug_info0
# Definition TJSONString.Class Of TJSONString
.La615:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La616:
	.uleb128	9
	.long	.La615-.Ldebug_info0
# Definition TJSONString.Class Of TJSONString
.La617:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La618:
	.uleb128	9
	.long	.La617-.Ldebug_info0
# Definition TJSONString.Class Of TJSONString
.La619:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La620:
	.uleb128	9
	.long	.La619-.Ldebug_info0
# Definition TJSONBoolean.Class Of TJSONBoolean
.La622:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La623:
	.uleb128	9
	.long	.La622-.Ldebug_info0
# Definition TJSONBoolean.Class Of TJSONBoolean
.La624:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La625:
	.uleb128	9
	.long	.La624-.Ldebug_info0
# Definition TBaseJSONReader
.La631:
	.uleb128	11
	.ascii	"TBaseJSONReader\000"
	.long	.La805-.Ldebug_info0
.La805:
	.uleb128	20
	.long	.La633-.Ldebug_info0
.La633:
	.uleb128	21
	.ascii	"TBaseJSONReader\000"
	.uleb128	16
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FScanner\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La806-.Ldebug_info0
	.uleb128	23
	.ascii	"Scanner\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La806-.Ldebug_info0
# Procdef GetO(<TBaseJSONReader>;TJSONOption):Boolean;
	.uleb128	36
	.ascii	"GetO\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La809-.Ldebug_info0
	.byte	0
# Procdef GetOptions(<TBaseJSONReader>):Set Of TJSONOption;
	.uleb128	36
	.ascii	"GetOptions\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La811-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef SetO(<TBaseJSONReader>;TJSONOption;Boolean);
	.uleb128	32
	.ascii	"SetO\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La809-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef SetOptions(<TBaseJSONReader>;TJSONOptions);
	.uleb128	32
	.ascii	"SetOptions\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La811-.Ldebug_info0
	.byte	0
# Procdef DoError(<TBaseJSONReader>;const AnsiString);
	.uleb128	32
	.ascii	"DoError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef DoParse(<TBaseJSONReader>;Boolean;Boolean);
	.uleb128	32
	.ascii	"DoParse\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol ATCURRENT
	.uleb128	26
	.ascii	"AtCurrent\000"
	.long	.La109-.Ldebug_info0
# Symbol ALLOWEOF
	.uleb128	26
	.ascii	"AllowEOF\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef GetNextToken(<TBaseJSONReader>):<enumeration type>;
	.uleb128	36
	.ascii	"GetNextToken\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La813-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef CurrentTokenString(<TBaseJSONReader>;<var RawByteString>):AnsiString;
	.uleb128	36
	.ascii	"CurrentTokenString\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La815-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La815-.Ldebug_info0
	.byte	0
# Procdef CurrentToken(<TBaseJSONReader>):<enumeration type>;
	.uleb128	36
	.ascii	"CurrentToken\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La813-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef KeyValue(<TBaseJSONReader>;const UTF8String);
	.uleb128	28
	.ascii	"KeyValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	200
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AKEY
	.uleb128	26
	.ascii	"AKey\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef StringValue(<TBaseJSONReader>;const UTF8String);
	.uleb128	28
	.ascii	"StringValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	208
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef NullValue(<TBaseJSONReader>);
	.uleb128	28
	.ascii	"NullValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	216
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef FloatValue(<TBaseJSONReader>;const Double);
	.uleb128	28
	.ascii	"FloatValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	224
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La80-.Ldebug_info0
	.byte	0
# Procdef BooleanValue(<TBaseJSONReader>;const Boolean);
	.uleb128	28
	.ascii	"BooleanValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	232
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef NumberValue(<TBaseJSONReader>;const UTF8String);
	.uleb128	28
	.ascii	"NumberValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	240
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La540-.Ldebug_info0
	.byte	0
# Procdef IntegerValue(<TBaseJSONReader>;const LongInt);
	.uleb128	28
	.ascii	"IntegerValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	248
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Int64Value(<TBaseJSONReader>;const Int64);
	.uleb128	28
	.ascii	"Int64Value\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	256
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef QWordValue(<TBaseJSONReader>;const QWord);
	.uleb128	28
	.ascii	"QWordValue\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	264
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La72-.Ldebug_info0
	.byte	0
# Procdef StartArray(<TBaseJSONReader>);
	.uleb128	28
	.ascii	"StartArray\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	272
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef StartObject(<TBaseJSONReader>);
	.uleb128	28
	.ascii	"StartObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	280
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef EndArray(<TBaseJSONReader>);
	.uleb128	28
	.ascii	"EndArray\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	288
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef EndObject(<TBaseJSONReader>);
	.uleb128	28
	.ascii	"EndObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.byte	5
	.byte	6
	.byte	16
	.uleb128	296
	.byte	34
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef ParseArray(<TBaseJSONReader>);
	.uleb128	32
	.ascii	"ParseArray\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef ParseObject(<TBaseJSONReader>);
	.uleb128	32
	.ascii	"ParseObject\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef ParseNumber(<TBaseJSONReader>);
	.uleb128	32
	.ascii	"ParseNumber\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef DoExecute(<TBaseJSONReader>);
	.uleb128	32
	.ascii	"DoExecute\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TBaseJSONReader>;<Class Of TBaseJSONReader>;TStream;Boolean=`TRUE`);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La817-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La132-.Ldebug_info0
# Symbol AUSEUTF8
	.uleb128	26
	.ascii	"AUseUTF8\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TBaseJSONReader>;<Class Of TBaseJSONReader>;const RawByteString;Boolean=`TRUE`);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La819-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La815-.Ldebug_info0
# Symbol AUSEUTF8
	.uleb128	26
	.ascii	"AUseUTF8\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TBaseJSONReader>;<Class Of TBaseJSONReader>;TStream;TJSONOptions);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La821-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La132-.Ldebug_info0
# Symbol AOPTIONS
	.uleb128	26
	.ascii	"AOptions\000"
	.long	.La811-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TBaseJSONReader>;<Class Of TBaseJSONReader>;const RawByteString;TJSONOptions);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La823-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La815-.Ldebug_info0
# Symbol AOPTIONS
	.uleb128	26
	.ascii	"AOptions\000"
	.long	.La811-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TBaseJSONReader>;<Class Of TBaseJSONReader>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La631-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La825-.Ldebug_info0
	.byte	0
	.byte	0
.La632:
	.uleb128	9
	.long	.La631-.Ldebug_info0
# Definition TJSONParser.{Dynamic} Array Of TJSONData
.La634:
	.uleb128	54
	.byte	2
	.byte	151
	.byte	6
	.long	.La63-.Ldebug_info0
	.uleb128	53
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
	.long	.La66-.Ldebug_info0
	.byte	0
.La635:
	.uleb128	9
	.long	.La634-.Ldebug_info0
# Definition TFitnessTarget.{Dynamic} Array Of TFitnessCriterion
.La639:
	.uleb128	54
	.byte	2
	.byte	151
	.byte	6
	.long	.La3-.Ldebug_info0
	.uleb128	53
	.uleb128	16
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
	.long	.La66-.Ldebug_info0
	.byte	0
.La640:
	.uleb128	9
	.long	.La639-.Ldebug_info0
# Definition TObject.Class Of TObject
.La669:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La670:
	.uleb128	9
	.long	.La669-.Ldebug_info0
# Definition TObject.Class Of TObject
.La671:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La672:
	.uleb128	9
	.long	.La671-.Ldebug_info0
# Definition TObject.Class Of TObject
.La673:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La674:
	.uleb128	9
	.long	.La673-.Ldebug_info0
# Definition TObject.Class Of TObject
.La675:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La676:
	.uleb128	9
	.long	.La675-.Ldebug_info0
# Definition TClass
.La677:
	.uleb128	11
	.ascii	"TClass\000"
	.long	.La827-.Ldebug_info0
.La827:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La678:
	.uleb128	9
	.long	.La677-.Ldebug_info0
# Definition TObject.Class Of TObject
.La679:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La680:
	.uleb128	9
	.long	.La679-.Ldebug_info0
# Definition TObject.Class Of TObject
.La681:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La682:
	.uleb128	9
	.long	.La681-.Ldebug_info0
# Definition ShortString
.La683:
	.uleb128	11
	.ascii	"ShortString\000"
	.long	.La828-.Ldebug_info0
.La828:
	.uleb128	13
	.ascii	"ShortString\000"
	.byte	3
	.byte	151
	.byte	49
	.byte	34
	.long	.La86-.Ldebug_info0
	.uleb128	14
	.uleb128	1
	.byte	3
	.byte	151
	.byte	148
	.byte	1
	.byte	0
.La684:
	.uleb128	9
	.long	.La683-.Ldebug_info0
# Definition TObject.Class Of TObject
.La685:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La686:
	.uleb128	9
	.long	.La685-.Ldebug_info0
# Definition TObject.Class Of TObject
.La687:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La688:
	.uleb128	9
	.long	.La687-.Ldebug_info0
# Definition TObject.Class Of TObject
.La689:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La690:
	.uleb128	9
	.long	.La689-.Ldebug_info0
# Definition TObject.Class Of TObject
.La691:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La692:
	.uleb128	9
	.long	.La691-.Ldebug_info0
# Definition TObject.Class Of TObject
.La693:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La694:
	.uleb128	9
	.long	.La693-.Ldebug_info0
# Definition pstringmessagetable
.La695:
	.uleb128	11
	.ascii	"pstringmessagetable\000"
	.long	.La829-.Ldebug_info0
.La829:
	.uleb128	20
	.long	.La830-.Ldebug_info0
.La696:
	.uleb128	9
	.long	.La695-.Ldebug_info0
# Definition TObject.Class Of TObject
.La697:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La698:
	.uleb128	9
	.long	.La697-.Ldebug_info0
# Definition TObject.Class Of TObject
.La699:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La700:
	.uleb128	9
	.long	.La699-.Ldebug_info0
# Definition TObject.Class Of TObject
.La701:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La702:
	.uleb128	9
	.long	.La701-.Ldebug_info0
# Definition pinterfaceentry
.La703:
	.uleb128	11
	.ascii	"pinterfaceentry\000"
	.long	.La832-.Ldebug_info0
.La832:
	.uleb128	20
	.long	.La833-.Ldebug_info0
.La704:
	.uleb128	9
	.long	.La703-.Ldebug_info0
# Definition TObject.Class Of TObject
.La705:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La706:
	.uleb128	9
	.long	.La705-.Ldebug_info0
# Definition TObject.Class Of TObject
.La707:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La708:
	.uleb128	9
	.long	.La707-.Ldebug_info0
# Definition pinterfacetable
.La709:
	.uleb128	11
	.ascii	"pinterfacetable\000"
	.long	.La835-.Ldebug_info0
.La835:
	.uleb128	20
	.long	.La836-.Ldebug_info0
.La710:
	.uleb128	9
	.long	.La709-.Ldebug_info0
# Definition TObject.Class Of TObject
.La711:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La712:
	.uleb128	9
	.long	.La711-.Ldebug_info0
# Definition TObject.Class Of TObject
.La713:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La714:
	.uleb128	9
	.long	.La713-.Ldebug_info0
# Definition TObject.Class Of TObject
.La715:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La716:
	.uleb128	9
	.long	.La715-.Ldebug_info0
# Definition TGuid.Array[0..7] Of Byte
.La721:
	.uleb128	47
	.uleb128	8
	.long	.La117-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	7
	.uleb128	1
	.long	.La404-.Ldebug_info0
	.byte	0
.La722:
	.uleb128	9
	.long	.La721-.Ldebug_info0
# Definition TGuid.Array[0..7] Of Byte
.La723:
	.uleb128	47
	.uleb128	8
	.long	.La117-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	7
	.uleb128	1
	.long	.La404-.Ldebug_info0
	.byte	0
.La724:
	.uleb128	9
	.long	.La723-.Ldebug_info0
# Definition TGuid.Array[0..5] Of Byte
.La725:
	.uleb128	47
	.uleb128	6
	.long	.La117-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	5
	.uleb128	1
	.long	.La404-.Ldebug_info0
	.byte	0
.La726:
	.uleb128	9
	.long	.La725-.Ldebug_info0
# Definition PWideChar
.La737:
	.uleb128	11
	.ascii	"PWideChar\000"
	.long	.La838-.Ldebug_info0
.La838:
	.uleb128	20
	.long	.La296-.Ldebug_info0
.La738:
	.uleb128	9
	.long	.La737-.Ldebug_info0
# Definition WordBool
.La739:
	.uleb128	11
	.ascii	"WordBool\000"
	.long	.La839-.Ldebug_info0
.La839:
	.uleb128	12
	.ascii	"WordBool\000"
	.byte	2
	.byte	2
.La740:
	.uleb128	9
	.long	.La739-.Ldebug_info0
# Definition pvararray
.La741:
	.uleb128	11
	.ascii	"pvararray\000"
	.long	.La840-.Ldebug_info0
.La840:
	.uleb128	20
	.long	.La841-.Ldebug_info0
.La742:
	.uleb128	9
	.long	.La741-.Ldebug_info0
# Definition TPropInfo
.La749:
	.uleb128	11
	.ascii	"TPropInfo\000"
	.long	.La843-.Ldebug_info0
.La843:
	.uleb128	16
	.ascii	"TPROPINFO\000"
	.uleb128	299
	.uleb128	17
	.ascii	"PropTypeRef\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La844-.Ldebug_info0
	.uleb128	17
	.ascii	"GetProc\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"SetProc\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"StoredProc\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"Index\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"Default\000"
	.byte	2
	.byte	35
	.uleb128	36
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"NameIndex\000"
	.byte	2
	.byte	35
	.uleb128	40
	.long	.La114-.Ldebug_info0
	.uleb128	17
	.ascii	"PropProcs\000"
	.byte	2
	.byte	35
	.uleb128	42
	.long	.La117-.Ldebug_info0
	.uleb128	17
	.ascii	"Name\000"
	.byte	2
	.byte	35
	.uleb128	43
	.long	.La683-.Ldebug_info0
# Procdef GetPropType(<var TPropInfo>):^TTypeInfo;
	.uleb128	36
	.ascii	"GetPropType\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La846-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La749-.Ldebug_info0
	.byte	0
# Procdef GetTail(<var TPropInfo>):^untyped;
	.uleb128	36
	.ascii	"GetTail\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La749-.Ldebug_info0
	.byte	0
# Procdef GetNext(<var TPropInfo>):^TPropInfo;
	.uleb128	36
	.ascii	"GetNext\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La410-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La749-.Ldebug_info0
	.byte	0
	.byte	0
.La750:
	.uleb128	9
	.long	.La749-.Ldebug_info0
# Definition TEncoding.Class Of TEncoding
.La753:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La754:
	.uleb128	9
	.long	.La753-.Ldebug_info0
# Definition PUnicodeChar
.La755:
	.uleb128	11
	.ascii	"PUnicodeChar\000"
	.long	.La848-.Ldebug_info0
.La848:
	.uleb128	20
	.long	.La296-.Ldebug_info0
.La756:
	.uleb128	9
	.long	.La755-.Ldebug_info0
# Definition PByte
.La757:
	.uleb128	11
	.ascii	"PByte\000"
	.long	.La849-.Ldebug_info0
.La849:
	.uleb128	20
	.long	.La117-.Ldebug_info0
.La758:
	.uleb128	9
	.long	.La757-.Ldebug_info0
# Definition TBytes
.La759:
	.uleb128	11
	.ascii	"TBytes\000"
	.long	.La850-.Ldebug_info0
.La850:
	.uleb128	13
	.ascii	"TBytes\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La117-.Ldebug_info0
	.uleb128	53
	.uleb128	1
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
	.long	.La66-.Ldebug_info0
	.byte	0
.La760:
	.uleb128	9
	.long	.La759-.Ldebug_info0
# Definition TEncoding.Class Of TEncoding
.La761:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La762:
	.uleb128	9
	.long	.La761-.Ldebug_info0
# Definition TEncoding.Class Of TEncoding
.La763:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La764:
	.uleb128	9
	.long	.La763-.Ldebug_info0
# Definition TUnicodeCharArray
.La765:
	.uleb128	11
	.ascii	"TUnicodeCharArray\000"
	.long	.La851-.Ldebug_info0
.La851:
	.uleb128	13
	.ascii	"TUnicodeCharArray\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La296-.Ldebug_info0
	.uleb128	53
	.uleb128	2
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
	.long	.La66-.Ldebug_info0
	.byte	0
.La766:
	.uleb128	9
	.long	.La765-.Ldebug_info0
# Definition PExtended
.La772:
	.uleb128	11
	.ascii	"PExtended\000"
	.long	.La852-.Ldebug_info0
.La852:
	.uleb128	20
	.long	.La80-.Ldebug_info0
.La773:
	.uleb128	9
	.long	.La772-.Ldebug_info0
# Definition PShortString
.La774:
	.uleb128	11
	.ascii	"PShortString\000"
	.long	.La853-.Ldebug_info0
.La853:
	.uleb128	20
	.long	.La683-.Ldebug_info0
.La775:
	.uleb128	9
	.long	.La774-.Ldebug_info0
# Definition PCurrency
.La776:
	.uleb128	11
	.ascii	"PCurrency\000"
	.long	.La854-.Ldebug_info0
.La854:
	.uleb128	20
	.long	.La307-.Ldebug_info0
.La777:
	.uleb128	9
	.long	.La776-.Ldebug_info0
# Definition PVariant
.La778:
	.uleb128	11
	.ascii	"PVariant\000"
	.long	.La855-.Ldebug_info0
.La855:
	.uleb128	20
	.long	.La309-.Ldebug_info0
.La779:
	.uleb128	9
	.long	.La778-.Ldebug_info0
# Definition PInt64
.La780:
	.uleb128	11
	.ascii	"PInt64\000"
	.long	.La856-.Ldebug_info0
.La856:
	.uleb128	20
	.long	.La78-.Ldebug_info0
.La781:
	.uleb128	9
	.long	.La780-.Ldebug_info0
# Definition PQWord
.La782:
	.uleb128	11
	.ascii	"PQWord\000"
	.long	.La857-.Ldebug_info0
.La857:
	.uleb128	20
	.long	.La72-.Ldebug_info0
.La783:
	.uleb128	9
	.long	.La782-.Ldebug_info0
# Definition TFPHashList
.La787:
	.uleb128	11
	.ascii	"TFPHashList\000"
	.long	.La858-.Ldebug_info0
.La858:
	.uleb128	20
	.long	.La789-.Ldebug_info0
.La789:
	.uleb128	21
	.ascii	"TFPHashList\000"
	.uleb128	56
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FHashList\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La859-.Ldebug_info0
	.uleb128	23
	.ascii	"FCount\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FCapacity\000"
	.byte	2
	.byte	35
	.uleb128	20
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FHashTable\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La861-.Ldebug_info0
	.uleb128	23
	.ascii	"FHashCapacity\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FStrs\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La490-.Ldebug_info0
	.uleb128	23
	.ascii	"FStrCount\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FStrCapacity\000"
	.byte	2
	.byte	35
	.uleb128	52
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"Capacity\000"
	.byte	2
	.byte	35
	.uleb128	20
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"Count\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"List\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La859-.Ldebug_info0
	.uleb128	23
	.ascii	"Strs\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La490-.Ldebug_info0
# Procdef InternalFind(<TFPHashList>;LongWord;const ShortString;out LongInt):LongInt;
	.uleb128	36
	.ascii	"InternalFind\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol AHASH
	.uleb128	26
	.ascii	"AHash\000"
	.long	.La127-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
# Symbol PREVINDEX
	.uleb128	26
	.ascii	"PrevIndex\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Get(<TFPHashList>;LongInt):^untyped;
	.uleb128	36
	.ascii	"Get\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Put(<TFPHashList>;LongInt;Pointer);
	.uleb128	32
	.ascii	"Put\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef SetCapacity(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"SetCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetCount(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"SetCount\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol NEWCOUNT
	.uleb128	26
	.ascii	"NewCount\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef RaiseIndexError(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"RaiseIndexError\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef AddStr(<TFPHashList>;const ShortString):LongInt;
	.uleb128	36
	.ascii	"AddStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol S
	.uleb128	26
	.ascii	"s\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef AddToHashTable(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"AddToHashTable\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef StrExpand(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"StrExpand\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol MININCSIZE
	.uleb128	26
	.ascii	"MinIncSize\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetStrCapacity(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"SetStrCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef SetHashCapacity(<TFPHashList>;LongInt);
	.uleb128	32
	.ascii	"SetHashCapacity\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol NEWCAPACITY
	.uleb128	26
	.ascii	"NewCapacity\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef ReHash(<TFPHashList>);
	.uleb128	32
	.ascii	"ReHash\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TFPHashList>;<Class Of TFPHashList>);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La863-.Ldebug_info0
	.byte	0
# Procdef destructor Destroy(<TFPHashList>;<Class Of TFPHashList>);
	.uleb128	27
	.ascii	"Destroy\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	1
	.byte	4
	.byte	6
	.byte	16
	.uleb128	96
	.byte	34
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La865-.Ldebug_info0
	.byte	0
# Procdef Add(<TFPHashList>;const ShortString;Pointer):LongInt;
	.uleb128	24
	.ascii	"Add\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Clear(<TFPHashList>);
	.uleb128	34
	.ascii	"Clear\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
	.byte	0
# Procdef NameOfIndex(<TFPHashList>;<var ShortString>;LongInt):ShortString;
	.uleb128	24
	.ascii	"NameOfIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La683-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La683-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef HashOfIndex(<TFPHashList>;LongInt):DWord;
	.uleb128	24
	.ascii	"HashOfIndex\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La127-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef GetNextCollision(<TFPHashList>;LongInt):LongInt;
	.uleb128	24
	.ascii	"GetNextCollision\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef Delete(<TFPHashList>;LongInt);
	.uleb128	34
	.ascii	"Delete\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol INDEX
	.uleb128	26
	.ascii	"Index\000"
	.long	.La66-.Ldebug_info0
	.byte	0
# Procdef class Error(<Class Of TFPHashList>;const AnsiString;Int64);
	.uleb128	34
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol self
	.uleb128	25
	.ascii	"self\000"
	.byte	1
	.long	.La867-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
# Symbol DATA
	.uleb128	26
	.ascii	"Data\000"
	.long	.La78-.Ldebug_info0
	.byte	0
# Procdef Expand(<TFPHashList>):TFPHashList;
	.uleb128	24
	.ascii	"Expand\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
	.byte	0
# Procdef Extract(<TFPHashList>;Pointer):^untyped;
	.uleb128	24
	.ascii	"Extract\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef IndexOf(<TFPHashList>;Pointer):LongInt;
	.uleb128	24
	.ascii	"IndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Find(<TFPHashList>;const ShortString):^untyped;
	.uleb128	24
	.ascii	"Find\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef FindIndexOf(<TFPHashList>;const ShortString):LongInt;
	.uleb128	24
	.ascii	"FindIndexOf\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef FindWithHash(<TFPHashList>;const ShortString;LongWord):^untyped;
	.uleb128	24
	.ascii	"FindWithHash\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La156-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ANAME
	.uleb128	26
	.ascii	"AName\000"
	.long	.La683-.Ldebug_info0
# Symbol AHASH
	.uleb128	26
	.ascii	"AHash\000"
	.long	.La127-.Ldebug_info0
	.byte	0
# Procdef Rename(<TFPHashList>;const ShortString;const ShortString):LongInt;
	.uleb128	24
	.ascii	"Rename\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol AOLDNAME
	.uleb128	26
	.ascii	"AOldName\000"
	.long	.La683-.Ldebug_info0
# Symbol ANEWNAME
	.uleb128	26
	.ascii	"ANewName\000"
	.long	.La683-.Ldebug_info0
	.byte	0
# Procdef Remove(<TFPHashList>;Pointer):LongInt;
	.uleb128	24
	.ascii	"Remove\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol ITEM
	.uleb128	26
	.ascii	"Item\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef Pack(<TFPHashList>);
	.uleb128	34
	.ascii	"Pack\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
	.byte	0
# Procdef ShowStatistics(<TFPHashList>);
	.uleb128	34
	.ascii	"ShowStatistics\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPHashList>;TListCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La210-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
# Procdef ForEachCall(<TFPHashList>;TListStaticCallback;Pointer);
	.uleb128	34
	.ascii	"ForEachCall\000"
	.byte	1
	.byte	65
	.byte	1
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La787-.Ldebug_info0
# Symbol PROC2CALL
	.uleb128	26
	.ascii	"proc2call\000"
	.long	.La212-.Ldebug_info0
# Symbol ARG
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
	.byte	0
.La788:
	.uleb128	9
	.long	.La787-.Ldebug_info0
# Definition TFPHashObjectList.Class Of TFPHashObjectList
.La790:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La791:
	.uleb128	9
	.long	.La790-.Ldebug_info0
# Definition TFPHashObjectList.Class Of TFPHashObjectList
.La792:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La793:
	.uleb128	9
	.long	.La792-.Ldebug_info0
# Definition <procedure variable type of procedure(TObject;Pointer) of object;Register>
.La794:
	.uleb128	11
	.ascii	"TObjectListCallback\000"
	.long	.La869-.Ldebug_info0
.La869:
	.uleb128	41
	.byte	16
	.uleb128	17
	.ascii	"Proc\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La870-.Ldebug_info0
	.uleb128	17
	.ascii	"Self\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La143-.Ldebug_info0
	.byte	0
.La870:
	.uleb128	42
	.ascii	"TObjectListCallback\000"
	.byte	1
	.uleb128	26
	.ascii	"this\000"
	.long	.La156-.Ldebug_info0
	.uleb128	26
	.ascii	"data\000"
	.long	.La143-.Ldebug_info0
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
.La795:
	.uleb128	9
	.long	.La794-.Ldebug_info0
# Definition <procedure variable type of procedure(TObject;Pointer);Register>
.La796:
	.uleb128	11
	.ascii	"TObjectListStaticCallback\000"
	.long	.La871-.Ldebug_info0
.La871:
	.uleb128	42
	.ascii	"TObjectListStaticCallback\000"
	.byte	1
	.uleb128	26
	.ascii	"data\000"
	.long	.La143-.Ldebug_info0
	.uleb128	26
	.ascii	"arg\000"
	.long	.La156-.Ldebug_info0
	.byte	0
.La797:
	.uleb128	9
	.long	.La796-.Ldebug_info0
# Definition TFPObjectList.Class Of TFPObjectList
.La799:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La800:
	.uleb128	9
	.long	.La799-.Ldebug_info0
# Definition TFPObjectList.Class Of TFPObjectList
.La801:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La802:
	.uleb128	9
	.long	.La801-.Ldebug_info0
# Definition TFPObjectList.Class Of TFPObjectList
.La803:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La804:
	.uleb128	9
	.long	.La803-.Ldebug_info0
# Definition TJSONScanner
.La806:
	.uleb128	11
	.ascii	"TJSONScanner\000"
	.long	.La872-.Ldebug_info0
.La872:
	.uleb128	20
	.long	.La808-.Ldebug_info0
.La808:
	.uleb128	21
	.ascii	"TJSONScanner\000"
	.uleb128	72
	.uleb128	22
	.byte	1
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La145-.Ldebug_info0
	.uleb128	23
	.ascii	"FSource\000"
	.byte	2
	.byte	35
	.uleb128	8
	.byte	3
	.long	.La815-.Ldebug_info0
	.uleb128	23
	.ascii	"FCurPos\000"
	.byte	2
	.byte	35
	.uleb128	16
	.byte	3
	.long	.La490-.Ldebug_info0
	.uleb128	23
	.ascii	"FCurRow\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"FCurToken\000"
	.byte	2
	.byte	35
	.uleb128	28
	.byte	3
	.long	.La813-.Ldebug_info0
	.uleb128	23
	.ascii	"FCurTokenString\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"FCurLine\000"
	.byte	2
	.byte	35
	.uleb128	40
	.byte	3
	.long	.La490-.Ldebug_info0
	.uleb128	23
	.ascii	"FTokenStr\000"
	.byte	2
	.byte	35
	.uleb128	48
	.byte	3
	.long	.La490-.Ldebug_info0
	.uleb128	23
	.ascii	"FEOL\000"
	.byte	2
	.byte	35
	.uleb128	56
	.byte	3
	.long	.La490-.Ldebug_info0
	.uleb128	23
	.ascii	"FOptions\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La811-.Ldebug_info0
	.uleb128	23
	.ascii	"CurRow\000"
	.byte	2
	.byte	35
	.uleb128	24
	.byte	3
	.long	.La66-.Ldebug_info0
	.uleb128	23
	.ascii	"CurToken\000"
	.byte	2
	.byte	35
	.uleb128	28
	.byte	3
	.long	.La813-.Ldebug_info0
	.uleb128	23
	.ascii	"CurTokenString\000"
	.byte	2
	.byte	35
	.uleb128	32
	.byte	3
	.long	.La49-.Ldebug_info0
	.uleb128	23
	.ascii	"Options\000"
	.byte	2
	.byte	35
	.uleb128	64
	.byte	3
	.long	.La811-.Ldebug_info0
# Procdef GetCurColumn(<TJSONScanner>):LongInt;
	.uleb128	36
	.ascii	"GetCurColumn\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La66-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
	.byte	0
# Procdef GetCurLine(<TJSONScanner>;<var AnsiString>):AnsiString;
	.uleb128	36
	.ascii	"GetCurLine\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La49-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol result
	.uleb128	35
	.ascii	"$result\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef GetO(<TJSONScanner>;TJSONOption):Boolean;
	.uleb128	36
	.ascii	"GetO\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La109-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La809-.Ldebug_info0
	.byte	0
# Procdef SetO(<TJSONScanner>;TJSONOption;Boolean);
	.uleb128	32
	.ascii	"SetO\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol AINDEX
	.uleb128	26
	.ascii	"AIndex\000"
	.long	.La809-.Ldebug_info0
# Symbol AVALUE
	.uleb128	26
	.ascii	"AValue\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef Error(<TJSONScanner>;const AnsiString);
	.uleb128	32
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
	.byte	0
# Procdef Error(<TJSONScanner>;const AnsiString;const Array Of Const;<const Int64>);
	.uleb128	32
	.ascii	"Error\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	2
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol MSG
	.uleb128	26
	.ascii	"Msg\000"
	.long	.La49-.Ldebug_info0
# Symbol ARGS
	.uleb128	26
	.ascii	"Args\000"
	.long	.La873-.Ldebug_info0
# Symbol highARGS
	.uleb128	26
	.ascii	"$highARGS\000"
	.long	.La78-.Ldebug_info0
# Definition Array Of Const
.La873:
	.uleb128	7
	.long	.La469-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.uleb128	16
	.long	.La78-.Ldebug_info0
	.byte	0
.La874:
	.uleb128	9
	.long	.La873-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONScanner>;<Class Of TJSONScanner>;TStream;Boolean=`TRUE`);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La875-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La132-.Ldebug_info0
# Symbol AUSEUTF8
	.uleb128	26
	.ascii	"AUseUTF8\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONScanner>;<Class Of TJSONScanner>;TStream;TJSONOptions);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La877-.Ldebug_info0
# Symbol SOURCE
	.uleb128	26
	.ascii	"Source\000"
	.long	.La132-.Ldebug_info0
# Symbol AOPTIONS
	.uleb128	26
	.ascii	"AOptions\000"
	.long	.La811-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONScanner>;<Class Of TJSONScanner>;const RawByteString;Boolean=`TRUE`);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La879-.Ldebug_info0
# Symbol ASOURCE
	.uleb128	26
	.ascii	"aSource\000"
	.long	.La815-.Ldebug_info0
# Symbol AUSEUTF8
	.uleb128	26
	.ascii	"AUseUTF8\000"
	.long	.La109-.Ldebug_info0
	.byte	0
# Procdef constructor Create(<TJSONScanner>;<Class Of TJSONScanner>;const RawByteString;TJSONOptions);
	.uleb128	24
	.ascii	"Create\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
# Symbol vmt
	.uleb128	26
	.ascii	"$vmt\000"
	.long	.La881-.Ldebug_info0
# Symbol ASOURCE
	.uleb128	26
	.ascii	"aSource\000"
	.long	.La815-.Ldebug_info0
# Symbol AOPTIONS
	.uleb128	26
	.ascii	"AOptions\000"
	.long	.La811-.Ldebug_info0
	.byte	0
# Procdef FetchToken(<TJSONScanner>):<enumeration type>;
	.uleb128	24
	.ascii	"FetchToken\000"
	.byte	1
	.byte	65
	.byte	1
	.long	.La813-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La806-.Ldebug_info0
	.byte	0
	.byte	0
.La807:
	.uleb128	9
	.long	.La806-.Ldebug_info0
# Definition TJSONOption
.La809:
	.uleb128	11
	.ascii	"TJSONOption\000"
	.long	.La883-.Ldebug_info0
.La883:
	.uleb128	30
	.ascii	"TJSONOption\000"
	.byte	4
	.uleb128	31
	.ascii	"joUTF8\000"
	.long	0
	.uleb128	31
	.ascii	"joStrict\000"
	.long	1
	.uleb128	31
	.ascii	"joComments\000"
	.long	2
	.uleb128	31
	.ascii	"joIgnoreTrailingComma\000"
	.long	3
	.uleb128	31
	.ascii	"joIgnoreDuplicates\000"
	.long	4
	.uleb128	31
	.ascii	"joBOMCheck\000"
	.long	5
	.byte	0
.La810:
	.uleb128	9
	.long	.La809-.Ldebug_info0
# Definition TJSONOptions
.La811:
	.uleb128	11
	.ascii	"TJSONOptions\000"
	.long	.La884-.Ldebug_info0
.La884:
	.uleb128	39
	.ascii	"TJSONOptions\000"
	.short	4
	.long	.La885-.Ldebug_info0
.La885:
	.uleb128	40
	.sleb128	0
	.sleb128	5
	.long	.La809-.Ldebug_info0
.La812:
	.uleb128	9
	.long	.La811-.Ldebug_info0
# Definition TJSONToken
.La813:
	.uleb128	11
	.ascii	"TJSONToken\000"
	.long	.La886-.Ldebug_info0
.La886:
	.uleb128	30
	.ascii	"TJSONToken\000"
	.byte	4
	.uleb128	31
	.ascii	"tkEOF\000"
	.long	0
	.uleb128	31
	.ascii	"tkWhitespace\000"
	.long	1
	.uleb128	31
	.ascii	"tkString\000"
	.long	2
	.uleb128	31
	.ascii	"tkNumber\000"
	.long	3
	.uleb128	31
	.ascii	"tkTrue\000"
	.long	4
	.uleb128	31
	.ascii	"tkFalse\000"
	.long	5
	.uleb128	31
	.ascii	"tkNull\000"
	.long	6
	.uleb128	31
	.ascii	"tkComma\000"
	.long	7
	.uleb128	31
	.ascii	"tkColon\000"
	.long	8
	.uleb128	31
	.ascii	"tkCurlyBraceOpen\000"
	.long	9
	.uleb128	31
	.ascii	"tkCurlyBraceClose\000"
	.long	10
	.uleb128	31
	.ascii	"tkSquaredBraceOpen\000"
	.long	11
	.uleb128	31
	.ascii	"tkSquaredBraceClose\000"
	.long	12
	.uleb128	31
	.ascii	"tkIdentifier\000"
	.long	13
	.uleb128	31
	.ascii	"tkComment\000"
	.long	14
	.uleb128	31
	.ascii	"tkUnknown\000"
	.long	15
	.byte	0
.La814:
	.uleb128	9
	.long	.La813-.Ldebug_info0
# Definition RawByteString
.La815:
	.uleb128	11
	.ascii	"RawByteString\000"
	.long	.La887-.Ldebug_info0
.La887:
	.uleb128	13
	.ascii	"AnsiString\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La86-.Ldebug_info0
	.uleb128	14
	.uleb128	1
	.byte	13
	.byte	151
	.byte	6
	.byte	18
	.byte	40
	.short	4
	.byte	48
	.byte	47
	.short	3
	.byte	56
	.byte	28
	.byte	6
	.byte	0
.La816:
	.uleb128	9
	.long	.La815-.Ldebug_info0
# Definition TBaseJSONReader.Class Of TBaseJSONReader
.La817:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La818:
	.uleb128	9
	.long	.La817-.Ldebug_info0
# Definition TBaseJSONReader.Class Of TBaseJSONReader
.La819:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La820:
	.uleb128	9
	.long	.La819-.Ldebug_info0
# Definition TBaseJSONReader.Class Of TBaseJSONReader
.La821:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La822:
	.uleb128	9
	.long	.La821-.Ldebug_info0
# Definition TBaseJSONReader.Class Of TBaseJSONReader
.La823:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La824:
	.uleb128	9
	.long	.La823-.Ldebug_info0
# Definition TBaseJSONReader.Class Of TBaseJSONReader
.La825:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La826:
	.uleb128	9
	.long	.La825-.Ldebug_info0
# Definition TStringMessageTable
.La830:
	.uleb128	11
	.ascii	"TStringMessageTable\000"
	.long	.La888-.Ldebug_info0
.La888:
	.uleb128	16
	.ascii	"TSTRINGMESSAGETABLE\000"
	.uleb128	24
	.uleb128	17
	.ascii	"count\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"msgstrtable\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La889-.Ldebug_info0
	.byte	0
.La831:
	.uleb128	9
	.long	.La830-.Ldebug_info0
# Definition tinterfaceentry
.La833:
	.uleb128	11
	.ascii	"tinterfaceentry\000"
	.long	.La891-.Ldebug_info0
.La891:
	.uleb128	16
	.ascii	"TINTERFACEENTRY\000"
	.uleb128	40
	.uleb128	17
	.ascii	"IIDRef\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La892-.Ldebug_info0
	.uleb128	17
	.ascii	"VTable\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"IOffset\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"IOffsetAsCodePtr\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"IIDStrRef\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La894-.Ldebug_info0
	.uleb128	17
	.ascii	"IType\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La896-.Ldebug_info0
# Procdef GetIID(<var tinterfaceentry>):^TGuid;
	.uleb128	36
	.ascii	"GetIID\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La898-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La833-.Ldebug_info0
	.byte	0
# Procdef GetIIDStr(<var tinterfaceentry>):^ShortString;
	.uleb128	36
	.ascii	"GetIIDStr\000"
	.byte	1
	.byte	65
	.byte	1
	.byte	3
	.long	.La774-.Ldebug_info0
# Symbol this
	.uleb128	25
	.ascii	"this\000"
	.byte	1
	.long	.La833-.Ldebug_info0
	.byte	0
	.byte	0
.La834:
	.uleb128	9
	.long	.La833-.Ldebug_info0
# Definition tinterfacetable
.La836:
	.uleb128	11
	.ascii	"tinterfacetable\000"
	.long	.La900-.Ldebug_info0
.La900:
	.uleb128	16
	.ascii	"TINTERFACETABLE\000"
	.uleb128	48
	.uleb128	17
	.ascii	"EntryCount\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La72-.Ldebug_info0
	.uleb128	17
	.ascii	"Entries\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La901-.Ldebug_info0
	.byte	0
.La837:
	.uleb128	9
	.long	.La836-.Ldebug_info0
# Definition tvararray
.La841:
	.uleb128	11
	.ascii	"tvararray\000"
	.long	.La903-.Ldebug_info0
.La903:
	.uleb128	16
	.ascii	"TVARARRAY\000"
	.uleb128	32
	.uleb128	17
	.ascii	"dimcount\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"flags\000"
	.byte	2
	.byte	35
	.uleb128	2
	.long	.La107-.Ldebug_info0
	.uleb128	17
	.ascii	"elementsize\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"lockcount\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"data\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La156-.Ldebug_info0
	.uleb128	17
	.ascii	"bounds\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La904-.Ldebug_info0
	.byte	0
.La842:
	.uleb128	9
	.long	.La841-.Ldebug_info0
# Definition PPTypeInfo
.La844:
	.uleb128	11
	.ascii	"PPTypeInfo\000"
	.long	.La906-.Ldebug_info0
.La906:
	.uleb128	20
	.long	.La846-.Ldebug_info0
.La845:
	.uleb128	9
	.long	.La844-.Ldebug_info0
# Definition PTypeInfo
.La846:
	.uleb128	11
	.ascii	"PTypeInfo\000"
	.long	.La907-.Ldebug_info0
.La907:
	.uleb128	20
	.long	.La908-.Ldebug_info0
.La847:
	.uleb128	9
	.long	.La846-.Ldebug_info0
# Definition PHashItemList
.La859:
	.uleb128	11
	.ascii	"PHashItemList\000"
	.long	.La910-.Ldebug_info0
.La910:
	.uleb128	20
	.long	.La911-.Ldebug_info0
.La860:
	.uleb128	9
	.long	.La859-.Ldebug_info0
# Definition PHashTable
.La861:
	.uleb128	11
	.ascii	"PHashTable\000"
	.long	.La913-.Ldebug_info0
.La913:
	.uleb128	20
	.long	.La914-.Ldebug_info0
.La862:
	.uleb128	9
	.long	.La861-.Ldebug_info0
# Definition TFPHashList.Class Of TFPHashList
.La863:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La864:
	.uleb128	9
	.long	.La863-.Ldebug_info0
# Definition TFPHashList.Class Of TFPHashList
.La865:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La866:
	.uleb128	9
	.long	.La865-.Ldebug_info0
# Definition TFPHashList.Class Of TFPHashList
.La867:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La868:
	.uleb128	9
	.long	.La867-.Ldebug_info0
# Definition TJSONScanner.Class Of TJSONScanner
.La875:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La876:
	.uleb128	9
	.long	.La875-.Ldebug_info0
# Definition TJSONScanner.Class Of TJSONScanner
.La877:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La878:
	.uleb128	9
	.long	.La877-.Ldebug_info0
# Definition TJSONScanner.Class Of TJSONScanner
.La879:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La880:
	.uleb128	9
	.long	.La879-.Ldebug_info0
# Definition TJSONScanner.Class Of TJSONScanner
.La881:
	.uleb128	20
	.long	.La364-.Ldebug_info0
.La882:
	.uleb128	9
	.long	.La881-.Ldebug_info0
# Definition TStringMessageTable.Array[0..0] Of TMsgStrTable
.La889:
	.uleb128	47
	.uleb128	16
	.long	.La916-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	0
	.uleb128	16
	.long	.La404-.Ldebug_info0
	.byte	0
.La890:
	.uleb128	9
	.long	.La889-.Ldebug_info0
# Definition tinterfaceentry.^PGuid
.La892:
	.uleb128	20
	.long	.La898-.Ldebug_info0
.La893:
	.uleb128	9
	.long	.La892-.Ldebug_info0
# Definition tinterfaceentry.^PShortString
.La894:
	.uleb128	20
	.long	.La774-.Ldebug_info0
.La895:
	.uleb128	9
	.long	.La894-.Ldebug_info0
# Definition tinterfaceentrytype
.La896:
	.uleb128	11
	.ascii	"tinterfaceentrytype\000"
	.long	.La918-.Ldebug_info0
.La918:
	.uleb128	30
	.ascii	"tinterfaceentrytype\000"
	.byte	4
	.uleb128	31
	.ascii	"etStandard\000"
	.long	0
	.uleb128	31
	.ascii	"etVirtualMethodResult\000"
	.long	1
	.uleb128	31
	.ascii	"etStaticMethodResult\000"
	.long	2
	.uleb128	31
	.ascii	"etFieldValue\000"
	.long	3
	.uleb128	31
	.ascii	"etVirtualMethodClass\000"
	.long	4
	.uleb128	31
	.ascii	"etStaticMethodClass\000"
	.long	5
	.uleb128	31
	.ascii	"etFieldValueClass\000"
	.long	6
	.byte	0
.La897:
	.uleb128	9
	.long	.La896-.Ldebug_info0
# Definition PGuid
.La898:
	.uleb128	11
	.ascii	"PGuid\000"
	.long	.La919-.Ldebug_info0
.La919:
	.uleb128	20
	.long	.La182-.Ldebug_info0
.La899:
	.uleb128	9
	.long	.La898-.Ldebug_info0
# Definition tinterfacetable.Array[0..0] Of tinterfaceentry
.La901:
	.uleb128	47
	.uleb128	40
	.long	.La833-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	0
	.uleb128	40
	.long	.La404-.Ldebug_info0
	.byte	0
.La902:
	.uleb128	9
	.long	.La901-.Ldebug_info0
# Definition tvararrayboundarray
.La904:
	.uleb128	11
	.ascii	"tvararrayboundarray\000"
	.long	.La920-.Ldebug_info0
.La920:
	.uleb128	18
	.ascii	"tvararrayboundarray\000"
	.uleb128	8
	.long	.La921-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	0
	.uleb128	8
	.long	.La404-.Ldebug_info0
	.byte	0
.La905:
	.uleb128	9
	.long	.La904-.Ldebug_info0
# Definition TTypeInfo
.La908:
	.uleb128	11
	.ascii	"TTypeInfo\000"
	.long	.La923-.Ldebug_info0
.La923:
	.uleb128	16
	.ascii	"TTYPEINFO\000"
	.uleb128	257
	.uleb128	17
	.ascii	"Kind\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La924-.Ldebug_info0
	.uleb128	17
	.ascii	"Name\000"
	.byte	2
	.byte	35
	.uleb128	1
	.long	.La683-.Ldebug_info0
	.byte	0
.La909:
	.uleb128	9
	.long	.La908-.Ldebug_info0
# Definition THashItemList
.La911:
	.uleb128	11
	.ascii	"THashItemList\000"
	.long	.La926-.Ldebug_info0
.La926:
	.uleb128	18
	.ascii	"THashItemList\000"
	.uleb128	3221225448
	.long	.La927-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	134217726
	.uleb128	24
	.long	.La66-.Ldebug_info0
	.byte	0
.La912:
	.uleb128	9
	.long	.La911-.Ldebug_info0
# Definition THashTable
.La914:
	.uleb128	11
	.ascii	"THashTable\000"
	.long	.La929-.Ldebug_info0
.La929:
	.uleb128	18
	.ascii	"THashTable\000"
	.uleb128	2147483644
	.long	.La66-.Ldebug_info0
	.uleb128	19
	.sleb128	0
	.sleb128	536870910
	.uleb128	4
	.long	.La66-.Ldebug_info0
	.byte	0
.La915:
	.uleb128	9
	.long	.La914-.Ldebug_info0
# Definition TMsgStrTable
.La916:
	.uleb128	11
	.ascii	"TMsgStrTable\000"
	.long	.La930-.Ldebug_info0
.La930:
	.uleb128	16
	.ascii	"TMSGSTRTABLE\000"
	.uleb128	16
	.uleb128	17
	.ascii	"name\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La774-.Ldebug_info0
	.uleb128	17
	.ascii	"method\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La156-.Ldebug_info0
	.byte	0
.La917:
	.uleb128	9
	.long	.La916-.Ldebug_info0
# Definition tvararraybound
.La921:
	.uleb128	11
	.ascii	"tvararraybound\000"
	.long	.La931-.Ldebug_info0
.La931:
	.uleb128	16
	.ascii	"TVARARRAYBOUND\000"
	.uleb128	8
	.uleb128	17
	.ascii	"elementcount\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"lowbound\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La66-.Ldebug_info0
	.byte	0
.La922:
	.uleb128	9
	.long	.La921-.Ldebug_info0
# Definition TTypeKind
.La924:
	.uleb128	11
	.ascii	"TTypeKind\000"
	.long	.La932-.Ldebug_info0
.La932:
	.uleb128	30
	.ascii	"TTypeKind\000"
	.byte	1
	.uleb128	31
	.ascii	"tkUnknown\000"
	.long	0
	.uleb128	31
	.ascii	"tkInteger\000"
	.long	1
	.uleb128	31
	.ascii	"tkChar\000"
	.long	2
	.uleb128	31
	.ascii	"tkEnumeration\000"
	.long	3
	.uleb128	31
	.ascii	"tkFloat\000"
	.long	4
	.uleb128	31
	.ascii	"tkSet\000"
	.long	5
	.uleb128	31
	.ascii	"tkMethod\000"
	.long	6
	.uleb128	31
	.ascii	"tkSString\000"
	.long	7
	.uleb128	31
	.ascii	"tkLString\000"
	.long	8
	.uleb128	31
	.ascii	"tkAString\000"
	.long	9
	.uleb128	31
	.ascii	"tkWString\000"
	.long	10
	.uleb128	31
	.ascii	"tkVariant\000"
	.long	11
	.uleb128	31
	.ascii	"tkArray\000"
	.long	12
	.uleb128	31
	.ascii	"tkRecord\000"
	.long	13
	.uleb128	31
	.ascii	"tkInterface\000"
	.long	14
	.uleb128	31
	.ascii	"tkClass\000"
	.long	15
	.uleb128	31
	.ascii	"tkObject\000"
	.long	16
	.uleb128	31
	.ascii	"tkWChar\000"
	.long	17
	.uleb128	31
	.ascii	"tkBool\000"
	.long	18
	.uleb128	31
	.ascii	"tkInt64\000"
	.long	19
	.uleb128	31
	.ascii	"tkQWord\000"
	.long	20
	.uleb128	31
	.ascii	"tkDynArray\000"
	.long	21
	.uleb128	31
	.ascii	"tkInterfaceRaw\000"
	.long	22
	.uleb128	31
	.ascii	"tkProcVar\000"
	.long	23
	.uleb128	31
	.ascii	"tkUString\000"
	.long	24
	.uleb128	31
	.ascii	"tkUChar\000"
	.long	25
	.uleb128	31
	.ascii	"tkHelper\000"
	.long	26
	.uleb128	31
	.ascii	"tkFile\000"
	.long	27
	.uleb128	31
	.ascii	"tkClassRef\000"
	.long	28
	.uleb128	31
	.ascii	"tkPointer\000"
	.long	29
	.byte	0
.La925:
	.uleb128	9
	.long	.La924-.Ldebug_info0
# Definition THashItem
.La927:
	.uleb128	11
	.ascii	"THashItem\000"
	.long	.La933-.Ldebug_info0
.La933:
	.uleb128	16
	.ascii	"THASHITEM\000"
	.uleb128	24
	.uleb128	17
	.ascii	"HashValue\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La127-.Ldebug_info0
	.uleb128	17
	.ascii	"StrIndex\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"NextIndex\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La66-.Ldebug_info0
	.uleb128	17
	.ascii	"Data\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La156-.Ldebug_info0
	.byte	0
.La928:
	.uleb128	9
	.long	.La927-.Ldebug_info0
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
	.uleb128	73
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 3
	.uleb128	3
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
# Abbrev 6
	.uleb128	6
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
# Abbrev 7
	.uleb128	7
	.uleb128	1
	.byte	1
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 8
	.uleb128	8
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
# Abbrev 9
	.uleb128	9
	.uleb128	16
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 10
	.uleb128	10
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
# Abbrev 11
	.uleb128	11
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
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
	.uleb128	1
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	80
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 14
	.uleb128	14
	.uleb128	33
	.byte	0
	.uleb128	34
	.uleb128	15
	.uleb128	47
	.uleb128	10
	.byte	0
	.byte	0
# Abbrev 15
	.uleb128	15
	.uleb128	15
	.byte	0
	.byte	0
	.byte	0
# Abbrev 16
	.uleb128	16
	.uleb128	19
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 17
	.uleb128	17
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
# Abbrev 18
	.uleb128	18
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
# Abbrev 19
	.uleb128	19
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
# Abbrev 20
	.uleb128	20
	.uleb128	15
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 21
	.uleb128	21
	.uleb128	2
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 22
	.uleb128	22
	.uleb128	28
	.byte	0
	.uleb128	50
	.uleb128	11
	.uleb128	56
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 23
	.uleb128	23
	.uleb128	13
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	56
	.uleb128	10
	.uleb128	50
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 24
	.uleb128	24
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
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 25
	.uleb128	25
	.uleb128	5
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	52
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 26
	.uleb128	26
	.uleb128	5
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 27
	.uleb128	27
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
	.uleb128	76
	.uleb128	11
	.uleb128	77
	.uleb128	10
	.byte	0
	.byte	0
# Abbrev 28
	.uleb128	28
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
	.uleb128	76
	.uleb128	11
	.uleb128	77
	.uleb128	10
	.uleb128	50
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 29
	.uleb128	29
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
	.uleb128	76
	.uleb128	11
	.uleb128	77
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 30
	.uleb128	30
	.uleb128	4
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 31
	.uleb128	31
	.uleb128	40
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	28
	.uleb128	6
	.byte	0
	.byte	0
# Abbrev 32
	.uleb128	32
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
	.uleb128	50
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 33
	.uleb128	33
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
	.uleb128	76
	.uleb128	11
	.uleb128	77
	.uleb128	10
	.uleb128	50
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 34
	.uleb128	34
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
	.byte	0
	.byte	0
# Abbrev 35
	.uleb128	35
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 36
	.uleb128	36
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
	.uleb128	50
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 37
	.uleb128	37
	.uleb128	46
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	63
	.uleb128	12
	.uleb128	76
	.uleb128	11
	.uleb128	77
	.uleb128	10
	.uleb128	50
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 38
	.uleb128	38
	.uleb128	46
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	63
	.uleb128	12
	.uleb128	50
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 39
	.uleb128	39
	.uleb128	32
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	5
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 40
	.uleb128	40
	.uleb128	33
	.byte	0
	.uleb128	34
	.uleb128	13
	.uleb128	47
	.uleb128	13
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 41
	.uleb128	41
	.uleb128	19
	.byte	1
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 42
	.uleb128	42
	.uleb128	21
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.byte	0
	.byte	0
# Abbrev 43
	.uleb128	43
	.uleb128	21
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 44
	.uleb128	44
	.uleb128	4
	.byte	1
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 45
	.uleb128	45
	.uleb128	56
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.uleb128	78
	.uleb128	10
	.uleb128	80
	.uleb128	10
	.byte	0
	.byte	0
# Abbrev 46
	.uleb128	46
	.uleb128	28
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 47
	.uleb128	47
	.uleb128	1
	.byte	1
	.uleb128	11
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 48
	.uleb128	48
	.uleb128	59
	.byte	0
	.byte	0
	.byte	0
# Abbrev 49
	.uleb128	49
	.uleb128	13
	.byte	0
	.uleb128	52
	.uleb128	12
	.uleb128	3
	.uleb128	8
	.uleb128	56
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 50
	.uleb128	50
	.uleb128	51
	.byte	1
	.uleb128	21
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 51
	.uleb128	51
	.uleb128	25
	.byte	1
	.uleb128	22
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 52
	.uleb128	52
	.uleb128	19
	.byte	1
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 53
	.uleb128	53
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
# Abbrev 54
	.uleb128	54
	.uleb128	1
	.byte	1
	.uleb128	80
	.uleb128	10
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
	.ascii	"soma_fitness.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Lehdebug_line0:
# === header end ===
# function: SOMA_FITNESS_$$_PRIM_SURVIVAL$TVMSTATE$$DOUBLE
# [92:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	103
# [93:26]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	5
	.uleb128	26
	.byte	13
# [94:21]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	5
	.uleb128	21
	.byte	13
# [96:26]
	.byte	2
	.uleb128	.Ll4-.Ll3
	.byte	5
	.uleb128	26
	.byte	14
# [97:21]
	.byte	2
	.uleb128	.Ll5-.Ll4
	.byte	5
	.uleb128	21
	.byte	13
# [92:1]
	.byte	2
	.uleb128	.Ll6-.Ll5
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-5
	.byte	1
# [99:6]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	5
	.uleb128	6
	.byte	19
# [100:15]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	5
	.uleb128	15
	.byte	13
# [102:15]
	.byte	2
	.uleb128	.Ll9-.Ll8
	.byte	14
# [103:1]
	.byte	2
	.uleb128	.Ll10-.Ll9
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll11
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE
# [115:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll12
	.byte	5
	.uleb128	1
	.byte	126
# [116:12]
	.byte	2
	.uleb128	.Ll13-.Ll12
	.byte	5
	.uleb128	12
	.byte	13
# [118:5]
	.byte	2
	.uleb128	.Ll14-.Ll13
	.byte	5
	.uleb128	5
	.byte	14
# [119:5]
	.byte	2
	.uleb128	.Ll15-.Ll14
	.byte	13
# [121:24]
	.byte	2
	.uleb128	.Ll16-.Ll15
	.byte	5
	.uleb128	24
	.byte	14
# [122:3]
	.byte	2
	.uleb128	.Ll17-.Ll16
	.byte	5
	.uleb128	3
	.byte	13
# [123:23]
	.byte	2
	.uleb128	.Ll18-.Ll17
	.byte	5
	.uleb128	23
	.byte	13
# [115:1]
	.byte	2
	.uleb128	.Ll19-.Ll18
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-8
	.byte	1
# [124:40]
	.byte	2
	.uleb128	.Ll20-.Ll19
	.byte	5
	.uleb128	40
	.byte	21
# [115:1]
	.byte	2
	.uleb128	.Ll21-.Ll20
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-9
	.byte	1
# [125:7]
	.byte	2
	.uleb128	.Ll22-.Ll21
	.byte	5
	.uleb128	7
	.byte	22
# [123:3]
	.byte	2
	.uleb128	.Ll23-.Ll22
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-2
	.byte	1
# [126:13]
	.byte	2
	.uleb128	.Ll24-.Ll23
	.byte	5
	.uleb128	13
	.byte	15
# [127:1]
	.byte	2
	.uleb128	.Ll25-.Ll24
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll26
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
# [147:8]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll27
	.byte	5
	.uleb128	8
	.byte	158
# [146:7]
	.byte	2
	.uleb128	.Ll28-.Ll27
	.byte	5
	.uleb128	7
	.byte	3
	.sleb128	-1
	.byte	1
# [147:8]
	.byte	2
	.uleb128	.Ll29-.Ll28
	.byte	5
	.uleb128	8
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll30
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
# [150:6]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll31
	.byte	5
	.uleb128	6
	.byte	161
# [149:5]
	.byte	2
	.uleb128	.Ll32-.Ll31
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [150:6]
	.byte	2
	.uleb128	.Ll33-.Ll32
	.byte	5
	.uleb128	6
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll34
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
# [194:6]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll35
	.byte	5
	.uleb128	6
	.byte	205
# [193:5]
	.byte	2
	.uleb128	.Ll36-.Ll35
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [194:6]
	.byte	2
	.uleb128	.Ll37-.Ll36
	.byte	5
	.uleb128	6
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll38
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C
# [195:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll39
	.byte	5
	.uleb128	1
	.byte	206
# [139:1]
	.byte	2
	.uleb128	.Ll40-.Ll39
	.byte	3
	.sleb128	-56
	.byte	1
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll41
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
# [139:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll42
	.byte	5
	.uleb128	1
	.byte	150
# [139:1]
	.byte	2
	.uleb128	.Ll43-.Ll42
	.byte	1
# [140:20]
	.byte	2
	.uleb128	.Ll44-.Ll43
	.byte	5
	.uleb128	20
	.byte	13
# [141:3]
	.byte	2
	.uleb128	.Ll45-.Ll44
	.byte	5
	.uleb128	3
	.byte	13
# [142:26]
	.byte	2
	.uleb128	.Ll46-.Ll45
	.byte	5
	.uleb128	26
	.byte	13
# [143:5]
	.byte	2
	.uleb128	.Ll47-.Ll46
	.byte	5
	.uleb128	5
	.byte	13
# [144:21]
	.byte	2
	.uleb128	.Ll48-.Ll47
	.byte	5
	.uleb128	21
	.byte	13
# [143:5]
	.byte	2
	.uleb128	.Ll49-.Ll48
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-1
	.byte	1
# [141:3]
	.byte	2
	.uleb128	.Ll50-.Ll49
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-2
	.byte	1
# [152:3]
	.byte	2
	.uleb128	.Ll51-.Ll50
	.byte	23
# [153:19]
	.byte	2
	.uleb128	.Ll52-.Ll51
	.byte	5
	.uleb128	19
	.byte	13
# [155:28]
	.byte	2
	.uleb128	.Ll53-.Ll52
	.byte	5
	.uleb128	28
	.byte	14
# [156:28]
	.byte	2
	.uleb128	.Ll54-.Ll53
	.byte	13
# [158:20]
	.byte	2
	.uleb128	.Ll55-.Ll54
	.byte	5
	.uleb128	20
	.byte	14
# [159:15]
	.byte	2
	.uleb128	.Ll56-.Ll55
	.byte	5
	.uleb128	15
	.byte	13
# [161:35]
	.byte	2
	.uleb128	.Ll57-.Ll56
	.byte	5
	.uleb128	35
	.byte	14
# [162:35]
	.byte	2
	.uleb128	.Ll58-.Ll57
	.byte	13
# [163:35]
	.byte	2
	.uleb128	.Ll59-.Ll58
	.byte	13
# [167:13]
	.byte	2
	.uleb128	.Ll60-.Ll59
	.byte	5
	.uleb128	13
	.byte	16
# [168:13]
	.byte	2
	.uleb128	.Ll61-.Ll60
	.byte	13
# [169:13]
	.byte	2
	.uleb128	.Ll62-.Ll61
	.byte	13
# [172:18]
	.byte	2
	.uleb128	.Ll63-.Ll62
	.byte	5
	.uleb128	18
	.byte	15
# [173:13]
	.byte	2
	.uleb128	.Ll64-.Ll63
	.byte	5
	.uleb128	13
	.byte	13
# [175:44]
	.byte	2
	.uleb128	.Ll65-.Ll64
	.byte	5
	.uleb128	44
	.byte	14
# [176:25]
	.byte	2
	.uleb128	.Ll66-.Ll65
	.byte	5
	.uleb128	25
	.byte	13
# [178:22]
	.byte	2
	.uleb128	.Ll67-.Ll66
	.byte	5
	.uleb128	22
	.byte	14
# [179:43]
	.byte	2
	.uleb128	.Ll68-.Ll67
	.byte	5
	.uleb128	43
	.byte	13
# [180:43]
	.byte	2
	.uleb128	.Ll69-.Ll68
	.byte	13
# [176:7]
	.byte	2
	.uleb128	.Ll70-.Ll69
	.byte	5
	.uleb128	7
	.byte	3
	.sleb128	-4
	.byte	1
# [188:7]
	.byte	2
	.uleb128	.Ll71-.Ll70
	.byte	24
# [189:13]
	.byte	2
	.uleb128	.Ll72-.Ll71
	.byte	5
	.uleb128	13
	.byte	13
# [190:13]
	.byte	2
	.uleb128	.Ll73-.Ll72
	.byte	13
# [152:3]
	.byte	2
	.uleb128	.Ll74-.Ll73
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-38
	.byte	1
# [139:1]
	.byte	2
	.uleb128	.Ll75-.Ll74
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-13
	.byte	1
# [195:1]
	.byte	2
	.uleb128	.Ll76-.Ll75
	.byte	68
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll77
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
# [204:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll78
	.byte	5
	.uleb128	1
	.byte	215
# [204:1]
	.byte	2
	.uleb128	.Ll79-.Ll78
	.byte	1
# [205:37]
	.byte	2
	.uleb128	.Ll80-.Ll79
	.byte	5
	.uleb128	37
	.byte	13
# [206:36]
	.byte	2
	.uleb128	.Ll81-.Ll80
	.byte	5
	.uleb128	36
	.byte	13
# [204:1]
	.byte	2
	.uleb128	.Ll82-.Ll81
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-2
	.byte	1
# [208:20]
	.byte	2
	.uleb128	.Ll83-.Ll82
	.byte	5
	.uleb128	20
	.byte	16
# [204:1]
	.byte	2
	.uleb128	.Ll84-.Ll83
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-4
	.byte	1
# [209:20]
	.byte	2
	.uleb128	.Ll85-.Ll84
	.byte	5
	.uleb128	20
	.byte	17
# [204:1]
	.byte	2
	.uleb128	.Ll86-.Ll85
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-5
	.byte	1
# [210:20]
	.byte	2
	.uleb128	.Ll87-.Ll86
	.byte	5
	.uleb128	20
	.byte	18
# [211:53]
	.byte	2
	.uleb128	.Ll88-.Ll87
	.byte	5
	.uleb128	53
	.byte	13
# [206:3]
	.byte	2
	.uleb128	.Ll89-.Ll88
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-5
	.byte	1
# [213:22]
	.byte	2
	.uleb128	.Ll90-.Ll89
	.byte	5
	.uleb128	22
	.byte	19
# [214:1]
	.byte	2
	.uleb128	.Ll91-.Ll90
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll92
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011
# [262:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll93
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	261
	.byte	1
# [224:1]
	.byte	2
	.uleb128	.Ll94-.Ll93
	.byte	3
	.sleb128	-38
	.byte	1
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll95
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
# [224:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll96
	.byte	5
	.uleb128	1
	.byte	235
# [224:1]
	.byte	2
	.uleb128	.Ll97-.Ll96
	.byte	1
# [225:3]
	.byte	2
	.uleb128	.Ll98-.Ll97
	.byte	5
	.uleb128	3
	.byte	13
# [226:3]
	.byte	2
	.uleb128	.Ll99-.Ll98
	.byte	13
# [227:52]
	.byte	2
	.uleb128	.Ll100-.Ll99
	.byte	5
	.uleb128	52
	.byte	13
# [229:3]
	.byte	2
	.uleb128	.Ll101-.Ll100
	.byte	5
	.uleb128	3
	.byte	14
# [230:3]
	.byte	2
	.uleb128	.Ll102-.Ll101
	.byte	13
# [231:3]
	.byte	2
	.uleb128	.Ll103-.Ll102
	.byte	13
# [233:39]
	.byte	2
	.uleb128	.Ll104-.Ll103
	.byte	5
	.uleb128	39
	.byte	14
# [235:25]
	.byte	2
	.uleb128	.Ll105-.Ll104
	.byte	5
	.uleb128	25
	.byte	14
# [236:12]
	.byte	2
	.uleb128	.Ll106-.Ll105
	.byte	5
	.uleb128	12
	.byte	13
# [237:30]
	.byte	2
	.uleb128	.Ll107-.Ll106
	.byte	5
	.uleb128	30
	.byte	13
# [238:12]
	.byte	2
	.uleb128	.Ll108-.Ll107
	.byte	5
	.uleb128	12
	.byte	13
# [240:7]
	.byte	2
	.uleb128	.Ll109-.Ll108
	.byte	5
	.uleb128	7
	.byte	14
# [242:19]
	.byte	2
	.uleb128	.Ll110-.Ll109
	.byte	5
	.uleb128	19
	.byte	14
# [244:22]
	.byte	2
	.uleb128	.Ll111-.Ll110
	.byte	5
	.uleb128	22
	.byte	14
# [245:7]
	.byte	2
	.uleb128	.Ll112-.Ll111
	.byte	5
	.uleb128	7
	.byte	13
# [248:58]
	.byte	2
	.uleb128	.Ll113-.Ll112
	.byte	5
	.uleb128	58
	.byte	15
# [249:53]
	.byte	2
	.uleb128	.Ll114-.Ll113
	.byte	5
	.uleb128	53
	.byte	13
# [233:3]
	.byte	2
	.uleb128	.Ll115-.Ll114
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-16
	.byte	1
# [252:19]
	.byte	2
	.uleb128	.Ll116-.Ll115
	.byte	5
	.uleb128	19
	.byte	31
# [253:34]
	.byte	2
	.uleb128	.Ll117-.Ll116
	.byte	5
	.uleb128	34
	.byte	13
# [255:5]
	.byte	2
	.uleb128	.Ll118-.Ll117
	.byte	5
	.uleb128	5
	.byte	14
# [224:1]
	.byte	2
	.uleb128	.Ll119-.Ll118
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-31
	.byte	1
# [260:21]
	.byte	2
	.uleb128	.Ll120-.Ll119
	.byte	5
	.uleb128	21
	.byte	48
# [261:25]
	.byte	2
	.uleb128	.Ll121-.Ll120
	.byte	5
	.uleb128	25
	.byte	13
# [260:3]
	.byte	2
	.uleb128	.Ll122-.Ll121
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-1
	.byte	1
# [224:1]
	.byte	2
	.uleb128	.Ll123-.Ll122
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-36
	.byte	1
# [262:1]
	.byte	2
	.uleb128	.Ll124-.Ll123
	.byte	50
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll125
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
	.quad	SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
	.quad	.Lt1-SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
	.quad	.Lt2-SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$00000009
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
	.quad	.Lt3-SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000A
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
	.quad	.Lt4-SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000B
	.quad	SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C
	.quad	.Lt5-SOMA_FITNESS$_$LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET_$$_fin$0000000C
	.quad	SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
	.quad	.Lt6-SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
	.quad	SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
	.quad	.Lt7-SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
	.quad	SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011
	.quad	.Lt8-SOMA_FITNESS$_$EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT_$$_fin$00000011
	.quad	SOMA_FITNESS_$$_PRIM_SURVIVAL$TVMSTATE$$DOUBLE
	.quad	.Lt9-SOMA_FITNESS_$$_PRIM_SURVIVAL$TVMSTATE$$DOUBLE
	.quad	SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE
	.quad	.Lt10-SOMA_FITNESS_$$_PRIM_ARRAYSORTED$TVMSTATE$LONGINT$$DOUBLE
	.quad	0
	.quad	0
.Learanges0:
# End asmlist al_dwarf_aranges
# Begin asmlist al_dwarf_ranges

.section .debug_ranges
# End asmlist al_dwarf_ranges
# Begin asmlist al_end

.section .text.z_DEBUGEND_$SOMA_FITNESS,"x"
.globl	DEBUGEND_$SOMA_FITNESS
DEBUGEND_$SOMA_FITNESS:
# End asmlist al_end

