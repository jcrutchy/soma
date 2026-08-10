	.file "soma_hypervisor.pas"
# Begin asmlist al_procedures

.section .text.n_soma_hypervisor_$$_allocaligned$qword$pointer$$pointer,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER:
.Lc1:
.seh_proc SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
# [soma_hypervisor.pas]
# [75] begin
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
# [76] raw    := GetMem(size + 63);
	addq	$63,%rcx
	call	SYSTEM_$$_GETMEM$QWORD$$POINTER
	movq	%rax,(%rbx)
# Var p located in register rax
# [78] p      := (p + 63) and not PtrUInt(63);
	addq	$63,%rax
	andq	$-64,%rax
# Var p located in register rax
# Var $result located in register rax
# Var p located in register rax
# [80] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rbx
	ret
.seh_endproc
.Lc2:

.section .text.n_soma_hypervisor_$$_initsharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_INITSHAREDMEMORY:
.Lc4:
.seh_proc SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
# [89] begin
	pushq	%rbx
.seh_pushreg %rbx
	leaq	-48(%rsp),%rsp
.Lc6:
.seh_stackalloc 48
.seh_endprologue
# [95] );
	leaq	_$SOMA_HYPERVISOR$_Ld1(%rip),%rax
# [90] ShmemHandle := CreateFileMapping(
	movq	%rax,40(%rsp)
	movl	$64,32(%rsp)
	xorl	%r9d,%r9d
	movl	$4,%r8d
	xorl	%edx,%edx
	movq	$-1,%rcx
	call	_$dll$kernel32$CreateFileMappingA
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
# [96] if ShmemHandle = 0 then
	testq	%rax,%rax
	jne	.Lj8
# [98] WriteLn('WARNING: Could not create shared memory: ', GetLastError);
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
# [99] Shmem := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
# [100] Exit;
	jmp	.Lj5
	.balign 4,0x90
.Lj8:
# [102] Shmem := MapViewOfFile(ShmemHandle, FILE_MAP_ALL_ACCESS, 0, 0, SizeOf(TSOMAShmem));
	movq	$64,32(%rsp)
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	xorl	%r9d,%r9d
	xorl	%r8d,%r8d
	movl	$983071,%edx
	call	_$dll$kernel32$MapViewOfFile
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
# [103] if Shmem = nil then
	testq	%rax,%rax
	jne	.Lj10
# [104] WriteLn('WARNING: Could not map shared memory: ', GetLastError)
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
# [107] FillChar(Shmem^, SizeOf(TSOMAShmem), 0);
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$64,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [108] Shmem^.magic := $534F4D41;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$1397706049,(%rax)
.Lj11:
.Lj5:
# [110] end;
	nop
	leaq	48(%rsp),%rsp
	popq	%rbx
	ret
.seh_endproc
.Lc5:

.section .text.n_soma_hypervisor_$$_closesharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY:
.Lc7:
.seh_proc SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
# [113] begin
	leaq	-40(%rsp),%rsp
.Lc9:
.seh_stackalloc 40
.seh_endprologue
# [114] if Shmem <> nil then UnmapViewOfFile(Shmem);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj15
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	call	_$dll$kernel32$UnmapViewOfFile
	.balign 4,0x90
.Lj15:
# [115] if ShmemHandle <> 0 then CloseHandle(ShmemHandle);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
	je	.Lj17
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj17:
# [116] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc8:

.section .text.n_soma_hypervisor_$$_readtsc$$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_READTSC$$QWORD:
.Lc10:
.seh_proc SOMA_HYPERVISOR_$$_READTSC$$QWORD
# [121] begin
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
# [123] rdtsc
	rdtsc
# [124] shl rdx, 32
	shlq	$32,%rdx
# [125] or  rax, rdx
	orq	%rdx,%rax
# [126] mov r, rax
	movq	%rax,-16(%rbp)
#  CPU ATHLON64
# [128] Result := r;
	movq	-16(%rbp),%rax
# [129] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc11:

.section .text.n_soma_hypervisor_$$_updatesharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY:
.Lc15:
.seh_proc SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
# [132] begin
	leaq	-40(%rsp),%rsp
.Lc17:
.seh_stackalloc 40
.seh_endprologue
# [133] if Shmem = nil then Exit;
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj20
	.balign 4,0x90
# [134] Shmem^.generation      := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rdx
	movq	%rdx,4(%rax)
# [135] Shmem^.active_colonies := ColonyCount;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%edx
	movl	%edx,12(%rax)
# [136] Shmem^.best_fitness    := BestFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%rdx
	movq	%rdx,16(%rax)
# [137] Shmem^.avg_fitness     := AvgFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%rdx
	movq	%rdx,24(%rax)
