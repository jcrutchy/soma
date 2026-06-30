# SOMA — Self-Organizing Machine Architecture
## Project Status — FreePascal Implementation

---

## 0. What This Document Is

This is a working status document for SOMA as it currently stands. The project began as a Rust specification (preserved in git history) and was deliberately pivoted to FreePascal/Lazarus for reasons of familiarity, enjoyment, and sustainable hobby-project pace. The architecture below reflects real, compiled, running code — not aspiration. Sections marked **[PLANNED]** describe agreed direction that hasn't been built yet. Sections marked **[OPEN]** are unresolved design questions.

This supersedes the earlier v0.1–v0.4 Rust specification. Core philosophy carries forward; implementation details do not.

---

## 1. Core Principles

**Enjoyment and understanding over prestige.** This is a hobby project. The guiding priority is staying motivated and learning, not chasing the most fashionable toolchain. FreePascal was chosen over Rust because of a decade-plus of prior Delphi experience — recoverable muscle memory beats unfamiliar ceremony for a project meant to be sustained outside of work hours.

**Write the code, let LLMs scrutinise it.** The development workflow is: write or sketch the implementation by hand, then use AI assistance to review, optimise, and catch errors — not to generate from scratch. This keeps understanding of the system intact as it grows.

**NIH / minimal dependencies.** No external packages beyond what FreePascal's standard library provides (`fpjson`, `SysUtils`, `Windows`/`BaseUnix`). Procedural style throughout; globals are used freely for single-instance structures (the hypervisor, the population) without ceremony.

**Bounded, auditable evolution.** Every genome execution is traceable. Mutation is constrained by structural validity (relative jump addressing, fixed-width instructions) so that splicing, swapping, or replacing genome regions cannot silently corrupt control flow.

**Layered codon architecture.** Layer 0 is fixed, hand-written, and never evolves. Layer 1+ codons are evolved sequences of Layer 0 primitives, promoted into a reusable library once proven fit. The codon library is the accumulating intelligence of the system — not any single genome.

---

## 2. What Actually Exists Right Now

- A complete, compiling, running **Layer 0 virtual machine** (`soma_core.pas`) — a stack-based interpreter written in inline x86-64 assembly (Intel syntax), cross-platform between Win64 and Linux via conditional compilation.
- A working **hypervisor** (`soma_hypervisor.pas`) that spins up multiple colony threads, each running an independent `TVMState`, executing random genomes in a tight loop, with live status reporting and clean shutdown.
- Verified throughput in the hundreds of thousands of generations per second across 4 colony threads on commodity hardware, with zero crashes or corruption across millions of executions.
- All core type definitions (`soma_types.pas`) with compile-time and runtime assertions guaranteeing struct layout correctness — critical since the asm layer depends on exact byte offsets.

What does **not** yet exist: fitness evaluation (currently a stub returning 0.0), mutation operators, the GLOG binary logger, the live viewer, and the compiler/codegen toolchain. These are the next layers to build.

---

## 3. Two-Layer Architecture (Current)

```
┌─────────────────────────────────────────┐
│  SOMA Hypervisor (Pascal, BeginThread)   │
│  Owns population, colonies, RNG seeding  │
├─────────────────────────────────────────┤
│  LAYER 0 — kernel (fixed, hand-written)  │  soma_core.pas
│  Stack machine. Pure inline asm.         │
│  67 primitive opcodes. Jump table.       │
├─────────────────────────────────────────┤
│  LAYER 1+ — evolved codons [PLANNED]     │
│  Promoted genome sequences, reused       │
│  as callable subroutines. Manually       │
│  curated via semi-automatic promotion.   │
└─────────────────────────────────────────┘
```

Layer 0 never mutates. It is the only hand-written code in the execution path. Layer 1+ does not exist yet as a runtime concept — `$0100`–`$02FF` is reserved opcode space, and any genome that addresses it currently halts with `HR_HIGHER_LAYER`.

---

## 4. The Virtual Machine

### 4.1 Design

Stack-based, not register-based. This was a deliberate choice over register allocation: stack machines have simpler, more uniform instruction encoding, which makes genome mutation, crossover, and splicing dramatically easier to reason about than register-allocated code. The cost — somewhat denser instruction streams than a register machine — was judged acceptable since raw dispatch speed isn't the bottleneck (fitness evaluation will be, once it exists).

Two independent stacks: an **integer stack** (`Int64`, 256 slots) and a **float stack** (`Double`, 256 slots), each with its own stack pointer. This mirrors the x86-64 SSE2 split between general-purpose and XMM registers and avoids the overhead of a tagged union.

### 4.2 Instruction Format

Fixed-width, 8 bytes, naturally aligned:

