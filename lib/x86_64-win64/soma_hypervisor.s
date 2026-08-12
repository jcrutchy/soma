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
.Ll2:
# [76] raw    := GetMem(size + 63);
	addq	$63,%rcx
	call	SYSTEM_$$_GETMEM$QWORD$$POINTER
	movq	%rax,(%rbx)
# Var p located in register rax
.Ll3:
# [78] p      := (p + 63) and not PtrUInt(63);
	addq	$63,%rax
	andq	$-64,%rax
# Var p located in register rax
# Var $result located in register rax
# Var p located in register rax
.Ll4:
# [80] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rbx
	ret
.seh_endproc
.Lc2:
.Lt5:
.Ll5:

.section .text.n_soma_hypervisor_$$_initsharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_INITSHAREDMEMORY:
.Lc4:
.seh_proc SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
.Ll6:
# [89] begin
	pushq	%rbx
.seh_pushreg %rbx
	leaq	-48(%rsp),%rsp
.Lc6:
.seh_stackalloc 48
.seh_endprologue
.Ll7:
# [95] );
	leaq	_$SOMA_HYPERVISOR$_Ld1(%rip),%rax
.Ll8:
# [90] ShmemHandle := CreateFileMapping(
	movq	%rax,40(%rsp)
	movl	$64,32(%rsp)
	xorl	%r9d,%r9d
	movl	$4,%r8d
	xorl	%edx,%edx
	movq	$-1,%rcx
	call	_$dll$kernel32$CreateFileMappingA
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
.Ll9:
# [96] if ShmemHandle = 0 then
	testq	%rax,%rax
	jne	.Lj8
.Ll10:
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
.Ll11:
# [99] Shmem := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
.Ll12:
# [100] Exit;
	jmp	.Lj5
	.balign 4,0x90
.Lj8:
.Ll13:
# [102] Shmem := MapViewOfFile(ShmemHandle, FILE_MAP_ALL_ACCESS, 0, 0, SizeOf(TSOMAShmem));
	movq	$64,32(%rsp)
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	xorl	%r9d,%r9d
	xorl	%r8d,%r8d
	movl	$983071,%edx
	call	_$dll$kernel32$MapViewOfFile
	movq	%rax,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
.Ll14:
# [103] if Shmem = nil then
	testq	%rax,%rax
	jne	.Lj10
.Ll15:
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
.Ll16:
# [107] FillChar(Shmem^, SizeOf(TSOMAShmem), 0);
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$64,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll17:
# [108] Shmem^.magic := $534F4D41;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$1397706049,(%rax)
.Lj11:
.Lj5:
.Ll18:
# [110] end;
	nop
	leaq	48(%rsp),%rsp
	popq	%rbx
	ret
.seh_endproc
.Lc5:
.Lt6:
.Ll19:

.section .text.n_soma_hypervisor_$$_closesharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY:
.Lc7:
.seh_proc SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
.Ll20:
# [113] begin
	leaq	-40(%rsp),%rsp
.Lc9:
.seh_stackalloc 40
.seh_endprologue
.Ll21:
# [114] if Shmem <> nil then UnmapViewOfFile(Shmem);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj15
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rcx
	call	_$dll$kernel32$UnmapViewOfFile
	.balign 4,0x90
.Lj15:
.Ll22:
# [115] if ShmemHandle <> 0 then CloseHandle(ShmemHandle);
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
	je	.Lj17
	movq	U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip),%rcx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj17:
.Ll23:
# [116] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc8:
.Lt7:
.Ll24:

.section .text.n_soma_hypervisor_$$_readtsc$$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_READTSC$$QWORD:
.Lc10:
.seh_proc SOMA_HYPERVISOR_$$_READTSC$$QWORD
.Ll25:
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
.Ll26:
# [123] rdtsc
	rdtsc
.Ll27:
# [124] shl rdx, 32
	shlq	$32,%rdx
.Ll28:
# [125] or  rax, rdx
	orq	%rdx,%rax
.Ll29:
# [126] mov r, rax
	movq	%rax,-16(%rbp)
#  CPU ATHLON64
.Ll30:
# [128] Result := r;
	movq	-16(%rbp),%rax
.Ll31:
# [129] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc11:
.Lt8:
.Ll32:

.section .text.n_soma_hypervisor_$$_updatesharedmemory,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY:
.Lc15:
.seh_proc SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
.Ll33:
# [132] begin
	leaq	-40(%rsp),%rsp
.Lc17:
.seh_stackalloc 40
.seh_endprologue
.Ll34:
# [133] if Shmem = nil then Exit;
	cmpq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
	je	.Lj20
	.balign 4,0x90
.Ll35:
# [134] Shmem^.generation      := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rdx
	movq	%rdx,4(%rax)
.Ll36:
# [135] Shmem^.active_colonies := ColonyCount;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%edx
	movl	%edx,12(%rax)
.Ll37:
# [136] Shmem^.best_fitness    := BestFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%rdx
	movq	%rdx,16(%rax)
.Ll38:
# [137] Shmem^.avg_fitness     := AvgFitness;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip),%rdx
	movq	%rdx,24(%rax)
.Ll39:
# [138] Shmem^.uptime_secs     := (ReadTSC - StartTime) div 3000000000;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%rdx
	subq	U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip),%rdx
	movq	$-5242050321332162017,%rax
	mulq	%rdx
	shrq	$31,%rdx
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movq	%rdx,44(%rax)
.Ll40:
# [139] Shmem^.codon_count     := 0;
	movq	U_$SOMA_HYPERVISOR_$$_SHMEM(%rip),%rax
	movl	$0,40(%rax)
.Lj20:
.Ll41:
# [140] end;
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc16:
.Lt9:
.Ll42:

.section .text.n_soma_hypervisor_$$_randomgenome$tgenome$qword,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD:
.Lc18:
# Var i located in register eax
# Var G located in register rcx
.Ll43:
# [149] begin
	movq	%rdx,%r8
# Var rng located in register r8
# Var i located in register r9d
.Ll44:
# [150] for i := 0 to GENOME_SIZE-1 do
	movl	$-1,%r9d
	.balign 8,0x90
.Lj26:
	addl	$1,%r9d
.Ll45:
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
.Ll46:
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
.Ll47:
# [154] G[i].flags  := 0;
	movl	%r9d,%eax
	movb	$0,2(%rcx,%rax,8)
.Ll48:
# [155] G[i].pad    := 0;
	movl	%r9d,%eax
	movb	$0,3(%rcx,%rax,8)
.Ll49:
# [156] G[i].imm    := Int32((rng shr 32) mod 128) - 64;
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
# [158] end;
	ret
.Lc19:
.Lt10:
.Ll52:

.section .text.n_soma_hypervisor_$$_evaluatefitness$pvmstate$$double,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE:
.Lc20:
# Var $result located in register xmm0
# Var survival_score located in register xmm0
# Var activity_score located in register xmm0
.Ll53:
# [173] begin
	movq	%rcx,%rax
# Var state located in register rax
# Var state located in register rax
.Ll54:
# [175] survival_score := state^.ip / GENOME_SIZE;
	cvtsi2sdq	4368(%rax),%xmm1
	mulsd	_$SOMA_HYPERVISOR$_Ld4(%rip),%xmm1
# Var survival_score located in register xmm1
.Ll55:
# [176] if survival_score > 1.0 then survival_score := 1.0;
	comisd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm1
	jp	.Lj33
	jna	.Lj33
	movsd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm1
	.balign 4,0x90
.Lj33:
# Var state located in register rax
.Ll56:
# [180] activity_score := state^.isp / STACK_SIZE;
	cvtsi2sdq	4352(%rax),%xmm2
	mulsd	_$SOMA_HYPERVISOR$_Ld6(%rip),%xmm2
# Var activity_score located in register xmm2
.Ll57:
# [181] if activity_score > 1.0 then activity_score := 1.0;
	comisd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm2
	jp	.Lj36
	jna	.Lj36
	movsd	_$SOMA_HYPERVISOR$_Ld5(%rip),%xmm2
	.balign 4,0x90
.Lj36:
.Ll58:
	movq	4384(%rax),%rax
.Ll59:
# [184] if (state^.halt_reason = HR_HALT) or (state^.halt_reason = HR_YIELD) then
	cmpq	$1,%rax
	je	.Lj38
	cmpq	$2,%rax
	jne	.Lj40
.Lj38:
.Ll60:
# [185] Result := (survival_score * 0.5) + (activity_score * 0.3) + 0.2
	movapd	%xmm1,%xmm3
	mulsd	_$SOMA_HYPERVISOR$_Ld7(%rip),%xmm3
	movapd	%xmm2,%xmm0
	mulsd	_$SOMA_HYPERVISOR$_Ld8(%rip),%xmm0
	addsd	%xmm3,%xmm0
	addsd	_$SOMA_HYPERVISOR$_Ld9(%rip),%xmm0
	ret
.Lj40:
.Ll61:
# [187] Result := (survival_score * 0.5) + (activity_score * 0.3);
	mulsd	_$SOMA_HYPERVISOR$_Ld7(%rip),%xmm1
	mulsd	_$SOMA_HYPERVISOR$_Ld8(%rip),%xmm2
	addsd	%xmm1,%xmm2
	movapd	%xmm2,%xmm0
.Ll62:
# [188] end;
	ret
.Lc21:
.Lt11:
.Ll63:

.section .text.n_soma_hypervisor_$$_findworstidx$$longint,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT:
.Lc22:
# Var $result located in register eax
# Var i located in register eax
# Var worst located in register xmm0
# [200] begin
# Var $result located in register eax
.Ll64:
# [201] Result := 0;
	xorl	%eax,%eax
