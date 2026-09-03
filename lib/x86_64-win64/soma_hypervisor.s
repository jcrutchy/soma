	.file "soma_hypervisor.pas"
# Begin asmlist al_begin

.section .debug_line
.Ldebug_linesection0:
.Ldebug_line0:

.section .debug_abbrev
.Ldebug_abbrevsection0:
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$SOMA_HYPERVISOR,"x"
.globl	DEBUGSTART_$SOMA_HYPERVISOR
DEBUGSTART_$SOMA_HYPERVISOR:
# End asmlist al_begin
# Begin asmlist al_procedures

.section .text.n_soma_hypervisor_$$_allocaligned$qword$pointer$$pointer,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER:
.Lc1:
.seh_proc SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
.Ll1:
# [soma_hypervisor.pas]
# [77] begin
	pushq	%rbx
.seh_pushreg %rbx
	leaq	-32(%rsp),%rsp
.Lc3:
.seh_stackalloc 32
.seh_endprologue
# Var $result located in register rax
# Var p located in register rax
# Var size located in register rcx
	movq	%rdx,%rbx
# Var raw located in register rbx
.Ll2:
# [78] raw    := GetMem(size + 63);
	addq	$63,%rcx
	call	SYSTEM_$$_GETMEM$QWORD$$POINTER
	movq	%rax,(%rbx)
# Var p located in register rax
.Ll3:
# [80] p      := (p + 63) and not PtrUInt(63);
	addq	$63,%rax
	andq	$-64,%rax
# Var p located in register rax
# Var $result located in register rax
# Var p located in register rax
.Ll4:
# [82] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rbx
	ret
.seh_endproc
.Lc2:
.Lt6:
.Ll5:

.section .text.n_soma_hypervisor_$$_initsharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_INITSHAREDMEMORY:
.Lc4:
.seh_proc SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
.Ll6:
# [91] begin
	pushq	%rbx
.seh_pushreg %rbx
	leaq	-48(%rsp),%rsp
.Lc6:
.seh_stackalloc 48
.seh_endprologue
.Ll7:
# [97] );
	leaq	_$SOMA_HYPERVISOR$_Ld1(%rip),%rax
.Ll8:
# [92] ShmemHandle := CreateFileMapping(
	movq	%rax,40(%rsp)
	movl	$64,32(%rsp)
	xorl	%r9d,%r9d
	movl	$4,%r8d
	xorl	%edx,%edx
	movq	$-1,%rcx
	call	_$dll$kernel32$CreateFileMappingA
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
.Ll9:
# [98] if ShmemHandle = 0 then
	testq	%rax,%rax
	jne	.Lj8
.Ll10:
# [100] WriteLn('WARNING: Could not create shared memory: ', GetLastError);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld2(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	call	_$dll$kernel32$GetLastError
	movl	%eax,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll11:
# [101] Shmem := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
.Ll12:
# [102] Exit;
	jmp	.Lj5
	.balign 4,0x90
.Lj8:
.Ll13:
# [104] Shmem := MapViewOfFile(ShmemHandle, FILE_MAP_ALL_ACCESS, 0, 0, SizeOf(TSOMAShmem));
	movq	$64,32(%rsp)
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	xorl	%r9d,%r9d
	xorl	%r8d,%r8d
	movl	$983071,%edx
	call	_$dll$kernel32$MapViewOfFile
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
.Ll14:
# [105] if Shmem = nil then
	testq	%rax,%rax
	jne	.Lj10
.Ll15:
# [106] WriteLn('WARNING: Could not map shared memory: ', GetLastError)
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld3(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	call	_$dll$kernel32$GetLastError
	movl	%eax,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
	jmp	.Lj11
.Lj10:
.Ll16:
# [109] FillChar(Shmem^, SizeOf(TSOMAShmem), 0);
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$64,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll17:
# [110] Shmem^.magic := $534F4D41;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$1397706049,(%rax)
.Lj11:
.Lj5:
.Ll18:
# [112] end;
	nop
	leaq	48(%rsp),%rsp
	popq	%rbx
	ret
.seh_endproc
.Lc5:
.Lt7:
.Ll19:

.section .text.n_soma_hypervisor_$$_closesharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY:
.Lc7:
.seh_proc SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
.Ll20:
# [115] begin
	leaq	-40(%rsp),%rsp
.Lc9:
.seh_stackalloc 40
.seh_endprologue
.Ll21:
# [116] if Shmem <> nil then UnmapViewOfFile(Shmem);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj15
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	call	_$dll$kernel32$UnmapViewOfFile
	.balign 4,0x90
.Lj15:
.Ll22:
# [117] if ShmemHandle <> 0 then CloseHandle(ShmemHandle);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
	je	.Lj17
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj17:
.Ll23:
# [118] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc8:
.Lt8:
.Ll24:

.section .text.n_soma_hypervisor_$$_readtsc$$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_READTSC$$QWORD:
.Lc10:
.seh_proc SOMA_HYPERVISOR_$$_READTSC$$QWORD
.Ll25:
# [123] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc12:
.Lc13:
	movq	%rsp,%rbp
.Lc14:
	leaq	-16(%rsp),%rsp
.seh_stackalloc 16
.seh_endprologue
# Var $result located at rbp-8, size=OS_64
# Var r located at rbp-16, size=OS_64
#  CPU ATHLON64
.Ll26:
# [125] rdtsc
	rdtsc
.Ll27:
# [126] shl rdx, 32
	shlq	$32,%rdx
.Ll28:
# [127] or  rax, rdx
	orq	%rdx,%rax
.Ll29:
# [128] mov r, rax
	movq	%rax,-16(%rbp)
#  CPU ATHLON64
.Ll30:
# [130] Result := r;
	movq	-16(%rbp),%rax
.Ll31:
# [131] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc11:
.Lt9:
.Ll32:

.section .text.n_soma_hypervisor_$$_updatesharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY:
.Lc15:
.seh_proc SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
.Ll33:
# [134] begin
	leaq	-40(%rsp),%rsp
.Lc17:
.seh_stackalloc 40
.seh_endprologue
.Ll34:
# [135] if Shmem = nil then Exit;
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj20
	.balign 4,0x90
.Ll35:
# [136] Shmem^.generation      := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rdx
	movq	%rdx,4(%rax)
.Ll36:
# [137] Shmem^.active_colonies := ColonyCount;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%edx
	movl	%edx,12(%rax)
.Ll37:
# [138] Shmem^.best_fitness    := BestFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%rdx
	movq	%rdx,16(%rax)
.Ll38:
# [139] Shmem^.avg_fitness     := AvgFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%rdx
	movq	%rdx,24(%rax)
.Ll39:
# [140] Shmem^.uptime_secs     := (ReadTSC - StartTime) div 3000000000;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%rdx
	subq	U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip),%rdx
	movq	$-5242050321332162017,%rax
	mulq	%rdx
	shrq	$31,%rdx
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	%rdx,44(%rax)
.Ll40:
# [141] Shmem^.codon_count     := 0;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$0,40(%rax)
.Lj20:
.Ll41:
# [142] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc16:
.Lt10:
.Ll42:

.section .text.n_soma_hypervisor_$$_randomgenome$tgenome$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD:
.Lc18:
# Var i located in register eax
# Var G located in register rcx
.Ll43:
# [151] begin
	movq	%rdx,%r8
# Var rng located in register r8
# Var i located in register r9d
.Ll44:
# [152] for i := 0 to GENOME_SIZE-1 do
	movl	$-1,%r9d
	.balign 8,0x90
.Lj26:
	addl	$1,%r9d
.Ll45:
# [154] XorShift64(rng);
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
.Ll46:
# [155] G[i].opcode := VALID_OPCODES[rng mod VALID_OPCODE_COUNT];
	movq	%rax,%r10
	movq	$-825973615240726191,%rax
	mulq	%r10
	shrq	$6,%rdx
	movl	$67,%eax
	imulq	%rax,%rdx
	subq	%rdx,%r10
	movl	%r9d,%eax
	leaq	TC_$SOMA_TYPES_$$_VALID_OPCODES(%rip),%rdx
	movw	(%rdx,%r10,2),%dx
	movw	%dx,(%rcx,%rax,8)
.Ll47:
# [156] G[i].flags  := 0;
	movl	%r9d,%eax
	movb	$0,2(%rcx,%rax,8)
.Ll48:
# [157] G[i].pad    := 0;
	movl	%r9d,%eax
	movb	$0,3(%rcx,%rax,8)
.Ll49:
# [158] G[i].imm    := Int32((rng shr 32) mod 128) - 64;
	movq	(%r8),%rax
	shrq	$32,%rax
	andl	$127,%eax
	subl	$64,%eax
	movl	%r9d,%edx
	movl	%eax,4(%rcx,%rdx,8)
.Ll50:
	cmpl	$4095,%r9d
	jnge	.Lj26
.Ll51:
# [160] end;
	ret
.Lc19:
.Lt11:
.Ll52:

.section .text.n_soma_hypervisor_$$_evaluatefitness$pvmstate$$double,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE:
.Lc20:
# Temps allocated between rsp+152 and rsp+160
.seh_proc SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
.Ll53:
# [173] begin
	leaq	-168(%rsp),%rsp
.Lc22:
.seh_stackalloc 168
.seh_endprologue
# Var $result located in register xmm0
# Var fr located at rsp+40, size=OS_NO
	movq	%rcx,%rax
# Var state located in register rax
.Ll54:
# [174] fr := EvaluateFitnessTarget(state^, FitnessTarget, []);
	movq	$-1,32(%rsp)
	leaq	152(%rsp),%r9
	movq	%rax,%rdx
# Var state located in register rdx
	leaq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET(%rip),%r8
	leaq	40(%rsp),%rcx
	call	SOMA_FITNESS_$$_EVALUATEFITNESSTARGET$TVMSTATE$TFITNESSTARGET$array_of_INT64$$TFITNESSRESULT
# Var $result located in register xmm0
.Ll55:
# [175] Result := fr.score;
	movsd	40(%rsp),%xmm0
.Ll56:
# [176] end;
	nop
	leaq	168(%rsp),%rsp
	ret
.seh_endproc
.Lc21:
.Lt12:
.Ll57:

.section .text.n_soma_hypervisor_$$_findworstidx$$longint,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT:
.Lc23:
# Var $result located in register eax
# Var i located in register eax
# Var worst located in register xmm0
# [188] begin
# Var $result located in register eax
.Ll58:
# [189] Result := 0;
	xorl	%eax,%eax
# Var worst located in register xmm0
.Ll59:
# [190] worst  := PopFitness[0];
	movsd	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%xmm0
# Var i located in register edx
.Ll60:
# [191] for i := 1 to POPULATION_SIZE-1 do
	xorl	%edx,%edx
	.balign 8,0x90
.Lj34:
	addl	$1,%edx
.Ll61:
# [192] if PopFitness[i] < worst then
	movl	%edx,%ecx
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	comisd	(%r8,%rcx,8),%xmm0
	jp	.Lj38
	jna	.Lj38
.Ll62:
# [194] worst  := PopFitness[i];
	movl	%edx,%ecx
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	movsd	(%r8,%rcx,8),%xmm0
.Ll63:
# [195] Result := i;
	movl	%edx,%eax
	.balign 4,0x90
.Lj38:
.Ll64:
	cmpl	$127,%edx
	jnge	.Lj34
.Ll65:
# [197] end;
	ret
.Lc24:
.Lt13:
.Ll66:

.section .text.n_soma_hypervisor_$$_tournamentselect$qword$longint$$longint,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT:
.Lc25:
# Var $result located in register eax
# Var i located in register r8d
# Var candidate located in register r10d
# Var best_idx located in register eax
# Var best_fit located in register xmm0
# Var rng located in register rcx
# Var k located in register edx
# [206] begin
.Ll67:
# [207] XorShift64(rng);
	movq	(%rcx),%rax
	shlq	$13,%rax
	xorq	(%rcx),%rax
	movq	%rax,(%rcx)
	shrq	$7,%rax
	xorq	(%rcx),%rax
	movq	%rax,(%rcx)
	shlq	$17,%rax
	xorq	(%rcx),%rax
	movq	%rax,(%rcx)
.Ll68:
# [208] best_idx := rng mod POPULATION_SIZE;
	movl	(%rcx),%eax
	andl	$127,%eax
# Var best_idx located in register eax
.Ll69:
# [209] best_fit := PopFitness[best_idx];
	movl	%eax,%r8d
# Var best_fit located in register xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r9
	movsd	(%r9,%r8,8),%xmm0
.Ll70:
# [211] for i := 1 to k-1 do
	subl	$1,%edx
	cmpl	$1,%edx
	jnge	.Lj44
	xorl	%r8d,%r8d
	.balign 8,0x90
.Lj45:
	addl	$1,%r8d
.Ll71:
# [213] XorShift64(rng);
	movq	(%rcx),%r9
	shlq	$13,%r9
	xorq	(%rcx),%r9
	movq	%r9,(%rcx)
	shrq	$7,%r9
	xorq	(%rcx),%r9
	movq	%r9,(%rcx)
	shlq	$17,%r9
	xorq	(%rcx),%r9
	movq	%r9,(%rcx)
.Ll72:
# [214] candidate := rng mod POPULATION_SIZE;
	movl	(%rcx),%r9d
	andl	$127,%r9d
	movl	%r9d,%r10d
.Ll73:
# [215] if PopFitness[candidate] > best_fit then
	andl	%r9d,%r9d
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r11
	comisd	(%r11,%r9,8),%xmm0
	jp	.Lj50
	jnb	.Lj50
.Ll74:
# [217] best_fit := PopFitness[candidate];
	movl	%r10d,%r9d
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r11
	movsd	(%r11,%r9,8),%xmm0
.Ll75:
# [218] best_idx := candidate;
	movl	%r10d,%eax
	.balign 4,0x90
.Lj50:
.Ll76:
	cmpl	%r8d,%edx
	jnle	.Lj45
	.balign 4,0x90
.Lj44:
# Var $result located in register eax
# Var best_idx located in register eax
.Ll77:
# [223] end;
	ret
.Lc26:
.Lt14:
.Ll78:

.section .text.n_soma_hypervisor_$$_colonythreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64:
.Lc27:
# Temps allocated between rsp+32816 and rsp+32832
.seh_proc SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
.Ll79:
# [238] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rdi
.seh_pushreg %rdi
	pushq	%rsi
.seh_pushreg %rsi
	pushq	%r12
.seh_pushreg %r12
	pushq	%r13
.seh_pushreg %r13
	pushq	%r14
.seh_pushreg %r14
	pushq	%r15
.seh_pushreg %r15
	movl	$8,%r10d
.Lj62:
	leaq	-4096(%rsp),%rsp
	movl	%eax,(%rsp)
	subq	$1,%r10
	jne	.Lj62
	leaq	-64(%rsp),%rsp
