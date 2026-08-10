program test_evolution;
{$mode Delphi}
{$H+}
uses soma_types, soma_evolution, SysUtils, Math;

const
  POP = 128;

type
  TPop = array[0..POP-1] of TGenome;

var
  rng: UInt64;
  fails: Integer = 0;

procedure Check(name: string; cond: Boolean);
begin
  if cond then
    Writeln('ok   ', name)
  else
  begin
    Writeln('FAIL ', name);
    Inc(fails);
  end;
end;

// -- RNG sanity ------------------------------------------------------------

procedure TestRNGRange;
var
  i: Integer;
  v: Double;
  minV, maxV: Double;
  imm: Int32;
  idx: Integer;
begin
  rng := $1234567890ABCDEF;
  minV := 2.0; maxV := -1.0;
  for i := 1 to 100000 do
  begin
    v := RandomUnit(rng);
    if v < minV then minV := v;
    if v > maxV then maxV := v;
    if (v < 0.0) or (v >= 1.0) then
    begin
      Writeln('FAIL RandomUnit out of range: ', v:0:10);
      Inc(fails);
      Exit;
    end;
  end;
  Check('RandomUnit stays in [0,1) over 100000 draws', True);
  Writeln('       observed range: [', minV:0:6, ', ', maxV:0:6, ']');

  for i := 1 to 1000 do
  begin
    imm := RandomImm(rng);
    if (imm < -64) or (imm > 63) then
    begin
      Writeln('FAIL RandomImm out of range: ', imm);
      Inc(fails);
      Exit;
    end;
  end;
  Check('RandomImm stays in [-64,63]', True);

  // Deliberately seed with a value whose top bit is set, and keep it set
  // (xorshift preserves plenty of high-bit-set states) -- this is exactly
  // the condition that produced a NEGATIVE index before the RandomIndex
  // fix. Every draw here must be in [0, 9].
  rng := $F000000000000001;
  for i := 1 to 200000 do
  begin
    idx := RandomIndex(rng, 10);
    if (idx < 0) or (idx > 9) then
    begin
      Writeln('FAIL RandomIndex out of range: ', idx, ' at draw ', i);
      Inc(fails);
      Exit;
    end;
  end;
  Check('RandomIndex never goes negative over 200000 draws from a high-bit-set seed', True);
end;

// -- RandomGenome / MutateGenome --------------------------------------------

procedure TestRandomGenome;
var
  G: TGenome;
  i, j: Integer;
  allZero: Boolean;
  found: Boolean;
begin
  rng := $DEADBEEFCAFEF00D;
  RandomGenome(G, rng);
  allZero := True;
  for i := 0 to GENOME_SIZE - 1 do
    if G[i].opcode <> 0 then
    begin
      allZero := False;
      Break;
    end;
  Check('RandomGenome actually fills the genome (not all zero opcodes)', not allZero);
  Check('RandomGenome zeroes flags/pad', (G[0].flags = 0) and (G[0].pad = 0));

  // Every opcode drawn must actually be a member of VALID_OPCODES -- this
  // is exactly what a negative-index bug would violate silently (reading
  // memory before the array instead of raising an error under -R-).
  for i := 0 to GENOME_SIZE - 1 do
  begin
    found := False;
    for j := 0 to VALID_OPCODE_COUNT - 1 do
      if VALID_OPCODES[j] = G[i].opcode then
      begin
        found := True;
        Break;
      end;
    if not found then
    begin
      Writeln('FAIL genome[', i, '].opcode = $', IntToHex(G[i].opcode, 4),
              ' is not in VALID_OPCODES');
      Inc(fails);
      Exit;
    end;
  end;
  Check('every drawn opcode across a full genome is a real VALID_OPCODES member', True);
end;

procedure TestMutateGenomeRateSanity;
var
  G, G2: TGenome;
  i, changed: Integer;
  frac: Double;