# Var worst located in register xmm0
.Ll65:
# [202] worst  := PopFitness[0];
	movsd	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%xmm0
# Var i located in register edx
.Ll66:
# [203] for i := 1 to POPULATION_SIZE-1 do
	xorl	%edx,%edx
	.balign 8,0x90
.Lj44:
	addl	$1,%edx
.Ll67:
# [204] if PopFitness[i] < worst then
	movl	%edx,%ecx
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	comisd	(%r8,%rcx,8),%xmm0
	jp	.Lj48
	jna	.Lj48
.Ll68:
# [206] worst  := PopFitness[i];
	movl	%edx,%ecx
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r8
	movsd	(%r8,%rcx,8),%xmm0
.Ll69:
# [207] Result := i;
	movl	%edx,%eax
	.balign 4,0x90
.Lj48:
.Ll70:
	cmpl	$127,%edx
	jnge	.Lj44
.Ll71:
# [209] end;
	ret
.Lc23:
.Lt12:
.Ll72:

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
.Ll73:
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
.Ll74:
# [220] best_idx := rng mod POPULATION_SIZE;
	movl	(%rcx),%eax
	andl	$127,%eax
# Var best_idx located in register eax
.Ll75:
# [221] best_fit := PopFitness[best_idx];
	movl	%eax,%r8d
# Var best_fit located in register xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r9
	movsd	(%r9,%r8,8),%xmm0
.Ll76:
# [223] for i := 1 to k-1 do
	subl	$1,%edx
	cmpl	$1,%edx
	jnge	.Lj54
	xorl	%r8d,%r8d
	.balign 8,0x90
.Lj55:
	addl	$1,%r8d
.Ll77:
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
.Ll78:
# [226] candidate := rng mod POPULATION_SIZE;
	movl	(%rcx),%r9d
	andl	$127,%r9d
	movl	%r9d,%r10d
.Ll79:
# [227] if PopFitness[candidate] > best_fit then
	andl	%r9d,%r9d
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r11
	comisd	(%r11,%r9,8),%xmm0
	jp	.Lj60
	jnb	.Lj60
.Ll80:
# [229] best_fit := PopFitness[candidate];
	movl	%r10d,%r9d
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%r11
	movsd	(%r11,%r9,8),%xmm0
.Ll81:
# [230] best_idx := candidate;
	movl	%r10d,%eax
	.balign 4,0x90
.Lj60:
.Ll82:
	cmpl	%r8d,%edx
	jnle	.Lj55
	.balign 4,0x90
.Lj54:
# Var $result located in register eax
# Var best_idx located in register eax
.Ll83:
# [235] end;
	ret
.Lc25:
.Lt13:
.Ll84:

.section .text.n_soma_hypervisor_$$_colonythreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64:
.Lc26:
# Temps allocated between rsp+32808 and rsp+32816
.seh_proc SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
.Ll85:
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
.Ll86:
# [252] state := col^.state;
	movq	8(%rcx),%r8
.Ll87:
# [254] local_rng := UInt64(col^.colony_id + 1) * $6C62272E07BB0142;
	movq	%rcx,32808(%rsp)
# Var col located in register rax
	movq	%rcx,%rdx
	movslq	28(%rdx),%rax
	leaq	1(%rax),%rdx
	movq	$7809847782465536322,%rax
	imulq	%rax,%rdx
	movq	%rdx,32(%rsp)
.Ll88:
# [255] state^.rng_state := local_rng;
	movq	%r8,%r15
# Var state located in register r15
	movq	32(%rsp),%rax
	movq	%rax,4376(%r15)
.Ll89:
# [257] while Running do
	jmp	.Lj65
	.balign 8,0x90
.Lj64:
.Ll90:
# [277] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll91:
# [278] parent_idx := TournamentSelect(local_rng, 4);
	leaq	32(%rsp),%rcx
	movl	$4,%edx
	call	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	movl	%eax,%r12d
.Ll92:
# [279] offspring  := Population[parent_idx];
	andl	%eax,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	40(%rsp),%rdi
	leaq	(%rdx,%rax),%rsi
	movl	$4096,%ecx
	rep
	movsq
.Ll93:
# [280] MutateGenome(offspring, Population, local_rng);
	leaq	32(%rsp),%r9
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	40(%rsp),%rcx
	movl	$127,%r8d
	call	SOMA_MUTATE_$$_MUTATEGENOME$TGENOME$array_of_TGENOME$QWORD
.Ll94:
# [281] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Ll95:
# [284] state^.genome       := offspring;
	leaq	4392(%r15),%rdi
	leaq	40(%rsp),%rsi
	movl	$4096,%ecx
	rep
	movsq
.Ll96:
# [285] state^.ip           := 0;
	movq	$0,4368(%r15)
.Ll97:
# [286] state^.isp          := 0;
	movq	$0,4352(%r15)
.Ll98:
# [287] state^.fsp          := 0;
	movq	$0,4360(%r15)
.Ll99:
# [288] state^.halt_reason  := HR_NONE;
	movq	$0,4384(%r15)
.Ll100:
# [290] t0 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r14
.Ll101:
# [291] Execute(state^);
	movq	%r15,%rcx
	call	SOMA_CORE_$$_EXECUTE$TVMSTATE
.Ll102:
# [292] t1 := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,%r13
.Ll103:
# [294] col^.exec_cycles := t1 - t0;
	subq	%r14,%rax
	movq	32808(%rsp),%rdx
	movq	%rax,40(%rdx)
.Ll104:
# [295] col^.fitness      := EvaluateFitness(state);
	movq	%r15,%rcx
	call	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	movq	32808(%rsp),%rdx
	movsd	%xmm0,32(%rdx)
.Ll105:
# [296] col^.generation    := Generation;
	movq	U_$SOMA_HYPERVISOR_$$_GENERATION(%rip),%rdx
	movq	32808(%rsp),%rax
	movq	%rdx,48(%rax)
.Ll106:
# [299] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll107:
# [300] worst_idx := FindWorstIdx;
	call	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	movl	%eax,%ebx
.Ll108:
# [301] if col^.fitness > PopFitness[worst_idx] then
	movl	%ebx,%edx
	movq	32808(%rsp),%rax
	movsd	32(%rax),%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rax
	comisd	(%rax,%rdx,8),%xmm0
	jp	.Lj68
	jna	.Lj68
.Ll109:
# [303] Population[worst_idx] := offspring;
	movl	%ebx,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rdi
	leaq	40(%rsp),%rsi
	movl	$4096,%ecx
	rep
	movsq
.Ll110:
# [304] PopFitness[worst_idx] := col^.fitness;
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rcx
	movq	32808(%rsp),%rdx
	movq	32(%rdx),%r8
	movq	%r8,(%rcx,%rax,8)
	.balign 4,0x90
.Lj68:
.Ll111:
# [306] Inc(Generation);
	addq	$1,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
.Ll112:
# [307] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Lj65:
.Ll113:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj64
# Var $result located in register rax
.Ll114:
# [310] Result := 0;
	xorl	%eax,%eax
.Ll115:
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
.Lt14:
.Ll116:

.section .text.n_soma_hypervisor_$$_statusthreadproc$pointer$$int64,"x"
	.balign 16,0x90
SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64:
.Lc29:
.seh_proc SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
.Ll117:
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
.Ll118:
# [322] while Running do
	jmp	.Lj74
	.balign 8,0x90
.Lj73:
.Ll119:
# [324] Sleep(500);
	movl	$500,%ecx
	call	SYSUTILS_$$_SLEEP$LONGWORD
.Ll120:
# [325] if not Running then Break;
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	je	.Lj75
	.balign 4,0x90
.Ll121:
# [327] UpdateSharedMemory;
	call	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
.Ll122:
# [329] EnterCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$EnterCriticalSection
.Ll123:
# [330] BestFitness   := PopFitness[0];
	movq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
.Ll124:
# [331] BestGenomeIdx := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
.Ll125:
# [332] sum := 0.0;
	movsd	_$SOMA_HYPERVISOR$_Ld10(%rip),%xmm6
.Ll126:
# [333] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%ebx
	.balign 8,0x90
.Lj78:
	addl	$1,%ebx
.Ll127:
# [335] sum := sum + PopFitness[i];
	movl	%ebx,%eax
	movapd	%xmm6,%xmm0
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	addsd	(%rdx,%rax,8),%xmm0
	movapd	%xmm0,%xmm6
.Ll128:
# [336] if PopFitness[i] > BestFitness then
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movsd	(%rdx,%rax,8),%xmm0
	comisd	U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip),%xmm0
	jp	.Lj82
	jna	.Lj82
.Ll129:
# [338] BestFitness   := PopFitness[i];
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movq	(%rdx,%rax,8),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
.Ll130:
# [339] BestGenomeIdx := i;
	movl	%ebx,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
	.balign 4,0x90
.Lj82:
.Ll131:
	cmpl	$127,%ebx
	jnge	.Lj78
.Ll132:
# [342] AvgFitness := sum / POPULATION_SIZE;
	movapd	%xmm6,%xmm0
	mulsd	_$SOMA_HYPERVISOR$_Ld11(%rip),%xmm0
	movsd	%xmm0,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
.Ll133:
# [343] LeaveCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	_$dll$kernel32$LeaveCriticalSection
.Ll134:
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
.Ll135:
# [348] '  (genome #', BestGenomeIdx, ')');
	movslq	U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip),%r8
.Ll136:
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
.Ll137:
	cmpb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
	jne	.Lj73
