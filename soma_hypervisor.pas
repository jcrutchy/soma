unit soma_hypervisor;

{$mode Delphi}
{$ASMMODE INTEL}

interface

uses
  soma_types, soma_core,
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
  Colonies:       array[0..MAX_COLONIES-1] of TColonyThread;
  Population:     TPopulation;
  Generation:     UInt64;
  ColonyCount:    Integer;
  BestFitness:    Double;
  AvgFitness:     Double;
  Running:        Boolean;
  HyperCS:        TRTLCriticalSection;
  ShmemHandle:    THandle;
  Shmem:          ^TSOMAShmem;
  StartTime:      UInt64;
  StatusThreadID: TThreadID;

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

procedure XorShift64(var rng: UInt64); inline;
begin
  rng := rng xor (rng shl 13);
  rng := rng xor (rng shr 7);
  rng := rng xor (rng shl 17);
end;

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
// Fitness evaluation (stub)
//------------------------------------------------------------

function EvaluateFitness(state: PVMState): Double;
begin
  Result := 0.0;
end;

//------------------------------------------------------------
// Colony thread
//------------------------------------------------------------

function ColonyThreadProc(param: Pointer): PtrInt;
var
  col:        ^TColonyThread;
  state:      PVMState;
  t0, t1:     UInt64;
  genome_idx: Integer;
begin
  col   := param;
  state := col^.state;

  state^.rng_state := UInt64(col^.colony_id + 1) * $6C62272E07BB0142;

  while Running do
  begin
    EnterCriticalSection(HyperCS);
    genome_idx := col^.colony_id mod POPULATION_SIZE;
    state^.genome := Population[genome_idx];
    LeaveCriticalSection(HyperCS);

    state^.ip          := 0;
    state^.isp         := 0;
    state^.fsp         := 0;
    state^.halt_reason := HR_NONE;

    t0 := ReadTSC;
    Execute(state^);
    t1 := ReadTSC;

    col^.exec_cycles := t1 - t0;
    col^.fitness      := EvaluateFitness(state);
    col^.generation    := Generation;

    EnterCriticalSection(HyperCS);
    Inc(Generation);
    LeaveCriticalSection(HyperCS);
  end;

  Result := 0;
end;

//------------------------------------------------------------
// Status thread - prints stats, updates shared memory
//------------------------------------------------------------

function StatusThreadProc(param: Pointer): PtrInt;
var
  i: Integer;
begin
  while Running do
  begin
    Sleep(500);
    if not Running then Break;

    UpdateSharedMemory;

    EnterCriticalSection(HyperCS);
    BestFitness := 0.0;
    AvgFitness  := 0.0;
    for i := 0 to ColonyCount-1 do
    begin
      AvgFitness := AvgFitness + Colonies[i].fitness;
      if Colonies[i].fitness > BestFitness then
        BestFitness := Colonies[i].fitness;
    end;
    if ColonyCount > 0 then
      AvgFitness := AvgFitness / ColonyCount;
    LeaveCriticalSection(HyperCS);

    WriteLn('Gen: ', Generation,
            '  Best: ', BestFitness:6:4,
            '  Avg: ',  AvgFitness:6:4);
  end;
  Result := 0;
end;

//------------------------------------------------------------
// Public interface
//------------------------------------------------------------

procedure HypervisorInit(colony_count: Integer);
var
  i:   Integer;
  rng: UInt64;
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

  for i := 0 to ColonyCount-1 do
  begin
    Colonies[i].colony_id := i;
    Colonies[i].active    := False;
    Colonies[i].fitness   := 0.0;
    Colonies[i].state     := AllocAligned(SizeOf(TVMState), Colonies[i].raw_alloc);
    FillChar(Colonies[i].state^, SizeOf(TVMState), 0);
  end;

  rng := UInt64($CAFE1234DEADBEEF);
  for i := 0 to POPULATION_SIZE-1 do
    RandomGenome(Population[i], rng);

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

  // signal all threads to stop
  Running := False;
end;

procedure HypervisorStop;
var
  i: Integer;
begin
  WriteLn('Stopping hypervisor...');

  // wait for status thread
  if StatusThreadID <> 0 then
  begin
    WaitForSingleObject(StatusThreadID, 2000);
    CloseHandle(StatusThreadID);
  end;

  // wait for all colony threads
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
  Running        := False;
  ShmemHandle    := 0;
  Shmem          := nil;
  StartTime      := 0;
  Generation     := 0;
  StatusThreadID := 0;

end.