```pascal
TInstruction = packed record
  opcode: UInt16;  // up to 65535 opcodes
  flags:  UInt8;   // reserved — addressing mode, imm size
  pad:    UInt8;   // reserved
  imm:    Int32;   // immediate value
end;
```

Fixed width was chosen over UTF-8-style variable-length encoding specifically because the genome must remain robust under random mutation. A flipped length bit in a variable-width scheme corrupts every subsequent instruction; fixed width means any single instruction can be mutated, swapped, or NOP'd without affecting its neighbours. Cache density is sacrificed for mutation safety — a deliberate tradeoff, revisited only if profiling later shows it matters.

### 4.3 Opcode Space

16-bit opcode field, partitioned by range:

```
$0000–$00FF   Layer 0 primitives (67 implemented, rest reserved)
$0100–$01FF   Layer 1 evolved codons        [PLANNED]
$0200–$02FF   Layer 2+ compositions          [PLANNED]
$FF00–$FFFF   Reserved / system
```

Layer 0 opcodes are grouped by category in blocks of ~8–16 with deliberate gaps for future expansion:

```
$00–$07   Integer stack ops    NOP PUSH POP DUP SWAP OVER ROT DROP
$10–$18   Integer arithmetic   ADD SUB MUL DIV MOD NEG ABS INC DEC
$20–$26   Bitwise              AND OR XOR NOT SHL SHR SAR
$30–$35   Integer comparison   EQ NEQ LT GT LTE GTE
$40–$45   Control flow         JMP JZ JNZ CALL RET HALT
$50–$53   Memory [stub]        LOAD STORE MLOAD MSTORE
$60–$64   Float stack ops      FPUSH FPOP FDUP FSWAP FDROP
$70–$77   Float arithmetic     FADD FSUB FMUL FDIV FNEG FABS FSQRT FMOD
$80–$85   Float comparison     FEQ FNEQ FLT FGT FLTE FGTE
$90–$91   Conversion           I2F F2I
$A0–$A5   System                RAND FRAND PCNT YIELD IN OUT
```

67 opcodes implemented and verified compiling correctly to clean x86-64 machine code. `LOAD`/`STORE`/`MLOAD`/`MSTORE`/`IN`/`OUT` are currently stubs that halt cleanly with `HR_UNUSED` — they're reserved slots pending a VM heap and I/O buffer design.

**Control flow uses relative addressing.** `JMP`/`JZ`/`JNZ`/`CALL` add a signed offset to the instruction pointer rather than jumping to an absolute address. This was a late but important correction: absolute jump targets would be invalidated by any mutation that inserts, deletes, or reorders instructions elsewhere in the genome. Relative addressing combined with fixed-width instructions means structural mutations (NOP-insertion, point mutation, block swap) never silently break control flow.

### 4.4 Dispatch

A single monolithic `asm` block in `Execute()`. No Pascal-level function call per opcode — every Layer 0 primitive is an inline label reached via a 256-entry jump table sitting directly in the `.text` section (RIP-relative addressed), dispatched with `jmp`, not `call`. This was a deliberate refinement over an earlier Pascal-dispatch version that used `call`/`ret` per opcode; the monolithic version eliminates call overhead entirely for the hot path.

Register assignment, fixed for the duration of `Execute`:
```
rbx   State pointer (TVMState base)
r12   instruction pointer (ip)
r13   integer stack pointer (isp)
r14   float stack pointer (fsp)
r15   jump table base address (set once, never touched again)
xmm0–xmm2  float scratch registers
```

Cross-platform via `{$IFDEF WINDOWS}`: the only differences between Win64 and System V AMD64 are the incoming argument register (`rcx` vs `rdi`) and whether `xmm6`–`xmm9` need save/restore (non-volatile on Win64, volatile on Linux). Both are isolated to a few lines in the prologue/epilogue; the entire opcode body is identical on both platforms.

### 4.5 Halt Reasons

`TVMState` carries a `halt_reason: UInt64` field, set immediately before every exit path:

```
HR_NONE          0   still running (shouldn't be seen post-exit)
HR_HALT          1   OP_HALT executed
HR_YIELD         2   OP_YIELD — voluntary checkpoint
HR_BOUNDS        3   ip exceeded GENOME_SIZE
HR_DIV_ZERO      4   integer divide by zero
HR_FDIV_ZERO     5   float divide by zero
HR_UNUSED        6   hit a reserved/unimplemented opcode
HR_HIGHER_LAYER  7   genome addressed Layer 1+ space (not yet implemented)
```

This gives the hypervisor visibility into *why* a genome stopped, which is essential both for fitness scoring and for understanding the distribution of failure modes across a randomly mutated population.

### 4.6 RNG

