	.file "soma_hypervisor.pas"
# Begin asmlist al_procedures

.section .text.n_soma_hypervisor_$$_allocaligned$qword$pointer$$pointer,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER:
.Lc1:
.seh_proc SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
# [soma_hypervisor.pas]
# [72] begin
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
# [73] raw    := GetMem(size + 63);
	addq	$63,%rcx
	call	SYSTEM_$$_GETMEM$QWORD$$POINTER
	movq	%rax,(%rbx)
# Var p located in register rax
# [75] p      := (p + 63) and not PtrUInt(63);
	addq	$63,%rax
	andq	$-64,%rax
# Var p located in register rax
# Var $result located in register rax
# Var p located in register rax
# [77] end;
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
# [86] begin
	pushq	%rbx
.seh_pushreg %rbx
	leaq	-48(%rsp),%rsp
.Lc6:
.seh_stackalloc 48
.seh_endprologue
# [92] );
	leaq	_$SOMA_HYPERVISOR$_Ld1(%rip),%rax
# [87] ShmemHandle := CreateFileMapping(
	movq	%rax,40(%rsp)
	movl	$64,32(%rsp)
	xorl	%r9d,%r9d
	movl	$4,%r8d
	xorl	%edx,%edx
	movq	$-1,%rcx
	call	_$dll$kernel32$CreateFileMappingA
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
# [93] if ShmemHandle = 0 then
	testq	%rax,%rax
	jne	.Lj8
# [95] WriteLn('WARNING: Could not create shared memory: ', GetLastError);
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
# [96] Shmem := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
# [97] Exit;
	jmp	.Lj5
	.balign 4,0x90
.Lj8:
# [99] Shmem := MapViewOfFile(ShmemHandle, FILE_MAP_ALL_ACCESS, 0, 0, SizeOf(TSOMAShmem));
	movq	$64,32(%rsp)
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	xorl	%r9d,%r9d
	xorl	%r8d,%r8d
	movl	$983071,%edx
	call	_$dll$kernel32$MapViewOfFile
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
# [100] if Shmem = nil then
	testq	%rax,%rax
	jne	.Lj10
# [101] WriteLn('WARNING: Could not map shared memory: ', GetLastError)
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
# [104] FillChar(Shmem^, SizeOf(TSOMAShmem), 0);
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$64,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [105] Shmem^.magic := $534F4D41;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$1397706049,(%rax)
.Lj11:
.Lj5:
# [107] end;
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
# [110] begin
	leaq	-40(%rsp),%rsp
.Lc9:
.seh_stackalloc 40
.seh_endprologue
# [111] if Shmem <> nil then UnmapViewOfFile(Shmem);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj15
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	call	_$dll$kernel32$UnmapViewOfFile
	.balign 4,0x90
.Lj15:
# [112] if ShmemHandle <> 0 then CloseHandle(ShmemHandle);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
	je	.Lj17
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj17:
# [113] end;
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
# [118] begin
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
# [120] rdtsc
	rdtsc
# [121] shl rdx, 32
	shlq	$32,%rdx
# [122] or  rax, rdx
	orq	%rdx,%rax
# [123] mov r, rax
	movq	%rax,-16(%rbp)
#  CPU ATHLON64
# [125] Result := r;
	movq	-16(%rbp),%rax
# [126] end;
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
# [129] begin
	leaq	-40(%rsp),%rsp
.Lc17:
.seh_stackalloc 40
.seh_endprologue
# [130] if Shmem = nil then Exit;
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj20
	.balign 4,0x90
# [131] Shmem^.generation      := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rdx
	movq	%rdx,4(%rax)
# [132] Shmem^.active_colonies := ColonyCount;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%edx
	movl	%edx,12(%rax)
# [133] Shmem^.best_fitness    := BestFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%rdx
	movq	%rdx,16(%rax)
# [134] Shmem^.avg_fitness     := AvgFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%rdx
	movq	%rdx,24(%rax)