.Lj75:
# Var $result located in register rax
.Ll138:
# [350] Result := 0;
	xorl	%eax,%eax
.Ll139:
# [351] end;
	nop
	movdqa	48(%rsp),%xmm6
	leaq	72(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc30:
.Lt15:
.Ll140:

.section .text.n_soma_hypervisor_$$_hypervisorinit$longint,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT:
.Lc32:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
.Ll141:
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
.Ll142:
# [361] if colony_count > MAX_COLONIES then colony_count := MAX_COLONIES;
	cmpl	$16,%ecx
	jng	.Lj87
	movl	$16,%ecx
	.balign 4,0x90
.Lj87:
.Ll143:
# [362] if colony_count < 1 then colony_count := 1;
	cmpl	$1,%ecx
	jnl	.Lj89
	movl	$1,%ecx
	.balign 4,0x90
.Lj89:
# Var colony_count located in register ecx
.Ll144:
# [363] ColonyCount := colony_count;
	movl	%ecx,U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip)
.Ll145:
# [364] Generation  := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
.Ll146:
# [365] BestFitness := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_BESTFITNESS(%rip)
.Ll147:
# [366] AvgFitness  := 0.0;
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rax
	movq	%rax,U_$SOMA_HYPERVISOR_$$_AVGFITNESS(%rip)
.Ll148:
# [367] Running     := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll149:
# [369] InitCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_INITCRITICALSECTION$TRTLCRITICALSECTION
.Ll150:
# [370] InitSharedMemory;
	call	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
.Ll151:
# [371] StartTime := ReadTSC;
	call	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	movq	%rax,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
.Ll152:
# [373] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj91
	movl	$-1,%esi
	.balign 8,0x90
.Lj92:
	addl	$1,%esi
.Ll153:
# [375] Colonies[i].colony_id := i;
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	%esi,28(%rax,%rdx)
.Ll154:
# [376] Colonies[i].active    := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
.Ll155:
# [377] Colonies[i].fitness   := 0.0;
	movl	%esi,%eax
	imulq	$56,%rax,%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rax
	movq	%rax,32(%rdx,%rcx)
.Ll156:
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
.Ll157:
# [379] FillChar(Colonies[i].state^, SizeOf(TVMState), 0);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	8(%rdx,%rax),%rcx
	xorl	%r8d,%r8d
	movl	$37184,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll158:
	cmpl	%esi,%ebx
	jnle	.Lj92
	.balign 4,0x90
.Lj91:
.Ll159:
# [382] GlobalRNG := UInt64($CAFE1234DEADBEEF);
	movl	$-559038737,U_$SOMA_HYPERVISOR_$$_GLOBALRNG(%rip)
	movl	$-889318860,U_$SOMA_HYPERVISOR_$$_GLOBALRNG+4(%rip)
# Var i located in register ebx
.Ll160:
# [383] for i := 0 to POPULATION_SIZE-1 do
	movl	$-1,%ebx
	.balign 8,0x90
.Lj95:
	addl	$1,%ebx
.Ll161:
# [385] RandomGenome(Population[i], GlobalRNG);
	movl	%ebx,%eax
	shlq	$15,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rdx
	leaq	(%rdx,%rax),%rcx
	leaq	U_$SOMA_HYPERVISOR_$$_GLOBALRNG(%rip),%rdx
	call	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
.Ll162:
# [386] PopFitness[i] := 0.0;
	movl	%ebx,%eax
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rdx
	movq	_$SOMA_HYPERVISOR$_Ld10(%rip),%rcx
	movq	%rcx,(%rdx,%rax,8)
.Ll163:
	cmpl	$127,%ebx
	jnge	.Lj95
.Ll164:
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
.Ll165:
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
.Ll166:
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
.Ll167:
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
.Ll168:
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
.Ll169:
# [394] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc33:
.Lt1:
.Ll170:

.section .text.n_soma_hypervisor_$$_hypervisorrun,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORRUN
SOMA_HYPERVISOR_$$_HYPERVISORRUN:
.Lc35:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORRUN
.Ll171:
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
.Ll172:
# [400] Running := True;
	movb	$1,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll173:
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
.Ll174:
# [403] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj101
	movl	$-1,%esi
	.balign 8,0x90
.Lj102:
	addl	$1,%esi
.Ll175:
# [405] Colonies[i].active    := True;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$1,24(%rdx,%rax)
.Ll176:
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
.Ll177:
# [407] if Colonies[i].thread_id = 0 then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpl	$0,(%rdx,%rax)
	jne	.Lj106
.Ll178:
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
.Ll179:
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
.Ll180:
	cmpl	%esi,%ebx
	jnle	.Lj102
	.balign 4,0x90
.Lj101:
.Ll181:
# [413] StatusThreadID := BeginThread(@StatusThreadProc, nil);
	leaq	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64(%rip),%rcx
	xorl	%edx,%edx
	call	SYSTEM_$$_BEGINTHREAD$TTHREADFUNC$POINTER$$LONGWORD
	movl	%eax,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
.Ll182:
# [414] if StatusThreadID = 0 then
	testl	%eax,%eax
	jne	.Lj109
.Ll183:
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
.Ll184:
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
.Ll185:
# [418] Readln;
	call	fpc_get_input
	movq	%rax,%rcx
	call	fpc_readln_end
	call	fpc_iocheck
.Ll186:
# [420] Running := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll187:
# [421] end;
	nop
	leaq	32(%rsp),%rsp
	popq	%rsi
	popq	%rdi
	popq	%rbx
	ret
.seh_endproc
.Lc36:
.Lt2:
.Ll188:

.section .text.n_soma_hypervisor_$$_hypervisorstop,"x"
	.balign 16,0x90
.globl	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
SOMA_HYPERVISOR_$$_HYPERVISORSTOP:
.Lc38:
.seh_proc SOMA_HYPERVISOR_$$_HYPERVISORSTOP
.Ll189:
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
.Ll190:
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
.Ll191:
# [429] if StatusThreadID <> 0 then
	cmpl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
	je	.Lj113
.Ll192:
# [431] WaitForSingleObject(StatusThreadID, 2000);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	movl	$2000,%edx
	call	_$dll$kernel32$WaitForSingleObject
.Ll193:
# [432] CloseHandle(StatusThreadID);
	movl	U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip),%ecx
	call	_$dll$kernel32$CloseHandle
	.balign 4,0x90
.Lj113:
.Ll194:
# [435] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj115
	movl	$-1,%esi
	.balign 8,0x90
.Lj116:
	addl	$1,%esi
.Ll195:
# [437] if Colonies[i].active and (Colonies[i].thread_id <> 0) then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
.Ll196:
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	addq	%rdx,%rax
.Ll197:
	cmpb	$0,24(%rax)
	je	.Lj120
	cmpl	$0,(%rax)
	je	.Lj120
.Ll198:
# [439] WaitForSingleObject(Colonies[i].thread_id, 5000);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movl	(%rdx,%rax),%ecx
	movl	$5000,%edx
	call	_$dll$kernel32$WaitForSingleObject
.Ll199:
# [440] CloseHandle(Colonies[i].thread_id);
	movl	%esi,%eax
	imulq	$56,%rax,%rdx
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	movl	(%rax,%rdx),%ecx
	call	_$dll$kernel32$CloseHandle
.Ll200:
# [441] Colonies[i].active := False;
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movb	$0,24(%rdx,%rax)
	.balign 4,0x90
.Lj120:
.Ll201:
	cmpl	%esi,%ebx
	jnle	.Lj116
	.balign 4,0x90
.Lj115:
.Ll202:
# [445] for i := 0 to ColonyCount-1 do
	movl	U_$SOMA_HYPERVISOR_$$_COLONYCOUNT(%rip),%eax
	leal	-1(%eax),%ebx
	testl	%ebx,%ebx
	jnge	.Lj123
	movl	$-1,%esi
	.balign 8,0x90
.Lj124:
	addl	$1,%esi
.Ll203:
# [446] if Colonies[i].raw_alloc <> nil then
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	cmpq	$0,16(%rdx,%rax)
	je	.Lj128
.Ll204:
# [447] FreeMem(Colonies[i].raw_alloc);
	movl	%esi,%eax
	imulq	$56,%rax,%rax
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rdx
	movq	16(%rdx,%rax),%rcx
	call	SYSTEM_$$_FREEMEM$POINTER$$QWORD
	.balign 4,0x90
.Lj128:
.Ll205:
	cmpl	%esi,%ebx
	jnle	.Lj124
	.balign 4,0x90
.Lj123:
.Ll206:
# [449] CloseSharedMemory;
	call	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
.Ll207:
# [450] DoneCriticalSection(HyperCS);
	leaq	U_$SOMA_HYPERVISOR_$$_HYPERCS(%rip),%rcx
	call	SYSTEM_$$_DONECRITICALSECTION$TRTLCRITICALSECTION
.Ll208:
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
.Ll209:
# [452] end;
	nop
	leaq	40(%rsp),%rsp
	popq	%rsi
	popq	%rbx
	ret
.seh_endproc
.Lc39:
.Lt3:
.Ll210:

.section .text.n_soma_hypervisor_$$_init$,"x"
	.balign 16,0x90
.globl	INIT$_$SOMA_HYPERVISOR
INIT$_$SOMA_HYPERVISOR:
.globl	SOMA_HYPERVISOR_$$_init$
SOMA_HYPERVISOR_$$_init$:
.Lc41:
.seh_proc SOMA_HYPERVISOR_$$_init$
.Ll211:
# [454] initialization
	leaq	-40(%rsp),%rsp
