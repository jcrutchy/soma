unit soma_hypervisor;

{$mode Delphi}

interface

uses
  soma_types, soma_core, soma_mutate, soma_fitness,
  fpjson, jsonparser,
  Windows,
  SysUtils;

const
  MAX_COLONIES    = 16;
  POPULATION_SIZE = 128;

type
  PVMState = ^TVMState;

  TColonyThread = record
    thread_id:    TThreadID;
    state:        PVMState;
    raw_alloc:    Pointer;
    active:       Boolean;
    colony_id:    Integer;
    fitness:      Double;
    exec_cycles:  UInt64;
    generation:   UInt64;
  end;

  TPopulation = array[0..POPULATION_SIZE-1] of TGenome;
  TFitnessArr = array[0..POPULATION_SIZE-1] of Double;

  TSOMAShmem = packed record
    magic:           UInt32;
    generation:      UInt64;
    active_colonies: UInt32;
    best_fitness:    Double;
    avg_fitness:     Double;
    diversity:       Double;
    codon_count:     UInt32;
    uptime_secs:     UInt64;
    pad:             array[0..11] of Byte;
  end;

var
  Colonies:        array[0..MAX_COLONIES-1] of TColonyThread;
  Population:       TPopulation;
  PopFitness:       TFitnessArr;
  Generation:       UInt64;
  ColonyCount:      Integer;
  BestFitness:      Double;
  AvgFitness:       Double;
  BestGenomeIdx:    Integer;
  Running:          Boolean;
  HyperCS:          TRTLCriticalSection;
  ShmemHandle:      THandle;
  Shmem:            ^TSOMAShmem;
  StartTime:        UInt64;
  StatusThreadID:   TThreadID;
  GlobalRNG:        UInt64;
  FitnessTarget:    TFitnessTarget;  // loaded once in InitHypervisor, read-only after that

procedure HypervisorInit(colony_count: Integer);
procedure HypervisorRun;
procedure HypervisorStop;

implementation

//------------------------------------------------------------
// Aligned allocation
//------------------------------------------------------------

function AllocAligned(size: PtrUInt; out raw: Pointer): Pointer;
var
  p: PtrUInt;
begin
  raw    := GetMem(size + 63);
  p      := PtrUInt(raw);
  p      := (p + 63) and not PtrUInt(63);
  Result := Pointer(p);
end;

//------------------------------------------------------------
// Shared memory
//------------------------------------------------------------

procedure InitSharedMemory;
const
  SHMEM_NAME = 'SOMA_LiveView';
begin
  ShmemHandle := CreateFileMapping(
    INVALID_HANDLE_VALUE, nil,
    PAGE_READWRITE, 0,
    SizeOf(TSOMAShmem),
    SHMEM_NAME
  );
  if ShmemHandle = 0 then
  begin
    WriteLn('WARNING: Could not create shared memory: ', GetLastError);
    Shmem := nil;
    Exit;
  end;
  Shmem := MapViewOfFile(ShmemHandle, FILE_MAP_ALL_ACCESS, 0, 0, SizeOf(TSOMAShmem));
  if Shmem = nil then
    WriteLn('WARNING: Could not map shared memory: ', GetLastError)
  else
  begin
    FillChar(Shmem^, SizeOf(TSOMAShmem), 0);
    Shmem^.magic := $534F4D41;
  end;
end;

procedure CloseSharedMemory;
begin
  if Shmem <> nil then UnmapViewOfFile(Shmem);
  if ShmemHandle <> 0 then CloseHandle(ShmemHandle);
end;

function ReadTSC: UInt64;
var
  r: UInt64;
begin
  asm
    rdtsc
    shl rdx, 32
    or  rax, rdx
    mov r, rax
  end;
  Result := r;
end;

procedure UpdateSharedMemory;
begin
  if Shmem = nil then Exit;
  Shmem^.generation      := Generation;
  Shmem^.active_colonies := ColonyCount;
  Shmem^.best_fitness    := BestFitness;
  Shmem^.avg_fitness     := AvgFitness;
  Shmem^.uptime_secs     := (ReadTSC - StartTime) div 3000000000;
  Shmem^.codon_count     := 0;
end;

//------------------------------------------------------------
// Genome initialisation
//------------------------------------------------------------

procedure RandomGenome(var G: TGenome; var rng: UInt64);
var
  i: Integer;
begin
  for i := 0 to GENOME_SIZE-1 do
  begin
    XorShift64(rng);
    G[i].opcode := VALID_OPCODES[rng mod VALID_OPCODE_COUNT];
    G[i].flags  := 0;
    G[i].pad    := 0;
    G[i].imm    := Int32((rng shr 32) mod 128) - 64;
  end;
end;

//------------------------------------------------------------
// Fitness evaluation
//------------------------------------------------------------

