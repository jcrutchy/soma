program soma;

{$mode Delphi}

uses
  soma_types,
  soma_core,
  soma_hypervisor, soma_mutate;

var
  StateSize: Integer;
  OK:        Boolean;

begin
  OK        := True;
  StateSize := SizeOf(TVMState);

  WriteLn('SOMA - Self Organizing Machine Architecture');
  WriteLn('===========================================');
  WriteLn;
  WriteLn('Startup checks:');

  if SizeOf(TInstruction) <> 8 then
  begin
    WriteLn('FAIL: TInstruction = ', SizeOf(TInstruction), ' (expected 8)');
    OK := False;
  end else
    WriteLn('OK   TInstruction = 8 bytes');

  if (StateSize mod 64) <> 0 then
  begin
    WriteLn('FAIL: TVMState = ', StateSize, ' (not 64-byte aligned)');
    OK := False;
  end else
    WriteLn('OK   TVMState = ', StateSize, ' bytes (64-byte aligned)');

  if GENOME_OFFSET <> 4392 then
  begin
    WriteLn('FAIL: GENOME_OFFSET = ', GENOME_OFFSET, ' (expected 4392)');
    OK := False;
  end else
    WriteLn('OK   GENOME_OFFSET = 4392');

  if VALID_OPCODE_COUNT <> 67 then
  begin
    WriteLn('FAIL: VALID_OPCODE_COUNT = ', VALID_OPCODE_COUNT, ' (expected 67)');
    OK := False;
  end else
    WriteLn('OK   VALID_OPCODE_COUNT = 67');

  WriteLn;

  if not OK then
  begin
    WriteLn('Startup checks FAILED. Press Enter to exit.');
    Readln;
    Halt(1);
  end;

  WriteLn('All checks passed.');
  WriteLn;

  HypervisorInit(1);  // start with 4 colonies
  HypervisorRun;      // blocks until Enter pressed
  HypervisorStop;

  WriteLn;
  WriteLn('Press Enter to exit...');
  Readln;
end.