.Lc43:
.seh_stackalloc 40
.seh_endprologue
.Ll212:
# [455] FillChar(Colonies,   SizeOf(Colonies),   0);
	leaq	U_$SOMA_HYPERVISOR_$$_COLONIES(%rip),%rax
	xorl	%r8d,%r8d
	movl	$896,%edx
	movq	%rax,%rcx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll213:
# [456] FillChar(Population, SizeOf(Population), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPULATION(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$4194304,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll214:
# [457] FillChar(PopFitness, SizeOf(PopFitness), 0);
	leaq	U_$SOMA_HYPERVISOR_$$_POPFITNESS(%rip),%rcx
	xorl	%r8d,%r8d
	movl	$1024,%edx
	call	SYSTEM_$$_FILLCHAR$formal$INT64$BYTE
.Ll215:
# [458] Running        := False;
	movb	$0,U_$SOMA_HYPERVISOR_$$_RUNNING(%rip)
.Ll216:
# [459] ShmemHandle    := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEMHANDLE(%rip)
.Ll217:
# [460] Shmem          := nil;
	movq	$0,U_$SOMA_HYPERVISOR_$$_SHMEM(%rip)
.Ll218:
# [461] StartTime      := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_STARTTIME(%rip)
.Ll219:
# [462] Generation     := 0;
	movq	$0,U_$SOMA_HYPERVISOR_$$_GENERATION(%rip)
.Ll220:
# [463] StatusThreadID := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_STATUSTHREADID(%rip)
.Ll221:
# [464] BestGenomeIdx  := 0;
	movl	$0,U_$SOMA_HYPERVISOR_$$_BESTGENOMEIDX(%rip)
.Ll222:
# [466] end.
	nop
	leaq	40(%rsp),%rsp
	ret
.seh_endproc
.Lc42:
.Lt4:
.Ll223:
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
	.uleb128	2
	.long	.La19-.Ldebug_info0
# Symbol I
	.uleb128	6
	.ascii	"i\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La19-.Ldebug_info0
	.byte	0
# Procdef HypervisorRun;
	.uleb128	4
	.ascii	"HypervisorRun\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORRUN
	.quad	.Lt2
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
	.quad	.Lt3
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
	.quad	.Lt4
	.byte	0
# Procdef AllocAligned(QWord;out Pointer):^untyped;
	.uleb128	7
	.ascii	"AllocAligned\000"
	.byte	1
	.byte	65
	.long	.La61-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	.quad	.Lt5
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
	.long	.La61-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La61-.Ldebug_info0
# Symbol ALLOCALIGNED
	.uleb128	6
	.ascii	"ALLOCALIGNED\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La61-.Ldebug_info0
# Symbol RESULT
	.uleb128	6
	.ascii	"RESULT\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La61-.Ldebug_info0
# Symbol P
	.uleb128	6
	.ascii	"p\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La17-.Ldebug_info0
	.byte	0
# Procdef InitSharedMemory;
	.uleb128	8
	.ascii	"InitSharedMemory\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
	.quad	.Lt6
# Symbol SHMEM_NAME
	.uleb128	9
	.ascii	"SHMEM_NAME\000"
	.long	.La63-.Ldebug_info0
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
	.uleb128	8
	.ascii	"CloseSharedMemory\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
	.quad	.Lt7
	.byte	0
# Procdef ReadTSC:QWord;
	.uleb128	7
	.ascii	"ReadTSC\000"
	.byte	1
	.byte	65
	.long	.La17-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	.quad	.Lt8
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
	.uleb128	8
	.ascii	"UpdateSharedMemory\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
	.quad	.Lt9
	.byte	0
# Procdef RandomGenome(var TGenome;var QWord);
	.uleb128	8
	.ascii	"RandomGenome\000"
	.byte	1
	.byte	65
	.quad	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	.quad	.Lt10
# Symbol G
	.uleb128	5
	.ascii	"G\000"
	.byte	3
	.byte	146
	.uleb128	2
	.sleb128	0
	.long	.La65-.Ldebug_info0
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
	.uleb128	7
	.ascii	"EvaluateFitness\000"
	.byte	1
	.byte	65
	.long	.La21-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	.quad	.Lt11
# Symbol STATE
	.uleb128	5
	.ascii	"state\000"
	.byte	2
	.byte	144
	.uleb128	0
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
# Symbol SURVIVAL_SCORE
	.uleb128	6
	.ascii	"survival_score\000"
	.byte	2
	.byte	144
	.uleb128	18
	.long	.La21-.Ldebug_info0
# Symbol ACTIVITY_SCORE
	.uleb128	6
	.ascii	"activity_score\000"
	.byte	2
	.byte	144
	.uleb128	19
	.long	.La21-.Ldebug_info0
	.byte	0
# Procdef FindWorstIdx:LongInt;
	.uleb128	7
	.ascii	"FindWorstIdx\000"
	.byte	1
	.byte	65
	.long	.La19-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	.quad	.Lt12
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
	.uleb128	7
	.ascii	"TournamentSelect\000"
	.byte	1
	.byte	65
	.long	.La19-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	.quad	.Lt13
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
	.uleb128	7
	.ascii	"ColonyThreadProc\000"
	.byte	1
	.byte	65
	.long	.La67-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
	.quad	.Lt14
# Symbol PARAM
	.uleb128	5
	.ascii	"param\000"
	.byte	2
	.byte	144
	.uleb128	2
	.long	.La61-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La67-.Ldebug_info0
# Symbol COLONYTHREADPROC
	.uleb128	6
	.ascii	"COLONYTHREADPROC\000"
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
# Symbol COL
	.uleb128	6
	.ascii	"col\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La69-.Ldebug_info0
# Symbol STATE
	.uleb128	6
	.ascii	"state\000"
	.byte	2
	.byte	144
	.uleb128	15
	.long	.La5-.Ldebug_info0
# Symbol T0
	.uleb128	6
	.ascii	"t0\000"
	.byte	2
	.byte	144
	.uleb128	14
	.long	.La17-.Ldebug_info0
# Symbol T1
	.uleb128	6
	.ascii	"t1\000"
	.byte	2
	.byte	144
	.uleb128	13
	.long	.La17-.Ldebug_info0
# Symbol PARENT_IDX
	.uleb128	6
	.ascii	"parent_idx\000"
	.byte	2
	.byte	144
	.uleb128	12
	.long	.La19-.Ldebug_info0
# Symbol WORST_IDX
	.uleb128	6
	.ascii	"worst_idx\000"
	.byte	2
	.byte	144
	.uleb128	3
	.long	.La19-.Ldebug_info0
# Symbol LOCAL_RNG
	.uleb128	6
	.ascii	"local_rng\000"
	.byte	2
	.byte	119
	.sleb128	32
	.long	.La17-.Ldebug_info0
# Symbol OFFSPRING
	.uleb128	6
	.ascii	"offspring\000"
	.byte	2
	.byte	119
	.sleb128	40
	.long	.La65-.Ldebug_info0
# Definition ^TColonyThread
.La69:
	.uleb128	10
	.long	.La7-.Ldebug_info0
.La70:
	.uleb128	11
	.long	.La69-.Ldebug_info0
	.byte	0
# Procdef StatusThreadProc(Pointer):Int64;
	.uleb128	7
	.ascii	"StatusThreadProc\000"
	.byte	1
	.byte	65
	.long	.La67-.Ldebug_info0
	.quad	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
	.quad	.Lt15
# Symbol PARAM
	.uleb128	5
	.ascii	"param\000"
	.byte	2
	.byte	144
	.uleb128	2
	.long	.La61-.Ldebug_info0
# Symbol result
	.uleb128	6
	.ascii	"$result\000"
	.byte	2
	.byte	144
	.uleb128	0
	.long	.La67-.Ldebug_info0
# Symbol STATUSTHREADPROC
	.uleb128	6
	.ascii	"STATUSTHREADPROC\000"
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
# Defs - Begin unit SYSTEM has index 1
# Definition Pointer
.La61:
	.uleb128	12
	.ascii	"Pointer\000"
	.long	.La71-.Ldebug_info0
.La71:
	.uleb128	13
.La62:
	.uleb128	11
	.long	.La61-.Ldebug_info0
# Definition Byte
.La3:
	.uleb128	12
	.ascii	"Byte\000"
	.long	.La72-.Ldebug_info0
.La72:
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
	.long	.La73-.Ldebug_info0
.La73:
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
	.long	.La74-.Ldebug_info0
.La74:
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
	.long	.La75-.Ldebug_info0
.La75:
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
	.long	.La76-.Ldebug_info0
.La76:
	.uleb128	14
	.ascii	"QWord\000"
	.byte	7
	.byte	8
.La18:
	.uleb128	11
	.long	.La17-.Ldebug_info0
# Definition Int64
.La67:
	.uleb128	12
	.ascii	"Int64\000"
	.long	.La77-.Ldebug_info0
.La77:
	.uleb128	14
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.La68:
	.uleb128	11
	.long	.La67-.Ldebug_info0
# Definition Boolean
.La23:
	.uleb128	12
	.ascii	"Boolean\000"
	.long	.La78-.Ldebug_info0
.La78:
	.uleb128	14
	.ascii	"Boolean\000"
	.byte	2
	.byte	1
.La24:
	.uleb128	11
	.long	.La23-.Ldebug_info0
# Definition ShortString
.La63:
	.uleb128	12
	.ascii	"ShortString\000"
	.long	.La79-.Ldebug_info0
.La79:
	.uleb128	15
	.ascii	"ShortString\000"
	.byte	3
	.byte	151
	.byte	49
	.byte	34
	.long	.La80-.Ldebug_info0
	.uleb128	16
	.uleb128	1
	.byte	3
	.byte	151
	.byte	148
	.byte	1
	.byte	0