// Replaces the old crude survival+activity proxy. Delegates entirely to
// soma_fitness.pas: FitnessTarget is loaded once (see InitHypervisor) from
// a JSON file naming a weighted pipeline of primitives, so changing what
// a genome is scored against no longer requires touching this unit at all.
function EvaluateFitness(state: PVMState): Double;
var
  fr: TFitnessResult;
begin
  fr := EvaluateFitnessTarget(state^, FitnessTarget, []);
  Result := fr.score;
end;

//------------------------------------------------------------
// Selection and replacement
//------------------------------------------------------------

// Find the index of the worst-performing genome in the population.
// Used as the replacement target for new offspring.
function FindWorstIdx: Integer;
var
  i: Integer;
  worst: Double;
begin
  Result := 0;
  worst  := PopFitness[0];
  for i := 1 to POPULATION_SIZE-1 do
    if PopFitness[i] < worst then
    begin
      worst  := PopFitness[i];
      Result := i;
    end;
end;

// Simple tournament selection: pick K random candidates, return the
// fittest of them. Cheap, no need to sort the whole population.
function TournamentSelect(var rng: UInt64; k: Integer): Integer;
var
  i, candidate: Integer;
  best_idx: Integer;
  best_fit: Double;
begin
  XorShift64(rng);
  best_idx := rng mod POPULATION_SIZE;
  best_fit := PopFitness[best_idx];

  for i := 1 to k-1 do
  begin
    XorShift64(rng);
    candidate := rng mod POPULATION_SIZE;
    if PopFitness[candidate] > best_fit then
    begin
      best_fit := PopFitness[candidate];
      best_idx := candidate;
    end;
  end;

  Result := best_idx;
end;

//------------------------------------------------------------
// Colony thread
//------------------------------------------------------------

function ColonyThreadProc(param: Pointer): PtrInt;
var
  col:        ^TColonyThread;
  state:      PVMState;
  t0, t1:     UInt64;
  parent_idx: Integer;
  worst_idx:  Integer;
  local_rng:  UInt64;
  offspring:  TGenome;
begin
  col   := param;
  state := col^.state;

  local_rng := UInt64(col^.colony_id + 1) * $6C62272E07BB0142;
  state^.rng_state := local_rng;

  while Running do
  begin
    // --- select a parent, produce offspring, and mutate: ALL under lock.
    // MutateGenome's copy-block operator reads live Population data too
    // (source_pool, not just the parent copy) -- previously that read
    // happened UNLOCKED here while another thread could be concurrently
    // executing `Population[worst_idx] := offspring;` below under lock.
    // That's a genuine data race on a 32KB, non-atomic struct assignment:
    // a concurrent unlocked reader can observe a torn genome mid-write,
    // handing Execute() an instruction stream that isn't just "randomly
    // mutated" but arbitrarily inconsistent -- opcode/imm pairs that
    // never came from the same instruction, not bounded by any of the
    // assumptions the rest of the VM's hardening relies on. This is
    // exactly the class of bug that never reproduces under single-
    // threaded fuzzing (confirmed: it doesn't) but can crash unpredictably
    // under real concurrent execution. Mutation itself is cheap, pure
    // in-memory work -- a few array writes -- so covering it under the
    // same lock as the parent-copy costs microseconds, negligible next
    // to Execute() (which correctly stays OUTSIDE the lock below, since
    // that's the genuinely expensive part).
    EnterCriticalSection(HyperCS);
    parent_idx := TournamentSelect(local_rng, 4);
    offspring  := Population[parent_idx];
    MutateGenome(offspring, Population, local_rng);
    LeaveCriticalSection(HyperCS);

    // --- evaluate offspring ---
    state^.genome       := offspring;
    state^.ip           := 0;
    state^.fsp          := 0;
    state^.halt_reason  := HR_NONE;

    // Seeds istack[0..input_count-1] with the array to sort AND sets isp
    // -- must happen after the ip/fsp/halt_reason reset above but replaces
    // the old flat "isp := 0", since the genome needs to see its input
    // already on the stack when execution starts.
    SeedFitnessInput(state^, FitnessTarget, local_rng);

    t0 := ReadTSC;
    Execute(state^);
    t1 := ReadTSC;

    col^.exec_cycles := t1 - t0;
    col^.fitness      := EvaluateFitness(state);
    col^.generation    := Generation;

    // --- replace worst-in-population if offspring is fitter ---
    EnterCriticalSection(HyperCS);
    worst_idx := FindWorstIdx;
    if col^.fitness > PopFitness[worst_idx] then
    begin
      Population[worst_idx] := offspring;
      PopFitness[worst_idx] := col^.fitness;
    end;
    Inc(Generation);
    LeaveCriticalSection(HyperCS);
  end;

  Result := 0;
end;

//------------------------------------------------------------
// Status thread
//------------------------------------------------------------

function StatusThreadProc(param: Pointer): PtrInt;
var
  i: Integer;
  sum: Double;
