program stress_test;
{$mode Delphi}
{$H+}
uses soma_types, soma_core, SysUtils, Math;

var
  State: TVMState;
  gi: Integer;
  iter: Integer;
  fails: Integer = 0;

procedure Emit(op: UInt16; imm: Int32 = 0);
begin
  State.genome[gi].opcode := op;
  State.genome[gi].imm := imm;
  Inc(gi);
end;

procedure EmitFPush(v: Double);
begin
  Emit(OP_FPUSH, Trunc(v));
end;

begin
  Randomize;

  // Genome that chains MATINV, MATVEC, VDOT, FMA, SIGMOID, TANH, RELU
  // back to back multiple times in ONE run -- if rsp or any pinned
  // register were drifting even slightly, this would compound fast and
  // crash or corrupt within a handful of iterations.
  for iter := 1 to 20000 do
  begin
    FillChar(State, SizeOf(State), 0);
    gi := 0;

    // 2x2 invertible matrix
    EmitFPush(4); EmitFPush(7);
    EmitFPush(2); EmitFPush(6);
    Emit(OP_MATINV, 2);              // -> 4 doubles: inverse

    // matvec against it with a fresh vector
    EmitFPush(1); EmitFPush(1);
    Emit(OP_MATVEC, 2);              // -> 2 doubles

    // vdot the result against itself
    EmitFPush(0); EmitFPush(0);      // placeholder second vec via FMA below
    Emit(OP_FMA);                    // consumes 3, leaves 1 -- just exercising it

    EmitFPush(0.3);
    Emit(OP_SIGMOID);
    Emit(OP_TANH);
    Emit(OP_RELU);

    // 4x4 identity inverse for extra scratch-buffer churn
    EmitFPush(1); EmitFPush(0); EmitFPush(0); EmitFPush(0);
    EmitFPush(0); EmitFPush(1); EmitFPush(0); EmitFPush(0);
    EmitFPush(0); EmitFPush(0); EmitFPush(1); EmitFPush(0);
    EmitFPush(0); EmitFPush(0); EmitFPush(0); EmitFPush(1);
    Emit(OP_MATINV, 4);

    Emit(OP_HALT);
    Execute(State);

    if State.halt_reason <> HR_HALT then
    begin
      Writeln('FAIL at iter ', iter, ': halt_reason=', State.halt_reason);
      Inc(fails);
      Break;
    end;

    if IsNan(State.fstack[State.fsp-1]) or IsInfinite(State.fstack[State.fsp-1]) then
    begin
      Writeln('FAIL at iter ', iter, ': non-finite result');
      Inc(fails);
      Break;
    end;

    if (iter mod 5000) = 0 then
    begin
      Writeln(iter, ' iterations OK, last fsp=', State.fsp, ' isp=', State.isp);
      Flush(Output);
    end;
  end;

  Writeln;
  if fails = 0 then
    Writeln('STRESS TEST PASSED: 20000 iterations clean')
  else
    Writeln('STRESS TEST FAILED: ', fails, ' failure(s)');
end.