.Lc29:
.seh_stackalloc 32832
.seh_endprologue
# Var $result located in register rax
# Var col located in register rax
# Var state located in register rax
# Var t0 located in register r15
# Var t1 located in register r14
# Var parent_idx located in register r13d
# Var worst_idx located in register r12d
# Var local_rng located at rsp+40, size=OS_64
# Var offspring located at rsp+48, size=OS_NO
# Var param located in register rcx
# Var col located in register rcx
# Var param located in register rcx
# Var col located in register rcx
# Var state located in register r8
.Ll80:
# [240] state := col^.state;
	movq	8(%rcx),%r8
.Ll81:
# [242] local_rng := UInt64(col^.colony_id + 1) * $6C62272E07BB0142;
	movq	%rcx,32816(%rsp)
# Var col located in register rax
	movq	%rcx,%rdx
	movslq	28(%rdx),%rax
	leaq	1(%rax),%rdx
	movq	$7809847782465536322,%rax
	imulq	%rax,%rdx
	movq	%rdx,40(%rsp)
.Ll82:
# [243] state^.rng_state := local_rng;
	movq	%r8,32824(%rsp)
# Var state located in register rax
	movq	40(%rsp),%rdx
	movq	32824(%rsp),%rax
	movq	%rdx,4376(%rax)
.Ll83:
# [245] while Running do
	jmp	.Lj55
	.balign 8,0x90
.Lj54:
.Ll84:
# [265] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll85:
# [266] parent_idx := TournamentSelect(local_rng, 4);
	leaq	40(%rsp),%rcx
	movl	$4,%edx
	call	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	movl	%eax,%r13d
.Ll86:
# [267] offspring  := Population[parent_idx];
	andl	%eax,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	48(%rsp),%rdi
	leaq	(%rdx,%rax),%rsi
	movl	$4096,%ecx
	rep
	movsq
.Ll87:
# [268] MutateGenome(offspring, Population, local_rng);
	leaq	40(%rsp),%r9
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	48(%rsp),%rcx
	movl	$127,%r8d
	call	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
.Ll88:
# [269] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Ll89:
# [272] state^.genome       := offspring;
	movq	32824(%rsp),%rax
	leaq	4392(%rax),%rdi
	leaq	48(%rsp),%rsi
	movl	$4096,%ecx
	rep
	movsq
.Ll90:
# [273] state^.ip           := 0;
	movq	32824(%rsp),%rax
	movq	$0,4368(%rax)
.Ll91:
# [274] state^.fsp          := 0;
	movq	32824(%rsp),%rax
	movq	$0,4360(%rax)
.Ll92:
# [275] state^.halt_reason  := HR_NONE;
	movq	32824(%rsp),%rax
	movq	$0,4384(%rax)
.Ll93:
# [281] SeedFitnessInput(state^, FitnessTarget, local_rng);
	movq	32824(%rsp),%rcx
	leaq	40(%rsp),%r8
	leaq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET(%rip),%rdx
	call	SOMA_FITNESS_$$_SEEDFITNESSINPUT$TVMSTATE$TFITNESSTARGET$QWORD
.Ll94:
# [283] t0 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r15
.Ll95:
# [284] Execute(state^);
	movq	32824(%rsp),%rcx
	call	SOMA_CORE_$$_EXECUTE$TVMSTATE
.Ll96:
# [285] t1 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r14
.Ll97:
# [287] col^.exec_cycles := t1 - t0;
	subq	%r15,%rax
	movq	32816(%rsp),%rdx
	movq	%rax,40(%rdx)
.Ll98:
# [288] col^.fitness      := EvaluateFitness(state);
	movq	32824(%rsp),%rcx
	call	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	movq	32816(%rsp),%rdx
	movsd	%xmm0,32(%rdx)
.Ll99:
# [289] col^.generation    := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rax
	movq	32816(%rsp),%rdx
	movq	%rax,48(%rdx)
.Ll100:
# [292] if Generation < 5 then
	cmpq	$5,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
	jnb	.Lj58