# [135] Shmem^.uptime_secs     := (ReadTSC - StartTime) div 3000000000;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%rdx
	subq	U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip),%rdx
	movq	$-5242050321332162017,%rax
	mulq	%rdx
	shrq	$31,%rdx
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	%rdx,44(%rax)
# [136] Shmem^.codon_count     := 0;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$0,40(%rax)
.Lj20:
# [137] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc16:

.section .text.n_soma_hypervisor_$$_xorshift64$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_XORSHIFT64$QWORD:
.Lc18:
# [144] begin
	movq	%rcx,%rax
# Var rng located in register rax
	movq	(%rax),%rcx
# [145] rng := rng xor (rng shl 13);
	movq	%rcx,%rdx
	shlq	$13,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
	movq	%rdx,%rcx
# [146] rng := rng xor (rng shr 7);
	shrq	$7,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
	movq	%rdx,%rcx
# [147] rng := rng xor (rng shl 17);
	shlq	$17,%rdx
	xorq	%rcx,%rdx
	movq	%rdx,(%rax)
# [148] end;
	ret
.Lc19:

.section .text.n_soma_hypervisor_$$_randomgenome$tgenome$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD:
.Lc20:
# Var i located in register eax
# Var G located in register rcx
# [153] begin
	movq	%rdx,%r8
# Var rng located in register r8
# Var i located in register r9d
# [154] for i := 0 to GENOME_SIZE-1 do
	movl	$-1,%r9d
	.balign 8,0x90
.Lj28:
	addl	$1,%r9d
# [156] XorShift64(rng);
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
# [157] G[i].opcode := VALID_OPCODES[rng mod VALID_OPCODE_COUNT];
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
# [158] G[i].flags  := 0;
	movl	%r9d,%eax
	movb	$0,2(%rcx,%rax,8)
# [159] G[i].pad    := 0;
	movl	%r9d,%eax
	movb	$0,3(%rcx,%rax,8)
# [160] G[i].imm    := Int32((rng shr 32) mod 128) - 64;
	movq	(%r8),%rax
	shrq	$32,%rax
	andl	$127,%eax
	subl	$64,%eax
	movl	%r9d,%edx
	movl	%eax,4(%rcx,%rdx,8)
	cmpl	$4095,%r9d
	jnge	.Lj28
# [162] end;
	ret
.Lc21:

.section .text.n_soma_hypervisor_$$_evaluatefitness$pvmstate$$double,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE:
.Lc22:
# Var $result located in register xmm0
# [169] begin
	movq	%rcx,%rax
# Var state located in register rax
# Var $result located in register xmm0
# [170] Result := 0.0;
	movsd	_$SOMA_HYPERVISOR$_Ld4(%rip),%xmm0
# [171] end;
	ret
.Lc23:

.section .text.n_soma_hypervisor_$$_colonythreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64:
.Lc24:
.seh_proc SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
# [183] begin
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
	leaq	-32(%rsp),%rsp
.Lc26:
.seh_stackalloc 32
.seh_endprologue
# Var $result located in register rax
# Var col located in register rax
# Var state located in register rax
# Var t0 located in register r12
# Var t1 located in register r13
# Var genome_idx located in register ebx
# Var param located in register rcx
# Var col located in register rcx
# Var param located in register rcx
# Var col located in register rcx
# Var state located in register rax
# [185] state := col^.state;
	movq	8(%rcx),%rax
# [187] state^.rng_state := UInt64(col^.colony_id + 1) * $6C62272E07BB0142;
	movq	%rcx,%r15
# Var col located in register r15
	movslq	28(%r15),%rdx
	leaq	1(%rdx),%rcx
	movq	$7809847782465536322,%rdx
	imulq	%rdx,%rcx
	movq	%rax,%r14
# Var state located in register r14
	movq	%rcx,4120(%r14)
# [189] while Running do
	jmp	.Lj37
	.balign 8,0x90
