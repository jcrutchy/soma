## SOMA Project Plan (FreePascal/Lazarus)

### Philosophy & Approach
- Hobby project prioritising **enjoyment and understanding** over prestige or performance perfection
- **Write code yourself, use LLMs to scrutinise and optimise** — not generate from scratch
- NIH philosophy — minimal external dependencies
- Unix philosophy for tooling — small focused composable utilities
- Windows 11 first, clean core VM logic for future Linux portability

---

### Lazarus Project Setup
- New project → **Program → Console Application** (no form designer)
- Close/ignore the form designer entirely — SOMA is headless
- Set `{$mode Delphi}` globally in project options
- Compiler switches: `-O2 -g- -al -XX -CX -Cg-`
  - `-O2` optimise
  - `-g-` no debug symbols
  - `-al` output `.s` assembly file
  - `-XX` strip binary
  - `-CX` smart linking
  - `-Cg-` disable position-independent code
- First session: compile an **empty program** and examine the `.s` file and binary size as a baseline

---

### Architecture Overview

**VM Type: Stack machine**
- Simpler instruction encoding than register-based
- More mutation/crossover friendly for evolutionary use
- Fixed-width 8-byte instructions

**Instruction Format**
```pascal
type
  TInstruction = packed record
    opcode: UInt16;   // 2 bytes - up to 65535 opcodes
    flags:  UInt8;    // 1 byte  - imm_size, addressing mode
    pad:    UInt8;    // 1 byte  - reserved/future
    imm:    Int32;    // 4 bytes - immediate value
  end;               // 8 bytes total, naturally aligned
```

**Opcode space partitioning**
- `$0000–$00FF` — Layer 0 primitives
- `$0100–$01FF` — Layer 1 evolved codons
- `$0200–$02FF` — Layer 2 and beyond
- `$FF00–$FFFF` — reserved/system

**Opcode constants**
```pascal
const
  OP_NOP      = $0000;
  OP_PUSH     = $0001;
  OP_POP      = $0002;
  LAYER1_BASE = $0100;
  LAYER2_BASE = $0200;
  SYS_BASE    = $FF00;
```

---

### VM State
```pascal
type
  TGenome = array[0..GENOME_SIZE-1] of TInstruction;

  TVMState = packed record
    stack:  array[0..STACK_SIZE-1] of Int64;
    sp:     Integer;
    ip:     Integer;
    genome: TGenome;
    pad:    array[0..N] of Byte; // pad to 64-byte boundary
  end;
  {$ALIGN 64}  // prevent false sharing between threads
```

---

### Multi-threading
- `BeginThread` to spin up N VM instances in parallel
- Each thread owns its own `TVMState` — **no shared register state**
- `TVMState` aligned to **64-byte cache line boundary** to prevent false sharing
- Thread proc signature:
```pascal
function VMThreadProc(param: Pointer): PtrInt;
// cast param to PVMState inside
```
- Critical section only for shared resources — genome pool, codon promotion, GLOG writes
- Worker threads do zero-lock independent fitness evaluation

---

### Layered Codon Architecture

**Layer 0** — hand-crafted primitives (stack ops, arithmetic, control flow, I/O)

**Layer 1** — evolved/promoted codon table
- Sequences of Layer 0 ops that proved useful get crystallised as named codons
- Promotion criteria options:
  - Frequency: same sequence appears independently in N fit genomes
  - Fitness delta: replacing sequence with codon reference improves compactness without losing fitness
  - Manual curation: you inspect and promote what looks genuinely interesting

**Layer 2+** — compositions of Layer 1 codons, building toward higher abstraction

Higher layers expand at compile/pre-execution time into Layer 0/1 sequences — the dispatch loop always sees flat efficient bytecode.

---

### Fitness System

**Plugin architecture — DLL per fitness criterion**
- Fitness DLLs loaded from a plugin directory via `LoadLibrary`/`GetProcAddress`
- Shared interface unit `soma_fitness.pas` included by both SOMA and every DLL:

