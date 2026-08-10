{$mode Delphi}{$H+}
uses soma_types, soma_core, SysUtils;
var State: TVMState; fails: Integer = 0;
procedure Check(name: string; cond: Boolean);
begin
  if cond then Writeln('ok   ', name) else begin Writeln('FAIL ', name); Inc(fails); end;
end;
begin
  // DIV: MinValue / -1 traps on real x86 idiv
  FillChar(State, SizeOf(State), 0);
  State.istack[0] := Low(Int64); State.istack[1] := -1; State.isp := 2;
  State.genome[0].opcode := OP_DIV;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Writeln('DIV MinValue/-1: halt_reason=', State.halt_reason, ' (want ', HR_INT_OVERFLOW, ')');
  Check('DIV MinValue/-1 halts gracefully, does not crash', State.halt_reason = HR_INT_OVERFLOW);

  // MOD: same trap condition
  FillChar(State, SizeOf(State), 0);
  State.istack[0] := Low(Int64); State.istack[1] := -1; State.isp := 2;
  State.genome[0].opcode := OP_MOD;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Writeln('MOD MinValue/-1: halt_reason=', State.halt_reason, ' (want ', HR_INT_OVERFLOW, ')');
  Check('MOD MinValue/-1 halts gracefully, does not crash', State.halt_reason = HR_INT_OVERFLOW);

  // Sanity: MinValue / -2 is NOT the trap case, should compute normally
  FillChar(State, SizeOf(State), 0);
  State.istack[0] := Low(Int64); State.istack[1] := -2; State.isp := 2;
  State.genome[0].opcode := OP_DIV;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Writeln('DIV MinValue/-2: halt_reason=', State.halt_reason, ' result=', State.istack[0]);
  Check('DIV MinValue/-2 computes normally (not a trap case)',
        (State.halt_reason = HR_HALT) and (State.istack[0] = Low(Int64) div -2));

  // Sanity: ordinary DIV still works
  FillChar(State, SizeOf(State), 0);
  State.istack[0] := 100; State.istack[1] := 7; State.isp := 2;
  State.genome[0].opcode := OP_DIV;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Check('ordinary DIV 100/7 still works', (State.halt_reason = HR_HALT) and (State.istack[0] = 14));

  // Sanity: div by zero still correctly caught (regression on the original guard)
  FillChar(State, SizeOf(State), 0);
  State.istack[0] := 100; State.istack[1] := 0; State.isp := 2;
  State.genome[0].opcode := OP_DIV;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Check('div by zero still correctly caught', State.halt_reason = HR_DIV_ZERO);

  Writeln;
  if fails = 0 then Writeln('ALL DIVZERO-REPRO TESTS PASSED') else Writeln(fails, ' FAILED');
end.