.Ll101:
# [294] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll102:
# [295] Write('  [dbg gen=', Generation, '] input_count=', FitnessTarget.input_count,
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld4(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld5(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET+12(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld6(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	256(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movl	$44,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_char
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	264(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movl	$44,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_char
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	272(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movl	$44,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_char
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	280(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld7(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	4352(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld8(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	4368(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld9(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	32824(%rsp),%rax
	movq	4384(%rax),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld10(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	32816(%rsp),%rax
	movq	32(%rax),%rdx
	movq	%rdx,32(%rsp)
	movq	%rbx,%r9
	xorl	%r8d,%r8d
	movl	$4,%edx
	movl	$1,%ecx
	call	fpc_write_text_float
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_write_end
	call	fpc_iocheck
.Ll103:
# [301] WriteLn;
	call	fpc_get_output
	movq	%rax,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll104:
# [302] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
	.balign 4,0x90
.Lj58:
.Ll105:
# [306] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll106:
# [307] worst_idx := FindWorstIdx;
	call	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	movl	%eax,%r12d
.Ll107:
# [308] if col^.fitness > PopFitness[worst_idx] then
	movl	%r12d,%edx
	movq	32816(%rsp),%rax
	movsd	32(%rax),%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rax
	comisd	(%rax,%rdx,8),%xmm0
	jp	.Lj60
	jna	.Lj60
.Ll108:
# [310] Population[worst_idx] := offspring;
	movl	%r12d,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rdi
	leaq	48(%rsp),%rsi
	movl	$4096,%ecx
	rep
	movsq
.Ll109:
# [311] PopFitness[worst_idx] := col^.fitness;
	movl	%r12d,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	movq	32816(%rsp),%rdx
	movq	32(%rdx),%rcx
	movq	%rcx,(%r8,%rax,8)
	.balign 4,0x90
.Lj60:
.Ll110:
# [313] Inc(Generation);
	addq	$1,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
.Ll111:
# [314] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Lj55:
.Ll112:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj54
# Var $result located in register rax
.Ll113:
# [317] Result := 0;
	xorl	%eax,%eax
.Ll114:
# [318] end;
	nop
	leaq	32832(%rsp),%rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc28:
.Lt15:
.Ll115:

.section .text.n_soma_hypervisor_$$_statusthreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64:
.Lc30:
.seh_proc SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
.Ll116:
# [328] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-72(%rsp),%rsp
.Lc32:
.seh_stackalloc 72
	movdqa	%xmm6,48(%rsp)
.seh_savexmm %xmm6, 48
.seh_endprologue
# Var $result located in register rax
# Var i located in register ebx
# Var sum located in register xmm6
# Var param located in register rcx
.Ll117:
# [329] while Running do
	jmp	.Lj66
	.balign 8,0x90
.Lj65:
.Ll118:
# [331] Sleep(500);
	movl	$500,%ecx
	call	SYSUTILS_$$_SLEEP$LONGWORD
.Ll119:
# [332] if not Running then Break;
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	je	.Lj67
	.balign 4,0x90
.Ll120:
# [334] UpdateSharedMemory;
	call	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
.Ll121:
# [336] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll122:
# [337] BestFitness   := PopFitness[0];
	movq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
.Ll123:
# [338] BestGenomeIdx := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
.Ll124:
# [339] sum := 0.0;
	movsd	_$SOMA_HYPERVISOR$_Ld11(%rip),%xmm6
.Ll125:
# [340] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%ebx
	.balign 8,0x90
.Lj70:
	addl	$1,%ebx
.Ll126:
# [342] sum := sum + PopFitness[i];
	movl	%ebx,%eax
	movapd	%xmm6,%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	addsd	(%rdx,%rax,8),%xmm0
	movapd	%xmm0,%xmm6
.Ll127:
# [343] if PopFitness[i] > BestFitness then
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movsd	(%rdx,%rax,8),%xmm0
	comisd	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%xmm0
	jp	.Lj74
	jna	.Lj74
.Ll128:
# [345] BestFitness   := PopFitness[i];
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movq	(%rdx,%rax,8),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
.Ll129:
# [346] BestGenomeIdx := i;
	movl	%ebx,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
	.balign 4,0x90
.Lj74:
.Ll130:
	cmpl	$127,%ebx
	jnge	.Lj70
.Ll131:
# [349] AvgFitness := sum / POPULATION_SIZE;
	movapd	%xmm6,%xmm0
	mulsd	_$SOMA_HYPERVISOR$_Ld12(%rip),%xmm0
	movsd	%xmm0,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
.Ll132:
# [350] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Ll133:
# [352] WriteLn('Gen: ', Generation,
	call	fpc_get_output
	movq	%rax,%rsi
	leaq	_$SOMA_HYPERVISOR$_Ld13(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld14(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%rax
	movq	%rax,32(%rsp)
	movq	%rsi,%r9
	movl	$6,%r8d
	movl	$4,%edx
	movl	$1,%ecx
	call	fpc_write_text_float
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld15(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%rax
	movq	%rax,32(%rsp)
	movq	%rsi,%r9
	movl	$6,%r8d
	movl	$4,%edx
	movl	$1,%ecx
	call	fpc_write_text_float
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld16(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
.Ll134:
# [355] '  (genome #', BestGenomeIdx, ')');
	movslq	U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip),%r8
.Ll135:
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movl	$41,%r8d
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_char
	call	fpc_iocheck
	movq	%rsi,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Lj66:
.Ll136:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj65
.Lj67:
# Var $result located in register rax
.Ll137:
# [357] Result := 0;
	xorl	%eax,%eax
.Ll138:
# [358] end;
	nop
	movdqa	48(%rsp),%xmm6
	leaq	72(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc31:
.Lt16:
.Ll139:

.section .text.n_soma_hypervisor$_$hypervisorinit$longint_$$_fin$00000024,"x"
	.balign 16,0x90
SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024:
.Lc33:
.seh_proc SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024
.Ll140:
# [407] end;
	pushq	%rbp
.seh_pushreg %rbp
.Lc35:
.Lc36:
	movq	%rcx,%rbp
.Lc37:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
.Ll141:
# [367] begin
	leaq	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET(%rip),%rdx
	leaq	-40(%rbp),%rcx
	call	fpc_finalize
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc34:
.Lt2:
.Ll142:

.section .text.n_soma_hypervisor_$$_hypervisorinit$longint,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT:
.Lc38:
# Temps allocated between rbp-56 and rbp+0
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
.Ll143:
	pushq	%rbp
.seh_pushreg %rbp
.Lc40:
.Lc41:
	movq	%rsp,%rbp
.Lc42:
	leaq	-96(%rsp),%rsp
.seh_stackalloc 96
	movq	%rbx,-56(%rbp)
	movq	%rsi,-48(%rbp)
.seh_savereg %rbx, 40
.seh_savereg %rsi, 48
.seh_endprologue
# Var i located in register esi
	movl	%ecx,%ebx
# Var colony_count located in register ebx
.Ll144:
	leaq	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET(%rip),%rdx
	leaq	-40(%rbp),%rcx
	call	fpc_initialize
.Lj84:
	nop
.Lj80:
.Ll145:
# [368] if colony_count > MAX_COLONIES then colony_count := MAX_COLONIES;
	cmpl	$16,%ebx
	jng	.Lj86
	movl	$16,%ebx
	.balign 4,0x90
.Lj86:
.Ll146:
# [369] if colony_count < 1 then colony_count := 1;
	cmpl	$1,%ebx
	jnl	.Lj88
	movl	$1,%ebx
	.balign 4,0x90
.Lj88:
.Ll147:
# [370] ColonyCount := colony_count;
	movl	%ebx,U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip)
.Ll148:
# [371] Generation  := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
.Ll149:
# [372] BestFitness := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld11(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
.Ll150:
# [373] AvgFitness  := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld11(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
.Ll151:
# [374] Running     := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll152:
# [376] InitCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_INITCRITICALSECTION$TRTLCRITICALSECTION
.Ll153:
# [377] InitSharedMemory;
	call	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
.Ll154:
# [378] StartTime := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
.Ll155:
# [383] FitnessTarget := LoadFitnessTarget('fitness_sort.json');
	leaq	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET(%rip),%rbx
	leaq	.Ld17(%rip),%rdx
	leaq	-40(%rbp),%rcx
	call	SOMA_FITNESS_$$_LOADFITNESSTARGET$ANSISTRING$$TFITNESSTARGET
	leaq	-40(%rbp),%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET(%rip),%rdx
	movq	%rbx,%r8
	call	fpc_copy_proc
.Ll156:
# [384] WriteLn('  Fitness target: ', FitnessTarget.name, ' v', FitnessTarget.version);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld18(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_ansistr
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld19(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movzwl	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET+8(%rip),%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll157:
# [386] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj90
	movl	$-1,%esi
	.balign 8,0x90
.Lj91:
	addl	$1,%esi
.Ll158:
# [388] Colonies[i].colony_id := i;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movl	%esi,28(%rdx,%rax)
.Ll159:
# [389] Colonies[i].active    := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
.Ll160:
# [390] Colonies[i].fitness   := 0.0;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rcx
	movq	_$SOMA_HYPERVISOR$_Ld11(%rip),%rdx
	movq	%rdx,32(%rcx,%rax)
.Ll161:
# [391] Colonies[i].state     := AllocAligned(SizeOf(TVMState), Colonies[i].raw_alloc);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	leaq	16(%rdx,%rax),%rdx
	movl	$37184,%ecx
	call	SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	movl	%esi,%edx
	imulq	$56,%rdx,%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	%rax,8(%rdx,%rcx)
.Ll162:
# [392] FillChar(Colonies[i].state^, SizeOf(TVMState), 0);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movq	8(%rax,%rdx),%rcx
	xorl	%r8d,%r8d
	movl	$37184,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll163:
	cmpl	%esi,%ebx
	jnle	.Lj91
	.balign 4,0x90
.Lj90:
.Ll164:
# [395] GlobalRNG := UInt64($CAFE1234DEADBEEF);
	movl	$-559038737,U_$SOMA_HYPERVISOR_$$_GLOBALRNG(%rip)
	movl	$-889318860,U_$SOMA_HYPERVISOR_$$_GLOBALRNG+4(%rip)
.Ll165:
# [396] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%esi
	.balign 8,0x90
.Lj94:
	addl	$1,%esi
.Ll166:
# [398] RandomGenome(Population[i], GlobalRNG);
	movl	%esi,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_GLOBALRNG(%rip),%rdx
	call	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
.Ll167:
# [399] PopFitness[i] := 0.0;
	movl	%esi,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movq	_$SOMA_HYPERVISOR$_Ld11(%rip),%rcx
	movq	%rcx,(%rdx,%rax,8)
.Ll168:
	cmpl	$127,%esi
	jnge	.Lj94
.Ll169:
# [402] WriteLn('SOMA Hypervisor initialised');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld20(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll170:
# [403] WriteLn('  Colonies  : ', ColonyCount);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld21(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll171:
# [404] WriteLn('  Population: ', POPULATION_SIZE);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld22(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movl	$128,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll172:
# [405] WriteLn('  VMState   : ', SizeOf(TVMState), ' bytes per colony');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld23(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movl	$37184,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld24(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll173:
# [406] WriteLn('  Total RAM : ', (ColonyCount * SizeOf(TVMState)) div 1024, ' KB for VM states');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld25(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%r8
	imulq	$37184,%r8
	movq	%r8,%rax
	sarq	$63,%rax
	andq	$1023,%rax
	addq	%rax,%r8
	sarq	$10,%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld26(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Lj82:
.Ll174:
	nop
.Lj81:
	movq	%rbp,%rcx
	call	SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024
.Ll175:
	movq	-56(%rbp),%rbx
	movq	-48(%rbp),%rsi
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_handler __FPC_specific_handler,@unwind
.seh_handlerdata
	.long	1
	.long	0
	.rva	.Lj80
	.rva	.Lj81
	.rva	SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024

.section .text.n_soma_hypervisor_$$_hypervisorinit$longint,"x"
.seh_endproc
.Lc39:
.Lt1:
.Ll176:

.section .text.n_soma_hypervisor_$$_hypervisorrun,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORRUN
SOMA_HYPERVISOR_$$_HYPERVISORRUN:
.Lc43:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORRUN
.Ll177:
# [412] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rdi
.seh_pushreg %rdi
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-32(%rsp),%rsp
.Lc45:
.seh_stackalloc 32
.seh_endprologue
# Var i located in register esi
.Ll178:
# [413] Running := True;
	movb	$1,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll179:
# [414] WriteLn('Starting colony threads...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld27(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll180:
# [416] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj100
	movl	$-1,%esi
	.balign 8,0x90
.Lj101:
	addl	$1,%esi
.Ll181:
# [418] Colonies[i].active    := True;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$1,24(%rdx,%rax)
.Ll182:
# [419] Colonies[i].thread_id := BeginThread(@ColonyThreadProc, @Colonies[i]);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	addq	%rax,%rdx
	leaq	SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64(%rip),%rcx
	call	SYSTEM_$$_BEGINTHREAD$TTHREADFUNC$POINTER$$LONGWORD
	movl	%esi,%edx
	imulq	$56,%rdx,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rcx
	movl	%eax,(%rcx,%rdx)
.Ll183:
# [420] if Colonies[i].thread_id = 0 then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpl	$0,(%rdx,%rax)
	jne	.Lj105
.Ll184:
# [421] WriteLn('WARNING: Failed to start colony thread ', i)
	call	fpc_get_output
	movq	%rax,%rdi
	leaq	_$SOMA_HYPERVISOR$_Ld28(%rip),%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	movq	%rdi,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
	jmp	.Lj106
.Lj105:
.Ll185:
# [423] WriteLn('  Colony ', i, ' started (thread ', Colonies[i].thread_id, ')');
	call	fpc_get_output
	movq	%rax,%rdi
	leaq	_$SOMA_HYPERVISOR$_Ld29(%rip),%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld30(%rip),%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movl	(%rdx,%rax),%r8d
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	movl	$41,%r8d
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_char
	call	fpc_iocheck
	movq	%rdi,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Lj106:
.Ll186:
	cmpl	%esi,%ebx
	jnle	.Lj101
	.balign 4,0x90
.Lj100:
.Ll187:
# [426] StatusThreadID := BeginThread(@StatusThreadProc, nil);
	leaq	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64(%rip),%rcx
	xorl	%edx,%edx
	call	SYSTEM_$$_BEGINTHREAD$TTHREADFUNC$POINTER$$LONGWORD
	movl	%eax,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
.Ll188:
# [427] if StatusThreadID = 0 then
	testl	%eax,%eax
	jne	.Lj108
.Ll189:
# [428] WriteLn('WARNING: Failed to start status thread');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld31(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
	.balign 4,0x90
.Lj108:
.Ll190:
# [430] WriteLn('Hypervisor running. Press Enter to stop...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld32(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll191:
# [431] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
.Ll192:
# [433] Running := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll193:
# [434] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc44:
.Lt3:
.Ll194:

.section .text.n_soma_hypervisor_$$_hypervisorstop,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
SOMA_HYPERVISOR_$$_HYPERVISORSTOP:
.Lc46:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORSTOP
.Ll195:
# [439] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc48:
.seh_stackalloc 40
.seh_endprologue
# Var i located in register esi
.Ll196:
# [440] WriteLn('Stopping hypervisor...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld33(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll197:
# [442] if StatusThreadID <> 0 then
	cmpl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
	je	.Lj112
.Ll198:
# [444] WaitForSingleObject(StatusThreadID, 2000);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	movl	$2000,%edx
	call	_$dll$kernel32$WaitForSingleObject
.Ll199:
# [445] CloseHandle(StatusThreadID);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj112:
.Ll200:
# [448] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj114
	movl	$-1,%esi
	.balign 8,0x90
.Lj115:
	addl	$1,%esi
.Ll201:
# [450] if Colonies[i].active and (Colonies[i].thread_id <> 0) then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
.Ll202:
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	addq	%rdx,%rax
.Ll203:
	cmpb	$0,24(%rax)
	je	.Lj119
	cmpl	$0,(%rax)
	je	.Lj119
.Ll204:
# [452] WaitForSingleObject(Colonies[i].thread_id, 5000);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movl	(%rdx,%rax),%ecx
	movl	$5000,%edx
	call	_$dll$kernel32$WaitForSingleObject
.Ll205:
# [453] CloseHandle(Colonies[i].thread_id);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	(%rax,%rdx),%ecx
	call	_$dll$kernel32$CloseHandle
.Ll206:
# [454] Colonies[i].active := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
	.balign 4,0x90
.Lj119:
.Ll207:
	cmpl	%esi,%ebx
	jnle	.Lj115
	.balign 4,0x90
.Lj114:
.Ll208:
# [458] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj122
	movl	$-1,%esi
	.balign 8,0x90
.Lj123:
	addl	$1,%esi
.Ll209:
# [459] if Colonies[i].raw_alloc <> nil then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpq	$0,16(%rdx,%rax)
	je	.Lj127
.Ll210:
# [460] FreeMem(Colonies[i].raw_alloc);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	16(%rdx,%rax),%rcx
	call	SYSTEM_$$_FREEMEM$POINTER$$QWORD
	.balign 4,0x90
.Lj127:
.Ll211:
	cmpl	%esi,%ebx
	jnle	.Lj123
	.balign 4,0x90
.Lj122:
.Ll212:
# [462] CloseSharedMemory;
	call	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
.Ll213:
# [463] DoneCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_DONECRITICALSECTION$TRTLCRITICALSECTION
.Ll214:
# [464] WriteLn('Hypervisor stopped. Total generations: ', Generation);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld34(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Ll215:
# [465] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc47:
.Lt4:
.Ll216:

.section .text.n_soma_hypervisor_$$_init$,"x"
	.balign 16,0x90
.globl	INIT$_$SOMA_HYPERVISOR
INIT$_$SOMA_HYPERVISOR:
.globl	SOMA_HYPERVISOR_$$_init$
SOMA_HYPERVISOR_$$_init$:
.Lc49:
.seh_proc SOMA_HYPERVISOR_$$_init$
.Ll217:
# [467] initialization
	leaq	-40(%rsp),%rsp
.Lc51:
.seh_stackalloc 40
.seh_endprologue
.Ll218:
	leaq	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET(%rip),%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET(%rip),%rcx
	call	fpc_initialize
.Ll219:
# [468] FillChar(Colonies,   SizeOf(Colonies),   0);
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$896,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll220:
# [469] FillChar(Population, SizeOf(Population), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$4194304,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll221:
# [470] FillChar(PopFitness, SizeOf(PopFitness), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$1024,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll222:
# [471] Running        := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll223:
# [472] ShmemHandle    := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
.Ll224:
# [473] Shmem          := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
.Ll225:
# [474] StartTime      := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
.Ll226:
# [475] Generation     := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
.Ll227:
# [476] StatusThreadID := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
.Ll228:
# [477] BestGenomeIdx  := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
.Ll229:
# [479] end.
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc50:
.Lt5:
.Ll230:

.section .text.n_soma_hypervisor_$$_finalize_implicit$,"x"
	.balign 16,0x90
.globl	FINALIZE$_$SOMA_HYPERVISOR
FINALIZE$_$SOMA_HYPERVISOR:
.globl	SOMA_HYPERVISOR_$$_finalize_implicit$
SOMA_HYPERVISOR_$$_finalize_implicit$:
.Lc52:
.seh_proc SOMA_HYPERVISOR_$$_finalize_implicit$
	pushq	%rbp
.seh_pushreg %rbp
.Lc54:
.Lc55:
	movq	%rsp,%rbp
.Lc56:
	leaq	-32(%rsp),%rsp
.seh_stackalloc 32
.seh_endprologue
	leaq	INIT_$SOMA_FITNESS_$$_TFITNESSTARGET(%rip),%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET(%rip),%rcx
	call	fpc_finalize
	nop
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc53:
.Lt17:
.Ll231:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 8
# [soma_hypervisor.pas]
# [47] Colonies:        array[0..MAX_COLONIES-1] of TColonyThread;
	.globl U_$SOMA_HYPERVISOR_$$_COLONIES
U_$SOMA_HYPERVISOR_$$_COLONIES:
	.zero 896

.section .bss
	.balign 4
# [48] Population:       TPopulation;
	.globl U_$SOMA_HYPERVISOR_$$_POPULATION
U_$SOMA_HYPERVISOR_$$_POPULATION:
	.zero 4194304

.section .bss
	.balign 8
# [49] PopFitness:       TFitnessArr;
	.globl U_$SOMA_HYPERVISOR_$$_POPFITNESS
U_$SOMA_HYPERVISOR_$$_POPFITNESS:
	.zero 1024

.section .bss
	.balign 8
# [50] Generation:       UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_GENERATION
U_$SOMA_HYPERVISOR_$$_GENERATION:
	.zero 8

.section .bss
	.balign 4
# [51] ColonyCount:      Integer;
	.globl U_$SOMA_HYPERVISOR_$$_COLONYCOUNT
U_$SOMA_HYPERVISOR_$$_COLONYCOUNT:
	.zero 4

.section .bss
	.balign 8
# [52] BestFitness:      Double;
	.globl U_$SOMA_HYPERVISOR_$$_BESTFITNESS
U_$SOMA_HYPERVISOR_$$_BESTFITNESS:
	.zero 8

.section .bss
	.balign 8
# [53] AvgFitness:       Double;
	.globl U_$SOMA_HYPERVISOR_$$_AVGFITNESS
U_$SOMA_HYPERVISOR_$$_AVGFITNESS:
	.zero 8

.section .bss
	.balign 4
# [54] BestGenomeIdx:    Integer;
	.globl U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX
U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX:
	.zero 4

.section .bss
# [55] Running:          Boolean;
	.globl U_$SOMA_HYPERVISOR_$$_RUNNING
U_$SOMA_HYPERVISOR_$$_RUNNING:
	.zero 1

.section .bss
	.balign 8
# [56] HyperCS:          TRTLCriticalSection;
	.globl U_$SOMA_HYPERVISOR_$$_HYPERCS
U_$SOMA_HYPERVISOR_$$_HYPERCS:
	.zero 40

.section .bss
	.balign 8
# [57] ShmemHandle:      THandle;
	.globl U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE
U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE:
	.zero 8

.section .bss
	.balign 8
# [58] Shmem:            ^TSOMAShmem;
	.globl U_$SOMA_HYPERVISOR_$$_SHMEM
U_$SOMA_HYPERVISOR_$$_SHMEM:
	.zero 8

.section .bss
	.balign 8
# [59] StartTime:        UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_STARTTIME
U_$SOMA_HYPERVISOR_$$_STARTTIME:
	.zero 8

.section .bss
	.balign 4
# [60] StatusThreadID:   TThreadID;
	.globl U_$SOMA_HYPERVISOR_$$_STATUSTHREADID
U_$SOMA_HYPERVISOR_$$_STATUSTHREADID:
	.zero 4

.section .bss
	.balign 8
# [61] GlobalRNG:        UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_GLOBALRNG
U_$SOMA_HYPERVISOR_$$_GLOBALRNG:
	.zero 8

.section .bss
	.balign 8
# [62] FitnessTarget:    TFitnessTarget;  // loaded once in InitHypervisor, read-only after that
	.globl U_$SOMA_HYPERVISOR_$$_FITNESSTARGET
U_$SOMA_HYPERVISOR_$$_FITNESSTARGET:
	.zero 40
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__$SOMA_HYPERVISOR$_Ld1,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld1
_$SOMA_HYPERVISOR$_Ld1:
	.ascii	"SOMA_LiveView\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld2,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld2
_$SOMA_HYPERVISOR$_Ld2:
	.ascii	")WARNING: Could not create shared memory: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld3,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld3
_$SOMA_HYPERVISOR$_Ld3:
	.ascii	"&WARNING: Could not map shared memory: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld4,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld4
_$SOMA_HYPERVISOR$_Ld4:
	.ascii	"\013  [dbg gen=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld5,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld5
_$SOMA_HYPERVISOR$_Ld5:
	.ascii	"\016] input_count=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld6,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld6
_$SOMA_HYPERVISOR$_Ld6:
# [296] ' istack[0..3]=', state^.istack[0], ',', state^.istack[1], ',',
	.ascii	"\016 istack[0..3]=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld7,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld7
_$SOMA_HYPERVISOR$_Ld7:
# [298] ' isp=', state^.isp, ' ip=', state^.ip,
	.ascii	"\005 isp=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld8,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld8
_$SOMA_HYPERVISOR$_Ld8:
	.ascii	"\004 ip=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld9,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld9
_$SOMA_HYPERVISOR$_Ld9:
# [299] ' halt_reason=', Ord(state^.halt_reason),
	.ascii	"\015 halt_reason=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld10,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld10
_$SOMA_HYPERVISOR$_Ld10:
# [300] ' fitness=', col^.fitness:0:4);
	.ascii	"\011 fitness=\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld11,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld11
_$SOMA_HYPERVISOR$_Ld11:
# value: 0d+0.0000000000000000E+000
	.byte	0,0,0,0,0,0,0,0

.section .rodata.n__$SOMA_HYPERVISOR$_Ld12,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld12
_$SOMA_HYPERVISOR$_Ld12:
# value: 0d+7.8125000000000000E-003
	.byte	0,0,0,0,0,0,128,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld13,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld13
_$SOMA_HYPERVISOR$_Ld13:
	.ascii	"\005Gen: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld14,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld14
_$SOMA_HYPERVISOR$_Ld14:
# [353] '  Best: ', BestFitness:6:4,
	.ascii	"\010  Best: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld15,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld15
_$SOMA_HYPERVISOR$_Ld15:
# [354] '  Avg: ',  AvgFitness:6:4,
	.ascii	"\007  Avg: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld16,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld16
_$SOMA_HYPERVISOR$_Ld16:
	.ascii	"\013  (genome #\000"

.section .rodata.n_.Ld17,"d"
	.balign 8
.Ld17$strlab:
	.short	0,1
	.long	0
	.quad	-1,17
.Ld17:
	.ascii	"fitness_sort.json\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld18,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld18
_$SOMA_HYPERVISOR$_Ld18:
	.ascii	"\022  Fitness target: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld19,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld19
_$SOMA_HYPERVISOR$_Ld19:
	.ascii	"\002 v\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld20,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld20
_$SOMA_HYPERVISOR$_Ld20:
	.ascii	"\033SOMA Hypervisor initialised\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld21,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld21
_$SOMA_HYPERVISOR$_Ld21:
	.ascii	"\016  Colonies  : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld22,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld22
_$SOMA_HYPERVISOR$_Ld22:
	.ascii	"\016  Population: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld23,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld23
_$SOMA_HYPERVISOR$_Ld23:
	.ascii	"\016  VMState   : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld24,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld24
_$SOMA_HYPERVISOR$_Ld24:
	.ascii	"\021 bytes per colony\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld25,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld25
_$SOMA_HYPERVISOR$_Ld25:
	.ascii	"\016  Total RAM : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld26,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld26
_$SOMA_HYPERVISOR$_Ld26:
	.ascii	"\021 KB for VM states\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld27,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld27
_$SOMA_HYPERVISOR$_Ld27:
	.ascii	"\032Starting colony threads...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld28,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld28
_$SOMA_HYPERVISOR$_Ld28:
	.ascii	"'WARNING: Failed to start colony thread \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld29,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld29
_$SOMA_HYPERVISOR$_Ld29:
	.ascii	"\011  Colony \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld30,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld30
_$SOMA_HYPERVISOR$_Ld30:
	.ascii	"\021 started (thread \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld31,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld31
_$SOMA_HYPERVISOR$_Ld31:
	.ascii	"&WARNING: Failed to start status thread\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld32,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld32
_$SOMA_HYPERVISOR$_Ld32:
	.ascii	"*Hypervisor running. Press Enter to stop...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld33,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld33
_$SOMA_HYPERVISOR$_Ld33:
	.ascii	"\026Stopping hypervisor...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld34,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld34
_$SOMA_HYPERVISOR$_Ld34:
	.ascii	"'Hypervisor stopped. Total generations: \000"
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE
RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE:
	.byte	29,8
# [480] 
	.ascii	"PVMState"
	.quad	RTTI_$SOMA_TYPES_$$_TVMSTATE$indirect

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD
INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD:
	.byte	13,13
	.ascii	"TColonyThread"
	.quad	0
	.long	56
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD
RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD:
	.byte	13,13
	.ascii	"TColonyThread"
	.quad	INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD
	.long	56,8
	.quad	RTTI_$SYSTEM_$$_LONGWORD$indirect
	.quad	0
	.quad	RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE$indirect
	.quad	8
	.quad	RTTI_$SYSTEM_$$_POINTER$indirect
	.quad	16
	.quad	RTTI_$SYSTEM_$$_BOOLEAN$indirect
	.quad	24
	.quad	RTTI_$SYSTEM_$$_LONGINT$indirect
	.quad	28
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	32
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	40
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	48

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TPOPULATION,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TPOPULATION
INIT_$SOMA_HYPERVISOR_$$_TPOPULATION:
	.byte	12,11
	.ascii	"TPopulation"
	.quad	4194304,524288
	.quad	INIT_$SOMA_TYPES_$$_TINSTRUCTION$indirect
	.byte	2
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect
	.quad	RTTI_$SYSTEM_$$_SMALLINT$indirect

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION
RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION:
	.byte	12,11
	.ascii	"TPopulation"
	.quad	4194304,524288
	.quad	RTTI_$SOMA_TYPES_$$_TINSTRUCTION$indirect
	.byte	2
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect
	.quad	RTTI_$SYSTEM_$$_SMALLINT$indirect

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR
RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR:
	.byte	12,11
	.ascii	"TFitnessArr"
	.quad	1024,128
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM
INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM:
	.byte	13,10
	.ascii	"TSOMAShmem"
	.quad	0
	.long	64
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_def00000005,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_def00000005
RTTI_$SOMA_HYPERVISOR_$$_def00000005:
	.byte	12,0
	.quad	12,12
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM
RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM:
	.byte	13,10
	.ascii	"TSOMAShmem"
	.quad	INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM
	.long	64,9
	.quad	RTTI_$SYSTEM_$$_LONGWORD$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	4
	.quad	RTTI_$SYSTEM_$$_LONGWORD$indirect
	.quad	12
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	16
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	24
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	32
	.quad	RTTI_$SYSTEM_$$_LONGWORD$indirect
	.quad	40
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	44
	.quad	RTTI_$SOMA_HYPERVISOR_$$_def00000005$indirect
	.quad	52
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE$indirect
RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD$indirect
INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD$indirect:
	.quad	INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD$indirect
RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TPOPULATION,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TPOPULATION$indirect
INIT_$SOMA_HYPERVISOR_$$_TPOPULATION$indirect:
	.quad	INIT_$SOMA_HYPERVISOR_$$_TPOPULATION

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION$indirect
RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR$indirect
RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect
INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect:
	.quad	INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_def00000005,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_def00000005$indirect
RTTI_$SOMA_HYPERVISOR_$$_def00000005$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_def00000005

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect
RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc57:
	.long	.Lc59-.Lc58
.Lc58:
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
.Lc59:
	.long	.Lc61-.Lc60
.Lc60:
	.secrel32	.Lc57
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc61:
	.long	.Lc63-.Lc62
.Lc62:
	.secrel32	.Lc57
	.quad	.Lc4
	.quad	.Lc5-.Lc4
	.byte	4
	.long	.Lc6-.Lc4
	.byte	14
	.uleb128	56
	.balign 4,0
.Lc63:
	.long	.Lc65-.Lc64
.Lc64:
	.secrel32	.Lc57
	.quad	.Lc7
	.quad	.Lc8-.Lc7
	.byte	4
	.long	.Lc9-.Lc7
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc65:
	.long	.Lc67-.Lc66
.Lc66:
	.secrel32	.Lc57
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
.Lc67:
	.long	.Lc69-.Lc68
.Lc68:
	.secrel32	.Lc57
	.quad	.Lc15
	.quad	.Lc16-.Lc15
	.byte	4
	.long	.Lc17-.Lc15
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc69:
	.long	.Lc71-.Lc70
.Lc70:
	.secrel32	.Lc57
	.quad	.Lc18
	.quad	.Lc19-.Lc18
	.balign 4,0
.Lc71:
	.long	.Lc73-.Lc72
.Lc72:
	.secrel32	.Lc57
	.quad	.Lc20
	.quad	.Lc21-.Lc20
	.byte	4
	.long	.Lc22-.Lc20
	.byte	14
	.uleb128	176
	.balign 4,0
.Lc73:
	.long	.Lc75-.Lc74
.Lc74:
	.secrel32	.Lc57
	.quad	.Lc23
	.quad	.Lc24-.Lc23
	.balign 4,0
.Lc75:
	.long	.Lc77-.Lc76
.Lc76:
	.secrel32	.Lc57
	.quad	.Lc25
	.quad	.Lc26-.Lc25
	.balign 4,0
.Lc77:
	.long	.Lc79-.Lc78
.Lc78:
	.secrel32	.Lc57
	.quad	.Lc27
	.quad	.Lc28-.Lc27
	.byte	4
	.long	.Lc29-.Lc27
	.byte	14
	.uleb128	32840
	.balign 4,0
.Lc79:
	.long	.Lc81-.Lc80
.Lc80:
	.secrel32	.Lc57
	.quad	.Lc30
	.quad	.Lc31-.Lc30
	.byte	4
	.long	.Lc32-.Lc30
	.byte	14
	.uleb128	80
	.balign 4,0
.Lc81:
	.long	.Lc83-.Lc82
.Lc82:
	.secrel32	.Lc57
	.quad	.Lc33
	.quad	.Lc34-.Lc33
	.byte	4
	.long	.Lc35-.Lc33
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc36-.Lc35
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc37-.Lc36
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc83:
	.long	.Lc85-.Lc84
.Lc84:
	.secrel32	.Lc57
	.quad	.Lc38
	.quad	.Lc39-.Lc38
	.byte	4
	.long	.Lc40-.Lc38
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc41-.Lc40
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc42-.Lc41
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc85:
	.long	.Lc87-.Lc86
.Lc86:
	.secrel32	.Lc57
	.quad	.Lc43
	.quad	.Lc44-.Lc43
	.byte	4
	.long	.Lc45-.Lc43
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc87:
	.long	.Lc89-.Lc88
.Lc88:
	.secrel32	.Lc57
	.quad	.Lc46
	.quad	.Lc47-.Lc46
	.byte	4
	.long	.Lc48-.Lc46
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc89:
	.long	.Lc91-.Lc90
.Lc90:
	.secrel32	.Lc57
	.quad	.Lc49
	.quad	.Lc50-.Lc49
	.byte	4
	.long	.Lc51-.Lc49
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc91:
	.long	.Lc93-.Lc92
.Lc92:
	.secrel32	.Lc57
	.quad	.Lc52
	.quad	.Lc53-.Lc52
	.byte	4
	.long	.Lc54-.Lc52
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc55-.Lc54
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc56-.Lc55
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc93:
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
	.ascii	"soma_hypervisor.pas\000"
	.ascii	"Free Pascal 3.2.2 2026/06/06\000"
	.ascii	"C:/dev/soma/\000"
	.byte	9
	.byte	3
	.secrel32	.Ldebug_line0
	.quad	DEBUGSTART_$SOMA_HYPERVISOR
	.quad	DEBUGEND_$SOMA_HYPERVISOR
# Syms - Begin unit SOMA_HYPERVISOR has index 10
# Symbol SOMA_HYPERVISOR
# Symbol SYSTEM
# Symbol OBJPAS
# Symbol SOMA_TYPES
# Symbol SOMA_CORE
# Symbol SOMA_MUTATE
# Symbol SOMA_FITNESS
# Symbol FPJSON
# Symbol JSONPARSER
# Symbol WINDOWS
# Symbol SYSUTILS
# Symbol MAX_COLONIES
	.uleb128	2
	.ascii	"MAX_COLONIES\000"
	.long	.La1-.Ldebug_info0
	.uleb128	16
# Symbol POPULATION_SIZE
	.uleb128	2
	.ascii	"POPULATION_SIZE\000"
	.long	.La3-.Ldebug_info0
	.uleb128	128
# Symbol PVMSTATE
# Symbol TCOLONYTHREAD
# Symbol TPOPULATION
# Symbol TFITNESSARR
# Symbol TSOMASHMEM
# Symbol COLONIES
	.uleb128	3
	.ascii	"Colonies\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_COLONIES
	.long	.La15-.Ldebug_info0
# Symbol POPULATION
	.uleb128	3
	.ascii	"Population\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_POPULATION
	.long	.La9-.Ldebug_info0
# Symbol POPFITNESS
	.uleb128	3
	.ascii	"PopFitness\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_POPFITNESS
	.long	.La11-.Ldebug_info0
# Symbol GENERATION
	.uleb128	3
	.ascii	"Generation\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_GENERATION
	.long	.La17-.Ldebug_info0
# Symbol COLONYCOUNT
	.uleb128	3
	.ascii	"ColonyCount\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT
	.long	.La19-.Ldebug_info0
# Symbol BESTFITNESS
	.uleb128	3
	.ascii	"BestFitness\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_BESTFITNESS
	.long	.La21-.Ldebug_info0
# Symbol AVGFITNESS
	.uleb128	3
	.ascii	"AvgFitness\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_AVGFITNESS
	.long	.La21-.Ldebug_info0
# Symbol BESTGENOMEIDX
	.uleb128	3
	.ascii	"BestGenomeIdx\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX
	.long	.La19-.Ldebug_info0
# Symbol RUNNING
	.uleb128	3
	.ascii	"Running\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_RUNNING
	.long	.La23-.Ldebug_info0
# Symbol HYPERCS
	.uleb128	3
	.ascii	"HyperCS\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_HYPERCS
	.long	.La25-.Ldebug_info0
# Symbol SHMEMHANDLE
	.uleb128	3
	.ascii	"ShmemHandle\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE
	.long	.La17-.Ldebug_info0
# Symbol SHMEM
	.uleb128	3
	.ascii	"Shmem\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_SHMEM
	.long	.La27-.Ldebug_info0
# Symbol STARTTIME
	.uleb128	3
	.ascii	"StartTime\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_STARTTIME
	.long	.La17-.Ldebug_info0
# Symbol STATUSTHREADID
	.uleb128	3
	.ascii	"StatusThreadID\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID
	.long	.La29-.Ldebug_info0
# Symbol GLOBALRNG
	.uleb128	3
	.ascii	"GlobalRNG\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_GLOBALRNG
	.long	.La17-.Ldebug_info0
# Symbol FITNESSTARGET
	.uleb128	3
	.ascii	"FitnessTarget\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	U_$SOMA_HYPERVISOR_$$_FITNESSTARGET
	.long	.La31-.Ldebug_info0
# Symbol HYPERVISORINIT
# Symbol HYPERVISORRUN
# Symbol HYPERVISORSTOP
# Syms - End unit SOMA_HYPERVISOR has index 10
# Syms - Begin Staticsymtable
# Symbol SOMA_HYPERVISOR_$$_init$
# Symbol ALLOCALIGNED
# Symbol INITSHAREDMEMORY
# Symbol CLOSESHAREDMEMORY
# Symbol READTSC
# Symbol UPDATESHAREDMEMORY
# Symbol RANDOMGENOME
# Symbol EVALUATEFITNESS
# Symbol FINDWORSTIDX
# Symbol TOURNAMENTSELECT
# Symbol COLONYTHREADPROC
# Symbol STATUSTHREADPROC
# Symbol ansistrrec17
# Symbol SOMA_HYPERVISOR_$$_finalize_implicit$
# Symbol rttidef$RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE
# Symbol rtti_header$8
# Symbol rtti_ref$
# Symbol rttidef$INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD
# Symbol rtti_header$13
# Symbol rttidef$RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD
# Symbol rttidef$INIT_$SOMA_HYPERVISOR_$$_TPOPULATION
# Symbol rtti_normal_array$2
# Symbol rttidef$RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION
# Symbol rttidef$RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR
# Symbol rtti_normal_array$1
# Symbol rttidef$INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM
# Symbol rtti_header$10
# Symbol rttidef$RTTI_$SOMA_HYPERVISOR_$$_def00000005
# Symbol rttidef$RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM
# Syms - End Staticsymtable
# Procdef HypervisorInit(LongInt);
	.uleb128	4
	.ascii	"HypervisorInit\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
	.quad	.Lt1
# Symbol COLONY_COUNT
	.uleb128	5
	.ascii	"colony_count\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La19-.Ldebug_info0
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	4
	.long	.La19-.Ldebug_info0
# Symbol fin$00000024
	.byte	0
# Procdef $fin$00000024(<^untyped>) is nested; Register;
	.uleb128	7
	.ascii	"$fin$00000024\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024
	.quad	.Lt2
# Symbol parentfp
	.uleb128	5
	.ascii	"$parentfp\000"
	.byte	2
	.byte	144
	.uleb128	6
	.long	.La65-.Ldebug_info0
	.byte	0
# Procdef HypervisorRun;
	.uleb128	4
	.ascii	"HypervisorRun\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORRUN
	.quad	.Lt3
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	4
	.long	.La19-.Ldebug_info0
	.byte	0
# Procdef HypervisorStop;
	.uleb128	4
	.ascii	"HypervisorStop\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
	.quad	.Lt4
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	4
	.long	.La19-.Ldebug_info0
	.byte	0
# Procdef $SOMA_HYPERVISOR_$$_init$; Register;
	.uleb128	4
	.ascii	"$SOMA_HYPERVISOR_$$_init$\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_HYPERVISOR_$$_init$
	.quad	.Lt5
	.byte	0
# Procdef AllocAligned(QWord;out Pointer):^untyped;
	.uleb128	8
	.ascii	"AllocAligned\000"
	.byte	1
	.byte	65
	.long	.La67-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	.quad	.Lt6
# Symbol SIZE
	.uleb128	5
	.ascii	"size\000"
	.byte	2
	.byte	144
	.uleb128	2
	.long	.La17-.Ldebug_info0
# Symbol RAW
	.uleb128	5
	.ascii	"raw\000"
	.byte	3
	.byte	146
	.uleb128	3
	.sleb128	0
	.long	.La67-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La67-.Ldebug_info0
# Symbol ALLOCALIGNED
	.uleb128	6
	.ascii	"ALLOCALIGNED\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La67-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La67-.Ldebug_info0
# Symbol P
	.uleb128	6
	.ascii	"p\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La17-.Ldebug_info0
	.byte	0
# Procdef InitSharedMemory;
	.uleb128	7
	.ascii	"InitSharedMemory\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
	.quad	.Lt7
# Symbol SHMEM_NAME
	.uleb128	9
	.ascii	"SHMEM_NAME\000"
	.long	.La69-.Ldebug_info0
	.byte	14
	.byte	13
	.byte	83
	.byte	79
	.byte	77
	.byte	65
	.byte	95
	.byte	76
	.byte	105
	.byte	118
	.byte	101
	.byte	86
	.byte	105
	.byte	101
	.byte	119
	.byte	0
# Procdef CloseSharedMemory;
	.uleb128	7
	.ascii	"CloseSharedMemory\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
	.quad	.Lt8
	.byte	0
# Procdef ReadTSC:QWord;
	.uleb128	8
	.ascii	"ReadTSC\000"
	.byte	1
	.byte	65
	.long	.La17-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	.quad	.Lt9
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	118
	.sleb128	-8
	.long	.La17-.Ldebug_info0
# Symbol READTSC
	.uleb128	6
	.ascii	"READTSC\000"
	.byte	2
	.byte	118
	.sleb128	-8
	.long	.La17-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	118
	.sleb128	-8
	.long	.La17-.Ldebug_info0
# Symbol R
	.uleb128	6
	.ascii	"r\000"
	.byte	2
	.byte	118
	.sleb128	-16
	.long	.La17-.Ldebug_info0
	.byte	0
# Procdef UpdateSharedMemory;
	.uleb128	7
	.ascii	"UpdateSharedMemory\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
	.quad	.Lt10
	.byte	0
# Procdef RandomGenome(var TGenome;var QWord);
	.uleb128	7
	.ascii	"RandomGenome\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	.quad	.Lt11
# Symbol G
	.uleb128	5
	.ascii	"G\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La71-.Ldebug_info0
# Symbol RNG
	.uleb128	5
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	8
	.sleb128	0
	.long	.La17-.Ldebug_info0
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	9
	.long	.La19-.Ldebug_info0
	.byte	0
# Procdef EvaluateFitness(PVMState):Double;
	.uleb128	8
	.ascii	"EvaluateFitness\000"
	.byte	1
	.byte	65
	.long	.La21-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	.quad	.Lt12
# Symbol STATE
	.uleb128	5
	.ascii	"state\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La5-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La21-.Ldebug_info0
# Symbol EVALUATEFITNESS
	.uleb128	6
	.ascii	"EVALUATEFITNESS\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La21-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La21-.Ldebug_info0
# Symbol FR
	.uleb128	6
	.ascii	"fr\000"
	.byte	2
	.byte	119
	.sleb128	40
	.long	.La73-.Ldebug_info0
	.byte	0
# Procdef FindWorstIdx:LongInt;
	.uleb128	8
	.ascii	"FindWorstIdx\000"
	.byte	1
	.byte	65
	.long	.La19-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	.quad	.Lt13
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol FINDWORSTIDX
	.uleb128	6
	.ascii	"FINDWORSTIDX\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La19-.Ldebug_info0
# Symbol WORST
	.uleb128	6
	.ascii	"worst\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La21-.Ldebug_info0
	.byte	0
# Procdef TournamentSelect(var QWord;LongInt):LongInt;
	.uleb128	8
	.ascii	"TournamentSelect\000"
	.byte	1
	.byte	65
	.long	.La19-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	.quad	.Lt14
# Symbol RNG
	.uleb128	5
	.ascii	"rng\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La17-.Ldebug_info0
# Symbol K
	.uleb128	5
	.ascii	"k\000"
	.byte	2
	.byte	144
	.uleb128	1
	.long	.La19-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol TOURNAMENTSELECT
	.uleb128	6
	.ascii	"TOURNAMENTSELECT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	8
	.long	.La19-.Ldebug_info0
# Symbol CANDIDATE
	.uleb128	6
	.ascii	"candidate\000"
	.byte	2
	.byte	144
	.uleb128	10
	.long	.La19-.Ldebug_info0
# Symbol BEST_IDX
	.uleb128	6
	.ascii	"best_idx\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La19-.Ldebug_info0
# Symbol BEST_FIT
	.uleb128	6
	.ascii	"best_fit\000"
	.byte	2
	.byte	144
	.uleb128	17
	.long	.La21-.Ldebug_info0
	.byte	0
# Procdef ColonyThreadProc(Pointer):Int64;
	.uleb128	8
	.ascii	"ColonyThreadProc\000"
	.byte	1
	.byte	65
	.long	.La75-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
	.quad	.Lt15
# Symbol PARAM
	.uleb128	5
	.ascii	"param\000"
	.byte	2
	.byte	144
	.uleb128	2
	.long	.La67-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La75-.Ldebug_info0
# Symbol COLONYTHREADPROC
	.uleb128	6
	.ascii	"COLONYTHREADPROC\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La75-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La75-.Ldebug_info0
# Symbol COL
	.uleb128	6
	.ascii	"col\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La77-.Ldebug_info0
# Symbol STATE
	.uleb128	6
	.ascii	"state\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La5-.Ldebug_info0
# Symbol T0
	.uleb128	6
	.ascii	"t0\000"
	.byte	2
	.byte	144
	.uleb128	15
	.long	.La17-.Ldebug_info0
# Symbol T1
	.uleb128	6
	.ascii	"t1\000"
	.byte	2
	.byte	144
	.uleb128	14
	.long	.La17-.Ldebug_info0
# Symbol PARENT_IDX
	.uleb128	6
	.ascii	"parent_idx\000"
	.byte	2
	.byte	144
	.uleb128	13
	.long	.La19-.Ldebug_info0
# Symbol WORST_IDX
	.uleb128	6
	.ascii	"worst_idx\000"
	.byte	2
	.byte	144
	.uleb128	12
	.long	.La19-.Ldebug_info0
# Symbol LOCAL_RNG
	.uleb128	6
	.ascii	"local_rng\000"
	.byte	2
	.byte	119
	.sleb128	40
	.long	.La17-.Ldebug_info0
# Symbol OFFSPRING
	.uleb128	6
	.ascii	"offspring\000"
	.byte	2
	.byte	119
	.sleb128	48
	.long	.La71-.Ldebug_info0
# Definition ^TColonyThread
.La77:
	.uleb128	10
	.long	.La7-.Ldebug_info0
.La78:
	.uleb128	11
	.long	.La77-.Ldebug_info0
	.byte	0
# Procdef StatusThreadProc(Pointer):Int64;
	.uleb128	8
	.ascii	"StatusThreadProc\000"
	.byte	1
	.byte	65
	.long	.La75-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
	.quad	.Lt16
# Symbol PARAM
	.uleb128	5
	.ascii	"param\000"
	.byte	2
	.byte	144
	.uleb128	2
	.long	.La67-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La75-.Ldebug_info0
# Symbol STATUSTHREADPROC
	.uleb128	6
	.ascii	"STATUSTHREADPROC\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La75-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La75-.Ldebug_info0
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La19-.Ldebug_info0
# Symbol SUM
	.uleb128	6
	.ascii	"sum\000"
	.byte	2
	.byte	144
	.uleb128	23
	.long	.La21-.Ldebug_info0
	.byte	0
# Procdef $SOMA_HYPERVISOR_$$_finalize_implicit$; Register;
	.uleb128	4
	.ascii	"$SOMA_HYPERVISOR_$$_finalize_implicit$\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_HYPERVISOR_$$_finalize_implicit$
	.quad	.Lt17
	.byte	0
# Defs - Begin unit SYSTEM has index 1
# Definition Pointer
.La67:
	.uleb128	12
	.ascii	"Pointer\000"
	.long	.La79-.Ldebug_info0
.La79:
	.uleb128	13
.La68:
	.uleb128	11
	.long	.La67-.Ldebug_info0
# Definition Byte
.La3:
	.uleb128	12
	.ascii	"Byte\000"
	.long	.La80-.Ldebug_info0
.La80:
	.uleb128	14
	.ascii	"Byte\000"
	.byte	7
	.byte	1
.La4:
	.uleb128	11
	.long	.La3-.Ldebug_info0
# Definition ShortInt
.La1:
	.uleb128	12
	.ascii	"ShortInt\000"
	.long	.La81-.Ldebug_info0
.La81:
	.uleb128	14
	.ascii	"ShortInt\000"
	.byte	5
	.byte	1
.La2:
	.uleb128	11
	.long	.La1-.Ldebug_info0
# Definition LongWord
.La29:
	.uleb128	12
	.ascii	"LongWord\000"
	.long	.La82-.Ldebug_info0
.La82:
	.uleb128	14
	.ascii	"LongWord\000"
	.byte	7
	.byte	4
.La30:
	.uleb128	11
	.long	.La29-.Ldebug_info0
# Definition LongInt
.La19:
	.uleb128	12
	.ascii	"LongInt\000"
	.long	.La83-.Ldebug_info0
.La83:
	.uleb128	14
	.ascii	"LongInt\000"
	.byte	5
	.byte	4
.La20:
	.uleb128	11
	.long	.La19-.Ldebug_info0
# Definition QWord
.La17:
	.uleb128	12
	.ascii	"QWord\000"
	.long	.La84-.Ldebug_info0
.La84:
	.uleb128	14
	.ascii	"QWord\000"
	.byte	7
	.byte	8
.La18:
	.uleb128	11
	.long	.La17-.Ldebug_info0
# Definition Int64
.La75:
	.uleb128	12
	.ascii	"Int64\000"
	.long	.La85-.Ldebug_info0
.La85:
	.uleb128	14
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.La76:
	.uleb128	11
	.long	.La75-.Ldebug_info0
# Definition Boolean
.La23:
	.uleb128	12
	.ascii	"Boolean\000"
	.long	.La86-.Ldebug_info0
.La86:
	.uleb128	14
	.ascii	"Boolean\000"
	.byte	2
	.byte	1
.La24:
	.uleb128	11
	.long	.La23-.Ldebug_info0
# Definition ShortString
.La69:
	.uleb128	12
	.ascii	"ShortString\000"
	.long	.La87-.Ldebug_info0
.La87:
	.uleb128	15
	.ascii	"ShortString\000"
	.byte	3
	.byte	151
	.byte	49
	.byte	34
	.long	.La88-.Ldebug_info0
	.uleb128	16
	.uleb128	1
	.byte	3
	.byte	151
	.byte	148
	.byte	1
	.byte	0
.La70:
	.uleb128	11
	.long	.La69-.Ldebug_info0
# Definition Double
.La21:
	.uleb128	12
	.ascii	"Double\000"
	.long	.La90-.Ldebug_info0
.La90:
	.uleb128	14
	.ascii	"Double\000"
	.byte	4
	.byte	8
.La22:
	.uleb128	11
	.long	.La21-.Ldebug_info0
# Definition ^untyped
.La65:
	.uleb128	12
	.ascii	"$parentfp_void_pointer\000"
	.long	.La91-.Ldebug_info0
.La91:
	.uleb128	13
.La66:
	.uleb128	11
	.long	.La65-.Ldebug_info0
# Definition TRTLCriticalSection
.La25:
	.uleb128	12
	.ascii	"TRTLCriticalSection\000"
	.long	.La92-.Ldebug_info0
.La92:
	.uleb128	17
	.ascii	"TRTLCRITICALSECTION\000"
	.uleb128	40
	.uleb128	18
	.ascii	"DebugInfo\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La67-.Ldebug_info0
	.uleb128	18
	.ascii	"LockCount\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La19-.Ldebug_info0
	.uleb128	18
	.ascii	"RecursionCount\000"
	.byte	2
	.byte	35
	.uleb128	12
	.long	.La19-.Ldebug_info0
	.uleb128	18
	.ascii	"OwningThread\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"LockSemaphore\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"SpinCount\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La17-.Ldebug_info0
	.byte	0
.La26:
	.uleb128	11
	.long	.La25-.Ldebug_info0
# Definition Char
.La88:
	.uleb128	12
	.ascii	"Char\000"
	.long	.La93-.Ldebug_info0
.La93:
	.uleb128	14
	.ascii	"Char\000"
	.byte	8
	.byte	1
.La89:
	.uleb128	11
	.long	.La88-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit SOMA_TYPES has index 8
# Definition TGenome
.La71:
	.uleb128	12
	.ascii	"TGenome\000"
	.long	.La94-.Ldebug_info0
.La94:
	.uleb128	19
	.ascii	"TGenome\000"
	.uleb128	32768
	.long	.La95-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	4095
	.uleb128	8
	.long	.La97-.Ldebug_info0
	.byte	0
.La72:
	.uleb128	11
	.long	.La71-.Ldebug_info0
# Definition TFitnessResult
.La73:
	.uleb128	12
	.ascii	"TFitnessResult\000"
	.long	.La99-.Ldebug_info0
.La99:
	.uleb128	17
	.ascii	"TFITNESSRESULT\000"
	.uleb128	112
	.uleb128	18
	.ascii	"score\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La21-.Ldebug_info0
	.uleb128	18
	.ascii	"metrics\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La100-.Ldebug_info0
	.uleb128	18
	.ascii	"tag\000"
	.byte	2
	.byte	35
	.uleb128	72
	.long	.La102-.Ldebug_info0
	.uleb128	18
	.ascii	"version\000"
	.byte	2
	.byte	35
	.uleb128	104
	.long	.La104-.Ldebug_info0
	.uleb128	18
	.ascii	"passed\000"
	.byte	2
	.byte	35
	.uleb128	106
	.long	.La23-.Ldebug_info0
	.byte	0
.La74:
	.uleb128	11
	.long	.La73-.Ldebug_info0
# Definition TInstruction
.La95:
	.uleb128	12
	.ascii	"TInstruction\000"
	.long	.La106-.Ldebug_info0
.La106:
	.uleb128	17
	.ascii	"TINSTRUCTION\000"
	.uleb128	8
	.uleb128	18
	.ascii	"opcode\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La104-.Ldebug_info0
	.uleb128	18
	.ascii	"flags\000"
	.byte	2
	.byte	35
	.uleb128	2
	.long	.La3-.Ldebug_info0
	.uleb128	18
	.ascii	"pad\000"
	.byte	2
	.byte	35
	.uleb128	3
	.long	.La3-.Ldebug_info0
	.uleb128	18
	.ascii	"imm\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La19-.Ldebug_info0
	.byte	0
.La96:
	.uleb128	11
	.long	.La95-.Ldebug_info0
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
# Definition TFitnessTarget
.La31:
	.uleb128	12
	.ascii	"TFitnessTarget\000"
	.long	.La107-.Ldebug_info0
.La107:
	.uleb128	17
	.ascii	"TFITNESSTARGET\000"
	.uleb128	40
	.uleb128	18
	.ascii	"name\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La108-.Ldebug_info0
	.uleb128	18
	.ascii	"version\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La104-.Ldebug_info0
	.uleb128	18
	.ascii	"input_count\000"
	.byte	2
	.byte	35
	.uleb128	12
	.long	.La19-.Ldebug_info0
	.uleb128	18
	.ascii	"input_min\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La75-.Ldebug_info0
	.uleb128	18
	.ascii	"input_max\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La75-.Ldebug_info0
	.uleb128	18
	.ascii	"criteria\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La110-.Ldebug_info0
	.byte	0
.La32:
	.uleb128	11
	.long	.La31-.Ldebug_info0
# Defs - End unit SOMA_FITNESS has index 12
# Defs - Begin unit SOMA_HYPERVISOR has index 10
# Definition PVMState
.La5:
	.uleb128	12
	.ascii	"PVMState\000"
	.long	.La112-.Ldebug_info0
.La112:
	.uleb128	10
	.long	.La113-.Ldebug_info0
.La6:
	.uleb128	11
	.long	.La5-.Ldebug_info0
# Definition TColonyThread
.La7:
	.uleb128	12
	.ascii	"TColonyThread\000"
	.long	.La115-.Ldebug_info0
.La115:
	.uleb128	17
	.ascii	"TCOLONYTHREAD\000"
	.uleb128	56
	.uleb128	18
	.ascii	"thread_id\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La29-.Ldebug_info0
	.uleb128	18
	.ascii	"state\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La5-.Ldebug_info0
	.uleb128	18
	.ascii	"raw_alloc\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La67-.Ldebug_info0
	.uleb128	18
	.ascii	"active\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La23-.Ldebug_info0
	.uleb128	18
	.ascii	"colony_id\000"
	.byte	2
	.byte	35
	.uleb128	28
	.long	.La19-.Ldebug_info0
	.uleb128	18
	.ascii	"fitness\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La21-.Ldebug_info0
	.uleb128	18
	.ascii	"exec_cycles\000"
	.byte	2
	.byte	35
	.uleb128	40
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"generation\000"
	.byte	2
	.byte	35
	.uleb128	48
	.long	.La17-.Ldebug_info0
	.byte	0
.La8:
	.uleb128	11
	.long	.La7-.Ldebug_info0
# Definition TPopulation
.La9:
	.uleb128	12
	.ascii	"TPopulation\000"
	.long	.La116-.Ldebug_info0
.La116:
	.uleb128	19
	.ascii	"TPopulation\000"
	.uleb128	4194304
	.long	.La71-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	127
	.uleb128	32768
	.long	.La1-.Ldebug_info0
	.byte	0
.La10:
	.uleb128	11
	.long	.La9-.Ldebug_info0
# Definition TFitnessArr
.La11:
	.uleb128	12
	.ascii	"TFitnessArr\000"
	.long	.La117-.Ldebug_info0
.La117:
	.uleb128	19
	.ascii	"TFitnessArr\000"
	.uleb128	1024
	.long	.La21-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	127
	.uleb128	8
	.long	.La1-.Ldebug_info0
	.byte	0
.La12:
	.uleb128	11
	.long	.La11-.Ldebug_info0
# Definition TSOMAShmem
.La13:
	.uleb128	12
	.ascii	"TSOMAShmem\000"
	.long	.La118-.Ldebug_info0
.La118:
	.uleb128	17
	.ascii	"TSOMASHMEM\000"
	.uleb128	64
	.uleb128	18
	.ascii	"magic\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La29-.Ldebug_info0
	.uleb128	18
	.ascii	"generation\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"active_colonies\000"
	.byte	2
	.byte	35
	.uleb128	12
	.long	.La29-.Ldebug_info0
	.uleb128	18
	.ascii	"best_fitness\000"
	.byte	2
	.byte	35
	.uleb128	16
	.long	.La21-.Ldebug_info0
	.uleb128	18
	.ascii	"avg_fitness\000"
	.byte	2
	.byte	35
	.uleb128	24
	.long	.La21-.Ldebug_info0
	.uleb128	18
	.ascii	"diversity\000"
	.byte	2
	.byte	35
	.uleb128	32
	.long	.La21-.Ldebug_info0
	.uleb128	18
	.ascii	"codon_count\000"
	.byte	2
	.byte	35
	.uleb128	40
	.long	.La29-.Ldebug_info0
	.uleb128	18
	.ascii	"uptime_secs\000"
	.byte	2
	.byte	35
	.uleb128	44
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"pad\000"
	.byte	2
	.byte	35
	.uleb128	52
	.long	.La119-.Ldebug_info0
	.byte	0
.La14:
	.uleb128	11
	.long	.La13-.Ldebug_info0
# Definition Array[0..15] Of TColonyThread
.La15:
	.uleb128	21
	.uleb128	896
	.long	.La7-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	15
	.uleb128	56
	.long	.La1-.Ldebug_info0
	.byte	0
.La16:
	.uleb128	11
	.long	.La15-.Ldebug_info0
# Definition ^TSOMAShmem
.La27:
	.uleb128	10
	.long	.La13-.Ldebug_info0
.La28:
	.uleb128	11
	.long	.La27-.Ldebug_info0
# Defs - End unit SOMA_HYPERVISOR has index 10
# Defs - Begin Staticsymtable
# Definition <record type>
.La33:
	.uleb128	12
	.ascii	"$ansistrrec17\000"
	.long	.La121-.Ldebug_info0
.La121:
	.uleb128	17
	.ascii	"$ANSISTRREC17\000"
	.uleb128	50
	.byte	0
.La34:
	.uleb128	11
	.long	.La33-.Ldebug_info0
# Definition <record type>
.La35:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE\000"
	.long	.La122-.Ldebug_info0
.La122:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE\000"
	.uleb128	18
	.byte	0
.La36:
	.uleb128	11
	.long	.La35-.Ldebug_info0
# Definition <record type>
.La37:
	.uleb128	12
	.ascii	"$rtti_header$8\000"
	.long	.La123-.Ldebug_info0
.La123:
	.uleb128	17
	.ascii	"$RTTI_HEADER$8\000"
	.uleb128	10
	.byte	0
.La38:
	.uleb128	11
	.long	.La37-.Ldebug_info0
# Definition <record type>
.La39:
	.uleb128	12
	.ascii	"$rtti_ref$\000"
	.long	.La124-.Ldebug_info0
.La124:
	.uleb128	17
	.ascii	"$RTTI_REF$\000"
	.uleb128	8
	.byte	0
.La40:
	.uleb128	11
	.long	.La39-.Ldebug_info0
# Definition <record type>
.La41:
	.uleb128	12
	.ascii	"$rttidef$INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.long	.La125-.Ldebug_info0
.La125:
	.uleb128	17
	.ascii	"$RTTIDEF$INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.uleb128	47
	.byte	0
.La42:
	.uleb128	11
	.long	.La41-.Ldebug_info0
# Definition <record type>
.La43:
	.uleb128	12
	.ascii	"$rtti_header$13\000"
	.long	.La126-.Ldebug_info0
.La126:
	.uleb128	17
	.ascii	"$RTTI_HEADER$13\000"
	.uleb128	15
	.byte	0
.La44:
	.uleb128	11
	.long	.La43-.Ldebug_info0
# Definition <record type>
.La45:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.long	.La127-.Ldebug_info0
.La127:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.uleb128	159
	.byte	0
.La46:
	.uleb128	11
	.long	.La45-.Ldebug_info0
# Definition <record type>
.La47:
	.uleb128	12
	.ascii	"$rttidef$INIT_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.long	.La128-.Ldebug_info0
.La128:
	.uleb128	17
	.ascii	"$RTTIDEF$INIT_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.uleb128	54
	.byte	0
.La48:
	.uleb128	11
	.long	.La47-.Ldebug_info0
# Definition <record type>
.La49:
	.uleb128	12
	.ascii	"$rtti_normal_array$2\000"
	.long	.La129-.Ldebug_info0
.La129:
	.uleb128	17
	.ascii	"$RTTI_NORMAL_ARRAY$2\000"
	.uleb128	41
	.byte	0
.La50:
	.uleb128	11
	.long	.La49-.Ldebug_info0
# Definition <record type>
.La51:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.long	.La130-.Ldebug_info0
.La130:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.uleb128	54
	.byte	0
.La52:
	.uleb128	11
	.long	.La51-.Ldebug_info0
# Definition <record type>
.La53:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR\000"
	.long	.La131-.Ldebug_info0
.La131:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR\000"
	.uleb128	46
	.byte	0
.La54:
	.uleb128	11
	.long	.La53-.Ldebug_info0
# Definition <record type>
.La55:
	.uleb128	12
	.ascii	"$rtti_normal_array$1\000"
	.long	.La132-.Ldebug_info0
.La132:
	.uleb128	17
	.ascii	"$RTTI_NORMAL_ARRAY$1\000"
	.uleb128	33
	.byte	0
.La56:
	.uleb128	11
	.long	.La55-.Ldebug_info0
# Definition <record type>
.La57:
	.uleb128	12
	.ascii	"$rttidef$INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.long	.La133-.Ldebug_info0
.La133:
	.uleb128	17
	.ascii	"$RTTIDEF$INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.uleb128	44
	.byte	0
.La58:
	.uleb128	11
	.long	.La57-.Ldebug_info0
# Definition <record type>
.La59:
	.uleb128	12
	.ascii	"$rtti_header$10\000"
	.long	.La134-.Ldebug_info0
.La134:
	.uleb128	17
	.ascii	"$RTTI_HEADER$10\000"
	.uleb128	12
	.byte	0
.La60:
	.uleb128	11
	.long	.La59-.Ldebug_info0
# Definition <record type>
.La61:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_def00000005\000"
	.long	.La135-.Ldebug_info0
.La135:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_DEF00000005\000"
	.uleb128	35
	.byte	0
.La62:
	.uleb128	11
	.long	.La61-.Ldebug_info0
# Definition <record type>
.La63:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.long	.La136-.Ldebug_info0
.La136:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.uleb128	172
	.byte	0
.La64:
	.uleb128	11
	.long	.La63-.Ldebug_info0
# Defs - End Staticsymtable
# Definition SmallInt
.La97:
	.uleb128	12
	.ascii	"SmallInt\000"
	.long	.La137-.Ldebug_info0
.La137:
	.uleb128	14
	.ascii	"SmallInt\000"
	.byte	5
	.byte	2
.La98:
	.uleb128	11
	.long	.La97-.Ldebug_info0
# Definition TFitnessResult.Array[0..7] Of Double
.La100:
	.uleb128	21
	.uleb128	64
	.long	.La21-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	7
	.uleb128	8
	.long	.La1-.Ldebug_info0
	.byte	0
.La101:
	.uleb128	11
	.long	.La100-.Ldebug_info0
# Definition TFitnessResult.Array[0..31] Of Char
.La102:
	.uleb128	21
	.uleb128	32
	.long	.La88-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	31
	.uleb128	1
	.long	.La1-.Ldebug_info0
	.byte	0
.La103:
	.uleb128	11
	.long	.La102-.Ldebug_info0
# Definition Word
.La104:
	.uleb128	12
	.ascii	"Word\000"
	.long	.La138-.Ldebug_info0
.La138:
	.uleb128	14
	.ascii	"Word\000"
	.byte	7
	.byte	2
.La105:
	.uleb128	11
	.long	.La104-.Ldebug_info0
# Definition AnsiString
.La108:
	.uleb128	12
	.ascii	"AnsiString\000"
	.long	.La139-.Ldebug_info0
.La139:
	.uleb128	15
	.ascii	"AnsiString\000"
	.byte	2
	.byte	151
	.byte	6
	.long	.La88-.Ldebug_info0
	.uleb128	16
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
.La109:
	.uleb128	11
	.long	.La108-.Ldebug_info0
# Definition TFitnessTarget.{Dynamic} Array Of TFitnessCriterion
.La110:
	.uleb128	22
	.byte	2
	.byte	151
	.byte	6
	.long	.La140-.Ldebug_info0
	.uleb128	23
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
	.long	.La19-.Ldebug_info0
	.byte	0
.La111:
	.uleb128	11
	.long	.La110-.Ldebug_info0
# Definition TVMState
.La113:
	.uleb128	12
	.ascii	"TVMState\000"
	.long	.La142-.Ldebug_info0
.La142:
	.uleb128	17
	.ascii	"TVMSTATE\000"
	.uleb128	37184
	.uleb128	18
	.ascii	"guard\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La143-.Ldebug_info0
	.uleb128	18
	.ascii	"istack\000"
	.byte	3
	.byte	35
	.uleb128	256
	.long	.La145-.Ldebug_info0
	.uleb128	18
	.ascii	"fstack\000"
	.byte	3
	.byte	35
	.uleb128	2304
	.long	.La147-.Ldebug_info0
	.uleb128	18
	.ascii	"isp\000"
	.byte	3
	.byte	35
	.uleb128	4352
	.long	.La75-.Ldebug_info0
	.uleb128	18
	.ascii	"fsp\000"
	.byte	3
	.byte	35
	.uleb128	4360
	.long	.La75-.Ldebug_info0
	.uleb128	18
	.ascii	"ip\000"
	.byte	3
	.byte	35
	.uleb128	4368
	.long	.La75-.Ldebug_info0
	.uleb128	18
	.ascii	"rng_state\000"
	.byte	3
	.byte	35
	.uleb128	4376
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"halt_reason\000"
	.byte	3
	.byte	35
	.uleb128	4384
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"genome\000"
	.byte	3
	.byte	35
	.uleb128	4392
	.long	.La71-.Ldebug_info0
	.uleb128	18
	.ascii	"exec_count\000"
	.byte	4
	.byte	35
	.uleb128	37160
	.long	.La17-.Ldebug_info0
	.uleb128	18
	.ascii	"pad\000"
	.byte	4
	.byte	35
	.uleb128	37168
	.long	.La149-.Ldebug_info0
	.byte	0
.La114:
	.uleb128	11
	.long	.La113-.Ldebug_info0
# Definition TSOMAShmem.Array[0..11] Of Byte
.La119:
	.uleb128	21
	.uleb128	12
	.long	.La3-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	11
	.uleb128	1
	.long	.La1-.Ldebug_info0
	.byte	0
.La120:
	.uleb128	11
	.long	.La119-.Ldebug_info0
# Definition TFitnessCriterion
.La140:
	.uleb128	12
	.ascii	"TFitnessCriterion\000"
	.long	.La151-.Ldebug_info0
.La151:
	.uleb128	17
	.ascii	"TFITNESSCRITERION\000"
	.uleb128	16
	.uleb128	18
	.ascii	"metric\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La108-.Ldebug_info0
	.uleb128	18
	.ascii	"weight\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La21-.Ldebug_info0
	.byte	0
.La141:
	.uleb128	11
	.long	.La140-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Byte
.La143:
	.uleb128	21
	.uleb128	256
	.long	.La3-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	255
	.uleb128	1
	.long	.La3-.Ldebug_info0
	.byte	0
.La144:
	.uleb128	11
	.long	.La143-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Int64
.La145:
	.uleb128	21
	.uleb128	2048
	.long	.La75-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La3-.Ldebug_info0
	.byte	0
.La146:
	.uleb128	11
	.long	.La145-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Double
.La147:
	.uleb128	21
	.uleb128	2048
	.long	.La21-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La3-.Ldebug_info0
	.byte	0
.La148:
	.uleb128	11
	.long	.La147-.Ldebug_info0
# Definition TVMState.Array[0..15] Of Byte
.La149:
	.uleb128	21
	.uleb128	16
	.long	.La3-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	15
	.uleb128	1
	.long	.La1-.Ldebug_info0
	.byte	0
.La150:
	.uleb128	11
	.long	.La149-.Ldebug_info0
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
	.uleb128	73
	.uleb128	19
	.uleb128	28
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 3
	.uleb128	3
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
	.uleb128	63
	.uleb128	12
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 5
	.uleb128	5
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
# Abbrev 6
	.uleb128	6
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
# Abbrev 7
	.uleb128	7
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
# Abbrev 8
	.uleb128	8
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
# Abbrev 9
	.uleb128	9
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	28
	.uleb128	10
	.byte	0
	.byte	0
# Abbrev 10
	.uleb128	10
	.uleb128	15
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 11
	.uleb128	11
	.uleb128	16
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 12
	.uleb128	12
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 13
	.uleb128	13
	.uleb128	15
	.byte	0
	.byte	0
	.byte	0
# Abbrev 14
	.uleb128	14
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
# Abbrev 15
	.uleb128	15
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
# Abbrev 16
	.uleb128	16
	.uleb128	33
	.byte	0
	.uleb128	34
	.uleb128	15
	.uleb128	47
	.uleb128	10
	.byte	0
	.byte	0
# Abbrev 17
	.uleb128	17
	.uleb128	19
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 18
	.uleb128	18
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
# Abbrev 19
	.uleb128	19
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
# Abbrev 20
	.uleb128	20
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
# Abbrev 21
	.uleb128	21
	.uleb128	1
	.byte	1
	.uleb128	11
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 22
	.uleb128	22
	.uleb128	1
	.byte	1
	.uleb128	80
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 23
	.uleb128	23
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
	.ascii	"soma_hypervisor.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Lehdebug_line0:
# === header end ===
# function: SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
# [77:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	88
# [78:29]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	5
	.uleb128	29
	.byte	13
# [80:13]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	5
	.uleb128	13
	.byte	14
# [82:1]
	.byte	2
	.uleb128	.Ll4-.Ll3
	.byte	5
	.uleb128	1
	.byte	14
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll5
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
# [91:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll6
	.byte	5
	.uleb128	1
	.byte	102
# [97:3]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	5
	.uleb128	3
	.byte	18
# [92:18]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	5
	.uleb128	18
	.byte	3
	.sleb128	-5
	.byte	1
# [98:18]
	.byte	2
	.uleb128	.Ll9-.Ll8
	.byte	18
# [100:5]
	.byte	2
	.uleb128	.Ll10-.Ll9
	.byte	5
	.uleb128	5
	.byte	14
# [101:5]
	.byte	2
	.uleb128	.Ll11-.Ll10
	.byte	13
# [102:5]
	.byte	2
	.uleb128	.Ll12-.Ll11
	.byte	13
# [104:12]
	.byte	2
	.uleb128	.Ll13-.Ll12
	.byte	5
	.uleb128	12
	.byte	14
# [105:12]
	.byte	2
	.uleb128	.Ll14-.Ll13
	.byte	13
# [106:5]
	.byte	2
	.uleb128	.Ll15-.Ll14
	.byte	5
	.uleb128	5
	.byte	13
# [109:20]
	.byte	2
	.uleb128	.Ll16-.Ll15
	.byte	5
	.uleb128	20
	.byte	15
# [110:11]
	.byte	2
	.uleb128	.Ll17-.Ll16
	.byte	5
	.uleb128	11
	.byte	13
# [112:1]
	.byte	2
	.uleb128	.Ll18-.Ll17
	.byte	5
	.uleb128	1
	.byte	14
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll19
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
# [115:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll20
	.byte	5
	.uleb128	1
	.byte	126
# [116:12]
	.byte	2
	.uleb128	.Ll21-.Ll20
	.byte	5
	.uleb128	12
	.byte	13
# [117:18]
	.byte	2
	.uleb128	.Ll22-.Ll21
	.byte	5
	.uleb128	18
	.byte	13
# [118:1]
	.byte	2
	.uleb128	.Ll23-.Ll22
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll24
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_READTSC$$QWORD
# [123:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll25
	.byte	5
	.uleb128	1
	.byte	134
# [125:5]
	.byte	2
	.uleb128	.Ll26-.Ll25
	.byte	5
	.uleb128	5
	.byte	14
# [126:5]
	.byte	2
	.uleb128	.Ll27-.Ll26
	.byte	13
# [127:5]
	.byte	2
	.uleb128	.Ll28-.Ll27
	.byte	13
# [128:5]
	.byte	2
	.uleb128	.Ll29-.Ll28
	.byte	13
# [130:3]
	.byte	2
	.uleb128	.Ll30-.Ll29
	.byte	5
	.uleb128	3
	.byte	14
# [131:1]
	.byte	2
	.uleb128	.Ll31-.Ll30
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll32
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
# [134:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll33
	.byte	5
	.uleb128	1
	.byte	145
# [135:12]
	.byte	2
	.uleb128	.Ll34-.Ll33
	.byte	5
	.uleb128	12
	.byte	13
# [136:9]
	.byte	2
	.uleb128	.Ll35-.Ll34
	.byte	5
	.uleb128	9
	.byte	13
# [137:9]
	.byte	2
	.uleb128	.Ll36-.Ll35
	.byte	13
# [138:9]
	.byte	2
	.uleb128	.Ll37-.Ll36
	.byte	13
# [139:9]
	.byte	2
	.uleb128	.Ll38-.Ll37
	.byte	13
# [140:30]
	.byte	2
	.uleb128	.Ll39-.Ll38
	.byte	5
	.uleb128	30
	.byte	13
# [141:9]
	.byte	2
	.uleb128	.Ll40-.Ll39
	.byte	5
	.uleb128	9
	.byte	13
# [142:1]
	.byte	2
	.uleb128	.Ll41-.Ll40
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll42
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
# [151:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll43
	.byte	5
	.uleb128	1
	.byte	162
# [152:3]
	.byte	2
	.uleb128	.Ll44-.Ll43
	.byte	5
	.uleb128	3
	.byte	13
# [154:5]
	.byte	2
	.uleb128	.Ll45-.Ll44
	.byte	5
	.uleb128	5
	.byte	14
# [155:38]
	.byte	2
	.uleb128	.Ll46-.Ll45
	.byte	5
	.uleb128	38
	.byte	13
# [156:7]
	.byte	2
	.uleb128	.Ll47-.Ll46
	.byte	5
	.uleb128	7
	.byte	13
# [157:7]
	.byte	2
	.uleb128	.Ll48-.Ll47
	.byte	13
# [158:26]
	.byte	2
	.uleb128	.Ll49-.Ll48
	.byte	5
	.uleb128	26
	.byte	13
# [152:3]
	.byte	2
	.uleb128	.Ll50-.Ll49
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-6
	.byte	1
# [160:1]
	.byte	2
	.uleb128	.Ll51-.Ll50
	.byte	5
	.uleb128	1
	.byte	20
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll52
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
# [173:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll53
	.byte	5
	.uleb128	1
	.byte	184
# [174:9]
	.byte	2
	.uleb128	.Ll54-.Ll53
	.byte	5
	.uleb128	9
	.byte	13
# [175:3]
	.byte	2
	.uleb128	.Ll55-.Ll54
	.byte	5
	.uleb128	3
	.byte	13
# [176:1]
	.byte	2
	.uleb128	.Ll56-.Ll55
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll57
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
# [189:3]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll58
	.byte	5
	.uleb128	3
	.byte	200
# [190:3]
	.byte	2
	.uleb128	.Ll59-.Ll58
	.byte	13
# [191:3]
	.byte	2
	.uleb128	.Ll60-.Ll59
	.byte	13
# [192:19]
	.byte	2
	.uleb128	.Ll61-.Ll60
	.byte	5
	.uleb128	19
	.byte	13
# [194:28]
	.byte	2
	.uleb128	.Ll62-.Ll61
	.byte	5
	.uleb128	28
	.byte	14
# [195:7]
	.byte	2
	.uleb128	.Ll63-.Ll62
	.byte	5
	.uleb128	7
	.byte	13
# [191:3]
	.byte	2
	.uleb128	.Ll64-.Ll63
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-4
	.byte	1
# [197:1]
	.byte	2
	.uleb128	.Ll65-.Ll64
	.byte	5
	.uleb128	1
	.byte	18
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll66
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
# [207:3]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll67
	.byte	5
	.uleb128	3
	.byte	218
# [208:19]
	.byte	2
	.uleb128	.Ll68-.Ll67
	.byte	5
	.uleb128	19
	.byte	13
# [209:26]
	.byte	2
	.uleb128	.Ll69-.Ll68
	.byte	5
	.uleb128	26
	.byte	13
# [211:18]
	.byte	2
	.uleb128	.Ll70-.Ll69
	.byte	5
	.uleb128	18
	.byte	14
# [213:5]
	.byte	2
	.uleb128	.Ll71-.Ll70
	.byte	5
	.uleb128	5
	.byte	14
# [214:22]
	.byte	2
	.uleb128	.Ll72-.Ll71
	.byte	5
	.uleb128	22
	.byte	13
# [215:18]
	.byte	2
	.uleb128	.Ll73-.Ll72
	.byte	5
	.uleb128	18
	.byte	13
# [217:30]
	.byte	2
	.uleb128	.Ll74-.Ll73
	.byte	5
	.uleb128	30
	.byte	14
# [218:7]
	.byte	2
	.uleb128	.Ll75-.Ll74
	.byte	5
	.uleb128	7
	.byte	13
# [211:3]
	.byte	2
	.uleb128	.Ll76-.Ll75
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-7
	.byte	1
# [223:1]
	.byte	2
	.uleb128	.Ll77-.Ll76
	.byte	5
	.uleb128	1
	.byte	24
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll78
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
# [238:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll79
	.byte	5
	.uleb128	1
	.byte	249
# [240:3]
	.byte	2
	.uleb128	.Ll80-.Ll79
	.byte	5
	.uleb128	3
	.byte	14
# [242:27]
	.byte	2
	.uleb128	.Ll81-.Ll80
	.byte	5
	.uleb128	27
	.byte	14
# [243:9]
	.byte	2
	.uleb128	.Ll82-.Ll81
	.byte	5
	.uleb128	9
	.byte	13
# [245:3]
	.byte	2
	.uleb128	.Ll83-.Ll82
	.byte	5
	.uleb128	3
	.byte	14
# [265:5]
	.byte	2
	.uleb128	.Ll84-.Ll83
	.byte	5
	.uleb128	5
	.byte	32
# [266:19]
	.byte	2
	.uleb128	.Ll85-.Ll84
	.byte	5
	.uleb128	19
	.byte	13
# [267:29]
	.byte	2
	.uleb128	.Ll86-.Ll85
	.byte	5
	.uleb128	29
	.byte	13
# [268:5]
	.byte	2
	.uleb128	.Ll87-.Ll86
	.byte	5
	.uleb128	5
	.byte	13
# [269:5]
	.byte	2
	.uleb128	.Ll88-.Ll87
	.byte	13
# [272:5]
	.byte	2
	.uleb128	.Ll89-.Ll88
	.byte	15
# [273:5]
	.byte	2
	.uleb128	.Ll90-.Ll89
	.byte	13
# [274:5]
	.byte	2
	.uleb128	.Ll91-.Ll90
	.byte	13
# [275:5]
	.byte	2
	.uleb128	.Ll92-.Ll91
	.byte	13
# [281:5]
	.byte	2
	.uleb128	.Ll93-.Ll92
	.byte	18
# [283:11]
	.byte	2
	.uleb128	.Ll94-.Ll93
	.byte	5
	.uleb128	11
	.byte	14
# [284:5]
	.byte	2
	.uleb128	.Ll95-.Ll94
	.byte	5
	.uleb128	5
	.byte	13
# [285:11]
	.byte	2
	.uleb128	.Ll96-.Ll95
	.byte	5
	.uleb128	11
	.byte	13
# [287:28]
	.byte	2
	.uleb128	.Ll97-.Ll96
	.byte	5
	.uleb128	28
	.byte	14
# [288:26]
	.byte	2
	.uleb128	.Ll98-.Ll97
	.byte	5
	.uleb128	26
	.byte	13
# [289:5]
	.byte	2
	.uleb128	.Ll99-.Ll98
	.byte	5
	.uleb128	5
	.byte	13
# [292:19]
	.byte	2
	.uleb128	.Ll100-.Ll99
	.byte	5
	.uleb128	19
	.byte	15
# [294:7]
	.byte	2
	.uleb128	.Ll101-.Ll100
	.byte	5
	.uleb128	7
	.byte	14
# [295:7]
	.byte	2
	.uleb128	.Ll102-.Ll101
	.byte	13
# [301:7]
	.byte	2
	.uleb128	.Ll103-.Ll102
	.byte	18
# [302:7]
	.byte	2
	.uleb128	.Ll104-.Ll103
	.byte	13
# [306:5]
	.byte	2
	.uleb128	.Ll105-.Ll104
	.byte	5
	.uleb128	5
	.byte	16
# [307:18]
	.byte	2
	.uleb128	.Ll106-.Ll105
	.byte	5
	.uleb128	18
	.byte	13
# [308:34]
	.byte	2
	.uleb128	.Ll107-.Ll106
	.byte	5
	.uleb128	34
	.byte	13
# [310:18]
	.byte	2
	.uleb128	.Ll108-.Ll107
	.byte	5
	.uleb128	18
	.byte	14
# [311:18]
	.byte	2
	.uleb128	.Ll109-.Ll108
	.byte	13
# [313:5]
	.byte	2
	.uleb128	.Ll110-.Ll109
	.byte	5
	.uleb128	5
	.byte	14
# [314:5]
	.byte	2
	.uleb128	.Ll111-.Ll110
	.byte	13
# [245:9]
	.byte	2
	.uleb128	.Ll112-.Ll111
	.byte	5
	.uleb128	9
	.byte	3
	.sleb128	-69
	.byte	1
# [317:3]
	.byte	2
	.uleb128	.Ll113-.Ll112
	.byte	5
	.uleb128	3
	.byte	84
# [318:1]
	.byte	2
	.uleb128	.Ll114-.Ll113
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll115
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
# [328:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll116
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	327
	.byte	1
# [329:3]
	.byte	2
	.uleb128	.Ll117-.Ll116
	.byte	5
	.uleb128	3
	.byte	13
# [331:5]
	.byte	2
	.uleb128	.Ll118-.Ll117
	.byte	5
	.uleb128	5
	.byte	14
# [332:8]
	.byte	2
	.uleb128	.Ll119-.Ll118
	.byte	5
	.uleb128	8
	.byte	13
# [334:5]
	.byte	2
	.uleb128	.Ll120-.Ll119
	.byte	5
	.uleb128	5
	.byte	14
# [336:5]
	.byte	2
	.uleb128	.Ll121-.Ll120
	.byte	14
# [337:5]
	.byte	2
	.uleb128	.Ll122-.Ll121
	.byte	13
# [338:5]
	.byte	2
	.uleb128	.Ll123-.Ll122
	.byte	13
# [339:5]
	.byte	2
	.uleb128	.Ll124-.Ll123
	.byte	13
# [340:5]
	.byte	2
	.uleb128	.Ll125-.Ll124
	.byte	13
# [342:31]
	.byte	2
	.uleb128	.Ll126-.Ll125
	.byte	5
	.uleb128	31
	.byte	14
# [343:21]
	.byte	2
	.uleb128	.Ll127-.Ll126
	.byte	5
	.uleb128	21
	.byte	13
# [345:37]
	.byte	2
	.uleb128	.Ll128-.Ll127
	.byte	5
	.uleb128	37
	.byte	14
# [346:9]
	.byte	2
	.uleb128	.Ll129-.Ll128
	.byte	5
	.uleb128	9
	.byte	13
# [340:5]
	.byte	2
	.uleb128	.Ll130-.Ll129
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-6
	.byte	1
# [349:23]
	.byte	2
	.uleb128	.Ll131-.Ll130
	.byte	5
	.uleb128	23
	.byte	21
# [350:5]
	.byte	2
	.uleb128	.Ll132-.Ll131
	.byte	5
	.uleb128	5
	.byte	13
# [352:5]
	.byte	2
	.uleb128	.Ll133-.Ll132
	.byte	14
# [355:41]
	.byte	2
	.uleb128	.Ll134-.Ll133
	.byte	5
	.uleb128	41
	.byte	15
# [352:5]
	.byte	2
	.uleb128	.Ll135-.Ll134
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-3
	.byte	1
# [329:9]
	.byte	2
	.uleb128	.Ll136-.Ll135
	.byte	5
	.uleb128	9
	.byte	3
	.sleb128	-23
	.byte	1
# [357:3]
	.byte	2
	.uleb128	.Ll137-.Ll136
	.byte	5
	.uleb128	3
	.byte	40
# [358:1]
	.byte	2
	.uleb128	.Ll138-.Ll137
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll139
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024
# [407:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll140
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	406
	.byte	1
# [367:1]
	.byte	2
	.uleb128	.Ll141-.Ll140
	.byte	3
	.sleb128	-40
	.byte	1
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll142
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
# [367:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll143
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	366
	.byte	1
# [367:1]
	.byte	2
	.uleb128	.Ll144-.Ll143
	.byte	1
# [368:19]
	.byte	2
	.uleb128	.Ll145-.Ll144
	.byte	5
	.uleb128	19
	.byte	13
# [369:19]
	.byte	2
	.uleb128	.Ll146-.Ll145
	.byte	13
# [370:3]
	.byte	2
	.uleb128	.Ll147-.Ll146
	.byte	5
	.uleb128	3
	.byte	13
# [371:3]
	.byte	2
	.uleb128	.Ll148-.Ll147
	.byte	13
# [372:3]
	.byte	2
	.uleb128	.Ll149-.Ll148
	.byte	13
# [373:3]
	.byte	2
	.uleb128	.Ll150-.Ll149
	.byte	13
# [374:3]
	.byte	2
	.uleb128	.Ll151-.Ll150
	.byte	13
# [376:3]
	.byte	2
	.uleb128	.Ll152-.Ll151
	.byte	14
# [377:3]
	.byte	2
	.uleb128	.Ll153-.Ll152
	.byte	13
# [378:16]
	.byte	2
	.uleb128	.Ll154-.Ll153
	.byte	5
	.uleb128	16
	.byte	13
# [383:3]
	.byte	2
	.uleb128	.Ll155-.Ll154
	.byte	5
	.uleb128	3
	.byte	17
# [384:3]
	.byte	2
	.uleb128	.Ll156-.Ll155
	.byte	13
# [386:28]
	.byte	2
	.uleb128	.Ll157-.Ll156
	.byte	5
	.uleb128	28
	.byte	14
# [388:14]
	.byte	2
	.uleb128	.Ll158-.Ll157
	.byte	5
	.uleb128	14
	.byte	14
# [389:14]
	.byte	2
	.uleb128	.Ll159-.Ll158
	.byte	13
# [390:14]
	.byte	2
	.uleb128	.Ll160-.Ll159
	.byte	13
# [391:70]
	.byte	2
	.uleb128	.Ll161-.Ll160
	.byte	5
	.uleb128	70
	.byte	13
# [392:23]
	.byte	2
	.uleb128	.Ll162-.Ll161
	.byte	5
	.uleb128	23
	.byte	13
# [386:3]
	.byte	2
	.uleb128	.Ll163-.Ll162
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-6
	.byte	1
# [395:3]
	.byte	2
	.uleb128	.Ll164-.Ll163
	.byte	21
# [396:3]
	.byte	2
	.uleb128	.Ll165-.Ll164
	.byte	13
# [398:29]
	.byte	2
	.uleb128	.Ll166-.Ll165
	.byte	5
	.uleb128	29
	.byte	14
# [399:16]
	.byte	2
	.uleb128	.Ll167-.Ll166
	.byte	5
	.uleb128	16
	.byte	13
# [396:3]
	.byte	2
	.uleb128	.Ll168-.Ll167
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-3
	.byte	1
# [402:3]
	.byte	2
	.uleb128	.Ll169-.Ll168
	.byte	18
# [403:3]
	.byte	2
	.uleb128	.Ll170-.Ll169
	.byte	13
# [404:3]
	.byte	2
	.uleb128	.Ll171-.Ll170
	.byte	13
# [405:3]
	.byte	2
	.uleb128	.Ll172-.Ll171
	.byte	13
# [406:3]
	.byte	2
	.uleb128	.Ll173-.Ll172
	.byte	13
# [367:1]
	.byte	2
	.uleb128	.Ll174-.Ll173
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-39
	.byte	1
# [407:1]
	.byte	2
	.uleb128	.Ll175-.Ll174
	.byte	52
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll176
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_HYPERVISORRUN
# [412:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll177
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	411
	.byte	1
# [413:3]
	.byte	2
	.uleb128	.Ll178-.Ll177
	.byte	5
	.uleb128	3
	.byte	13
# [414:3]
	.byte	2
	.uleb128	.Ll179-.Ll178
	.byte	13
# [416:28]
	.byte	2
	.uleb128	.Ll180-.Ll179
	.byte	5
	.uleb128	28
	.byte	14
# [418:14]
	.byte	2
	.uleb128	.Ll181-.Ll180
	.byte	5
	.uleb128	14
	.byte	14
# [419:71]
	.byte	2
	.uleb128	.Ll182-.Ll181
	.byte	5
	.uleb128	71
	.byte	13
# [420:17]
	.byte	2
	.uleb128	.Ll183-.Ll182
	.byte	5
	.uleb128	17
	.byte	13
# [421:7]
	.byte	2
	.uleb128	.Ll184-.Ll183
	.byte	5
	.uleb128	7
	.byte	13
# [423:7]
	.byte	2
	.uleb128	.Ll185-.Ll184
	.byte	14
# [416:3]
	.byte	2
	.uleb128	.Ll186-.Ll185
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-7
	.byte	1
# [426:33]
	.byte	2
	.uleb128	.Ll187-.Ll186
	.byte	5
	.uleb128	33
	.byte	22
# [427:21]
	.byte	2
	.uleb128	.Ll188-.Ll187
	.byte	5
	.uleb128	21
	.byte	13
# [428:5]
	.byte	2
	.uleb128	.Ll189-.Ll188
	.byte	5
	.uleb128	5
	.byte	13
# [430:3]
	.byte	2
	.uleb128	.Ll190-.Ll189
	.byte	5
	.uleb128	3
	.byte	14
# [431:3]
	.byte	2
	.uleb128	.Ll191-.Ll190
	.byte	13
# [433:3]
	.byte	2
	.uleb128	.Ll192-.Ll191
	.byte	14
# [434:1]
	.byte	2
	.uleb128	.Ll193-.Ll192
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll194
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_HYPERVISORSTOP
# [439:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll195
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	438
	.byte	1
# [440:3]
	.byte	2
	.uleb128	.Ll196-.Ll195
	.byte	5
	.uleb128	3
	.byte	13
# [442:21]
	.byte	2
	.uleb128	.Ll197-.Ll196
	.byte	5
	.uleb128	21
	.byte	14
# [444:39]
	.byte	2
	.uleb128	.Ll198-.Ll197
	.byte	5
	.uleb128	39
	.byte	14
# [445:31]
	.byte	2
	.uleb128	.Ll199-.Ll198
	.byte	5
	.uleb128	31
	.byte	13
# [448:28]
	.byte	2
	.uleb128	.Ll200-.Ll199
	.byte	5
	.uleb128	28
	.byte	15
# [450:17]
	.byte	2
	.uleb128	.Ll201-.Ll200
	.byte	5
	.uleb128	17
	.byte	14
# [439:1]
	.byte	2
	.uleb128	.Ll202-.Ll201
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-11
	.byte	1
# [450:16]
	.byte	2
	.uleb128	.Ll203-.Ll202
	.byte	5
	.uleb128	16
	.byte	23
# [452:36]
	.byte	2
	.uleb128	.Ll204-.Ll203
	.byte	5
	.uleb128	36
	.byte	14
# [453:28]
	.byte	2
	.uleb128	.Ll205-.Ll204
	.byte	5
	.uleb128	28
	.byte	13
# [454:16]
	.byte	2
	.uleb128	.Ll206-.Ll205
	.byte	5
	.uleb128	16
	.byte	13
# [448:3]
	.byte	2
	.uleb128	.Ll207-.Ll206
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-6
	.byte	1
# [458:28]
	.byte	2
	.uleb128	.Ll208-.Ll207
	.byte	5
	.uleb128	28
	.byte	22
# [459:17]
	.byte	2
	.uleb128	.Ll209-.Ll208
	.byte	5
	.uleb128	17
	.byte	13
# [460:24]
	.byte	2
	.uleb128	.Ll210-.Ll209
	.byte	5
	.uleb128	24
	.byte	13
# [458:3]
	.byte	2
	.uleb128	.Ll211-.Ll210
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-2
	.byte	1
# [462:3]
	.byte	2
	.uleb128	.Ll212-.Ll211
	.byte	16
# [463:3]
	.byte	2
	.uleb128	.Ll213-.Ll212
	.byte	13
# [464:3]
	.byte	2
	.uleb128	.Ll214-.Ll213
	.byte	13
# [465:1]
	.byte	2
	.uleb128	.Ll215-.Ll214
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll216
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: INIT$_$SOMA_HYPERVISOR
# function: SOMA_HYPERVISOR_$$_init$
# [467:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll217
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	466
	.byte	1
# [467:1]
	.byte	2
	.uleb128	.Ll218-.Ll217
	.byte	1
# [468:3]
	.byte	2
	.uleb128	.Ll219-.Ll218
	.byte	5
	.uleb128	3
	.byte	13
# [469:3]
	.byte	2
	.uleb128	.Ll220-.Ll219
	.byte	13
# [470:3]
	.byte	2
	.uleb128	.Ll221-.Ll220
	.byte	13
# [471:3]
	.byte	2
	.uleb128	.Ll222-.Ll221
	.byte	13
# [472:3]
	.byte	2
	.uleb128	.Ll223-.Ll222
	.byte	13
# [473:3]
	.byte	2
	.uleb128	.Ll224-.Ll223
	.byte	13
# [474:3]
	.byte	2
	.uleb128	.Ll225-.Ll224
	.byte	13
# [475:3]
	.byte	2
	.uleb128	.Ll226-.Ll225
	.byte	13
# [476:3]
	.byte	2
	.uleb128	.Ll227-.Ll226
	.byte	13
# [477:3]
	.byte	2
	.uleb128	.Ll228-.Ll227
	.byte	13
# [479:1]
	.byte	2
	.uleb128	.Ll229-.Ll228
	.byte	5
	.uleb128	1
	.byte	14
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll230
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: FINALIZE$_$SOMA_HYPERVISOR
# function: SOMA_HYPERVISOR_$$_finalize_implicit$
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll231
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
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
	.quad	.Lt1-SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
	.quad	SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024
	.quad	.Lt2-SOMA_HYPERVISOR$_$HYPERVISORINIT$LONGINT_$$_fin$00000024
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORRUN
	.quad	.Lt3-SOMA_HYPERVISOR_$$_HYPERVISORRUN
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
	.quad	.Lt4-SOMA_HYPERVISOR_$$_HYPERVISORSTOP
	.quad	SOMA_HYPERVISOR_$$_init$
	.quad	.Lt5-SOMA_HYPERVISOR_$$_init$
	.quad	SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	.quad	.Lt6-SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	.quad	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
	.quad	.Lt7-SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
	.quad	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
	.quad	.Lt8-SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
	.quad	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	.quad	.Lt9-SOMA_HYPERVISOR_$$_READTSC$$QWORD
	.quad	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
	.quad	.Lt10-SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
	.quad	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	.quad	.Lt11-SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	.quad	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	.quad	.Lt12-SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	.quad	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	.quad	.Lt13-SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	.quad	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	.quad	.Lt14-SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	.quad	SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
	.quad	.Lt15-SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
	.quad	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
	.quad	.Lt16-SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
	.quad	SOMA_HYPERVISOR_$$_finalize_implicit$
	.quad	.Lt17-SOMA_HYPERVISOR_$$_finalize_implicit$
	.quad	0
	.quad	0
.Learanges0:
# End asmlist al_dwarf_aranges
# Begin asmlist al_dwarf_ranges

.section .debug_ranges
# End asmlist al_dwarf_ranges
# Begin asmlist al_end

.section .text.z_DEBUGEND_$SOMA_HYPERVISOR,"x"
.globl	DEBUGEND_$SOMA_HYPERVISOR
DEBUGEND_$SOMA_HYPERVISOR:
# End asmlist al_end

