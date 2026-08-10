program crash_repro;
{$mode Delphi}
{$H+}
uses soma_types, soma_core, SysUtils;

var
  State: TVMState;
  fails: Integer = 0;

procedure Check(name: string; cond: Boolean);
begin
  if cond then Writeln('ok   ', name) else begin Writeln('FAIL ', name); Inc(fails); end;
end;

begin
  // Scenario: fsp = 0 (empty float stack, e.g. after floor-clamping), then
  // immediately a MATVEC with N=MAX_NN_WIDTH. Operand window = N*N+N = 72
  // doubles = 576 bytes below fsp=0 -- wider than the 256-byte guard
  // region. Before the fix, this walked off the front of the allocated
  // TVMState block. Must now halt cleanly with HR_INSUFFICIENT_STACK,
  // not fault.
  FillChar(State, SizeOf(State), 0);
  State.genome[0].opcode := OP_MATVEC;
  State.genome[0].imm := MAX_NN_WIDTH;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Writeln('MATVEC@fsp=0,N=8: halt_reason=', State.halt_reason,
          ' (want ', HR_INSUFFICIENT_STACK, ')');
  Check('MATVEC with empty stack halts gracefully, does not crash',
        State.halt_reason = HR_INSUFFICIENT_STACK);

  // Same for MATINV (N*N = 64 doubles = 512 bytes)
  FillChar(State, SizeOf(State), 0);
  State.genome[0].opcode := OP_MATINV;
  State.genome[0].imm := MAX_NN_WIDTH;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Writeln('MATINV@fsp=0,N=8: halt_reason=', State.halt_reason,
          ' (want ', HR_INSUFFICIENT_STACK, ')');
  Check('MATINV with empty stack halts gracefully, does not crash',
        State.halt_reason = HR_INSUFFICIENT_STACK);

  // Same for VDOT (2N = 16 doubles = 128 bytes -- fits the guard, but
  // should still halt cleanly rather than read garbage/uninitialized
  // memory as if it were valid stack content)
  FillChar(State, SizeOf(State), 0);
  State.genome[0].opcode := OP_VDOT;
  State.genome[0].imm := MAX_NN_WIDTH;
  State.genome[1].opcode := OP_HALT;
  Execute(State);
  Writeln('VDOT@fsp=0,N=8: halt_reason=', State.halt_reason,
          ' (want ', HR_INSUFFICIENT_STACK, ')');
  Check('VDOT with empty stack halts gracefully rather than reading garbage',
        State.halt_reason = HR_INSUFFICIENT_STACK);

  // Partial stack: 3 floats present, MATVEC needs way more (N=8 needs 72)
  FillChar(State, SizeOf(State), 0);
  State.genome[0].opcode := OP_FPUSH; State.genome[0].imm := 1;
  State.genome[1].opcode := OP_FPUSH; State.genome[1].imm := 2;
  State.genome[2].opcode := OP_FPUSH; State.genome[2].imm := 3;
  State.genome[3].opcode := OP_MATVEC; State.genome[3].imm := MAX_NN_WIDTH;
  State.genome[4].opcode := OP_HALT;
  Execute(State);
  Writeln('MATVEC with 3/72 needed: halt_reason=', State.halt_reason,
          ' (want ', HR_INSUFFICIENT_STACK, ')');
  Check('MATVEC with a partially-filled but insufficient stack halts cleanly',
        State.halt_reason = HR_INSUFFICIENT_STACK);

  // Sanity: MATVEC with EXACTLY enough on the stack still works normally
  // (this is the "N valid, base=0 exactly, not negative" boundary case)
  FillChar(State, SizeOf(State), 0);
  State.genome[0].opcode := OP_FPUSH; State.genome[0].imm := 1;
  State.genome[1].opcode := OP_FPUSH; State.genome[1].imm := 0;
  State.genome[2].opcode := OP_FPUSH; State.genome[2].imm := 0;
  State.genome[3].opcode := OP_FPUSH; State.genome[3].imm := 1;
  State.genome[4].opcode := OP_FPUSH; State.genome[4].imm := 5;
  State.genome[5].opcode := OP_FPUSH; State.genome[5].imm := 7;
  State.genome[6].opcode := OP_MATVEC; State.genome[6].imm := 2;
  State.genome[7].opcode := OP_HALT;
  Execute(State);
  Writeln('MATVEC boundary case (base=0 exactly): halt_reason=', State.halt_reason,
          ' result=[', State.fstack[0]:0:2, ',', State.fstack[1]:0:2, ']');
  Check('MATVEC still works normally when the stack exactly covers the operand window',
        (State.halt_reason = HR_HALT) and (State.fstack[0] = 5.0) and (State.fstack[1] = 7.0));

  Writeln;
  if fails = 0 then Writeln('ALL CRASH-REPRO TESTS PASSED')
  else Writeln(fails, ' FAILED');
end.
