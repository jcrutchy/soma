unit soma_main;

interface

const
  OP_NOP      = $0000;
  OP_PUSH     = $0001;
  OP_POP      = $0002;
  LAYER1_BASE = $0100;
  LAYER2_BASE = $0200;
  SYS_BASE    = $FF00;
  GENOME_SIZE = 1024;
  STACK_SIZE  = 256;
  BASE_SIZE   = (STACK_SIZE * 8) + 8 + 8 + (GENOME_SIZE * 8);
  N_PAD       = (64 - (BASE_SIZE mod 64)) mod 64;

type

  TInstruction = packed record
    opcode: UInt16; // 2 bytes - up to 65535 opcodes
    flags: UInt8;   // 1 byte  - imm_size, addressing mode
    pad: UInt8;     // 1 byte  - reserved/future
    imm: Int32;     // 4 bytes - immediate value
  end;              // 8 bytes total, naturally aligned

  TGenome = array[0..(GENOME_SIZE - 1)] of TInstruction;

  TVMState = packed record
    stack: array[0..(STACK_SIZE - 1)] of Int64;
    sp: Int64;
    ip: Int64;
    genome: TGenome;
    pad: array[0..(N_PAD - 1)] of Byte; // pad to 64-byte boundary
  end;

  TFitnessResult = record
    score: Double; // 0.0–1.0 normalised
    metrics: array[0..7] of Double;
    tag: array[0..31] of Char;
    version: UInt16;
    passed: Boolean; // gate criterion
  end;

  TFitnessFn = function(
    const genome: Pointer;
    genome_size: UInt32;
    out result: TFitnessResult
  ): Boolean; stdcall;

implementation

end.
