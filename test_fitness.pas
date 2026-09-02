program test_fitness;
{$mode Delphi}{$H+}
uses soma_types, soma_fitness, SysUtils;

var
  fails: Integer = 0;

procedure Check(name: string; cond: Boolean);
begin
  if cond then Writeln('ok   ', name) else begin Writeln('FAIL ', name); Inc(fails); end;
end;

procedure TestLoadTarget;
var
  target: TFitnessTarget;
begin
  target := LoadFitnessTarget('fitness_sort.json');
  Check('name loaded',         target.name = 'sort_integers');
  Check('input_count loaded',  target.input_count = 8);
  Check('two criteria loaded', Length(target.criteria) = 2);
  Check('first metric name',   target.criteria[0].metric = 'array_sorted');
end;

procedure TestSeedAndScorePerfectSort;
var
  state: TVMState;
  target: TFitnessTarget;
  result: TFitnessResult;
  rng: UInt64;
  i: Integer;
begin
  target := LoadFitnessTarget('fitness_sort.json');
  FillChar(state, SizeOf(state), 0);
  rng := $C0FFEE1234567890;
  SeedFitnessInput(state, target, rng);

  // Simulate a genome that "solved" sorting perfectly: force istack
  // ascending, then score as if Execute() had just produced this.
  for i := 0 to target.input_count - 1 do
    state.istack[i] := i;
  state.halt_reason := HR_HALT;
  state.ip := 100;
  state.isp := target.input_count - 1;

  result := EvaluateFitnessTarget(state, target, []);
  Check('perfectly sorted array_sorted metric = 1.0', result.metrics[0] = 1.0);
  Check('perfect sort passes gate', result.passed);
  Writeln('       score = ', result.score:0:4);
end;

procedure TestScoreUnsortedGenome;
var
  state: TVMState;
  target: TFitnessTarget;
  result: TFitnessResult;
  rng: UInt64;
begin
  target := LoadFitnessTarget('fitness_sort.json');
  FillChar(state, SizeOf(state), 0);
  rng := $DEADBEEF;
  SeedFitnessInput(state, target, rng);
  // leave istack as randomly-seeded (effectively unsorted) -- genome did nothing
  state.halt_reason := HR_BOUNDS;  // simulate a fault
  state.ip := 3;

  result := EvaluateFitnessTarget(state, target, []);
  Check('faulted genome does not pass gate', not result.passed);
  Writeln('       unsorted/faulted score = ', result.score:0:4);
end;

begin
  TestLoadTarget;
  TestSeedAndScorePerfectSort;
  TestScoreUnsortedGenome;
  Writeln;
  if fails = 0 then Writeln('ALL PASS') else Writeln(fails, ' FAILURE(S)');
end.