# [138] Shmem^.uptime_secs     := (ReadTSC - StartTime) div 3000000000;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%rdx
	subq	U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip),%rdx
	movq	$-5242050321332162017,%rax
	mulq	%rdx
	shrq	$31,%rdx
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	%rdx,44(%rax)
# [139] Shmem^.codon_count     := 0;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$0,40(%rax)
.Lj20:
# [140] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc16:

.section .text.n_soma_hypervisor_$$_randomgenome$tgenome$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD:
.Lc18:
# Var i located in register eax
# Var G located in register rcx
# [149] begin
	movq	%rdx,%r8
# Var rng located in register r8
# Var i located in register r9d
# [150] for i := 0 to GENOME_SIZE-1 do
	movl	$-1,%r9d
	.balign 8,0x90
.Lj26:
	addl	$1,%r9d
# [152] XorShift64(rng);
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
# [153] G[i].opcode := VALID_OPCODES[rng mod VALID_OPCODE_COUNT];
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
# [154] G[i].flags  := 0;
	movl	%r9d,%eax
	movb	$0,2(%rcx,%rax,8)
# [155] G[i].pad    := 0;
	movl	%r9d,%eax
	movb	$0,3(%rcx,%rax,8)
# [156] G[i].imm    := Int32((rng shr 32) mod 128) - 64;
	movq	(%r8),%rax
	shrq	$32,%rax
	andl	$127,%eax
	subl	$64,%eax
	movl	%r9d,%edx
	movl	%eax,4(%rcx,%rdx,8)
	cmpl	$4095,%r9d
	jnge	.Lj26
# [158] end;
	ret
.Lc19:

.section .text.n_soma_hypervisor_$$_evaluatefitness$pvmstate$$double,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE:
.Lc20:
# Var $result located in register xmm0
# Var survival_score located in register xmm0
# Var activity_score located in register xmm0
# [173] begin
	movq	%rcx,%rax
# Var state located in register rax
# Var state located in register rax
# [175] survival_score := state^.ip / GENOME_SIZE;
	cvtsi2sdq	4368(%rax),%xmm1
	mulsd	_$SOMA_HYPERVISOR$_Ld4(%rip),%xmm1
# Var survival_score located in register xmm1
# [176] if survival_score > 1.0 then survival_score := 1.0;
	comisd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm1
	jp	.Lj33
	jna	.Lj33
	movsd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm1
	.balign 4,0x90
.Lj33:
# Var state located in register rax
# [180] activity_score := state^.isp / STACK_SIZE;
	cvtsi2sdq	4352(%rax),%xmm2
	mulsd	_$SOMA_HYPERVISOR$_Ld6(%rip),%xmm2
# Var activity_score located in register xmm2
# [181] if activity_score > 1.0 then activity_score := 1.0;
	comisd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm2
	jp	.Lj36
	jna	.Lj36
	movsd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm2
	.balign 4,0x90
.Lj36:
	movq	4384(%rax),%rax
# [184] if (state^.halt_reason = HR_HALT) or (state^.halt_reason = HR_YIELD) then
	cmpq	$1,%rax
	je	.Lj38
	cmpq	$2,%rax
	jne	.Lj40
.Lj38:
# [185] Result := (survival_score * 0.5) + (activity_score * 0.3) + 0.2
	movapd	%xmm1,%xmm3
	mulsd	_$SOMA_HYPERVISOR$_Ld7(%rip),%xmm3
	movapd	%xmm2,%xmm0
	mulsd	_$SOMA_HYPERVISOR$_Ld8(%rip),%xmm0
	addsd	%xmm3,%xmm0
	addsd	_$SOMA_HYPERVISOR$_Ld9(%rip),%xmm0
	ret
.Lj40:
# [187] Result := (survival_score * 0.5) + (activity_score * 0.3);
	mulsd	_$SOMA_HYPERVISOR$_Ld7(%rip),%xmm1
	mulsd	_$SOMA_HYPERVISOR$_Ld8(%rip),%xmm2
	addsd	%xmm1,%xmm2
	movapd	%xmm2,%xmm0
# [188] end;
	ret
.Lc21:

.section .text.n_soma_hypervisor_$$_findworstidx$$longint,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT:
.Lc22:
# Var $result located in register eax
# Var i located in register eax
# Var worst located in register xmm0
# [200] begin
# Var $result located in register eax
# [201] Result := 0;
	xorl	%eax,%eax
# Var worst located in register xmm0
# [202] worst  := PopFitness[0];
	movsd	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%xmm0
# Var i located in register edx
# [203] for i := 1 to POPULATION_SIZE-1 do
	xorl	%edx,%edx
	.balign 8,0x90
.Lj44:
	addl	$1,%edx
# [204] if PopFitness[i] < worst then
	movl	%edx,%ecx
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	comisd	(%r8,%rcx,8),%xmm0
	jp	.Lj48
	jna	.Lj48
# [206] worst  := PopFitness[i];
	movl	%edx,%ecx
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	movsd	(%r8,%rcx,8),%xmm0
# [207] Result := i;
	movl	%edx,%eax
	.balign 4,0x90
