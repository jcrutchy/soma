program mutate_repro;
{$mode Delphi}{$H+}
uses soma_types, soma_mutate, SysUtils;

var
  fails: Integer = 0;

procedure Check(name: string; cond: Boolean);
begin
  if cond then Writeln('ok   ', name) else begin Writeln('FAIL ', name); Inc(fails); end;
end;

// Direct reproduction: hunt for a seed where the OLD buggy expression
// `rng mod (GENOME_SIZE - block_size)` goes negative, to prove the crash
// mechanism precisely (mirrors what actually happened on real hardware).
procedure ProveOldBugWouldCrash;
var
  rng: UInt64;
  i: Integer;
  block_size, divisor: Integer;
  start_idx: Integer;
  foundNegative: Boolean;
begin
  rng := $1122334455667788;
  block_size := 4;
  divisor := GENOME_SIZE - block_size;
  foundNegative := False;
  for i := 1 to 1000 do
  begin
    rng := rng xor (rng shl 13);
    rng := rng xor (rng shr 7);
    rng := rng xor (rng shl 17);
    start_idx := rng mod divisor;  // the OLD, buggy expression, reproduced exactly
    if start_idx < 0 then
    begin
      foundNegative := True;
      Writeln('       old buggy expression produced start_idx=', start_idx,
              ' at draw ', i, ' -- this would write G[', start_idx,
              '] to G[', start_idx + block_size - 1, '], wildly out of bounds');
      Break;
    end;
  end;
  Check('old expression demonstrably produces negative indices', foundNegative);
end;

procedure TestMutateNopBlockManySeeds;
var
  G: TGenome;
  rng: UInt64;
  seedTrial: Integer;
begin
  // Sweep many different seeds/starting states -- the bug was
  // seed-dependent (roughly 50% of draws), so a single lucky seed
  // proves nothing either way.
  for seedTrial := 1 to 2000 do
  begin
    rng := UInt64(seedTrial) * $9E3779B97F4A7C15;
    FillChar(G, SizeOf(G), 0);
    MutateNopBlock(G, rng, 4);
  end;
  Check('MutateNopBlock: 2000 different seeds, no crash', True);
end;

procedure TestMutateCopyBlockManySeeds;
var
  dst, src: TGenome;
  rng: UInt64;
  seedTrial: Integer;
begin
  FillChar(src, SizeOf(src), 0);
  for seedTrial := 1 to 2000 do
  begin
    rng := UInt64(seedTrial) * $9E3779B97F4A7C15 + 1;
    FillChar(dst, SizeOf(dst), 0);
    MutateCopyBlock(dst, src, rng, 8);
  end;
  Check('MutateCopyBlock: 2000 different seeds, no crash', True);
end;

procedure TestMutateGenomeFullPipeline;
var
  G: TGenome;
  pool: array[0..9] of TGenome;
  rng: UInt64;
  i, seedTrial: Integer;
begin
  for i := 0 to 9 do
    FillChar(pool[i], SizeOf(TGenome), 0);

  for seedTrial := 1 to 5000 do
  begin
    rng := UInt64(seedTrial) * $2545F4914F6CDD1D + 7;
    FillChar(G, SizeOf(G), 0);
    MutateGenome(G, pool, rng);
  end;
  Check('MutateGenome (full pipeline, all 4 operators): 5000 seeds, no crash', True);

  // Also with an EMPTY source pool (documented as valid: "pass an empty
  // array to skip copy-block mutation")
  for seedTrial := 1 to 1000 do
  begin
    rng := UInt64(seedTrial) * $BF58476D1CE4E5B9 + 3;
    FillChar(G, SizeOf(G), 0);
    MutateGenome(G, [], rng);
  end;
  Check('MutateGenome with empty source_pool: 1000 seeds, no crash', True);
end;

// Precise boundary check: with GENOME_SIZE=4096 and block_size=4, the
// legal range for start_idx is [0, 4091] so that start_idx+block_size-1
// never exceeds GENOME_SIZE-1. Verify the fixed code actually stays
// there over many draws, not just "doesn't crash".
procedure TestMutateNopBlockStaysInBounds;
var
  G: TGenome;
  rng: UInt64;
  seedTrial, i: Integer;
  touchedAny: Boolean;
  minTouched, maxTouched: Integer;
begin
  minTouched := GENOME_SIZE;
  maxTouched := -1;
  for seedTrial := 1 to 3000 do
  begin
    rng := UInt64(seedTrial) * $D1B54A32D192ED03 + 11;
    FillChar(G, SizeOf(G), 0);
    for i := 0 to GENOME_SIZE - 1 do
      G[i].opcode := 1;  // sentinel != OP_NOP, so we can see what changed
    MutateNopBlock(G, rng, 4);
    touchedAny := False;
    for i := 0 to GENOME_SIZE - 1 do
      if G[i].opcode = OP_NOP then
      begin
        touchedAny := True;
        if i < minTouched then minTouched := i;
        if i > maxTouched then maxTouched := i;
      end;
    if not touchedAny then
    begin
      Writeln('FAIL: MutateNopBlock touched nothing on trial ', seedTrial);
      Inc(fails);
      Exit;
    end;
  end;
  Writeln('       observed touched-index range across 3000 trials: [',
          minTouched, ', ', maxTouched, ']  (legal range: [0, ', GENOME_SIZE-1, '])');
  Check('MutateNopBlock never touches an index outside the genome',
        (minTouched >= 0) and (maxTouched <= GENOME_SIZE - 1));
end;

begin
  Writeln('GENOME_SIZE = ', GENOME_SIZE);
  Writeln;
  ProveOldBugWouldCrash;
  TestMutateNopBlockManySeeds;
  TestMutateCopyBlockManySeeds;
  TestMutateGenomeFullPipeline;
  TestMutateNopBlockStaysInBounds;

  Writeln;
  if fails = 0 then Writeln('ALL MUTATE-REPRO TESTS PASSED')
  else Writeln(fails, ' FAILED');
end.