begin
  while Running do
  begin
    Sleep(500);
    if not Running then Break;

    UpdateSharedMemory;

    EnterCriticalSection(HyperCS);
    BestFitness   := PopFitness[0];
    BestGenomeIdx := 0;
    sum := 0.0;
    for i := 0 to POPULATION_SIZE-1 do
    begin
      sum := sum + PopFitness[i];
      if PopFitness[i] > BestFitness then
      begin
        BestFitness   := PopFitness[i];
        BestGenomeIdx := i;
      end;
    end;
    AvgFitness := sum / POPULATION_SIZE;
    LeaveCriticalSection(HyperCS);

    WriteLn('Gen: ', Generation,
            '  Best: ', BestFitness:6:4,
            '  Avg: ',  AvgFitness:6:4,
            '  (genome #', BestGenomeIdx, ')');
  end;
  Result := 0;
end;

//------------------------------------------------------------
// Public interface
//------------------------------------------------------------

procedure HypervisorInit(colony_count: Integer);
var
  i: Integer;
begin
  if colony_count > MAX_COLONIES then colony_count := MAX_COLONIES;
  if colony_count < 1 then colony_count := 1;
  ColonyCount := colony_count;
  Generation  := 0;
  BestFitness := 0.0;
  AvgFitness  := 0.0;
  Running     := False;

  InitCriticalSection(HyperCS);
  InitSharedMemory;
  StartTime := ReadTSC;

  // Loaded once here, read-only for the life of the run. Change what
  // genomes are scored against by editing fitness_sort.json and
  // restarting -- no recompile needed.
  FitnessTarget := LoadFitnessTarget('fitness_sort.json');
  WriteLn('  Fitness target: ', FitnessTarget.name, ' v', FitnessTarget.version);

  for i := 0 to ColonyCount-1 do
  begin
    Colonies[i].colony_id := i;
    Colonies[i].active    := False;
    Colonies[i].fitness   := 0.0;
    Colonies[i].state     := AllocAligned(SizeOf(TVMState), Colonies[i].raw_alloc);
    FillChar(Colonies[i].state^, SizeOf(TVMState), 0);
  end;

  GlobalRNG := UInt64($CAFE1234DEADBEEF);
  for i := 0 to POPULATION_SIZE-1 do
  begin
    RandomGenome(Population[i], GlobalRNG);
    PopFitness[i] := 0.0;
  end;

  WriteLn('SOMA Hypervisor initialised');
  WriteLn('  Colonies  : ', ColonyCount);
  WriteLn('  Population: ', POPULATION_SIZE);
  WriteLn('  VMState   : ', SizeOf(TVMState), ' bytes per colony');
  WriteLn('  Total RAM : ', (ColonyCount * SizeOf(TVMState)) div 1024, ' KB for VM states');
end;

procedure HypervisorRun;
var
  i: Integer;
begin
  Running := True;
  WriteLn('Starting colony threads...');

  for i := 0 to ColonyCount-1 do
  begin
    Colonies[i].active    := True;
    Colonies[i].thread_id := BeginThread(@ColonyThreadProc, @Colonies[i]);
    if Colonies[i].thread_id = 0 then
      WriteLn('WARNING: Failed to start colony thread ', i)
    else
      WriteLn('  Colony ', i, ' started (thread ', Colonies[i].thread_id, ')');
  end;

  StatusThreadID := BeginThread(@StatusThreadProc, nil);
  if StatusThreadID = 0 then
    WriteLn('WARNING: Failed to start status thread');

  WriteLn('Hypervisor running. Press Enter to stop...');
  Readln;

  Running := False;
end;

procedure HypervisorStop;
var
  i: Integer;
begin
  WriteLn('Stopping hypervisor...');

  if StatusThreadID <> 0 then
  begin
    WaitForSingleObject(StatusThreadID, 2000);
    CloseHandle(StatusThreadID);
  end;

  for i := 0 to ColonyCount-1 do
  begin
    if Colonies[i].active and (Colonies[i].thread_id <> 0) then
    begin
      WaitForSingleObject(Colonies[i].thread_id, 5000);
      CloseHandle(Colonies[i].thread_id);
      Colonies[i].active := False;
    end;
  end;

  for i := 0 to ColonyCount-1 do
    if Colonies[i].raw_alloc <> nil then
      FreeMem(Colonies[i].raw_alloc);

  CloseSharedMemory;
  DoneCriticalSection(HyperCS);
  WriteLn('Hypervisor stopped. Total generations: ', Generation);
end;

initialization
  FillChar(Colonies,   SizeOf(Colonies),   0);
  FillChar(Population, SizeOf(Population), 0);
  FillChar(PopFitness, SizeOf(PopFitness), 0);
  Running        := False;
  ShmemHandle    := 0;
  Shmem          := nil;
  StartTime      := 0;
  Generation     := 0;
  StatusThreadID := 0;
  BestGenomeIdx  := 0;

end.