.Lj48:
	cmpl	$127,%edx
	jnge	.Lj44
# [209] end;
	ret
.Lc23:

.section .text.n_soma_hypervisor_$$_tournamentselect$qword$longint$$longint,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT:
.Lc24:
# Var $result located in register eax
# Var i located in register r8d
# Var candidate located in register r10d
# Var best_idx located in register eax
# Var best_fit located in register xmm0
# Var rng located in register rcx
# Var k located in register edx
# [218] begin
# [219] XorShift64(rng);
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
# [220] best_idx := rng mod POPULATION_SIZE;
	movl	(%rcx),%eax
	andl	$127,%eax
# Var best_idx located in register eax
# [221] best_fit := PopFitness[best_idx];
	movl	%eax,%r8d
# Var best_fit located in register xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r9
	movsd	(%r9,%r8,8),%xmm0
# [223] for i := 1 to k-1 do
	subl	$1,%edx
	cmpl	$1,%edx
	jnge	.Lj54
	xorl	%r8d,%r8d
	.balign 8,0x90
.Lj55:
	addl	$1,%r8d
# [225] XorShift64(rng);
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
# [226] candidate := rng mod POPULATION_SIZE;
	movl	(%rcx),%r9d
	andl	$127,%r9d
	movl	%r9d,%r10d
# [227] if PopFitness[candidate] > best_fit then
	andl	%r9d,%r9d
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r11
	comisd	(%r11,%r9,8),%xmm0
	jp	.Lj60
	jnb	.Lj60
# [229] best_fit := PopFitness[candidate];
	movl	%r10d,%r9d
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r11
	movsd	(%r11,%r9,8),%xmm0
# [230] best_idx := candidate;
	movl	%r10d,%eax
	.balign 4,0x90
.Lj60:
	cmpl	%r8d,%edx
	jnle	.Lj55
	.balign 4,0x90
.Lj54:
# Var $result located in register eax
# Var best_idx located in register eax
# [235] end;
	ret
.Lc25:

.section .text.n_soma_hypervisor_$$_colonythreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64:
.Lc26:
# Temps allocated between rsp+32808 and rsp+32816
.seh_proc SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
# [250] begin
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
.Lj70:
	leaq	-4096(%rsp),%rsp
	movl	%eax,(%rsp)
	subq	$1,%r10
	jne	.Lj70
	leaq	-48(%rsp),%rsp
.Lc28:
.seh_stackalloc 32816
.seh_endprologue
# Var $result located in register rax
# Var col located in register rax
# Var state located in register rax
# Var t0 located in register r14
# Var t1 located in register r13
# Var parent_idx located in register r12d
# Var worst_idx located in register ebx
# Var local_rng located at rsp+32, size=OS_64
# Var offspring located at rsp+40, size=OS_NO
# Var param located in register rcx
# Var col located in register rcx
# Var param located in register rcx
# Var col located in register rcx
# Var state located in register r8
# [252] state := col^.state;
	movq	8(%rcx),%r8
# [254] local_rng := UInt64(col^.colony_id + 1) * $6C62272E07BB0142;
	movq	%rcx,32808(%rsp)
# Var col located in register rax
	movq	%rcx,%rdx
	movslq	28(%rdx),%rax
	leaq	1(%rax),%rdx
	movq	$7809847782465536322,%rax
	imulq	%rax,%rdx
	movq	%rdx,32(%rsp)
# [255] state^.rng_state := local_rng;
	movq	%r8,%r15
# Var state located in register r15
	movq	32(%rsp),%rax
	movq	%rax,4376(%r15)
# [257] while Running do
	jmp	.Lj65
	.balign 8,0x90
.Lj64:
# [277] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
# [278] parent_idx := TournamentSelect(local_rng, 4);
	leaq	32(%rsp),%rcx
	movl	$4,%edx
	call	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	movl	%eax,%r12d
# [279] offspring  := Population[parent_idx];
	andl	%eax,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	40(%rsp),%rdi
	leaq	(%rdx,%rax),%rsi
	movl	$4096,%ecx
	rep
	movsq
# [280] MutateGenome(offspring, Population, local_rng);
	leaq	32(%rsp),%r9
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	40(%rsp),%rcx
	movl	$127,%r8d
	call	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
# [281] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
# [284] state^.genome       := offspring;
	leaq	4392(%r15),%rdi
	leaq	40(%rsp),%rsi
	movl	$4096,%ecx
	rep
	movsq
# [285] state^.ip           := 0;
	movq	$0,4368(%r15)
# [286] state^.isp          := 0;
	movq	$0,4352(%r15)
# [287] state^.fsp          := 0;
	movq	$0,4360(%r15)
# [288] state^.halt_reason  := HR_NONE;
	movq	$0,4384(%r15)
# [290] t0 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r14
# [291] Execute(state^);
	movq	%r15,%rcx
	call	SOMA_CORE_$$_EXECUTE$TVMSTATE