.La64:
	.uleb128	11
	.long	.La63-.Ldebug_info0
# Definition Double
.La21:
	.uleb128	12
	.ascii	"Double\000"
	.long	.La82-.Ldebug_info0
.La82:
	.uleb128	14
	.ascii	"Double\000"
	.byte	4
	.byte	8
.La22:
	.uleb128	11
	.long	.La21-.Ldebug_info0
# Definition TRTLCriticalSection
.La25:
	.uleb128	12
	.ascii	"TRTLCriticalSection\000"
	.long	.La83-.Ldebug_info0
.La83:
	.uleb128	17
	.ascii	"TRTLCRITICALSECTION\000"
	.uleb128	40
	.uleb128	18
	.ascii	"DebugInfo\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La61-.Ldebug_info0
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
.La80:
	.uleb128	12
	.ascii	"Char\000"
	.long	.La84-.Ldebug_info0
.La84:
	.uleb128	14
	.ascii	"Char\000"
	.byte	8
	.byte	1
.La81:
	.uleb128	11
	.long	.La80-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit SOMA_TYPES has index 8
# Definition TGenome
.La65:
	.uleb128	12
	.ascii	"TGenome\000"
	.long	.La85-.Ldebug_info0
.La85:
	.uleb128	19
	.ascii	"TGenome\000"
	.uleb128	32768
	.long	.La86-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	4095
	.uleb128	8
	.long	.La88-.Ldebug_info0
	.byte	0
.La66:
	.uleb128	11
	.long	.La65-.Ldebug_info0
# Definition TInstruction
.La86:
	.uleb128	12
	.ascii	"TInstruction\000"
	.long	.La90-.Ldebug_info0
.La90:
	.uleb128	17
	.ascii	"TINSTRUCTION\000"
	.uleb128	8
	.uleb128	18
	.ascii	"opcode\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La91-.Ldebug_info0
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
.La87:
	.uleb128	11
	.long	.La86-.Ldebug_info0
# Defs - End unit SOMA_TYPES has index 8
# Defs - Begin unit WINDOWS has index 5
# Defs - End unit WINDOWS has index 5
# Defs - Begin unit SYSCONST has index 14
# Defs - End unit SYSCONST has index 14
# Defs - Begin unit WINDIRS has index 15
# Defs - End unit WINDIRS has index 15
# Defs - Begin unit SYSUTILS has index 13
# Defs - End unit SYSUTILS has index 13
# Defs - Begin unit MATH has index 12
# Defs - End unit MATH has index 12
# Defs - Begin unit SOMA_CORE has index 9
# Defs - End unit SOMA_CORE has index 9
# Defs - Begin unit SOMA_MUTATE has index 11
# Defs - End unit SOMA_MUTATE has index 11
# Defs - Begin unit SOMA_HYPERVISOR has index 10
# Definition PVMState
.La5:
	.uleb128	12
	.ascii	"PVMState\000"
	.long	.La93-.Ldebug_info0
.La93:
	.uleb128	10
	.long	.La94-.Ldebug_info0
.La6:
	.uleb128	11
	.long	.La5-.Ldebug_info0
# Definition TColonyThread
.La7:
	.uleb128	12
	.ascii	"TColonyThread\000"
	.long	.La96-.Ldebug_info0
.La96:
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
	.long	.La61-.Ldebug_info0
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
	.long	.La97-.Ldebug_info0
.La97:
	.uleb128	19
	.ascii	"TPopulation\000"
	.uleb128	4194304
	.long	.La65-.Ldebug_info0
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
	.long	.La98-.Ldebug_info0
.La98:
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
	.long	.La99-.Ldebug_info0
.La99:
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
	.long	.La100-.Ldebug_info0
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
.La31:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE\000"
	.long	.La102-.Ldebug_info0
.La102:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_PVMSTATE\000"
	.uleb128	18
	.byte	0
.La32:
	.uleb128	11
	.long	.La31-.Ldebug_info0
# Definition <record type>
.La33:
	.uleb128	12
	.ascii	"$rtti_header$8\000"
	.long	.La103-.Ldebug_info0
.La103:
	.uleb128	17
	.ascii	"$RTTI_HEADER$8\000"
	.uleb128	10
	.byte	0
.La34:
	.uleb128	11
	.long	.La33-.Ldebug_info0
# Definition <record type>
.La35:
	.uleb128	12
	.ascii	"$rtti_ref$\000"
	.long	.La104-.Ldebug_info0
.La104:
	.uleb128	17
	.ascii	"$RTTI_REF$\000"
	.uleb128	8
	.byte	0
.La36:
	.uleb128	11
	.long	.La35-.Ldebug_info0
# Definition <record type>
.La37:
	.uleb128	12
	.ascii	"$rttidef$INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.long	.La105-.Ldebug_info0
.La105:
	.uleb128	17
	.ascii	"$RTTIDEF$INIT_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.uleb128	47
	.byte	0
.La38:
	.uleb128	11
	.long	.La37-.Ldebug_info0
# Definition <record type>
.La39:
	.uleb128	12
	.ascii	"$rtti_header$13\000"
	.long	.La106-.Ldebug_info0
.La106:
	.uleb128	17
	.ascii	"$RTTI_HEADER$13\000"
	.uleb128	15
	.byte	0
.La40:
	.uleb128	11
	.long	.La39-.Ldebug_info0
# Definition <record type>
.La41:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.long	.La107-.Ldebug_info0
.La107:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TCOLONYTHREAD\000"
	.uleb128	159
	.byte	0
.La42:
	.uleb128	11
	.long	.La41-.Ldebug_info0
# Definition <record type>
.La43:
	.uleb128	12
	.ascii	"$rttidef$INIT_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.long	.La108-.Ldebug_info0
.La108:
	.uleb128	17
	.ascii	"$RTTIDEF$INIT_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.uleb128	54
	.byte	0
.La44:
	.uleb128	11
	.long	.La43-.Ldebug_info0
# Definition <record type>
.La45:
	.uleb128	12
	.ascii	"$rtti_normal_array$2\000"
	.long	.La109-.Ldebug_info0
.La109:
	.uleb128	17
	.ascii	"$RTTI_NORMAL_ARRAY$2\000"
	.uleb128	41
	.byte	0
.La46:
	.uleb128	11
	.long	.La45-.Ldebug_info0
# Definition <record type>
.La47:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.long	.La110-.Ldebug_info0
.La110:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TPOPULATION\000"
	.uleb128	54
	.byte	0
.La48:
	.uleb128	11
	.long	.La47-.Ldebug_info0
# Definition <record type>
.La49:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR\000"
	.long	.La111-.Ldebug_info0
.La111:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TFITNESSARR\000"
	.uleb128	46
	.byte	0
.La50:
	.uleb128	11
	.long	.La49-.Ldebug_info0
# Definition <record type>
.La51:
	.uleb128	12
	.ascii	"$rtti_normal_array$1\000"
	.long	.La112-.Ldebug_info0
.La112:
	.uleb128	17
	.ascii	"$RTTI_NORMAL_ARRAY$1\000"
	.uleb128	33
	.byte	0
.La52:
	.uleb128	11
	.long	.La51-.Ldebug_info0
# Definition <record type>
.La53:
	.uleb128	12
	.ascii	"$rttidef$INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.long	.La113-.Ldebug_info0
.La113:
	.uleb128	17
	.ascii	"$RTTIDEF$INIT_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.uleb128	44
	.byte	0
.La54:
	.uleb128	11
	.long	.La53-.Ldebug_info0
# Definition <record type>
.La55:
	.uleb128	12
	.ascii	"$rtti_header$10\000"
	.long	.La114-.Ldebug_info0
.La114:
	.uleb128	17
	.ascii	"$RTTI_HEADER$10\000"
	.uleb128	12
	.byte	0
.La56:
	.uleb128	11
	.long	.La55-.Ldebug_info0
# Definition <record type>
.La57:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_def00000005\000"
	.long	.La115-.Ldebug_info0
.La115:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_DEF00000005\000"
	.uleb128	35
	.byte	0
.La58:
	.uleb128	11
	.long	.La57-.Ldebug_info0
# Definition <record type>
.La59:
	.uleb128	12
	.ascii	"$rttidef$RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.long	.La116-.Ldebug_info0
.La116:
	.uleb128	17
	.ascii	"$RTTIDEF$RTTI_$SOMA_HYPERVISOR_$$_TSOMASHMEM\000"
	.uleb128	172
	.byte	0
.La60:
	.uleb128	11
	.long	.La59-.Ldebug_info0
# Defs - End Staticsymtable
# Definition SmallInt
.La88:
	.uleb128	12
	.ascii	"SmallInt\000"
	.long	.La117-.Ldebug_info0
.La117:
	.uleb128	14
	.ascii	"SmallInt\000"
	.byte	5
	.byte	2
.La89:
	.uleb128	11
	.long	.La88-.Ldebug_info0
# Definition Word
.La91:
	.uleb128	12
	.ascii	"Word\000"
	.long	.La118-.Ldebug_info0
.La118:
	.uleb128	14
	.ascii	"Word\000"
	.byte	7
	.byte	2
.La92:
	.uleb128	11
	.long	.La91-.Ldebug_info0
# Definition TVMState
.La94:
	.uleb128	12
	.ascii	"TVMState\000"
	.long	.La119-.Ldebug_info0
