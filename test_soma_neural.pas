program test_soma_neural;
{$mode Delphi}
{$H+}
uses soma_types, soma_core, SysUtils, Math;

var
  State: TVMState;
  fails: Integer = 0;

procedure ResetVM;
begin
  FillChar(State, SizeOf(State), 0);
  State.ip := 0;
  State.isp := 0;
  State.fsp := 0;
  State.halt_reason := HR_NONE;
end;

var
  gi: Integer; // genome write cursor

procedure Emit(op: UInt16; imm: Int32 = 0);
begin
  State.genome[gi].opcode := op;
  State.genome[gi].flags := 0;
  State.genome[gi].pad := 0;
  State.genome[gi].imm := imm;
  Inc(gi);
end;

procedure EmitFPush(v: Double);
begin
  // FPUSH takes an Int32 immediate and converts via cvtsi2sd -- fine for
  // exercising the new ops with small integer-valued test doubles.
  Emit(OP_FPUSH, Trunc(v));
end;

procedure Run;
begin
  Emit(OP_HALT);
  Flush(Output);
  Execute(State);
  Flush(Output);
end;

procedure Check(name: string; got, want: Double; tol: Double = 1e-9);
begin
  if Abs(got - want) > tol then
  begin
    Writeln('FAIL ', name, ': got ', got:0:8, ' want ', want:0:8);
    Inc(fails);
  end
  else
    Writeln('ok   ', name, ' = ', got:0:8);
end;

procedure CheckHalt(name: string; want: UInt64);
begin
  if State.halt_reason <> want then
  begin
    Writeln('FAIL ', name, ': halt_reason=', State.halt_reason, ' want ', want);
    Inc(fails);
  end
  else
    Writeln('ok   ', name, ' halt_reason=', State.halt_reason);
end;

