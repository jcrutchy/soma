unit soma_fitness;

{ ==========================================================================
  JSON-driven fitness pipeline. Implements the architecture decided in
  readme.md section 7: fitness targets are DATA (a JSON file naming a
  small pipeline of measurement primitives plus weighted scoring rules),
  not compiled code -- editable without recompilation, and fully
  transparent (read the JSON, know exactly what a genome is scored
  against).

  This supersedes the DLL/stdcall TFitnessFn plugin design still present
  in soma_types.pas (from the original plan.md draft) -- that interface
  is left in place for now since TFitnessResult is reused here as the
  return shape, but no DLL loading is implemented or planned.

  Deliberately narrow scope for v1, per plan.md's stated preference:
  a fixed, compiled library of primitives referenced by name from JSON,
  no general expression evaluator (added later only if composition alone
  proves insufficient). Two primitives to start:

    survival       -- proxy fitness from halt_reason/ip (same signal as
                       the crude EvaluateFitness stub currently in
                       soma_hypervisor.pas, factored out here so it can
                       be combined with real benchmarks via weights)
    array_sorted    -- fraction of adjacent pairs in a named istack slice
                       that are in non-descending order; 1.0 = fully sorted

  Adding a new primitive is: extend TPrimitiveKind, extend the case
  statement in RunPrimitive, done. No JSON schema change needed for
  weighting or combination -- that's handled generically by "criteria".
  ========================================================================== }

{$mode Delphi}
{$H+}

interface

uses
  soma_types, fpjson, jsonparser, SysUtils, Classes;

type
  TPrimitiveKind = (pkSurvival, pkArraySorted);

  TFitnessCriterion = record
    metric: string;   // name of a primitive OR "survival"
    weight: Double;
  end;

  // Describes how to seed VM input state before Execute() runs, and what
  // to score afterward. v1 covers exactly the "sorting" training-wheels
  // target from plan.md section on Training Wheels Progression; extend
  // with more fields (e.g. a matrix shape) as later targets are added.
  TFitnessTarget = record
    name:         string;
    version:      UInt16;
    input_count:  Integer;   // how many istack slots to seed as the array to sort
    input_min:    Int64;     // inclusive
    input_max:    Int64;     // inclusive
    criteria:     array of TFitnessCriterion;
  end;

function LoadFitnessTarget(const path: string): TFitnessTarget;

// Seeds state.istack[0..target.input_count-1] with random integers in
// [input_min, input_max] and sets isp so the genome sees a populated
// integer stack on entry. Does NOT touch genome, ip, or halt_reason --
// caller resets those separately (same responsibility split as the
// existing hypervisor reset-then-Execute flow).
procedure SeedFitnessInput(var state: TVMState; const target: TFitnessTarget;
                            var rng: UInt64);

// Runs the target's criteria pipeline against a genome that has ALREADY
// been executed (state reflects post-Execute() values). Does not call
// Execute itself -- keeps this unit free of any dependency on soma_core,
// same platform-independence goal as soma_evolution.pas.
function EvaluateFitnessTarget(const state: TVMState;
                                const target: TFitnessTarget;
                                original_input: array of Int64): TFitnessResult;

implementation

// -- Primitives --------------------------------------------------------

// Proxy signal: reward instructions executed before halting (via final ip)
// and a clean halt/yield over a fault. Identical formula to the existing
// EvaluateFitness in soma_hypervisor.pas -- factored out so "survival" can
// be named as one weighted criterion alongside real benchmark primitives
// instead of being the entire fitness signal.
function Prim_Survival(const state: TVMState): Double;
var
  survival_score, activity_score: Double;
begin
  survival_score := state.ip / GENOME_SIZE;
  if survival_score > 1.0 then survival_score := 1.0;

  activity_score := state.isp / STACK_SIZE;
  if activity_score > 1.0 then activity_score := 1.0;

  if (state.halt_reason = HR_HALT) or (state.halt_reason = HR_YIELD) then
    Result := (survival_score * 0.5) + (activity_score * 0.3) + 0.2
  else
    Result := (survival_score * 0.5) + (activity_score * 0.3);
end;

// Fraction of adjacent pairs in istack[0..count-1] that are in
// non-descending order. count fully-sorted pairs / (count-1) total pairs.
// Deliberately partial-credit (not a pass/fail gate) so mutation has a
// gradient to climb rather than a fitness cliff -- a genome that gets
// 6 of 7 pairs right scores meaningfully higher than one that gets 2 of 7,
// which matters a great deal for tournament selection to have any signal
// to work with in early generations of essentially-random genomes.
function Prim_ArraySorted(const state: TVMState; count: Integer): Double;
var
  i, correct_pairs, total_pairs: Integer;