.La119:
	.uleb128	17
	.ascii	"TVMSTATE\000"
	.uleb128	37184
	.uleb128	18
	.ascii	"guard\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La120-.Ldebug_info0
	.uleb128	18
	.ascii	"istack\000"
	.byte	3
	.byte	35
	.uleb128	256
	.long	.La122-.Ldebug_info0
	.uleb128	18
	.ascii	"fstack\000"
	.byte	3
	.byte	35
	.uleb128	2304
	.long	.La124-.Ldebug_info0
	.uleb128	18
	.ascii	"isp\000"
	.byte	3
	.byte	35
	.uleb128	4352
	.long	.La67-.Ldebug_info0
	.uleb128	18
	.ascii	"fsp\000"
	.byte	3
	.byte	35
	.uleb128	4360
	.long	.La67-.Ldebug_info0
	.uleb128	18
	.ascii	"ip\000"
	.byte	3
	.byte	35
	.uleb128	4368
	.long	.La67-.Ldebug_info0
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
	.long	.La65-.Ldebug_info0
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
	.long	.La126-.Ldebug_info0
	.byte	0
.La95:
	.uleb128	11
	.long	.La94-.Ldebug_info0
# Definition TSOMAShmem.Array[0..11] Of Byte
.La100:
	.uleb128	21
	.uleb128	12
	.long	.La3-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	11
	.uleb128	1
	.long	.La1-.Ldebug_info0
	.byte	0
.La101:
	.uleb128	11
	.long	.La100-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Byte
.La120:
	.uleb128	21
	.uleb128	256
	.long	.La3-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	255
	.uleb128	1
	.long	.La3-.Ldebug_info0
	.byte	0
.La121:
	.uleb128	11
	.long	.La120-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Int64
.La122:
	.uleb128	21
	.uleb128	2048
	.long	.La67-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La3-.Ldebug_info0
	.byte	0
.La123:
	.uleb128	11
	.long	.La122-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Double
.La124:
	.uleb128	21
	.uleb128	2048
	.long	.La21-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La3-.Ldebug_info0
	.byte	0
.La125:
	.uleb128	11
	.long	.La124-.Ldebug_info0
# Definition TVMState.Array[0..15] Of Byte
.La126:
	.uleb128	21
	.uleb128	16
	.long	.La3-.Ldebug_info0
	.uleb128	20
	.sleb128	0
	.sleb128	15
	.uleb128	1
	.long	.La1-.Ldebug_info0
	.byte	0
.La127:
	.uleb128	11
	.long	.La126-.Ldebug_info0
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
	.uleb128	73
	.uleb128	19
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
# [75:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	86
# [76:29]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	5
	.uleb128	29
	.byte	13
# [78:13]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	5
	.uleb128	13
	.byte	14
# [80:1]
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
# [89:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll6
	.byte	5
	.uleb128	1
	.byte	100
# [95:3]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	5
	.uleb128	3
	.byte	18
# [90:18]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	5
	.uleb128	18
	.byte	3
	.sleb128	-5
	.byte	1
# [96:18]
	.byte	2
	.uleb128	.Ll9-.Ll8
	.byte	18
# [98:5]
	.byte	2
	.uleb128	.Ll10-.Ll9
	.byte	5
	.uleb128	5
	.byte	14
# [99:5]
	.byte	2
	.uleb128	.Ll11-.Ll10
	.byte	13
# [100:5]
	.byte	2
	.uleb128	.Ll12-.Ll11
	.byte	13
# [102:12]
	.byte	2
	.uleb128	.Ll13-.Ll12
	.byte	5
	.uleb128	12
	.byte	14
# [103:12]
	.byte	2
	.uleb128	.Ll14-.Ll13
	.byte	13
# [104:5]
	.byte	2
	.uleb128	.Ll15-.Ll14
	.byte	5
	.uleb128	5
	.byte	13
# [107:20]
	.byte	2
	.uleb128	.Ll16-.Ll15
	.byte	5
	.uleb128	20
	.byte	15
# [108:11]
	.byte	2
	.uleb128	.Ll17-.Ll16
	.byte	5
	.uleb128	11
	.byte	13
# [110:1]
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
# [113:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll20
	.byte	5
	.uleb128	1
	.byte	124
# [114:12]
	.byte	2
	.uleb128	.Ll21-.Ll20
	.byte	5
	.uleb128	12
	.byte	13
# [115:18]
	.byte	2
	.uleb128	.Ll22-.Ll21
	.byte	5
	.uleb128	18
	.byte	13
# [116:1]
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
# [121:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll25
	.byte	5
	.uleb128	1
	.byte	132
# [123:5]
	.byte	2
	.uleb128	.Ll26-.Ll25
	.byte	5
	.uleb128	5
	.byte	14
# [124:5]
	.byte	2
	.uleb128	.Ll27-.Ll26
	.byte	13
# [125:5]
	.byte	2
	.uleb128	.Ll28-.Ll27
	.byte	13
# [126:5]
	.byte	2
	.uleb128	.Ll29-.Ll28
	.byte	13
# [128:3]
	.byte	2
	.uleb128	.Ll30-.Ll29
	.byte	5
	.uleb128	3
	.byte	14
# [129:1]
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
# [132:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll33
	.byte	5
	.uleb128	1
	.byte	143
# [133:12]
	.byte	2
	.uleb128	.Ll34-.Ll33
	.byte	5
	.uleb128	12
	.byte	13
# [134:9]
	.byte	2
	.uleb128	.Ll35-.Ll34
	.byte	5
	.uleb128	9
	.byte	13
# [135:9]
	.byte	2
	.uleb128	.Ll36-.Ll35
	.byte	13
# [136:9]
	.byte	2
	.uleb128	.Ll37-.Ll36
	.byte	13
# [137:9]
	.byte	2
	.uleb128	.Ll38-.Ll37
	.byte	13
# [138:30]
	.byte	2
	.uleb128	.Ll39-.Ll38
	.byte	5
	.uleb128	30
	.byte	13
# [139:9]
	.byte	2
	.uleb128	.Ll40-.Ll39
	.byte	5
	.uleb128	9
	.byte	13
# [140:1]
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
# [149:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll43
	.byte	5
	.uleb128	1
	.byte	160
# [150:3]
	.byte	2
	.uleb128	.Ll44-.Ll43
	.byte	5
	.uleb128	3
	.byte	13
# [152:5]
	.byte	2
	.uleb128	.Ll45-.Ll44
	.byte	5
	.uleb128	5
	.byte	14
# [153:38]
	.byte	2
	.uleb128	.Ll46-.Ll45
	.byte	5
	.uleb128	38
	.byte	13
# [154:7]
	.byte	2
	.uleb128	.Ll47-.Ll46
	.byte	5
	.uleb128	7
	.byte	13
# [155:7]
	.byte	2
	.uleb128	.Ll48-.Ll47
	.byte	13
# [156:26]
	.byte	2
	.uleb128	.Ll49-.Ll48
	.byte	5
	.uleb128	26
	.byte	13
# [150:3]
	.byte	2
	.uleb128	.Ll50-.Ll49
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-6
	.byte	1
# [158:1]
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
# [175:26]
	.byte	2
	.uleb128	.Ll54-.Ll53
	.byte	5
	.uleb128	26
	.byte	14
# [176:21]
	.byte	2
	.uleb128	.Ll55-.Ll54
	.byte	5
	.uleb128	21
	.byte	13
# [180:26]
	.byte	2
	.uleb128	.Ll56-.Ll55
	.byte	5
	.uleb128	26
	.byte	16
# [181:21]
	.byte	2
	.uleb128	.Ll57-.Ll56
	.byte	5
	.uleb128	21
	.byte	13
# [173:1]
	.byte	2
	.uleb128	.Ll58-.Ll57
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-8
	.byte	1
# [184:6]
	.byte	2
	.uleb128	.Ll59-.Ll58
	.byte	5
	.uleb128	6
	.byte	23
# [185:15]
	.byte	2
	.uleb128	.Ll60-.Ll59
	.byte	5
	.uleb128	15
	.byte	13
# [187:15]
	.byte	2
	.uleb128	.Ll61-.Ll60
	.byte	14
# [188:1]
	.byte	2
	.uleb128	.Ll62-.Ll61
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll63
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
# [201:3]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll64
	.byte	5
	.uleb128	3
	.byte	212
# [202:3]
	.byte	2
	.uleb128	.Ll65-.Ll64
	.byte	13
# [203:3]
	.byte	2
	.uleb128	.Ll66-.Ll65
	.byte	13
# [204:19]
	.byte	2
	.uleb128	.Ll67-.Ll66
	.byte	5
	.uleb128	19
	.byte	13
# [206:28]
	.byte	2
	.uleb128	.Ll68-.Ll67
	.byte	5
	.uleb128	28
	.byte	14
# [207:7]
	.byte	2
	.uleb128	.Ll69-.Ll68
	.byte	5
	.uleb128	7
	.byte	13
# [203:3]
	.byte	2
	.uleb128	.Ll70-.Ll69
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-4
	.byte	1
# [209:1]
	.byte	2
	.uleb128	.Ll71-.Ll70
	.byte	5
	.uleb128	1
	.byte	18
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll72
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
# [219:3]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll73
	.byte	5
	.uleb128	3
	.byte	230
# [220:19]
	.byte	2
	.uleb128	.Ll74-.Ll73
	.byte	5
	.uleb128	19
	.byte	13
# [221:26]
	.byte	2
	.uleb128	.Ll75-.Ll74
	.byte	5
	.uleb128	26
	.byte	13
# [223:18]
	.byte	2
	.uleb128	.Ll76-.Ll75
	.byte	5
	.uleb128	18
	.byte	14