.Lj36:
# [191] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
# [192] genome_idx := col^.colony_id mod POPULATION_SIZE;
	movslq	28(%r15),%rax
	cqto
	movl	$128,%ecx
	idivq	%rcx
	movl	%edx,%ebx
# [193] state^.genome := Population[genome_idx];
	movl	%ebx,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	4136(%r14),%rdi
	leaq	(%rdx,%rax),%rsi
	movl	$4096,%ecx
	rep
	movsq
# [194] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
# [196] state^.ip          := 0;
	movq	$0,4112(%r14)
# [197] state^.isp         := 0;
	movq	$0,4096(%r14)
# [198] state^.fsp         := 0;
	movq	$0,4104(%r14)
# [199] state^.halt_reason := HR_NONE;
	movq	$0,4128(%r14)
# [201] t0 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r12
# [202] Execute(state^);
	movq	%r14,%rcx
	call	SOMA_CORE_$$_EXECUTE$TVMSTATE
# [203] t1 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r13
# [205] col^.exec_cycles := t1 - t0;
	subq	%r12,%rax
	movq	%rax,40(%r15)
# [206] col^.fitness      := EvaluateFitness(state);
	movq	%r14,%rcx
	call	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	movsd	%xmm0,32(%r15)
# [207] col^.generation    := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rax
	movq	%rax,48(%r15)
# [209] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
# [210] Inc(Generation);
	addq	$1,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
# [211] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Lj37:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj36
# Var $result located in register rax
# [214] Result := 0;
	xorl	%eax,%eax
# [215] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc25:

.section .text.n_soma_hypervisor_$$_statusthreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64:
.Lc27:
.seh_proc SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
# [224] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc29:
.seh_stackalloc 40
.seh_endprologue
# Var $result located in register rax
# Var i located in register ebx
# Var param located in register rcx
# [225] while Running do
	jmp	.Lj42
	.balign 8,0x90
.Lj41:
# [227] Sleep(500);
	movl	$500,%ecx
	call	SYSUTILS_$$_SLEEP$LONGWORD
# [228] if not Running then Break;
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	je	.Lj43
	.balign 4,0x90
# [230] UpdateSharedMemory;
	call	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
# [232] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
# [233] BestFitness := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld4(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
# [234] AvgFitness  := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld4(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
# [235] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	subl	$1,%eax
	testl	%eax,%eax
	jnge	.Lj47
	movl	$-1,%ebx
	.balign 8,0x90
.Lj48:
	addl	$1,%ebx
# [237] AvgFitness := AvgFitness + Colonies[i].fitness;
	movl	%ebx,%edx
	imulq	$56,%rdx,%rcx
	movsd	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	addsd	32(%rdx,%rcx),%xmm0
	movsd	%xmm0,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
# [238] if Colonies[i].fitness > BestFitness then
	movl	%ebx,%edx
	imulq	$56,%rdx,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rcx
	movsd	32(%rcx,%rdx),%xmm0
	comisd	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%xmm0
	jp	.Lj52
	jna	.Lj52
# [239] BestFitness := Colonies[i].fitness;
	movl	%ebx,%edx
	imulq	$56,%rdx,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rcx
	movq	32(%rcx,%rdx),%rdx
	movq	%rdx,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
	.balign 4,0x90
.Lj52:
	cmpl	%ebx,%eax
	jnle	.Lj48
	.balign 4,0x90
.Lj47:
# [241] if ColonyCount > 0 then
	cmpl	$0,U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip)
	jng	.Lj55
# [242] AvgFitness := AvgFitness / ColonyCount;
	cvtsi2sdl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%xmm0
	movsd	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%xmm1
	divsd	%xmm0,%xmm1
	movsd	%xmm1,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
	.balign 4,0x90