Xorshift64, implemented directly in asm for `RAND` (raw `Int64`) and `FRAND` (scaled to `Double` 0.0–1.0 via the standard `>> 11` / `× 2⁻⁵³` technique). Seeded per-colony at thread start from the colony ID, so parallel colonies diverge immediately.

### 4.7 Cache and Threading Considerations

`TVMState` is padded to a 64-byte boundary (cache line size) to avoid false sharing between colony threads, each of which owns an independent, heap-allocated, explicitly-aligned instance (see §5.3). The jump table lives in `.text`/effectively read-only memory and is shared safely across all threads with no locking required.

---

## 5. The Hypervisor

### 5.1 Responsibilities

- Owns the population array (`TGenome` array) and the array of colony thread contexts.
- Spins up N worker threads via `BeginThread`, one `TVMState` per thread.
- Each colony thread loops: copy a genome from the population, reset VM state, `Execute`, evaluate fitness (currently stubbed), record results, repeat.
- A separate status thread prints live generation/fitness stats and updates a shared memory block at ~2 Hz, without blocking the colony threads.
- Main thread blocks on `Readln`; pressing Enter signals all threads to wind down cleanly.

### 5.2 Verified Behaviour

Tested with 4 colonies, 128-genome population, fully random genome initialisation (uniform draw from `VALID_OPCODES`, small random immediates). Result: sustained throughput in the 400,000+ generations/second range, stable across millions of generations, clean shutdown with no leaked threads or handles.

Fitness reads 0.0 throughout — expected, since fitness evaluation is not yet implemented. This run validated VM correctness and hypervisor plumbing, not evolutionary behaviour.

### 5.3 Memory Alignment

`AllocMem` does not guarantee 64-byte alignment on FreePascal. Colony states are allocated via a manual over-allocate-and-round technique (`AllocAligned`) to guarantee each `TVMState` starts on a cache line boundary regardless of what the heap allocator returns.

### 5.4 Shared Memory

A named file mapping (`CreateFileMapping`/`MapViewOfFile`, Windows) exposes a small `TSOMAShmem` struct — generation count, active colony count, best/avg fitness, uptime — intended to be read by a future, fully separate viewer process. This was a deliberate architectural decision: the GLOG viewer and any live charting tool must run as an independent process reading shared memory, not be embedded in the hypervisor. Mixing a UI message loop with a CPU-bound evolution loop in the same process risks starving one or the other.

---

## 6. Genome Mutation Strategy **[PLANNED]**

Not yet implemented. Agreed design direction:

- **Point mutation** — replace a single instruction's opcode with another drawn from `VALID_OPCODES` (a flat 67-entry const array already defined in `soma_types.pas`).
- **Immediate mutation** — adjust an instruction's `imm` field by small random deltas.
- **Sub-genome copy/splice** — copy a contiguous block of instructions from one genome into another; the simplest and likely most productive operator, since it requires no structural analysis and relies entirely on the relative-jump-safe instruction format.
- **NOP-insertion** — replace instructions with `OP_NOP` rather than shifting the genome array, preserving all relative jump offsets elsewhere in the genome.
- **Intron-biased mutation** — a planned refinement where a single "shadow" execution pass marks which instructions were actually reached, and mutation pressure is weighted toward active instructions (~90%) over inactive ones (~10%), rather than uniform random selection across the whole genome. This directly addresses the problem of most random mutations being immediately fatal or inert.

Dependency-aware mutation (constraining replacement opcodes to those with compatible stack effects) is acknowledged as valuable but deferred — higher implementation cost, lower near-term payoff than the operators above.

---

## 7. Fitness System **[PLANNED]**

Decided architecture, not yet built:

- **JSON fitness files**, not compiled DLLs. FPC's built-in `fpjson`/`jsonparser` units remove the need for any external dependency. A fitness target is data — a pipeline of named measurements (low-level VM observables through to higher-level mathematical scoring functions like matrix identity distance) plus weighted scoring rules — not code. This makes fitness targets editable without recompilation and fully transparent (you can read exactly what a genome is being scored against).
- **Measurement primitives** are a fixed, compiled library inside the hypervisor (e.g. `istack_slice`, `matrix_multiply`, `identity_distance`, `array_sorted`, `epsilon_score`), referenced by name from JSON and composed via a small pipeline of named intermediate values (`m1`, `m2`, `m3`...).
- Scope intentionally starts narrow — perhaps 15–20 primitives covering the initial "training wheels" targets (sorting, basic matrix operations) — with a small custom expression evaluator over named measurement variables added later only if composition alone proves insufficient.
- **Pluggable, weighted criteria.** Multiple fitness criteria combine via configurable weights; weights may eventually be evolvable themselves, but only once a stable population of working genomes exists to evolve from — weight evolution starts disabled.

Training-wheels progression agreed: sorting → matrix algebra → composition of the two → open-ended targets, with each stage providing ground-truth-verifiable fitness and progressively richer Layer 1 codon material.

