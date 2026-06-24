unit soma_core;
{$mode Delphi}
{$ASMMODE INTEL}
{$J-}

interface

uses
  soma_types;

type
  TOpHandler = procedure(var State: TVMState);

procedure Execute(var State: TVMState);

implementation

procedure _NOP(var State: TVMState);
begin
  Inc(State.ip);
end;

procedure _PUSH(var State: TVMState);
begin
  Inc(State.ip);
  Inc(State.sp);
end;

procedure _POP(var State: TVMState);
begin
  Inc(State.ip);
  Dec(State.sp);
end;

const
  JUMP_TABLE: array[0..2] of TOpHandler = (
    @_NOP,
    @_PUSH,
    @_POP
  );

procedure Execute(var State: TVMState);
var
  opcode: UInt16;
begin
  while State.ip < GENOME_SIZE do
  begin
    opcode := State.genome[State.ip].opcode;
    if opcode > High(JUMP_TABLE) then Break;
    JUMP_TABLE[opcode](State);
  end;
end;

end.