# [292] t1 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r13
# [294] col^.exec_cycles := t1 - t0;
	subq	%r14,%rax
	movq	32808(%rsp),%rdx
	movq	%rax,40(%rdx)
# [295] col^.fitness      := EvaluateFitness(state);
	movq	%r15,%rcx
	call	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	movq	32808(%rsp),%rdx
	movsd	%xmm0,32(%rdx)
# [296] col^.generation    := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rdx
	movq	32808(%rsp),%rax
	movq	%rdx,48(%rax)
# [299] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
# [300] worst_idx := FindWorstIdx;
	call	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	movl	%eax,%ebx
# [301] if col^.fitness > PopFitness[worst_idx] then
	movl	%ebx,%edx
	movq	32808(%rsp),%rax
	movsd	32(%rax),%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rax
	comisd	(%rax,%rdx,8),%xmm0
	jp	.Lj68
	jna	.Lj68
# [303] Population[worst_idx] := offspring;
	movl	%ebx,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rdi
	leaq	40(%rsp),%rsi
	movl	$4096,%ecx
	rep
	movsq
# [304] PopFitness[worst_idx] := col^.fitness;
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rcx
	movq	32808(%rsp),%rdx
	movq	32(%rdx),%r8
	movq	%r8,(%rcx,%rax,8)
	.balign 4,0x90
.Lj68:
# [306] Inc(Generation);
	addq	$1,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
# [307] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Lj65:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj64
# Var $result located in register rax
# [310] Result := 0;
	xorl	%eax,%eax
# [311] end;
	nop
	leaq	32816(%rsp),%rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc27:

.section .text.n_soma_hypervisor_$$_statusthreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64:
.Lc29:
.seh_proc SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
# [321] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-72(%rsp),%rsp
.Lc31:
.seh_stackalloc 72
	movdqa	%xmm6,48(%rsp)
.seh_savexmm %xmm6, 48
.seh_endprologue
# Var $result located in register rax
# Var i located in register ebx
# Var sum located in register xmm6
# Var param located in register rcx
# [322] while Running do
	jmp	.Lj74
	.balign 8,0x90
.Lj73:
# [324] Sleep(500);
	movl	$500,%ecx
	call	SYSUTILS_$$_SLEEP$LONGWORD
# [325] if not Running then Break;
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	je	.Lj75
	.balign 4,0x90
# [327] UpdateSharedMemory;
	call	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
# [329] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
# [330] BestFitness   := PopFitness[0];
	movq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
# [331] BestGenomeIdx := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
# [332] sum := 0.0;
	movsd	_$SOMA_HYPERVISOR$_Ld10(%rip),%xmm6
# [333] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%ebx
	.balign 8,0x90
.Lj78:
	addl	$1,%ebx
# [335] sum := sum + PopFitness[i];
	movl	%ebx,%eax
	movapd	%xmm6,%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	addsd	(%rdx,%rax,8),%xmm0
	movapd	%xmm0,%xmm6
# [336] if PopFitness[i] > BestFitness then
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movsd	(%rdx,%rax,8),%xmm0
	comisd	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%xmm0
	jp	.Lj82
	jna	.Lj82
# [338] BestFitness   := PopFitness[i];
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movq	(%rdx,%rax,8),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
# [339] BestGenomeIdx := i;
	movl	%ebx,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
	.balign 4,0x90
.Lj82:
	cmpl	$127,%ebx
	jnge	.Lj78
# [342] AvgFitness := sum / POPULATION_SIZE;
	movapd	%xmm6,%xmm0
	mulsd	_$SOMA_HYPERVISOR$_Ld11(%rip),%xmm0
	movsd	%xmm0,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