begin
  rng := $F00DCAFEDEADBEEF;
  RandomGenome(G, rng);
  G2 := G;
  MutateGenome(G2, rng);

  changed := 0;
  for i := 0 to GENOME_SIZE - 1 do
    if (G[i].opcode <> G2[i].opcode) or (G[i].imm <> G2[i].imm) then
      Inc(changed);

  frac := changed / GENOME_SIZE;
  Writeln('       mutated fraction of genome this call: ', frac:0:4,
          ' (', changed, '/', GENOME_SIZE, ')');
  Check('mutation touches a small, non-zero fraction of the genome',
        (frac > 0.0001) and (frac < 0.05));
end;

procedure TestMutateGenomeStatistics;
const
  TRIALS = 500;
var
  G, G2: TGenome;
  t, i, totalChanged: Integer;
  observedRate: Double;
begin
  rng := $ABCDEF0123456789;
  totalChanged := 0;
  for t := 1 to TRIALS do
  begin
    RandomGenome(G, rng);
    G2 := G;
    MutateGenome(G2, rng);
    for i := 0 to GENOME_SIZE - 1 do
      if (G[i].opcode <> G2[i].opcode) or (G[i].imm <> G2[i].imm) then
        Inc(totalChanged);
  end;
  observedRate := totalChanged / (TRIALS * GENOME_SIZE);
  Writeln('       observed per-site mutation rate over ', TRIALS,
          ' trials: ', observedRate:0:6,
          '  (point+imm baseline ~', (MUT_POINT_RATE + MUT_IMM_RATE):0:6, ')');
  Check('observed mutation rate is in a sane band around the configured rates',
        (observedRate > (MUT_POINT_RATE + MUT_IMM_RATE) * 0.5) and
        (observedRate < (MUT_POINT_RATE + MUT_IMM_RATE) * 3.0));
end;

procedure TestBlockMutationFires;
var
  G, G2: TGenome;
  t, i: Integer;
  runLen, maxRunLen: Integer;
begin
  rng := $1111222233334444;
  maxRunLen := 0;
  for t := 1 to 200 do
  begin
    RandomGenome(G, rng);
    G2 := G;
    MutateGenome(G2, rng);
    runLen := 0;
    for i := 0 to GENOME_SIZE - 1 do
    begin
      if (G[i].opcode <> G2[i].opcode) or (G[i].imm <> G2[i].imm) then
      begin
        Inc(runLen);
        if runLen > maxRunLen then maxRunLen := runLen;
      end
      else
        runLen := 0;
    end;
  end;
  Writeln('       longest contiguous mutated run observed over 200 trials: ', maxRunLen);
  Check('a long contiguous mutated run appears (block operator fires)', maxRunLen >= 4);
end;

// -- TournamentSelect --------------------------------------------------------

procedure TestTournamentSelectPrefersFitter;
var
  Fitness: array[0..9] of Double;
  i, winner, timesBestWon: Integer;
begin
  for i := 0 to 9 do Fitness[i] := i * 1.0;  // index 9 is clearly the fittest
  rng := $2222333344445555;
  timesBestWon := 0;
  for i := 1 to 10000 do
  begin
    winner := TournamentSelect(Fitness, rng);
    if (winner < 0) or (winner > 9) then
    begin
      Writeln('FAIL TournamentSelect returned out-of-range index: ', winner);
      Inc(fails);
      Exit;
    end;
    if winner = 9 then Inc(timesBestWon);
  end;
  Writeln('       fittest genome won ', timesBestWon, '/10000 tournaments');
  Check('tournament selection is biased toward higher fitness', timesBestWon > 1500);
end;

procedure TestTournamentSelectAllEqual;
var
  Fitness: array[0..9] of Double;
  i, winner: Integer;
  counts: array[0..9] of Integer;
begin
  for i := 0 to 9 do Fitness[i] := 5.0;  // all tied
  FillChar(counts, SizeOf(counts), 0);
  rng := $3333444455556666;
  for i := 1 to 10000 do
  begin
    winner := TournamentSelect(Fitness, rng);
    Inc(counts[winner]);
  end;
  Check('tournament selection with tied fitness visits every index',
        (counts[0] > 0) and (counts[9] > 0));
