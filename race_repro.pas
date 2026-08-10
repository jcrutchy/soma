program race_repro;
{$mode Delphi}{$H+}
uses
  {$IFDEF UNIX}cthreads,{$ENDIF}
  SysUtils, Classes;

const
  GENOME_SIZE = 4096;

type
  TInstr = packed record
    opcode: UInt16;
    flags:  UInt8;
    pad:    UInt8;
    imm:    Int32;
  end;
  TGenome = array[0..GENOME_SIZE-1] of TInstr;

var
  Slot: TGenome;              // the shared, racy slot (like Population[worst_idx])
  CS:   TRTLCriticalSection;
  StopFlag: Boolean;
  TornReadsUnlocked: Integer;
  TornReadsLocked:   Integer;
  TotalReadsUnlocked: Integer;
  TotalReadsLocked:   Integer;

procedure FillPattern(var G: TGenome; tag: UInt16);
var i: Integer;
begin
  for i := 0 to GENOME_SIZE - 1 do
  begin
    G[i].opcode := tag;
    G[i].flags  := 0;
    G[i].pad    := 0;
    G[i].imm    := Int32(tag) * 1000 + i;   // encodes position too, so we can
  end;                                       // detect ANY inconsistency at all
end;

// Returns True if every instruction in G is internally consistent with
// EITHER the "pattern A" (tag=1) or "pattern B" (tag=2) shape -- i.e. no
// torn mix of the two. This is the direct, checkable fingerprint of a
// torn concurrent read.
function IsConsistent(const G: TGenome): Boolean;
var
  i: Integer;
  tag: UInt16;
begin
  tag := G[0].opcode;
  if (tag <> 1) and (tag <> 2) then
  begin
    Result := False;
    Exit;
  end;
  for i := 0 to GENOME_SIZE - 1 do
  begin
    if G[i].opcode <> tag then begin Result := False; Exit; end;
    if G[i].imm <> (Int32(tag) * 1000 + i) then begin Result := False; Exit; end;
  end;
  Result := True;
end;

type
  TWriterThread = class(TThread)
  protected
    procedure Execute; override;
  end;

  TReaderThreadUnlocked = class(TThread)
  protected
    procedure Execute; override;
  end;

  TReaderThreadLocked = class(TThread)
  protected
    procedure Execute; override;
  end;

var
  GenomeA, GenomeB: TGenome;

procedure TWriterThread.Execute;
begin
  while not StopFlag do
  begin
    EnterCriticalSection(CS);
    Slot := GenomeA;   // 32KB struct assignment -- NOT atomic
    LeaveCriticalSection(CS);

    EnterCriticalSection(CS);
    Slot := GenomeB;
    LeaveCriticalSection(CS);
  end;
end;

procedure TReaderThreadUnlocked.Execute;
var
  local: TGenome;
begin
  while not StopFlag do
  begin
    local := Slot;   // deliberately UNLOCKED read -- this is the bug pattern
    Inc(TotalReadsUnlocked);
    if not IsConsistent(local) then
      Inc(TornReadsUnlocked);
  end;
end;

procedure TReaderThreadLocked.Execute;
var
  local: TGenome;
begin
  while not StopFlag do
  begin
    EnterCriticalSection(CS);
    local := Slot;   // properly locked read -- this is the fix
    LeaveCriticalSection(CS);
    Inc(TotalReadsLocked);
    if not IsConsistent(local) then
      Inc(TornReadsLocked);
  end;
end;

var
  writer: TWriterThread;
  readerU1, readerU2: TReaderThreadUnlocked;
  readerL1, readerL2: TReaderThreadLocked;

begin
  InitCriticalSection(CS);
  FillPattern(GenomeA, 1);
  FillPattern(GenomeB, 2);
  Slot := GenomeA;

  TornReadsUnlocked := 0; TotalReadsUnlocked := 0;
  TornReadsLocked   := 0; TotalReadsLocked   := 0;
  StopFlag := False;

  Writeln('Running writer + 2 unlocked readers + 2 locked readers for 3 seconds...');

  writer   := TWriterThread.Create(False);
  readerU1 := TReaderThreadUnlocked.Create(False);
  readerU2 := TReaderThreadUnlocked.Create(False);
  readerL1 := TReaderThreadLocked.Create(False);
  readerL2 := TReaderThreadLocked.Create(False);

  Sleep(3000);
  StopFlag := True;

  writer.WaitFor;   writer.Free;
  readerU1.WaitFor;  readerU1.Free;
  readerU2.WaitFor;  readerU2.Free;
  readerL1.WaitFor;  readerL1.Free;
  readerL2.WaitFor;  readerL2.Free;

  Writeln;
  Writeln('UNLOCKED reads (the original bug pattern):');
  Writeln('  total reads: ', TotalReadsUnlocked);
  Writeln('  torn reads : ', TornReadsUnlocked);
  Writeln;
  Writeln('LOCKED reads (the fix):');
  Writeln('  total reads: ', TotalReadsLocked);
  Writeln('  torn reads : ', TornReadsLocked);
  Writeln;

  if TornReadsUnlocked > 0 then
    Writeln('CONFIRMED: unlocked concurrent reads DO tear on a 32KB-scale struct.')
  else
    Writeln('No tearing observed this run (timing-dependent -- does not mean it cannot happen).');

  if TornReadsLocked = 0 then
    Writeln('CONFIRMED: locked reads show zero tearing, as expected.')
  else
    Writeln('UNEXPECTED: locked reads showed tearing -- something else is wrong.');

  DoneCriticalSection(CS);
end.