# [225:5]
	.byte	2
	.uleb128	.Ll77-.Ll76
	.byte	5
	.uleb128	5
	.byte	14
# [226:22]
	.byte	2
	.uleb128	.Ll78-.Ll77
	.byte	5
	.uleb128	22
	.byte	13
# [227:18]
	.byte	2
	.uleb128	.Ll79-.Ll78
	.byte	5
	.uleb128	18
	.byte	13
# [229:30]
	.byte	2
	.uleb128	.Ll80-.Ll79
	.byte	5
	.uleb128	30
	.byte	14
# [230:7]
	.byte	2
	.uleb128	.Ll81-.Ll80
	.byte	5
	.uleb128	7
	.byte	13
# [223:3]
	.byte	2
	.uleb128	.Ll82-.Ll81
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-7
	.byte	1
# [235:1]
	.byte	2
	.uleb128	.Ll83-.Ll82
	.byte	5
	.uleb128	1
	.byte	24
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll84
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
# [250:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll85
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	249
	.byte	1
# [252:3]
	.byte	2
	.uleb128	.Ll86-.Ll85
	.byte	5
	.uleb128	3
	.byte	14
# [254:27]
	.byte	2
	.uleb128	.Ll87-.Ll86
	.byte	5
	.uleb128	27
	.byte	14
# [255:9]
	.byte	2
	.uleb128	.Ll88-.Ll87
	.byte	5
	.uleb128	9
	.byte	13
# [257:3]
	.byte	2
	.uleb128	.Ll89-.Ll88
	.byte	5
	.uleb128	3
	.byte	14
# [277:5]
	.byte	2
	.uleb128	.Ll90-.Ll89
	.byte	5
	.uleb128	5
	.byte	32
# [278:19]
	.byte	2
	.uleb128	.Ll91-.Ll90
	.byte	5
	.uleb128	19
	.byte	13
# [279:29]
	.byte	2
	.uleb128	.Ll92-.Ll91
	.byte	5
	.uleb128	29
	.byte	13
# [280:5]
	.byte	2
	.uleb128	.Ll93-.Ll92
	.byte	5
	.uleb128	5
	.byte	13
# [281:5]
	.byte	2
	.uleb128	.Ll94-.Ll93
	.byte	13
# [284:5]
	.byte	2
	.uleb128	.Ll95-.Ll94
	.byte	15
# [285:5]
	.byte	2
	.uleb128	.Ll96-.Ll95
	.byte	13
# [286:5]
	.byte	2
	.uleb128	.Ll97-.Ll96
	.byte	13
# [287:5]
	.byte	2
	.uleb128	.Ll98-.Ll97
	.byte	13
# [288:5]
	.byte	2
	.uleb128	.Ll99-.Ll98
	.byte	13
# [290:11]
	.byte	2
	.uleb128	.Ll100-.Ll99
	.byte	5
	.uleb128	11
	.byte	14
# [291:5]
	.byte	2
	.uleb128	.Ll101-.Ll100
	.byte	5
	.uleb128	5
	.byte	13
# [292:11]
	.byte	2
	.uleb128	.Ll102-.Ll101
	.byte	5
	.uleb128	11
	.byte	13
# [294:28]
	.byte	2
	.uleb128	.Ll103-.Ll102
	.byte	5
	.uleb128	28
	.byte	14
# [295:26]
	.byte	2
	.uleb128	.Ll104-.Ll103
	.byte	5
	.uleb128	26
	.byte	13
# [296:5]
	.byte	2
	.uleb128	.Ll105-.Ll104
	.byte	5
	.uleb128	5
	.byte	13
# [299:5]
	.byte	2
	.uleb128	.Ll106-.Ll105
	.byte	15
# [300:18]
	.byte	2
	.uleb128	.Ll107-.Ll106
	.byte	5
	.uleb128	18
	.byte	13
# [301:34]
	.byte	2
	.uleb128	.Ll108-.Ll107
	.byte	5
	.uleb128	34
	.byte	13
# [303:18]
	.byte	2
	.uleb128	.Ll109-.Ll108
	.byte	5
	.uleb128	18
	.byte	14
# [304:18]
	.byte	2
	.uleb128	.Ll110-.Ll109
	.byte	13
# [306:5]
	.byte	2
	.uleb128	.Ll111-.Ll110
	.byte	5
	.uleb128	5
	.byte	14
# [307:5]
	.byte	2
	.uleb128	.Ll112-.Ll111
	.byte	13
# [257:9]
	.byte	2
	.uleb128	.Ll113-.Ll112
	.byte	5
	.uleb128	9
	.byte	3
	.sleb128	-50
	.byte	1
# [310:3]
	.byte	2
	.uleb128	.Ll114-.Ll113
	.byte	5
	.uleb128	3
	.byte	65
# [311:1]
	.byte	2
	.uleb128	.Ll115-.Ll114
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll116
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
# [321:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll117
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	320
	.byte	1
# [322:3]
	.byte	2
	.uleb128	.Ll118-.Ll117
	.byte	5
	.uleb128	3
	.byte	13
# [324:5]
	.byte	2
	.uleb128	.Ll119-.Ll118
	.byte	5
	.uleb128	5
	.byte	14
# [325:8]
	.byte	2
	.uleb128	.Ll120-.Ll119
	.byte	5
	.uleb128	8
	.byte	13
# [327:5]
	.byte	2
	.uleb128	.Ll121-.Ll120
	.byte	5
	.uleb128	5
	.byte	14
# [329:5]
	.byte	2
	.uleb128	.Ll122-.Ll121
	.byte	14
# [330:5]
	.byte	2
	.uleb128	.Ll123-.Ll122
	.byte	13
# [331:5]
	.byte	2
	.uleb128	.Ll124-.Ll123
	.byte	13
# [332:5]
	.byte	2
	.uleb128	.Ll125-.Ll124
	.byte	13
# [333:5]
	.byte	2
	.uleb128	.Ll126-.Ll125
	.byte	13
# [335:31]
	.byte	2
	.uleb128	.Ll127-.Ll126
	.byte	5
	.uleb128	31
	.byte	14
# [336:21]
	.byte	2
	.uleb128	.Ll128-.Ll127
	.byte	5
	.uleb128	21
	.byte	13
# [338:37]
	.byte	2
	.uleb128	.Ll129-.Ll128
	.byte	5
	.uleb128	37
	.byte	14
# [339:9]
	.byte	2
	.uleb128	.Ll130-.Ll129
	.byte	5
	.uleb128	9
	.byte	13
# [333:5]
	.byte	2
	.uleb128	.Ll131-.Ll130
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-6
	.byte	1
# [342:23]
	.byte	2
	.uleb128	.Ll132-.Ll131
	.byte	5
	.uleb128	23
	.byte	21
# [343:5]
	.byte	2
	.uleb128	.Ll133-.Ll132
	.byte	5
	.uleb128	5
	.byte	13
# [345:5]
	.byte	2
	.uleb128	.Ll134-.Ll133
	.byte	14
# [348:41]
	.byte	2
	.uleb128	.Ll135-.Ll134
	.byte	5
	.uleb128	41
	.byte	15
# [345:5]
	.byte	2
	.uleb128	.Ll136-.Ll135
	.byte	5
	.uleb128	5
	.byte	3
	.sleb128	-3
	.byte	1
# [322:9]
	.byte	2
	.uleb128	.Ll137-.Ll136
	.byte	5
	.uleb128	9
	.byte	3
	.sleb128	-23
	.byte	1
# [350:3]
	.byte	2
	.uleb128	.Ll138-.Ll137
	.byte	5
	.uleb128	3
	.byte	40
# [351:1]
	.byte	2
	.uleb128	.Ll139-.Ll138
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll140
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_HYPERVISORINIT$LONGINT
# [360:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll141
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	359
	.byte	1
# [361:19]
	.byte	2
	.uleb128	.Ll142-.Ll141
	.byte	5
	.uleb128	19
	.byte	13
# [362:19]
	.byte	2
	.uleb128	.Ll143-.Ll142
	.byte	13
# [363:3]
	.byte	2
	.uleb128	.Ll144-.Ll143
	.byte	5
	.uleb128	3
	.byte	13
# [364:3]
	.byte	2
	.uleb128	.Ll145-.Ll144
	.byte	13
# [365:3]
	.byte	2
	.uleb128	.Ll146-.Ll145
	.byte	13
# [366:3]
	.byte	2
	.uleb128	.Ll147-.Ll146
	.byte	13
# [367:3]
	.byte	2
	.uleb128	.Ll148-.Ll147
	.byte	13
# [369:3]
	.byte	2
	.uleb128	.Ll149-.Ll148
	.byte	14
# [370:3]
	.byte	2
	.uleb128	.Ll150-.Ll149
	.byte	13
# [371:16]
	.byte	2
	.uleb128	.Ll151-.Ll150
	.byte	5
	.uleb128	16
	.byte	13
# [373:28]
	.byte	2
	.uleb128	.Ll152-.Ll151
	.byte	5
	.uleb128	28
	.byte	14
# [375:14]
	.byte	2
	.uleb128	.Ll153-.Ll152
	.byte	5
	.uleb128	14
	.byte	14
# [376:14]
	.byte	2
	.uleb128	.Ll154-.Ll153
	.byte	13
# [377:14]
	.byte	2
	.uleb128	.Ll155-.Ll154
	.byte	13
# [378:70]
	.byte	2
	.uleb128	.Ll156-.Ll155
	.byte	5
	.uleb128	70
	.byte	13
# [379:23]
	.byte	2
	.uleb128	.Ll157-.Ll156
	.byte	5
	.uleb128	23
	.byte	13