.Lj55:
# [243] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
# [245] WriteLn('Gen: ', Generation,
	call	fpc_get_output
	movq	%rax,%rsi
	leaq	_$SOMA_HYPERVISOR$_Ld5(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%r8
	movq	%rsi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_uint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld6(%rip),%r8
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
	leaq	_$SOMA_HYPERVISOR$_Ld7(%rip),%r8
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
	movq	%rsi,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
.Lj42:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj41
.Lj43:
# Var $result located in register rax
# [249] Result := 0;
	xorl	%eax,%eax
# [250] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc28:

.section .text.n_soma_hypervisor_$$_hypervisorinit$longint,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT:
.Lc30:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
# [260] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc32:
.seh_stackalloc 40
.seh_endprologue
# Var i located in register esi
# Var rng located at rsp+32, size=OS_64
# Var colony_count located in register ecx
# [261] if colony_count > MAX_COLONIES then colony_count := MAX_COLONIES;
	cmpl	$16,%ecx
	jng	.Lj59
	movl	$16,%ecx
	.balign 4,0x90
.Lj59:
# [262] if colony_count < 1 then colony_count := 1;
	cmpl	$1,%ecx
	jnl	.Lj61
	movl	$1,%ecx
	.balign 4,0x90
.Lj61:
# Var colony_count located in register ecx
# [263] ColonyCount := colony_count;
	movl	%ecx,U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip)
# [264] Generation  := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
# [265] BestFitness := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld4(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
# [266] AvgFitness  := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld4(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
# [267] Running     := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [269] InitCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_INITCRITICALSECTION$TRTLCRITICALSECTION
# [270] InitSharedMemory;
	call	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
# [271] StartTime := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
# [273] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj63
	movl	$-1,%esi
	.balign 8,0x90
.Lj64:
	addl	$1,%esi
# [275] Colonies[i].colony_id := i;
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	%esi,28(%rax,%rdx)
# [276] Colonies[i].active    := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movb	$0,24(%rax,%rdx)
# [277] Colonies[i].fitness   := 0.0;
	movl	%esi,%eax
	imulq	$56,%rax,%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	_$SOMA_HYPERVISOR$_Ld4(%rip),%rax
	movq	%rax,32(%rdx,%rcx)
# [278] Colonies[i].state     := AllocAligned(SizeOf(TVMState), Colonies[i].raw_alloc);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	leaq	16(%rax,%rdx),%rdx
	movl	$36928,%ecx
	call	SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	movl	%esi,%edx
	imulq	$56,%rdx,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rcx
	movq	%rax,8(%rcx,%rdx)
# [279] FillChar(Colonies[i].state^, SizeOf(TVMState), 0);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movq	8(%rax,%rdx),%rcx
	xorl	%r8d,%r8d
	movl	$36928,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
	cmpl	%esi,%ebx
	jnle	.Lj64
	.balign 4,0x90
.Lj63:
# [282] rng := UInt64($CAFE1234DEADBEEF);
	movl	$-559038737,32(%rsp)
	movl	$-889318860,36(%rsp)
# Var i located in register ebx
# [283] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%ebx
	.balign 8,0x90
.Lj67:
	addl	$1,%ebx
# [284] RandomGenome(Population[i], rng);
	movl	%ebx,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rcx
	leaq	32(%rsp),%rdx
	call	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	cmpl	$127,%ebx
	jnge	.Lj67