---

## 8. Logging **[PLANNED]**

- **GLOG** — binary, append-only, fixed-size records (originally specified at 32 bytes; field set to be finalised against the current 11-field draft). Written via a ring buffer drained by a dedicated logger thread so the hot evolution loop never blocks on I/O. Rotated and gzip-compressed once active logs grow large — genome data compresses well due to repetition.
- **Benchmark record** — append-only JSONL, one line per fitness evaluation run, cross-referencing GLOG entries by a `genome_ref` field. Forms the basis of a self-raising benchmark suite: when a genome meaningfully beats the current reference implementation for a benchmark, a human reviews and may promote it as the new baseline, bumping the benchmark version.
- **GLOG Viewer** — a fully separate Lazarus GUI application (using the bundled `TAChart` package), reading binary GLOG files from disk and live shared-memory state from the running hypervisor. Deliberately decoupled from the hypervisor process for the reasons given in §5.4.

---

## 9. Codon Promotion **[PLANNED]**

Layer 1 codon promotion is intended to be **semi-automatic**: the GLOG viewer surfaces candidate promotions with statistical justification (frequency of independent discovery across colonies, fitness delta with/without the candidate sequence, peak fitness contribution) and simple promote/deny buttons. This avoids both unsupervised auto-promotion (risk of premature lock-in around mediocre codons) and the tedium of manually digging through raw logs.

A promoted codon is recorded with a reference to the fitness file that validated it and the GLOG slice it came from — giving each entry in the Layer 1 library full provenance back to the generation and colony that produced it.

---

## 10. Compiler / Codegen **[PLANNED, EARLY DISCUSSION ONLY]**

Long-term direction, not yet started, captured here so the idea isn't lost:

The aim is to compile one or more genomes — plus any Layer 1 codon dependencies — directly to native machine code, bypassing the interpreter entirely. Three output formats under consideration, roughly in order of implementation priority:

1. **Genome → `.s` (assembly text)** — the most useful first step. Effectively the inverse of what `soma_core.pas` does at runtime: walk the genome and emit the equivalent asm sequence per instruction. Immediately useful as a human-readable disassembler/debugging tool for the GLOG viewer, and can be handed to `as`/`ld` (via MinGW on Windows) to produce a real binary without implementing an object file format from scratch.
2. **Genome → raw machine code blob** — a SOMA-native format (conceptually similar to a Delphi `.dcu`): a small header (code size, stack depth requirements, codon dependency list) followed by raw executable bytes. Loadable at runtime by any host process via `VirtualAlloc`/`mmap` + mark-executable, callable as a function pointer with a defined calling convention. No linker, no file format ceremony. This is the most architecturally interesting option since it enables embedding evolved code directly into other programs.
3. **Genome → `.obj` (COFF/ELF) → linked executable** — full toolchain independence, highest implementation cost.

Explicitly **not** planned: compiling genomes to human-readable C or Pascal source. Evolved genomes are not expected to decompose meaningfully into idiomatic high-level code, and forcing that mapping would be both difficult and pointless — the genome's "language" is its own.

The genuinely interesting long-term payoff: once genomes can be compiled to native binaries with no VM overhead, they become directly benchmarkable against hand-written reference implementations on identical hardware — the only fair test of whether evolution actually discovered something better than what a human would write.

---

## 11. Open Questions

| # | Question | Status |
|---|----------|--------|
| 1 | VM heap design for `LOAD`/`STORE`/`MLOAD`/`MSTORE` — fixed region inside `TVMState`, or external allocation? | Open — leaning fixed-size internal for v1 |
| 2 | `IN`/`OUT` buffer design — needed before those opcodes can be implemented | Open |
| 3 | Separate call stack vs reusing the integer stack for `CALL`/`RET` return addresses | Open — current implementation reuses istack; may need revisiting if Layer 1 codons call deeply |
| 4 | GLOG exact field layout (11 fields, target ~32 bytes) | Open — needs finalising against current opcode/halt_reason additions |
| 5 | Layer 1 codon table storage and runtime dispatch mechanism | Open — likely a pointer field in `TVMState` referencing a shared, swappable table |
| 6 | Weight evolution for fitness criteria — when to enable | Deferred until a stable population of working genomes exists |
| 7 | Dependency-aware (stack-effect-constrained) mutation | Deferred — sub-genome copy and intron-biasing prioritised first |
| 8 | GENOME_SIZE = 4096 instructions — may need revisiting once real genomes are evolved and their typical length is observed | Open, low urgency |

---

*Status document reflects the FreePascal implementation as of the current session. Supersedes the v0.1–v0.4 Rust/graph-based specification, which is preserved in project history for reference but no longer describes the active architecture.*
