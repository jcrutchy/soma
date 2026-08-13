unit soma_mutate;

{$mode Delphi}

interface

uses
  soma_types;

type
  TMutationOp = (
    moPointOpcode,
    moPointImm,
    moNopBlock,
    moCopyBlock
  );

  TMutationParams = record
    op:         TMutationOp;
    rate:       Double;     // probability this op fires per call
    imm_delta:  Int32;      // max +/- range for immediate mutation
    block_size: Integer;    // for NOP-block and copy-block ops
  end;

const
  DEFAULT_MUTATION_PARAMS: array[0..3] of TMutationParams = (
    (op: moPointOpcode; rate: 0.02; imm_delta: 0;  block_size: 0),
    (op: moPointImm;    rate: 0.05; imm_delta: 16; block_size: 0),
    (op: moNopBlock;    rate: 0.01; imm_delta: 0;  block_size: 4),
    (op: moCopyBlock;   rate: 0.01; imm_delta: 0;  block_size: 8)
  );

procedure XorShift64(var rng: UInt64); inline;

procedure MutatePointOpcode(var G: TGenome; var rng: UInt64);
procedure MutatePointImm(var G: TGenome; var rng: UInt64; max_delta: Int32);
procedure MutateNopBlock(var G: TGenome; var rng: UInt64; block_size: Integer);
procedure MutateCopyBlock(var dst: TGenome; const src: TGenome; var rng: UInt64; block_size: Integer);

procedure MutateGenome(var G: TGenome; const source_pool: array of TGenome; var rng: UInt64);

implementation

procedure XorShift64(var rng: UInt64); inline;
begin
  rng := rng xor (rng shl 13);
  rng := rng xor (rng shr 7);
  rng := rng xor (rng shl 17);
end;

{ ============================================================================
  PITFALL, confirmed to have caused a real crash in this exact file:
  `rng mod N` where rng is UInt64 and N is a runtime-computed value (a
  variable, a parameter, a function result like Length(x), or an
  expression involving one) implicitly converts rng to a SIGNED Int64 for
  the modulo. rng routinely has its top bit set, so the result can come
  back NEGATIVE -- confirmed empirically: ~50% of draws, when reproduced
  in isolation. `G[negative_index]` then writes/reads wildly out of
  bounds. This crashed MutateNopBlock (`rng mod (GENOME_SIZE -
  block_size)` -- block_size is a parameter, so the divisor isn't a
  constant) with an access violation, reliably, single-threaded, no
  concurrency involved.

  `rng mod SOME_COMPILE_TIME_CONSTANT` (e.g. `rng mod GENOME_SIZE`) does
  NOT have this problem -- FPC correctly performs unsigned modulo when
  the divisor is a literal/const, confirmed empirically too. The bug is
  specifically about non-constant divisors.

  Fix: cast the divisor to UInt64 explicitly, e.g.
  `Integer(rng mod UInt64(some_runtime_expression))`. Every "pick a
  random index below N" call in this file must go through that pattern
  when N isn't a bare compile-time constant.
  ============================================================================ }

// Replace a single instruction's opcode with another valid Layer 0 opcode
procedure MutatePointOpcode(var G: TGenome; var rng: UInt64);
var
  idx: Integer;
begin
  XorShift64(rng);
  idx := rng mod GENOME_SIZE;
  XorShift64(rng);
  G[idx].opcode := VALID_OPCODES[rng mod VALID_OPCODE_COUNT];
end;

// Nudge a single instruction's immediate value by a small random delta
procedure MutatePointImm(var G: TGenome; var rng: UInt64; max_delta: Int32);
var
  idx:   Integer;
  delta: Int32;
begin
  XorShift64(rng);
  idx := rng mod GENOME_SIZE;
  XorShift64(rng);
  // delta in range [-max_delta, +max_delta]
  delta := Int32(rng mod UInt64(max_delta * 2 + 1)) - max_delta;
  G[idx].imm := G[idx].imm + delta;
end;

// Replace a contiguous block with NOPs - preserves genome length and all
// relative jump targets elsewhere in the genome
procedure MutateNopBlock(var G: TGenome; var rng: UInt64; block_size: Integer);
var
  start_idx, i: Integer;
begin
  if block_size < 1 then block_size := 1;
  XorShift64(rng);
  start_idx := Integer(rng mod UInt64(GENOME_SIZE - block_size));
  for i := start_idx to start_idx + block_size - 1 do
  begin
    G[i].opcode := OP_NOP;
    G[i].flags  := 0;
    G[i].pad    := 0;
    G[i].imm    := 0;
  end;
end;

// Copy a contiguous block from a source genome into this one at a random
// position. This is the "sub-graph copying" operator - cheapest to implement,
// likely highest payoff per Gemini's earlier analysis.
procedure MutateCopyBlock(var dst: TGenome; const src: TGenome; var rng: UInt64; block_size: Integer);
var
  src_start, dst_start, i: Integer;
begin
  if block_size < 1 then block_size := 1;
  XorShift64(rng);
  src_start := Integer(rng mod UInt64(GENOME_SIZE - block_size));
  XorShift64(rng);
  dst_start := Integer(rng mod UInt64(GENOME_SIZE - block_size));

  for i := 0 to block_size - 1 do
    dst[dst_start + i] := src[src_start + i];
end;

// Apply the default mutation operator set to a genome once, each operator
// firing independently according to its configured rate. source_pool is
// used by moCopyBlock to pick a donor genome; pass an empty array to skip
// copy-block mutation (e.g. for the very first generation).
procedure MutateGenome(var G: TGenome; const source_pool: array of TGenome; var rng: UInt64);
var
  i:        Integer;
  roll:     Double;
  donor_idx: Integer;
begin
  for i := 0 to High(DEFAULT_MUTATION_PARAMS) do
  begin
    XorShift64(rng);
    roll := (rng mod 1000000) / 1000000.0;
    if roll > DEFAULT_MUTATION_PARAMS[i].rate then
      Continue;

    case DEFAULT_MUTATION_PARAMS[i].op of
      moPointOpcode:
        MutatePointOpcode(G, rng);

      moPointImm:
        MutatePointImm(G, rng, DEFAULT_MUTATION_PARAMS[i].imm_delta);

      moNopBlock:
        MutateNopBlock(G, rng, DEFAULT_MUTATION_PARAMS[i].block_size);

      moCopyBlock:
        if Length(source_pool) > 0 then
        begin
          XorShift64(rng);
          donor_idx := Integer(rng mod UInt64(Length(source_pool)));
          MutateCopyBlock(G, source_pool[donor_idx], rng,
                           DEFAULT_MUTATION_PARAMS[i].block_size);
        end;
    end;
  end;
end;

end.