begin
  if count < 2 then
  begin
    Result := 1.0;  // trivially "sorted"
    Exit;
  end;
  total_pairs := count - 1;
  correct_pairs := 0;
  for i := 0 to count - 2 do
    if state.istack[i] <= state.istack[i + 1] then
      Inc(correct_pairs);
  Result := correct_pairs / total_pairs;
end;

// -- JSON loading --------------------------------------------------------

function LoadFitnessTarget(const path: string): TFitnessTarget;
var
  jroot, jsetup, jcriteria, jcrit: TJSONObject;
  jarr: TJSONArray;
  fs: TFileStream;
  parser: TJSONParser;
  data: TJSONData;
  i: Integer;
begin
  fs := TFileStream.Create(path, fmOpenRead or fmShareDenyWrite);
  try
    parser := TJSONParser.Create(fs);
    try
      data := parser.Parse;
    finally
      parser.Free;
    end;
  finally
    fs.Free;
  end;

  try
    jroot := data as TJSONObject;

    Result.name    := jroot.Get('name', 'unnamed');
    Result.version := jroot.Get('version', 1);

    jsetup := jroot.Objects['setup'];
    if jsetup <> nil then
    begin
      Result.input_count := jsetup.Get('input_count', 8);
      Result.input_min   := jsetup.Get('input_min', -50);
      Result.input_max   := jsetup.Get('input_max', 50);
    end
    else
    begin
      Result.input_count := 8;
      Result.input_min   := -50;
      Result.input_max   := 50;
    end;

    jarr := jroot.Arrays['criteria'];
    if jarr <> nil then
    begin
      SetLength(Result.criteria, jarr.Count);
      for i := 0 to jarr.Count - 1 do
      begin
        jcrit := jarr.Objects[i];
        Result.criteria[i].metric := jcrit.Get('metric', 'survival');
        Result.criteria[i].weight := jcrit.Get('weight', 1.0);
      end;
    end
    else
    begin
      // No criteria block: fall back to pure survival, weight 1.0, so a
      // malformed/minimal JSON file degrades gracefully rather than
      // producing a zero-everywhere fitness that looks like a VM bug.
      SetLength(Result.criteria, 1);
      Result.criteria[0].metric := 'survival';
      Result.criteria[0].weight := 1.0;
    end;
  finally
    data.Free;
  end;
end;

// -- Seeding ---------------------------------------------------------------

procedure SeedFitnessInput(var state: TVMState; const target: TFitnessTarget;
                            var rng: UInt64);
var
  i: Integer;
  span: UInt64;
begin
  span := UInt64(target.input_max - target.input_min + 1);
  for i := 0 to target.input_count - 1 do
  begin
    rng := rng xor (rng shl 13);
    rng := rng xor (rng shr 7);
    rng := rng xor (rng shl 17);
    state.istack[i] := target.input_min + Int64(rng mod span);
  end;
  state.isp := target.input_count - 1;
end;

// -- Evaluation --------------------------------------------------------

function EvaluateFitnessTarget(const state: TVMState;
                                const target: TFitnessTarget;
                                original_input: array of Int64): TFitnessResult;
var
  i, metric_idx: Integer;
  weighted_sum, weight_total, m: Double;
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.version := target.version;
  StrPCopy(@Result.tag[0], Copy(target.name, 1, 31));

  weighted_sum := 0.0;
  weight_total := 0.0;
  metric_idx   := 0;

  for i := 0 to High(target.criteria) do
  begin
    if target.criteria[i].metric = 'survival' then
      m := Prim_Survival(state)
    else if target.criteria[i].metric = 'array_sorted' then
      m := Prim_ArraySorted(state, target.input_count)
    else
      m := 0.0;  // unknown metric name: contributes nothing, doesn't crash

    if metric_idx <= High(Result.metrics) then
    begin
      Result.metrics[metric_idx] := m;
      Inc(metric_idx);
    end;

    weighted_sum := weighted_sum + (m * target.criteria[i].weight);
    weight_total := weight_total + target.criteria[i].weight;
  end;

  if weight_total > 0.0 then
    Result.score := weighted_sum / weight_total
  else
    Result.score := 0.0;

  // Gate: only a genome that halted cleanly (not fault/bounds/cycle-limit)
  // AND scored above a low floor counts as "passed" -- mirrors the
  // survival gate criterion described in plan.md's starter fitness list.
  Result.passed := ((state.halt_reason = HR_HALT) or (state.halt_reason = HR_YIELD))
                    and (Result.score > 0.1);
end;

end.