# [373:3]
	.byte	2
	.uleb128	.Ll158-.Ll157
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-6
	.byte	1
# [382:3]
	.byte	2
	.uleb128	.Ll159-.Ll158
	.byte	21
# [383:3]
	.byte	2
	.uleb128	.Ll160-.Ll159
	.byte	13
# [385:29]
	.byte	2
	.uleb128	.Ll161-.Ll160
	.byte	5
	.uleb128	29
	.byte	14
# [386:16]
	.byte	2
	.uleb128	.Ll162-.Ll161
	.byte	5
	.uleb128	16
	.byte	13
# [383:3]
	.byte	2
	.uleb128	.Ll163-.Ll162
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-3
	.byte	1
# [389:3]
	.byte	2
	.uleb128	.Ll164-.Ll163
	.byte	18
# [390:3]
	.byte	2
	.uleb128	.Ll165-.Ll164
	.byte	13
# [391:3]
	.byte	2
	.uleb128	.Ll166-.Ll165
	.byte	13
# [392:3]
	.byte	2
	.uleb128	.Ll167-.Ll166
	.byte	13
# [393:3]
	.byte	2
	.uleb128	.Ll168-.Ll167
	.byte	13
# [394:1]
	.byte	2
	.uleb128	.Ll169-.Ll168
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll170
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_HYPERVISORRUN
# [399:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll171
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	398
	.byte	1
# [400:3]
	.byte	2
	.uleb128	.Ll172-.Ll171
	.byte	5
	.uleb128	3
	.byte	13
# [401:3]
	.byte	2
	.uleb128	.Ll173-.Ll172
	.byte	13
# [403:28]
	.byte	2
	.uleb128	.Ll174-.Ll173
	.byte	5
	.uleb128	28
	.byte	14
# [405:14]
	.byte	2
	.uleb128	.Ll175-.Ll174
	.byte	5
	.uleb128	14
	.byte	14
# [406:71]
	.byte	2
	.uleb128	.Ll176-.Ll175
	.byte	5
	.uleb128	71
	.byte	13
# [407:17]
	.byte	2
	.uleb128	.Ll177-.Ll176
	.byte	5
	.uleb128	17
	.byte	13
# [408:7]
	.byte	2
	.uleb128	.Ll178-.Ll177
	.byte	5
	.uleb128	7
	.byte	13
# [410:7]
	.byte	2
	.uleb128	.Ll179-.Ll178
	.byte	14
# [403:3]
	.byte	2
	.uleb128	.Ll180-.Ll179
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-7
	.byte	1
# [413:33]
	.byte	2
	.uleb128	.Ll181-.Ll180
	.byte	5
	.uleb128	33
	.byte	22
# [414:21]
	.byte	2
	.uleb128	.Ll182-.Ll181
	.byte	5
	.uleb128	21
	.byte	13
# [415:5]
	.byte	2
	.uleb128	.Ll183-.Ll182
	.byte	5
	.uleb128	5
	.byte	13
# [417:3]
	.byte	2
	.uleb128	.Ll184-.Ll183
	.byte	5
	.uleb128	3
	.byte	14
# [418:3]
	.byte	2
	.uleb128	.Ll185-.Ll184
	.byte	13
# [420:3]
	.byte	2
	.uleb128	.Ll186-.Ll185
	.byte	14
# [421:1]
	.byte	2
	.uleb128	.Ll187-.Ll186
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll188
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: SOMA_HYPERVISOR_$$_HYPERVISORSTOP
# [426:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll189
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	425
	.byte	1
# [427:3]
	.byte	2
	.uleb128	.Ll190-.Ll189
	.byte	5
	.uleb128	3
	.byte	13
# [429:21]
	.byte	2
	.uleb128	.Ll191-.Ll190
	.byte	5
	.uleb128	21
	.byte	14
# [431:39]
	.byte	2
	.uleb128	.Ll192-.Ll191
	.byte	5
	.uleb128	39
	.byte	14
# [432:31]
	.byte	2
	.uleb128	.Ll193-.Ll192
	.byte	5
	.uleb128	31
	.byte	13
# [435:28]
	.byte	2
	.uleb128	.Ll194-.Ll193
	.byte	5
	.uleb128	28
	.byte	15
# [437:17]
	.byte	2
	.uleb128	.Ll195-.Ll194
	.byte	5
	.uleb128	17
	.byte	14
# [426:1]
	.byte	2
	.uleb128	.Ll196-.Ll195
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	-11
	.byte	1
# [437:16]
	.byte	2
	.uleb128	.Ll197-.Ll196
	.byte	5
	.uleb128	16
	.byte	23
# [439:36]
	.byte	2
	.uleb128	.Ll198-.Ll197
	.byte	5
	.uleb128	36
	.byte	14
# [440:28]
	.byte	2
	.uleb128	.Ll199-.Ll198
	.byte	5
	.uleb128	28
	.byte	13
# [441:16]
	.byte	2
	.uleb128	.Ll200-.Ll199
	.byte	5
	.uleb128	16
	.byte	13
# [435:3]
	.byte	2
	.uleb128	.Ll201-.Ll200
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-6
	.byte	1
# [445:28]
	.byte	2
	.uleb128	.Ll202-.Ll201
	.byte	5
	.uleb128	28
	.byte	22
# [446:17]
	.byte	2
	.uleb128	.Ll203-.Ll202
	.byte	5
	.uleb128	17
	.byte	13
# [447:24]
	.byte	2
	.uleb128	.Ll204-.Ll203
	.byte	5
	.uleb128	24
	.byte	13
# [445:3]
	.byte	2
	.uleb128	.Ll205-.Ll204
	.byte	5
	.uleb128	3
	.byte	3
	.sleb128	-2
	.byte	1
# [449:3]
	.byte	2
	.uleb128	.Ll206-.Ll205
	.byte	16
# [450:3]
	.byte	2
	.uleb128	.Ll207-.Ll206
	.byte	13
# [451:3]
	.byte	2
	.uleb128	.Ll208-.Ll207
	.byte	13
# [452:1]
	.byte	2
	.uleb128	.Ll209-.Ll208
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll210
	.byte	0
	.byte	1
	.byte	1
# ###################
# function: INIT$_$SOMA_HYPERVISOR
# function: SOMA_HYPERVISOR_$$_init$
# [454:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll211
	.byte	5
	.uleb128	1
	.byte	3
	.sleb128	453
	.byte	1
# [455:3]
	.byte	2
	.uleb128	.Ll212-.Ll211
	.byte	5
	.uleb128	3
	.byte	13
# [456:3]
	.byte	2
	.uleb128	.Ll213-.Ll212
	.byte	13
# [457:3]
	.byte	2
	.uleb128	.Ll214-.Ll213
	.byte	13
# [458:3]
	.byte	2
	.uleb128	.Ll215-.Ll214
	.byte	13
# [459:3]
	.byte	2
	.uleb128	.Ll216-.Ll215
	.byte	13
# [460:3]
	.byte	2
	.uleb128	.Ll217-.Ll216
	.byte	13
# [461:3]
	.byte	2
	.uleb128	.Ll218-.Ll217
	.byte	13
# [462:3]
	.byte	2
	.uleb128	.Ll219-.Ll218
	.byte	13
# [463:3]
	.byte	2
	.uleb128	.Ll220-.Ll219
	.byte	13
# [464:3]
	.byte	2
	.uleb128	.Ll221-.Ll220
	.byte	13
# [466:1]
	.byte	2
	.uleb128	.Ll222-.Ll221
	.byte	5
	.uleb128	1
	.byte	14
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll223
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
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORRUN
	.quad	.Lt2-SOMA_HYPERVISOR_$$_HYPERVISORRUN
	.quad	SOMA_HYPERVISOR_$$_HYPERVISORSTOP
	.quad	.Lt3-SOMA_HYPERVISOR_$$_HYPERVISORSTOP
	.quad	SOMA_HYPERVISOR_$$_init$
	.quad	.Lt4-SOMA_HYPERVISOR_$$_init$
	.quad	SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	.quad	.Lt5-SOMA_HYPERVISOR_$$_ALLOCALIGNED$QWORD$POINTER$$POINTER
	.quad	SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
	.quad	.Lt6-SOMA_HYPERVISOR_$$_INITSHAREDMEMORY
	.quad	SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
	.quad	.Lt7-SOMA_HYPERVISOR_$$_CLOSESHAREDMEMORY
	.quad	SOMA_HYPERVISOR_$$_READTSC$$QWORD
	.quad	.Lt8-SOMA_HYPERVISOR_$$_READTSC$$QWORD
	.quad	SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
	.quad	.Lt9-SOMA_HYPERVISOR_$$_UPDATESHAREDMEMORY
	.quad	SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	.quad	.Lt10-SOMA_HYPERVISOR_$$_RANDOMGENOME$TGENOME$QWORD
	.quad	SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	.quad	.Lt11-SOMA_HYPERVISOR_$$_EVALUATEFITNESS$PVMSTATE$$DOUBLE
	.quad	SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	.quad	.Lt12-SOMA_HYPERVISOR_$$_FINDWORSTIDX$$LONGINT
	.quad	SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	.quad	.Lt13-SOMA_HYPERVISOR_$$_TOURNAMENTSELECT$QWORD$LONGINT$$LONGINT
	.quad	SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
	.quad	.Lt14-SOMA_HYPERVISOR_$$_COLONYTHREADPROC$POINTER$$INT64
	.quad	SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
	.quad	.Lt15-SOMA_HYPERVISOR_$$_STATUSTHREADPROC$POINTER$$INT64
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