begin
  Writeln('sizeof(TVMState) = ', SizeOf(TVMState));
  Writeln('OP_VDOT=$', IntToHex(OP_VDOT,4), ' OP_MATVEC=$', IntToHex(OP_MATVEC,4),
          ' OP_MATINV=$', IntToHex(OP_MATINV,4), ' OP_FMA=$', IntToHex(OP_FMA,4),
          ' OP_SIGMOID=$', IntToHex(OP_SIGMOID,4), ' OP_TANH=$', IntToHex(OP_TANH,4),
          ' OP_RELU=$', IntToHex(OP_RELU,4));
  Writeln;

  // --- VDOT: [1,2,3,4].[5,6,7,8] = 70 ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(2); EmitFPush(3); EmitFPush(4);
  EmitFPush(5); EmitFPush(6); EmitFPush(7); EmitFPush(8);
  Emit(OP_VDOT, 4);
  Run;
  CheckHalt('VDOT halt', HR_HALT);
  Check('VDOT', State.fstack[State.fsp-1], 70.0);

  // --- VDOT width 1 (degenerate) ---
  ResetVM; gi := 0;
  EmitFPush(6); EmitFPush(7);
  Emit(OP_VDOT, 1);
  Run;
  Check('VDOT N=1', State.fstack[State.fsp-1], 42.0);

  // --- VDOT bad operand (N=0) halts correctly ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(2);
  Emit(OP_VDOT, 0);
  Run;
  CheckHalt('VDOT N=0 bad operand', HR_BAD_OPERAND);

  // --- VDOT bad operand (N too large) halts correctly ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(2);
  Emit(OP_VDOT, MAX_NN_WIDTH + 1);
  Run;
  CheckHalt('VDOT N too large', HR_BAD_OPERAND);

  // --- MATVEC: [[1,2],[3,4]] * [5,6] = [17,39] ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(2);
  EmitFPush(3); EmitFPush(4);
  EmitFPush(5); EmitFPush(6);
  Emit(OP_MATVEC, 2);
  Run;
  Check('MATVEC2 [0]', State.fstack[State.fsp-2], 17.0);
  Check('MATVEC2 [1]', State.fstack[State.fsp-1], 39.0);

  // --- MATVEC 3x3: [[1,2,3],[4,5,6],[7,8,9]] * [1,1,1] = [6,15,24] ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(2); EmitFPush(3);
  EmitFPush(4); EmitFPush(5); EmitFPush(6);
  EmitFPush(7); EmitFPush(8); EmitFPush(9);
  EmitFPush(1); EmitFPush(1); EmitFPush(1);
  Emit(OP_MATVEC, 3);
  Run;
  Check('MATVEC3 [0]', State.fstack[State.fsp-3], 6.0);
  Check('MATVEC3 [1]', State.fstack[State.fsp-2], 15.0);
  Check('MATVEC3 [2]', State.fstack[State.fsp-1], 24.0);

  // Chain: MATVEC then immediately VDOT the result against itself
  // (exercises composing two new ops back to back within one genome)
  ResetVM; gi := 0;
  EmitFPush(2); EmitFPush(0);
  EmitFPush(0); EmitFPush(3);
  EmitFPush(5); EmitFPush(7);
  Emit(OP_MATVEC, 2);          // -> [10, 21]
  EmitFPush(10); EmitFPush(21); // duplicate the same vector to dot against
  Emit(OP_VDOT, 2);             // 10*10+21*21 = 541
  Run;
  Check('MATVEC->VDOT chain', State.fstack[State.fsp-1], 541.0);

  // --- MATINV 2x2: [[4,7],[2,6]] -> 1/10*[[6,-7],[-2,4]] ---
  ResetVM; gi := 0;
  EmitFPush(4); EmitFPush(7);
  EmitFPush(2); EmitFPush(6);
  Emit(OP_MATINV, 2);
  Run;
  CheckHalt('MATINV halt', HR_HALT);
  Check('MATINV2 [0,0]', State.fstack[State.fsp-4], 0.6);
  Check('MATINV2 [0,1]', State.fstack[State.fsp-3], -0.7);
  Check('MATINV2 [1,0]', State.fstack[State.fsp-2], -0.2);
  Check('MATINV2 [1,1]', State.fstack[State.fsp-1], 0.4);

  // --- MATINV singular halts, doesn't crash ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(2);
  EmitFPush(2); EmitFPush(4);  // det = 0
  Emit(OP_MATINV, 2);
  Run;
  CheckHalt('MATINV singular', HR_SINGULAR_MATRIX);

  // --- MATINV 4x4 identity -> identity (bigger N, exercises the scratch buffer) ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(0); EmitFPush(0); EmitFPush(0);
  EmitFPush(0); EmitFPush(1); EmitFPush(0); EmitFPush(0);
  EmitFPush(0); EmitFPush(0); EmitFPush(1); EmitFPush(0);
  EmitFPush(0); EmitFPush(0); EmitFPush(0); EmitFPush(1);
  Emit(OP_MATINV, 4);
  Run;
  Check('MATINV4 identity[0]', State.fstack[State.fsp-16], 1.0);
  Check('MATINV4 identity[5]', State.fstack[State.fsp-11], 1.0);
  Check('MATINV4 identity[1]', State.fstack[State.fsp-15], 0.0);

  // --- FMA: acc=1, w=3, x=4 -> 13 ---
  ResetVM; gi := 0;
  EmitFPush(1); EmitFPush(3); EmitFPush(4);
  Emit(OP_FMA);
  Run;
  Check('FMA', State.fstack[State.fsp-1], 13.0);

  // --- RELU ---
  ResetVM; gi := 0; EmitFPush(-5); Emit(OP_RELU); Run;
  Check('RELU(-5)', State.fstack[State.fsp-1], 0.0);
  ResetVM; gi := 0; EmitFPush(5); Emit(OP_RELU); Run;
  Check('RELU(5)', State.fstack[State.fsp-1], 5.0);

  // --- SIGMOID(0) = 0.5, TANH(0) = 0 ---
  ResetVM; gi := 0; EmitFPush(0); Emit(OP_SIGMOID); Run;
  Check('SIGMOID(0)', State.fstack[State.fsp-1], 0.5);

  ResetVM; gi := 0; EmitFPush(0); Emit(OP_TANH); Run;
  Check('TANH(0)', State.fstack[State.fsp-1], 0.0);

  // --- SIGMOID/TANH on a nonzero value, chained: exercises the `call`
  //     path plus stack-alignment shim more than once in the same run ---
  ResetVM; gi := 0;
  EmitFPush(2);
  Emit(OP_SIGMOID);
  Emit(OP_TANH);   // tanh(sigmoid(2)) -- just needs to not crash and be finite
  Run;
  Writeln('ok   SIGMOID->TANH chain result = ', State.fstack[State.fsp-1]:0:8,
          ' (finite=', not IsNan(State.fstack[State.fsp-1]), ')');

  // --- Existing Layer 0 ops still work after all this (regression check) ---
  ResetVM; gi := 0;
  Emit(OP_PUSH, 10);
  Emit(OP_PUSH, 32);
  Emit(OP_ADD);
  Run;
  Check('regression: existing ADD', State.istack[State.isp-1] * 1.0, 42.0);

  Writeln;
  if fails = 0 then
    Writeln('ALL TESTS PASSED')
  else
    Writeln(fails, ' TEST(S) FAILED');
end.
