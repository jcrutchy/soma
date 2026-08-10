unit soma_evolution;

{ ==========================================================================
  Mutation and selection logic for the generational loop.

  Deliberately platform-independent (no Windows unit dependency, unlike
  soma_hypervisor.pas) so it compiles and is testable on any target FPC
  supports. It knows nothing about threads, shared memory, or colonies --
  it just turns (old population, fitness scores) into (new population).

  Mutation is a MIX of independent operators, not a single mode -- a
  genome can receive several point mutations, several imm nudges, AND a
  block mutation in the same generation, giving evolution both fine-
  grained parameter search and coarser structural disruption at once
  rather than picking one strategy up front.
  ========================================================================== }

{$mode Delphi}
{$H+}

interface

uses
  soma_types;

const
  MUT_POINT_RATE     = 0.0020;  // per-instruction: full opcode+imm reroll
  MUT_IMM_RATE       = 0.0040;  // per-instruction: nudge imm only, opcode kept
  MUT_BLOCK_RATE     = 0.05;    // per-genome: chance of ONE contiguous block reroll
  MUT_BLOCK_MIN_LEN  = 4;
  MUT_BLOCK_MAX_LEN  = 16;

  TOURNAMENT_K = 3;             // contestants per tournament-selection draw

procedure XorShift64(var rng: UInt64); inline;
function  RandomUnit(var rng: UInt64): Double; inline;    // uniform [0,1)
function  RandomOpcode(var rng: UInt64): UInt16; inline;  // drawn from VALID_OPCODES
function  RandomImm(var rng: UInt64): Int32; inline;      // [-64, 63]

procedure RandomGenome(var G: TGenome; var rng: UInt64);
procedure MutateGenome(var G: TGenome; var rng: UInt64);

function RandomIndex(var rng: UInt64; N: Integer): Integer; inline;

// Index of the tournament winner among TOURNAMENT_K random draws from
// Fitness[0..High(Fitness)].
function TournamentSelect(const Fitness: array of Double; var rng: UInt64): Integer;

// One full generational step. NextPopulation[0] is elitist (the single
// fittest genome from OldPopulation, copied verbatim, unmutated) so a
// lucky good genome can't be lost to mutation noise before it's had a
// generation to prove itself -- this also keeps "best fitness" trending
// monotonically non-decreasing, which matters for anything watching the
// live view: a jittering "best" number is a lot less legible than one
// that only ever goes up or holds. NextPopulation[1..] are each built by
// tournament-selecting a parent from OldPopulation and mutating a copy.
// OldPopulation and NextPopulation must NOT be the same array (pass a
// scratch buffer and swap, or copy afterward) since parents are read
// throughout the loop.
procedure EvolveGeneration(const OldPopulation: array of TGenome;
                            const Fitness: array of Double;
                            var NextPopulation: array of TGenome;
                            var rng: UInt64);

implementation

procedure XorShift64(var rng: UInt64); inline;
begin
  rng := rng xor (rng shl 13);
  rng := rng xor (rng shr 7);
  rng := rng xor (rng shl 17);
end;

// Draws rng and returns a value in [0, N-1]. Centralised deliberately:
// `rng mod SomeSmallInteger` implicitly converts the UInt64 to a SIGNED
// Int64 for the modulo, and rng routinely has its top bit set -- so a
// naive `rng mod N` at any call site can silently return a NEGATIVE
// index (confirmed: it does, reproducibly). Casting the divisor to
// UInt64 forces unsigned modulo and keeps the result in range. Every
// place in this unit that needs "a random index below N" goes through
// here so this can't be gotten wrong at a second call site later.
function RandomIndex(var rng: UInt64; N: Integer): Integer; inline;
begin
  XorShift64(rng);
  Result := Integer(rng mod UInt64(N));
end;

function RandomUnit(var rng: UInt64): Double; inline;
begin
  XorShift64(rng);
  // top 53 bits -> [0,1) at full double precision
  Result := (rng shr 11) * (1.0 / (UInt64(1) shl 53));
end;

function RandomOpcode(var rng: UInt64): UInt16; inline;
begin
  Result := VALID_OPCODES[RandomIndex(rng, VALID_OPCODE_COUNT)];
end;

function RandomImm(var rng: UInt64): Int32; inline;
begin
  XorShift64(rng);
  Result := Int32((rng shr 32) mod 128) - 64;
end;

procedure RandomGenome(var G: TGenome; var rng: UInt64);
var
  i: Integer;
begin
  for i := 0 to GENOME_SIZE - 1 do
  begin
    G[i].opcode := RandomOpcode(rng);
    G[i].flags  := 0;
    G[i].pad    := 0;
    G[i].imm    := RandomImm(rng);
  end;
end;

procedure MutateGenome(var G: TGenome; var rng: UInt64);
var
  i, blockStart, blockLen, blockEnd: Integer;
begin
  // Fine-grained: full instruction reroll at a low per-site rate
  for i := 0 to GENOME_SIZE - 1 do
    if RandomUnit(rng) < MUT_POINT_RATE then
    begin
      G[i].opcode := RandomOpcode(rng);
      G[i].imm    := RandomImm(rng);
    end;

  // Fine-grained: nudge just the numeric parameter, keep the opcode (and
  // whatever structural role it plays) intact
  for i := 0 to GENOME_SIZE - 1 do
    if RandomUnit(rng) < MUT_IMM_RATE then
      G[i].imm := RandomImm(rng);

  // Coarse: occasionally reroll a whole contiguous run -- a bigger,
  // more disruptive move alongside the fine-grained ones above
  if RandomUnit(rng) < MUT_BLOCK_RATE then
  begin
    blockLen   := MUT_BLOCK_MIN_LEN + RandomIndex(rng, MUT_BLOCK_MAX_LEN - MUT_BLOCK_MIN_LEN + 1);
    blockStart := RandomIndex(rng, GENOME_SIZE);
    blockEnd   := blockStart + blockLen - 1;
    if blockEnd > GENOME_SIZE - 1 then
      blockEnd := GENOME_SIZE - 1;
    for i := blockStart to blockEnd do
    begin
      G[i].opcode := RandomOpcode(rng);
      G[i].imm    := RandomImm(rng);
    end;
  end;
end;

function TournamentSelect(const Fitness: array of Double; var rng: UInt64): Integer;
var
  i, candidate, best: Integer;
  bestFitness: Double;
begin
  best := RandomIndex(rng, High(Fitness) + 1);
  bestFitness := Fitness[best];
  for i := 2 to TOURNAMENT_K do
  begin
    candidate := RandomIndex(rng, High(Fitness) + 1);
    if Fitness[candidate] > bestFitness then
    begin
      best        := candidate;
      bestFitness := Fitness[candidate];
    end;
  end;
  Result := best;
end;

procedure EvolveGeneration(const OldPopulation: array of TGenome;
                            const Fitness: array of Double;
                            var NextPopulation: array of TGenome;
                            var rng: UInt64);
var
  i, parentIdx, bestIdx: Integer;
begin
  bestIdx := 0;
  for i := 1 to High(Fitness) do
    if Fitness[i] > Fitness[bestIdx] then
      bestIdx := i;
  NextPopulation[0] := OldPopulation[bestIdx];  // elitism: unmutated copy

  for i := 1 to High(NextPopulation) do
  begin
    parentIdx := TournamentSelect(Fitness, rng);
    NextPopulation[i] := OldPopulation[parentIdx];
    MutateGenome(NextPopulation[i], rng);
  end;
end;

end.