# [286] WriteLn('SOMA Hypervisor initialised');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld8(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [287] WriteLn('  Colonies  : ', ColonyCount);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld9(%rip),%r8
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
# [288] WriteLn('  Population: ', POPULATION_SIZE);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld10(%rip),%r8
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
# [289] WriteLn('  VMState   : ', SizeOf(TVMState), ' bytes per colony');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld11(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movl	$36928,%r8d
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld12(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [290] WriteLn('  Total RAM : ', (ColonyCount * SizeOf(TVMState)) div 1024, ' KB for VM states');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld13(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%r8
	imulq	$36928,%r8
	movq	%r8,%rax
	sarq	$63,%rax
	andq	$1023,%rax
	addq	%rax,%r8
	sarq	$10,%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld14(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [291] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc31:

.section .text.n_soma_hypervisor_$$_hypervisorrun,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORRUN
SOMA_HYPERVISOR_$$_HYPERVISORRUN:
.Lc33:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORRUN
# [296] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rdi
.seh_pushreg %rdi
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-32(%rsp),%rsp
.Lc35:
.seh_stackalloc 32
.seh_endprologue
# Var i located in register esi
# [297] Running := True;
	movb	$1,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [298] WriteLn('Starting colony threads...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld15(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [300] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj73
	movl	$-1,%esi
	.balign 8,0x90
.Lj74:
	addl	$1,%esi
# [302] Colonies[i].active    := True;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$1,24(%rdx,%rax)
# [303] Colonies[i].thread_id := BeginThread(@ColonyThreadProc, @Colonies[i]);
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
# [304] if Colonies[i].thread_id = 0 then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpl	$0,(%rdx,%rax)
	jne	.Lj78
# [305] WriteLn('WARNING: Failed to start colony thread ', i)
	call	fpc_get_output
	movq	%rax,%rdi
	leaq	_$SOMA_HYPERVISOR$_Ld16(%rip),%r8
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
	jmp	.Lj79
.Lj78:
# [307] WriteLn('  Colony ', i, ' started (thread ', Colonies[i].thread_id, ')');
	call	fpc_get_output
	movq	%rax,%rdi
	leaq	_$SOMA_HYPERVISOR$_Ld17(%rip),%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movslq	%esi,%r8
	movq	%rdi,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_sint
	call	fpc_iocheck
	leaq	_$SOMA_HYPERVISOR$_Ld18(%rip),%r8
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
.Lj79:
	cmpl	%esi,%ebx
	jnle	.Lj74
	.balign 4,0x90
.Lj73:
# [310] StatusThreadID := BeginThread(@StatusThreadProc, nil);
	leaq	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64(%rip),%rcx
	xorl	%edx,%edx
	call	SYSTEM_$$_BEGINTHREAD$TTHREADFUNC$POINTER$$LONGWORD
	movl	%eax,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
# [311] if StatusThreadID = 0 then
	testl	%eax,%eax
	jne	.Lj81
# [312] WriteLn('WARNING: Failed to start status thread');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld19(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
	.balign 4,0x90
.Lj81:
# [314] WriteLn('Hypervisor running. Press Enter to stop...');
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
# [315] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
# [318] Running := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [319] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc34:

.section .text.n_soma_hypervisor_$$_hypervisorstop,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
SOMA_HYPERVISOR_$$_HYPERVISORSTOP:
.Lc36:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORSTOP
# [324] begin
	pushq	%rbx
.seh_pushreg %rbx
	pushq	%rsi
.seh_pushreg %rsi
	leaq	-40(%rsp),%rsp
.Lc38:
.seh_stackalloc 40
.seh_endprologue
# Var i located in register esi
# [325] WriteLn('Stopping hypervisor...');
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld21(%rip),%r8
	movq	%rbx,%rdx
	xorl	%ecx,%ecx
	call	fpc_write_text_shortstr
	call	fpc_iocheck
	movq	%rbx,%rcx
	call	fpc_writeln_end
	call	fpc_iocheck
# [328] if StatusThreadID <> 0 then
	cmpl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
	je	.Lj85
# [330] WaitForSingleObject(StatusThreadID, 2000);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	movl	$2000,%edx
	call	_$dll$kernel32$WaitForSingleObject
# [331] CloseHandle(StatusThreadID);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj85:
# [335] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj87
	movl	$-1,%esi
	.balign 8,0x90
.Lj88:
	addl	$1,%esi
# [337] if Colonies[i].active and (Colonies[i].thread_id <> 0) then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	addq	%rdx,%rax
	cmpb	$0,24(%rax)
	je	.Lj92
	cmpl	$0,(%rax)
	je	.Lj92
# [339] WaitForSingleObject(Colonies[i].thread_id, 5000);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movl	(%rdx,%rax),%ecx
	movl	$5000,%edx
	call	_$dll$kernel32$WaitForSingleObject
# [340] CloseHandle(Colonies[i].thread_id);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	(%rax,%rdx),%ecx
	call	_$dll$kernel32$CloseHandle
# [341] Colonies[i].active := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
	.balign 4,0x90
.Lj92:
	cmpl	%esi,%ebx
	jnle	.Lj88
	.balign 4,0x90
.Lj87:
# [345] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj95
	movl	$-1,%esi
	.balign 8,0x90
.Lj96:
	addl	$1,%esi
# [346] if Colonies[i].raw_alloc <> nil then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpq	$0,16(%rdx,%rax)
	je	.Lj100
# [347] FreeMem(Colonies[i].raw_alloc);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	16(%rdx,%rax),%rcx
	call	SYSTEM_$$_FREEMEM$POINTER$$QWORD
	.balign 4,0x90
.Lj100:
	cmpl	%esi,%ebx
	jnle	.Lj96
	.balign 4,0x90
.Lj95:
# [349] CloseSharedMemory;
	call	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
# [350] DoneCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_DONECRITICALSECTION$TRTLCRITICALSECTION
# [351] WriteLn('Hypervisor stopped. Total generations: ', Generation);
	call	fpc_get_output
	movq	%rax,%rbx
	leaq	_$SOMA_HYPERVISOR$_Ld22(%rip),%r8
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
# [352] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc37:

.section .text.n_soma_hypervisor_$$_init$,"x"
	.balign 16,0x90
.globl	INIT$_$SOMA_HYPERVISOR
INIT$_$SOMA_HYPERVISOR:
.globl	SOMA_HYPERVISOR_$$_init$
SOMA_HYPERVISOR_$$_init$:
.Lc39:
.seh_proc SOMA_HYPERVISOR_$$_init$
# [354] initialization
	leaq	-40(%rsp),%rsp
.Lc41:
.seh_stackalloc 40
.seh_endprologue
# [355] FillChar(Colonies,   SizeOf(Colonies),   0);
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	xorl	%r8d,%r8d
	movl	$896,%edx
	movq	%rax,%rcx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [356] FillChar(Population, SizeOf(Population), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$4194304,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
# [357] Running        := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
# [358] ShmemHandle    := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
# [359] Shmem          := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
# [360] StartTime      := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
# [361] Generation     := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
# [362] StatusThreadID := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
# [364] end.
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc40:
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 8
# [46] Colonies:       array[0..MAX_COLONIES-1] of TColonyThread;
	.globl U_$SOMA_HYPERVISOR_$$_COLONIES
U_$SOMA_HYPERVISOR_$$_COLONIES:
	.zero 896

.section .bss
	.balign 4
# [47] Population:     TPopulation;
	.globl U_$SOMA_HYPERVISOR_$$_POPULATION
U_$SOMA_HYPERVISOR_$$_POPULATION:
	.zero 4194304

.section .bss
	.balign 8
# [48] Generation:     UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_GENERATION
U_$SOMA_HYPERVISOR_$$_GENERATION:
	.zero 8

.section .bss
	.balign 4
# [49] ColonyCount:    Integer;
	.globl U_$SOMA_HYPERVISOR_$$_COLONYCOUNT
U_$SOMA_HYPERVISOR_$$_COLONYCOUNT:
	.zero 4

.section .bss
	.balign 8
# [50] BestFitness:    Double;
	.globl U_$SOMA_HYPERVISOR_$$_BESTFITNESS
U_$SOMA_HYPERVISOR_$$_BESTFITNESS:
	.zero 8

.section .bss
	.balign 8
# [51] AvgFitness:     Double;
	.globl U_$SOMA_HYPERVISOR_$$_AVGFITNESS
U_$SOMA_HYPERVISOR_$$_AVGFITNESS:
	.zero 8

.section .bss
# [52] Running:        Boolean;
	.globl U_$SOMA_HYPERVISOR_$$_RUNNING
U_$SOMA_HYPERVISOR_$$_RUNNING:
	.zero 1

.section .bss
	.balign 8
# [53] HyperCS:        TRTLCriticalSection;
	.globl U_$SOMA_HYPERVISOR_$$_HYPERCS
U_$SOMA_HYPERVISOR_$$_HYPERCS:
	.zero 40

.section .bss
	.balign 8
# [54] ShmemHandle:    THandle;
	.globl U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE
U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE:
	.zero 8

.section .bss
	.balign 8
# [55] Shmem:          ^TSOMAShmem;
	.globl U_$SOMA_HYPERVISOR_$$_SHMEM
U_$SOMA_HYPERVISOR_$$_SHMEM:
	.zero 8

.section .bss
	.balign 8
# [56] StartTime:      UInt64;
	.globl U_$SOMA_HYPERVISOR_$$_STARTTIME
U_$SOMA_HYPERVISOR_$$_STARTTIME:
	.zero 8

.section .bss
	.balign 4
# [57] StatusThreadID: TThreadID;
	.globl U_$SOMA_HYPERVISOR_$$_STATUSTHREADID
U_$SOMA_HYPERVISOR_$$_STATUSTHREADID:
	.zero 4
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
# value: 0d+0.0000000000000000E+000
	.byte	0,0,0,0,0,0,0,0

.section .rodata.n__$SOMA_HYPERVISOR$_Ld5,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld5
_$SOMA_HYPERVISOR$_Ld5:
	.ascii	"\005Gen: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld6,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld6
_$SOMA_HYPERVISOR$_Ld6:
# [246] '  Best: ', BestFitness:6:4,
	.ascii	"\010  Best: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld7,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld7
_$SOMA_HYPERVISOR$_Ld7:
# [247] '  Avg: ',  AvgFitness:6:4);
	.ascii	"\007  Avg: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld8,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld8
_$SOMA_HYPERVISOR$_Ld8:
	.ascii	"\033SOMA Hypervisor initialised\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld9,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld9
_$SOMA_HYPERVISOR$_Ld9:
	.ascii	"\016  Colonies  : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld10,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld10
_$SOMA_HYPERVISOR$_Ld10:
	.ascii	"\016  Population: \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld11,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld11
_$SOMA_HYPERVISOR$_Ld11:
	.ascii	"\016  VMState   : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld12,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld12
_$SOMA_HYPERVISOR$_Ld12:
	.ascii	"\021 bytes per colony\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld13,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld13
_$SOMA_HYPERVISOR$_Ld13:
	.ascii	"\016  Total RAM : \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld14,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld14
_$SOMA_HYPERVISOR$_Ld14:
	.ascii	"\021 KB for VM states\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld15,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld15
_$SOMA_HYPERVISOR$_Ld15:
	.ascii	"\032Starting colony threads...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld16,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld16
_$SOMA_HYPERVISOR$_Ld16:
	.ascii	"'WARNING: Failed to start colony thread \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld17,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld17
_$SOMA_HYPERVISOR$_Ld17:
	.ascii	"\011  Colony \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld18,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld18
_$SOMA_HYPERVISOR$_Ld18:
	.ascii	"\021 started (thread \000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld19,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld19
_$SOMA_HYPERVISOR$_Ld19:
	.ascii	"&WARNING: Failed to start status thread\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld20,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld20
_$SOMA_HYPERVISOR$_Ld20:
	.ascii	"*Hypervisor running. Press Enter to stop...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld21,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld21
_$SOMA_HYPERVISOR$_Ld21:
	.ascii	"\026Stopping hypervisor...\000"

.section .rodata.n__$SOMA_HYPERVISOR$_Ld22,"d"
	.balign 8
.globl	_$SOMA_HYPERVISOR$_Ld22
_$SOMA_HYPERVISOR$_Ld22:
	.ascii	"'Hypervisor stopped. Total generations: \000"
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE
RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE:
	.byte	29,8
# [365] 
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

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_def00000004,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_def00000004
RTTI_$SOMA_HYPERVISOR_$$_def00000004:
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
	.quad	RTTI_$SOMA_HYPERVISOR_$$_def00000004$indirect
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

.section .rodata.n_INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM,"d"
	.balign 8
.globl	INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect
INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect:
	.quad	INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_def00000004,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_def00000004$indirect
RTTI_$SOMA_HYPERVISOR_$$_def00000004$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_def00000004

.section .rodata.n_RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM,"d"
	.balign 8
.globl	RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect
RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM$indirect:
	.quad	RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM
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
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc46:
	.long	.Lc48-.Lc47
.Lc47:
	.secrel32	.Lc42
	.quad	.Lc4
	.quad	.Lc5-.Lc4
	.byte	4
	.long	.Lc6-.Lc4
	.byte	14
	.uleb128	56
	.balign 4,0
.Lc48:
	.long	.Lc50-.Lc49
.Lc49:
	.secrel32	.Lc42
	.quad	.Lc7
	.quad	.Lc8-.Lc7
	.byte	4
	.long	.Lc9-.Lc7
	.byte	14
	.uleb128	48
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
	.uleb128	48
	.balign 4,0
.Lc54:
	.long	.Lc56-.Lc55
.Lc55:
	.secrel32	.Lc42
	.quad	.Lc18
	.quad	.Lc19-.Lc18
	.balign 4,0
.Lc56:
	.long	.Lc58-.Lc57
.Lc57:
	.secrel32	.Lc42
	.quad	.Lc20
	.quad	.Lc21-.Lc20
	.balign 4,0
.Lc58:
	.long	.Lc60-.Lc59
.Lc59:
	.secrel32	.Lc42
	.quad	.Lc22
	.quad	.Lc23-.Lc22
	.balign 4,0
.Lc60:
	.long	.Lc62-.Lc61
.Lc61:
	.secrel32	.Lc42
	.quad	.Lc24
	.quad	.Lc25-.Lc24
	.byte	4
	.long	.Lc26-.Lc24
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc62:
	.long	.Lc64-.Lc63
.Lc63:
	.secrel32	.Lc42
	.quad	.Lc27
	.quad	.Lc28-.Lc27
	.byte	4
	.long	.Lc29-.Lc27
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc64:
	.long	.Lc66-.Lc65
.Lc65:
	.secrel32	.Lc42
	.quad	.Lc30
	.quad	.Lc31-.Lc30
	.byte	4
	.long	.Lc32-.Lc30
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc66:
	.long	.Lc68-.Lc67
.Lc67:
	.secrel32	.Lc42
	.quad	.Lc33
	.quad	.Lc34-.Lc33
	.byte	4
	.long	.Lc35-.Lc33
	.byte	14
	.uleb128	40
	.balign 4,0
.Lc68:
	.long	.Lc70-.Lc69
.Lc69:
	.secrel32	.Lc42
	.quad	.Lc36
	.quad	.Lc37-.Lc36
	.byte	4
	.long	.Lc38-.Lc36
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc70:
	.long	.Lc72-.Lc71
.Lc71:
	.secrel32	.Lc42
	.quad	.Lc39
	.quad	.Lc40-.Lc39
	.byte	4
	.long	.Lc41-.Lc39
	.byte	14
	.uleb128	48
	.balign 4,0
.Lc72:
# End asmlist al_dwarf_frame