# [343] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
# [345] WriteLn('Gen: ', Generation,
	call	fpc_get_output
	movq	%rax,%rsi
	leaq	_$SOMA_HYPERVISOR$_Ld12(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld13(%rip),%r8
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
	leaq	_$SOMA_HYPERVISOR$_Ld14(%rip),%r8
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
	leaq	_$SOMA_HYPERVISOR$_Ld15(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
# [348] '  (genome #', BestGenomeIdx, ')');
	movslq	U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip),%r8
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
.Lj74:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj73
.Lj75:
# Var $result located in register rax
# [350] Result := 0;
	xorl	%eax,%eax
# [351] end;
	nop
	movdqa	48(%rsp),%xmm6
	leaq	72(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc30:

.section .text.n_soma_hypervisor_$$_hypervisorinit$longint,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT:
.Lc32:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
# [360] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc34:
.seh_stackalloc 40
.seh_endprologue
# Var i located in register esi
# Var colony_count located in register ecx
# [361] if colony_count > MAX_COLONIES then colony_count := MAX_COLONIES;
	cmpl	$16,%ecx
	jng	.Lj87
	movl	$16,%ecx
	.balign 4,0x90
.Lj87:
# [362] if colony_count < 1 then colony_count := 1;
	cmpl	$1,%ecx
	jnl	.Lj89
	movl	$1,%ecx
	.balign 4,0x90
.Lj89:
# Var colony_count located in register ecx
# [363] ColonyCount := colony_count;
	movl	%ecx,U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip)
# [364] Generation  := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
# [365] BestFitness := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
# [366] AvgFitness  := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
# [367] Running     := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [369] InitCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_INITCRITICALSECTION$TRTLCRITICALSECTION
# [370] InitSharedMemory;
	call	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
# [371] StartTime := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
# [373] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj91
	movl	$-1,%esi
	.balign 8,0x90
.Lj92:
	addl	$1,%esi
# [375] Colonies[i].colony_id := i;
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	%esi,28(%rax,%rdx)
# [376] Colonies[i].active    := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
# [377] Colonies[i].fitness   := 0.0;
	movl	%esi,%eax
	imulq	$56,%rax,%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rax
	movq	%rax,32(%rdx,%rcx)
# [378] Colonies[i].state     := AllocAligned(SizeOf(TVMState), Colonies[i].raw_alloc);
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
# [379] FillChar(Colonies[i].state^, SizeOf(TVMState), 0);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	8(%rdx,%rax),%rcx
	xorl	%r8d,%r8d
	movl	$37184,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
	cmpl	%esi,%ebx
	jnle	.Lj92
	.balign 4,0x90
.Lj91:
# [382] GlobalRNG := UInt64($CAFE1234DEADBEEF);
	movl	$-559038737,U_$SOMA_HYPERVISOR_$$_GLOBALRNG(%rip)
	movl	$-889318860,U_$SOMA_HYPERVISOR_$$_GLOBALRNG+4(%rip)
# Var i located in register ebx
# [383] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%ebx
	.balign 8,0x90
.Lj95:
	addl	$1,%ebx
# [385] RandomGenome(Population[i], GlobalRNG);
	movl	%ebx,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_GLOBALRNG(%rip),%rdx
	call	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
# [386] PopFitness[i] := 0.0;
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rcx
	movq	%rcx,(%rdx,%rax,8)
	cmpl	$127,%ebx
	jnge	.Lj95
# [389] WriteLn('SOMA Hypervisor initialised');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld16(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [390] WriteLn('  Colonies  : ', ColonyCount);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld17(%rip),%r8
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
# [391] WriteLn('  Population: ', POPULATION_SIZE);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld18(%rip),%r8
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
# [392] WriteLn('  VMState   : ', SizeOf(TVMState), ' bytes per colony');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld19(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movl	$37184,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld20(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [393] WriteLn('  Total RAM : ', (ColonyCount * SizeOf(TVMState)) div 1024, ' KB for VM states');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld21(%rip),%r8
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
	leaq	_$SOMA_HYPERVISOR$_Ld22(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [394] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc33:

.section .text.n_soma_hypervisor_$$_hypervisorrun,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORRUN
SOMA_HYPERVISOR_$$_HYPERVISORRUN:
.Lc35:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORRUN
# [399] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rdi
.seh_pushreg %rdi
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-32(%rsp),%rsp
.Lc37:
.seh_stackalloc 32
.seh_endprologue
# Var i located in register esi
# [400] Running := True;
	movb	$1,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [401] WriteLn('Starting colony threads...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld23(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [403] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj101
	movl	$-1,%esi
	.balign 8,0x90
.Lj102:
	addl	$1,%esi
# [405] Colonies[i].active    := True;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$1,24(%rdx,%rax)
# [406] Colonies[i].thread_id := BeginThread(@ColonyThreadProc, @Colonies[i]);
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
# [407] if Colonies[i].thread_id = 0 then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpl	$0,(%rdx,%rax)
	jne	.Lj106
# [408] WriteLn('WARNING: Failed to start colony thread ', i)
	call	fpc_get_output
	movq	%rax,%rdi
	leaq	_$SOMA_HYPERVISOR$_Ld24(%rip),%r8
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
	jmp	.Lj107
.Lj106:
# [410] WriteLn('  Colony ', i, ' started (thread ', Colonies[i].thread_id, ')');
	call	fpc_get_output
	movq	%rax,%rdi
	leaq	_$SOMA_HYPERVISOR$_Ld25(%rip),%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld26(%rip),%r8
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
.Lj107:
	cmpl	%esi,%ebx
	jnle	.Lj102
	.balign 4,0x90
.Lj101:
# [413] StatusThreadID := BeginThread(@StatusThreadProc, nil);
	leaq	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64(%rip),%rcx
	xorl	%edx,%edx
	call	SYSTEM_$$_BEGINTHREAD$TTHREADFUNC$POINTER$$LONGWORD
	movl	%eax,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
# [414] if StatusThreadID = 0 then
	testl	%eax,%eax
	jne	.Lj109
# [415] WriteLn('WARNING: Failed to start status thread');
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
	.balign 4,0x90
.Lj109:
# [417] WriteLn('Hypervisor running. Press Enter to stop...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld28(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [418] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
# [420] Running := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [421] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc36:

.section .text.n_soma_hypervisor_$$_hypervisorstop,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
SOMA_HYPERVISOR_$$_HYPERVISORSTOP:
.Lc38:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORSTOP
# [426] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc40:
.seh_stackalloc 40
.seh_endprologue
# Var i located in register esi
# [427] WriteLn('Stopping hypervisor...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld29(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [429] if StatusThreadID <> 0 then
	cmpl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
	je	.Lj113
# [431] WaitForSingleObject(StatusThreadID, 2000);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	movl	$2000,%edx
	call	_$dll$kernel32$WaitForSingleObject
# [432] CloseHandle(StatusThreadID);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj113:
# [435] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj115
	movl	$-1,%esi
	.balign 8,0x90
.Lj116:
	addl	$1,%esi
# [437] if Colonies[i].active and (Colonies[i].thread_id <> 0) then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	addq	%rdx,%rax
	cmpb	$0,24(%rax)
	je	.Lj120
	cmpl	$0,(%rax)
	je	.Lj120
# [439] WaitForSingleObject(Colonies[i].thread_id, 5000);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movl	(%rdx,%rax),%ecx
	movl	$5000,%edx
	call	_$dll$kernel32$WaitForSingleObject
# [440] CloseHandle(Colonies[i].thread_id);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	(%rax,%rdx),%ecx
	call	_$dll$kernel32$CloseHandle
# [441] Colonies[i].active := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
	.balign 4,0x90
.Lj120:
	cmpl	%esi,%ebx
	jnle	.Lj116
	.balign 4,0x90
.Lj115:
# [445] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj123
	movl	$-1,%esi
	.balign 8,0x90
.Lj124:
	addl	$1,%esi
# [446] if Colonies[i].raw_alloc <> nil then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpq	$0,16(%rdx,%rax)
	je	.Lj128
# [447] FreeMem(Colonies[i].raw_alloc);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	16(%rdx,%rax),%rcx
	call	SYSTEM_$$_FREEMEM$POINTER$$QWORD
	.balign 4,0x90
.Lj128:
	cmpl	%esi,%ebx
	jnle	.Lj124
	.balign 4,0x90
.Lj123:
# [449] CloseSharedMemory;
	call	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
# [450] DoneCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_DONECRITICALSECTION$TRTLCRITICALSECTION
# [451] WriteLn('Hypervisor stopped. Total generations: ', Generation);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld30(%rip),%r8
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
# [452] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc39:

.section .text.n_soma_hypervisor_$$_init$,"x"
	.balign 16,0x90
.globl	INIT$_$SOMA_HYPERVISOR
INIT$_$SOMA_HYPERVISOR:
.globl	SOMA_HYPERVISOR_$$_init$
SOMA_HYPERVISOR_$$_init$:
.Lc41:
.seh_proc SOMA_HYPERVISOR_$$_init$
# [454] initialization
	leaq	-40(%rsp),%rsp
.Lc43:
.seh_stackalloc 40
.seh_endprologue
# [455] FillChar(Colonies,   SizeOf(Colonies),   0);
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	xorl	%r8d,%r8d
	movl	$896,%edx
	movq	%rax,%rcx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [456] FillChar(Population, SizeOf(Population), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$4194304,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [457] FillChar(PopFitness, SizeOf(PopFitness), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$1024,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [458] Running        := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [459] ShmemHandle    := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
# [460] Shmem          := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
# [461] StartTime      := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
# [462] Generation     := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
# [463] StatusThreadID := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
# [464] BestGenomeIdx  := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
# [466] end.
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc42:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 8
# [46] Colonies:        array[0..MAX_COLONIES-1] of TColonyThread;
	.globl U_$SOMA_HYPERVISOR_$$_COLONIES
U_$SOMA_HYPERVISOR_$$_COLONIES:
	.zero 896

.section .bss
	.balign 4
# [47] Population:       TPopulation;
	.globl U_$SOMA_HYPERVISOR_$$_POPULATION
U_$SOMA_HYPERVISOR_$$_POPULATION:
	.zero 4194304

.section .bss
	.balign 8
# [48] PopFitness:       TFitnessArr;
	.globl U_$SOMA_HYPERVISOR_$$_POPFITNESS
U_$SOMA_HYPERVISOR_$$_POPFITNESS:
	.zero 1024

.section .bss
	.balign 8
# [49] Generation:       UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_GENERATION
U_$SOMA_HYPERVISOR_$$_GENERATION:
	.zero 8

.section .bss
	.balign 4
# [50] ColonyCount:      Integer;
	.globl U_$SOMA_HYPERVISOR_$$_COLONYCOUNT
U_$SOMA_HYPERVISOR_$$_COLONYCOUNT:
	.zero 4

.section .bss
	.balign 8
# [51] BestFitness:      Double;
	.globl U_$SOMA_HYPERVISOR_$$_BESTFITNESS
U_$SOMA_HYPERVISOR_$$_BESTFITNESS:
	.zero 8

.section .bss
	.balign 8
# [52] AvgFitness:       Double;
	.globl U_$SOMA_HYPERVISOR_$$_AVGFITNESS
U_$SOMA_HYPERVISOR_$$_AVGFITNESS:
	.zero 8

.section .bss
	.balign 4
# [53] BestGenomeIdx:    Integer;
	.globl U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX
U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX:
	.zero 4

.section .bss
# [54] Running:          Boolean;
	.globl U_$SOMA_HYPERVISOR_$$_RUNNING
U_$SOMA_HYPERVISOR_$$_RUNNING:
	.zero 1

.section .bss
	.balign 8
# [55] HyperCS:          TRTLCriticalSection;
	.globl U_$SOMA_HYPERVISOR_$$_HYPERCS
U_$SOMA_HYPERVISOR_$$_HYPERCS:
	.zero 40

.section .bss
	.balign 8
# [56] ShmemHandle:      THandle;
	.globl U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE
U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE:
	.zero 8

.section .bss
	.balign 8
# [57] Shmem:            ^TSOMAShmem;
	.globl U_$SOMA_HYPERVISOR_$$_SHMEM
U_$SOMA_HYPERVISOR_$$_SHMEM:
	.zero 8

.section .bss
	.balign 8
# [58] StartTime:        UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_STARTTIME
U_$SOMA_HYPERVISOR_$$_STARTTIME:
	.zero 8

.section .bss
	.balign 4
# [59] StatusThreadID:   TThreadID;
	.globl U_$SOMA_HYPERVISOR_$$_STATUSTHREADID
U_$SOMA_HYPERVISOR_$$_STATUSTHREADID:
	.zero 4

.section .bss
	.balign 8
# [60] GlobalRNG:        UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_GLOBALRNG
U_$SOMA_HYPERVISOR_$$_GLOBALRNG:
	.zero 8
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
# value: 0d+2.4414062500000000E-004
	.byte	0,0,0,0,0,0,48,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld5,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld5
_$SOMA_HYPERVISOR$_Ld5:
# value: 0d+1.0000000000000000E+000
	.byte	0,0,0,0,0,0,240,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld6,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld6
_$SOMA_HYPERVISOR$_Ld6:
# value: 0d+3.9062500000000000E-003
	.byte	0,0,0,0,0,0,112,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld7,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld7
_$SOMA_HYPERVISOR$_Ld7:
# value: 0d+5.0000000000000000E-001
	.byte	0,0,0,0,0,0,224,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld8,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld8
_$SOMA_HYPERVISOR$_Ld8:
# value: 0d+2.9999999999999999E-001
	.byte	51,51,51,51,51,51,211,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld9,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld9
_$SOMA_HYPERVISOR$_Ld9:
# value: 0d+2.0000000000000001E-001
	.byte	154,153,153,153,153,153,201,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld10,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld10
_$SOMA_HYPERVISOR$_Ld10:
# value: 0d+0.0000000000000000E+000
	.byte	0,0,0,0,0,0,0,0

.section .rodata.n__$SOMA_HYPERVISOR$_Ld11,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld11
_$SOMA_HYPERVISOR$_Ld11:
# value: 0d+7.8125000000000000E-003
	.byte	0,0,0,0,0,0,128,63

.section .rodata.n__$SOMA_HYPERVISOR$_Ld12,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld12
_$SOMA_HYPERVISOR$_Ld12:
	.ascii	"\005Gen: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld13,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld13
_$SOMA_HYPERVISOR$_Ld13:
# [346] '  Best: ', BestFitness:6:4,
	.ascii	"\010  Best: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld14,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld14
_$SOMA_HYPERVISOR$_Ld14:
# [347] '  Avg: ',  AvgFitness:6:4,
	.ascii	"\007  Avg: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld15,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld15
_$SOMA_HYPERVISOR$_Ld15:
	.ascii	"\013  (genome #\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld16,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld16
_$SOMA_HYPERVISOR$_Ld16:
	.ascii	"\033SOMA Hypervisor initialised\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld17,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld17
_$SOMA_HYPERVISOR$_Ld17:
	.ascii	"\016  Colonies  : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld18,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld18
_$SOMA_HYPERVISOR$_Ld18:
	.ascii	"\016  Population: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld19,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld19
_$SOMA_HYPERVISOR$_Ld19:
	.ascii	"\016  VMState   : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld20,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld20
_$SOMA_HYPERVISOR$_Ld20:
	.ascii	"\021 bytes per colony\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld21,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld21
_$SOMA_HYPERVISOR$_Ld21:
	.ascii	"\016  Total RAM : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld22,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld22
_$SOMA_HYPERVISOR$_Ld22:
	.ascii	"\021 KB for VM states\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld23,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld23
_$SOMA_HYPERVISOR$_Ld23:
	.ascii	"\032Starting colony threads...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld24,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld24
_$SOMA_HYPERVISOR$_Ld24:
	.ascii	"'WARNING: Failed to start colony thread \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld25,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld25
_$SOMA_HYPERVISOR$_Ld25:
	.ascii	"\011  Colony \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld26,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld26
_$SOMA_HYPERVISOR$_Ld26:
	.ascii	"\021 started (thread \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld27,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld27
_$SOMA_HYPERVISOR$_Ld27:
	.ascii	"&WARNING: Failed to start status thread\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld28,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld28
_$SOMA_HYPERVISOR$_Ld28:
	.ascii	"*Hypervisor running. Press Enter to stop...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld29,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld29
_$SOMA_HYPERVISOR$_Ld29:
	.ascii	"\026Stopping hypervisor...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld30,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld30
_$SOMA_HYPERVISOR$_Ld30:
	.ascii	"'Hypervisor stopped. Total generations: \000"
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE
RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE:
	.byte	29,8
# [467] 
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
.Lc44:
	.long	.Lc46-.Lc45
.Lc45:
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
.Lc46:
	.long	.Lc48-.Lc47
.Lc47:
	.secrel32	.Lc44
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc48:
	.long	.Lc50-.Lc49
.Lc49:
	.secrel32	.Lc44
	.quad	.Lc4
	.quad	.Lc5-.Lc4
	.byte	4
	.long	.Lc6-.Lc4
	.byte	14
	.uleb128	56
	.balign 4,0
.Lc50:
	.long	.Lc52-.Lc51
.Lc51:
	.secrel32	.Lc44
	.quad	.Lc7
	.quad	.Lc8-.Lc7
	.byte	4
	.long	.Lc9-.Lc7
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc52:
	.long	.Lc54-.Lc53
.Lc53:
	.secrel32	.Lc44
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
.Lc54:
	.long	.Lc56-.Lc55
.Lc55:
	.secrel32	.Lc44
	.quad	.Lc15
	.quad	.Lc16-.Lc15
	.byte	4
	.long	.Lc17-.Lc15
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc56:
	.long	.Lc58-.Lc57
.Lc57:
	.secrel32	.Lc44
	.quad	.Lc18
	.quad	.Lc19-.Lc18
	.balign 4,0
.Lc58:
	.long	.Lc60-.Lc59
.Lc59:
	.secrel32	.Lc44
	.quad	.Lc20
	.quad	.Lc21-.Lc20
	.balign 4,0
.Lc60:
	.long	.Lc62-.Lc61
.Lc61:
	.secrel32	.Lc44
	.quad	.Lc22
	.quad	.Lc23-.Lc22
	.balign 4,0
.Lc62:
	.long	.Lc64-.Lc63
.Lc63:
	.secrel32	.Lc44
	.quad	.Lc24
	.quad	.Lc25-.Lc24
	.balign 4,0
.Lc64:
	.long	.Lc66-.Lc65
.Lc65:
	.secrel32	.Lc44
	.quad	.Lc26
	.quad	.Lc27-.Lc26
	.byte	4
	.long	.Lc28-.Lc26
	.byte	14
	.uleb128	32824
	.balign 4,0
.Lc66:
	.long	.Lc68-.Lc67
.Lc67:
	.secrel32	.Lc44
	.quad	.Lc29
	.quad	.Lc30-.Lc29
	.byte	4
	.long	.Lc31-.Lc29
	.byte	14
	.uleb128	80
	.balign 4,0
.Lc68:
	.long	.Lc70-.Lc69
.Lc69:
	.secrel32	.Lc44
	.quad	.Lc32
	.quad	.Lc33-.Lc32
	.byte	4
	.long	.Lc34-.Lc32
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc70:
	.long	.Lc72-.Lc71
.Lc71:
	.secrel32	.Lc44
	.quad	.Lc35
	.quad	.Lc36-.Lc35
	.byte	4
	.long	.Lc37-.Lc35
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc72:
	.long	.Lc74-.Lc73
.Lc73:
	.secrel32	.Lc44
	.quad	.Lc38
	.quad	.Lc39-.Lc38
	.byte	4
	.long	.Lc40-.Lc38
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc74:
	.long	.Lc76-.Lc75
.Lc75:
	.secrel32	.Lc44
	.quad	.Lc41
	.quad	.Lc42-.Lc41
	.byte	4
	.long	.Lc43-.Lc41
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc76:
# End asmlist al_dwarf_frame