```pascal
type
  TFitnessResult = record
    score:    Double;              // 0.0–1.0 normalised
    metrics:  array[0..7] of Double;
    label:    array[0..31] of Char;
    version:  UInt16;
    passed:   Boolean;             // gate criterion
  end;

  TFitnessFn = function(
    const genome: Pointer;
    genome_size:  UInt32;
    out result:   TFitnessResult
  ): Boolean; stdcall;
```

- `stdcall` enforced for consistent calling convention
- DLL functions must be **stateless** — no globals, no static buffers (multiple threads call simultaneously)

**Fitness criteria registry**
```pascal
type
  TFitnessCriterion = record
    fn:      TFitnessFn;
    enabled: Boolean;
    weight:  Double;
    label:   string[32];
  end;
```
- Final fitness = weighted sum across enabled criteria
- Criteria enabled/disabled via boolean flag
- Weights manually tunable, eventually partially evolvable

**Starter fitness criteria**
- Survival — completed without faulting (gate criterion)
- Density — meaningful opcode executions / genome length
- Stack discipline — stack depth variance
- Novelty — behavioural distance from existing population
- Codon reuse — how many Layer 1 codons appear
- Output production — wrote to buffer or channel

**Weight evolution**
- Disabled initially until stable starting population exists
- Enabled later as an optional evolutionary layer

---

### Benchmark System

**Self-improving benchmark suite**
- Benchmarks are fitness DLLs with a standard interface
- Results emitted as JSONL — one record per run:

```json
{
  "timestamp": "2026-06-23T14:32:00",
  "benchmark": "sort_integers",
  "version": "1.0",
  "genome_ref": "glog_4721_colony3",
  "score": 0.94,
  "passed": false,
  "promoted": false
}
```

**Benchmark promotion mechanic**
- SOMA beats current reference score by meaningful margin
- You inspect and validate — not auto-promoted
- Promoted genome becomes new reference implementation
- Benchmark version bumps, bar is raised
- Old scores become historical baseline

**Training wheels progression**
1. Sorting algorithms — ground truth is trivially verifiable
2. Matrix algebra — exercises different computational patterns
3. Mathematical algorithms — FFT, search, compression primitives
4. Composition problems — combining multiple sub-behaviours
5. Application-scale — something genuinely useful

---

### Logging

**GLOG — binary genome log**
- 32-byte packed records, append-only
- Written via ring buffer drained by dedicated logger thread — VM never blocks on I/O
- Format defined in SOMA spec (11 fields)
```pascal
type
  TGLogRecord = packed record
    // 11 fields totalling 32 bytes
  end;
  // Assert(SizeOf(TGLogRecord) = 32) at startup
```

**Benchmark record log**
- Append-only JSONL
- `genome_ref` field cross-references GLOG entries
- Logrotate: size or generation triggered, compress to `.jsonl.gz`
- Together GLOG + benchmark log form a **fossil record** of SOMA's development

**GLOG Viewer** — separate FP application
- Reads binary GLOG files independently of VM
- Charts fitness over generations, codon promotion events, opcode frequency heatmaps, benchmark milestone markers
- Built with Lazarus LCL + TAChart when you're ready

---

### Long-term Vision
- Bootstrap on well-understood algorithms (sorting, matrix algebra, maths)
- Evolved Layer 1 codons become a machine-grown mathematical library
- Progress toward more complex compositional problems
- Ultimate north star: evolve a genuinely novel and efficient computational approach — potentially an AI-specific or scientific language with primitives humans haven't formalised
- The benchmark suite as a living specification of what SOMA is becoming

---

### Immediate Next Steps
1. Tonight: compile empty FPC program, examine `.s` file and binary size with full optimisation switches
2. Define `TInstruction` and `TVMState` records
3. Stub dispatch loop — just prints opcode at each IP step
4. Load one fitness DLL successfully, call a dummy fitness function
5. Wrap in multi-threaded loop
6. First real evolutionary run with sorting benchmark