end;

// -- EvolveGeneration ---------------------------------------------------------

procedure TestEvolveGenerationElitism;
var
  OldPop, NewPop: ^TPop;
  Fitness: array[0..POP-1] of Double;
  i, bestIdx: Integer;
begin
  New(OldPop);
  New(NewPop);
  try
    rng := $4444555566667777;
    for i := 0 to POP - 1 do
    begin
      RandomGenome(OldPop^[i], rng);
      Fitness[i] := RandomUnit(rng) * 100.0;
    end;
    bestIdx := 0;
    for i := 1 to POP - 1 do
      if Fitness[i] > Fitness[bestIdx] then bestIdx := i;

    EvolveGeneration(OldPop^, Fitness, NewPop^, rng);

    Check('elite (NewPop[0]) is an exact copy of the fittest parent genome',
          CompareByte(NewPop^[0], OldPop^[bestIdx], SizeOf(TGenome)) = 0);
  finally
    Dispose(OldPop);
    Dispose(NewPop);
  end;
end;

procedure TestEvolveGenerationProducesVariety;
var
  OldPop, NewPop: ^TPop;
  Fitness: array[0..POP-1] of Double;
  i: Integer;
  identicalToElite: Integer;
begin
  New(OldPop);
  New(NewPop);
  try
    rng := $5555666677778888;
    for i := 0 to POP - 1 do
    begin
      RandomGenome(OldPop^[i], rng);
      Fitness[i] := RandomUnit(rng) * 100.0;
    end;

    EvolveGeneration(OldPop^, Fitness, NewPop^, rng);

    identicalToElite := 0;
    for i := 1 to POP - 1 do
      if CompareByte(NewPop^[i], NewPop^[0], SizeOf(TGenome)) = 0 then
        Inc(identicalToElite);

    Writeln('       non-elite genomes identical to the elite: ', identicalToElite, '/', POP-1);
    Check('new population is not a monoculture collapsed onto the elite',
          identicalToElite < (POP - 1));
  finally
    Dispose(OldPop);
    Dispose(NewPop);
  end;
end;

procedure TestEvolveGenerationDoesNotCrashRepeatedly;
var
  PopA, PopB: ^TPop;
  Fitness: array[0..POP-1] of Double;
  i, gen: Integer;
  usingAasOld: Boolean;
begin
  New(PopA);
  New(PopB);
  try
    rng := $6666777788889999;
    for i := 0 to POP - 1 do
      RandomGenome(PopA^[i], rng);

    usingAasOld := True;
    for gen := 1 to 200 do
    begin
      for i := 0 to POP - 1 do
        Fitness[i] := RandomUnit(rng) * 100.0;  // stand-in fitness each gen

      if usingAasOld then
        EvolveGeneration(PopA^, Fitness, PopB^, rng)
      else
        EvolveGeneration(PopB^, Fitness, PopA^, rng);
      usingAasOld := not usingAasOld;
    end;
    Check('200 chained generations run without error', True);
  finally
    Dispose(PopA);
    Dispose(PopB);
  end;
end;

begin
  Writeln('sizeof(TGenome) = ', SizeOf(TGenome));
  Writeln('GENOME_SIZE = ', GENOME_SIZE, '  VALID_OPCODE_COUNT = ', VALID_OPCODE_COUNT);
  Writeln;

  TestRNGRange;
  TestRandomGenome;
  TestMutateGenomeRateSanity;
  TestMutateGenomeStatistics;
  TestBlockMutationFires;
  TestTournamentSelectPrefersFitter;
  TestTournamentSelectAllEqual;
  TestEvolveGenerationElitism;
  TestEvolveGenerationProducesVariety;
  TestEvolveGenerationDoesNotCrashRepeatedly;

  Writeln;
  if fails = 0 then
    Writeln('ALL TESTS PASSED')
  else
    Writeln(fails, ' TEST(S) FAILED');
end.
