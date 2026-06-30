unit soma_types;

{$mode Delphi}

interface

const
  // VM dimensions
  GENOME_SIZE = 4096;
  STACK_SIZE  = 256;

  // TVMState field offsets for asm use
  ISTACK_OFFSET     = 0;
  FSTACK_OFFSET     = STACK_SIZE * 8;                    // 2048
  ISP_OFFSET        = FSTACK_OFFSET + (STACK_SIZE * 8);  // 4096
  FSP_OFFSET        = ISP_OFFSET + 8;                    // 4104
  IP_OFFSET         = FSP_OFFSET + 8;                    // 4112
  RNG_OFFSET        = IP_OFFSET + 8;                     // 4120
  HALT_REASON_OFFSET= RNG_OFFSET + 8;                    // 4128
  GENOME_OFFSET     = HALT_REASON_OFFSET + 8;            // 4136

  // TVMState total size for padding calculation
  BASE_SIZE = (STACK_SIZE * 8)     // istack    2048
            + (STACK_SIZE * 8)     // fstack    2048
            + 8                    // isp          8
            + 8                    // fsp          8
            + 8                    // ip           8
            + 8                    // rng_state    8
            + 8                    // halt_reason  8
            + (GENOME_SIZE * 8);   // genome   32768
                                   // total    36864
  N_PAD = (64 - (BASE_SIZE mod 64)) mod 64;

  // Opcode space boundaries
  LAYER0_MAX  = $00FF;
  LAYER1_BASE = $0100;
  LAYER1_MAX  = $01FF;
  LAYER2_BASE = $0200;
  LAYER2_MAX  = $02FF;
  SYS_BASE    = $FF00;

  // Layer 0 opcodes
  // $00-$07 Integer stack ops
  OP_NOP      = $0000;
  OP_PUSH     = $0001;
  OP_POP      = $0002;
  OP_DUP      = $0003;
  OP_SWAP     = $0004;
  OP_OVER     = $0005;
  OP_ROT      = $0006;
  OP_DROP     = $0007;
  // $08-$0F reserved

  // $10-$18 Integer arithmetic
  OP_ADD      = $0010;
  OP_SUB      = $0011;
  OP_MUL      = $0012;
  OP_DIV      = $0013;
  OP_MOD      = $0014;
  OP_NEG      = $0015;
  OP_ABS      = $0016;
  OP_INC      = $0017;
  OP_DEC      = $0018;
  // $19-$1F reserved

  // $20-$26 Bitwise
  OP_AND      = $0020;
  OP_OR       = $0021;
  OP_XOR      = $0022;
  OP_NOT      = $0023;
  OP_SHL      = $0024;
  OP_SHR      = $0025;
  OP_SAR      = $0026;
  // $27-$2F reserved

  // $30-$35 Integer comparison
  OP_EQ       = $0030;
  OP_NEQ      = $0031;
  OP_LT       = $0032;
  OP_GT       = $0033;
  OP_LTE      = $0034;
  OP_GTE      = $0035;
  // $36-$3F reserved

  // $40-$45 Control flow
  OP_JMP      = $0040;
  OP_JZ       = $0041;
  OP_JNZ      = $0042;
  OP_CALL     = $0043;
  OP_RET      = $0044;
  OP_HALT     = $0045;
  // $46-$4F reserved

  // $50-$53 Memory
  OP_LOAD     = $0050;
  OP_STORE    = $0051;
  OP_MLOAD    = $0052;
  OP_MSTORE   = $0053;
  // $54-$5F reserved

  // $60-$64 Float stack ops
  OP_FPUSH    = $0060;
  OP_FPOP     = $0061;
  OP_FDUP     = $0062;
  OP_FSWAP    = $0063;
  OP_FDROP    = $0064;
  // $65-$6F reserved

  // $70-$77 Float arithmetic
  OP_FADD     = $0070;
  OP_FSUB     = $0071;
  OP_FMUL     = $0072;
  OP_FDIV     = $0073;
  OP_FNEG     = $0074;
  OP_FABS     = $0075;
  OP_FSQRT    = $0076;
  OP_FMOD     = $0077;
  // $78-$7F reserved

  // $80-$85 Float comparison
  OP_FEQ      = $0080;
  OP_FNEQ     = $0081;
  OP_FLT      = $0082;
  OP_FGT      = $0083;
  OP_FLTE     = $0084;
  OP_FGTE     = $0085;
  // $86-$8F reserved

  // $90-$91 Conversion
  OP_I2F      = $0090;
  OP_F2I      = $0091;
  // $92-$9F reserved

  // $A0-$A5 System
  OP_RAND     = $00A0;
  OP_FRAND    = $00A1;
  OP_PCNT     = $00A2;
  OP_YIELD    = $00A3;
  OP_IN       = $00A4;
  OP_OUT      = $00A5;
  // $A6-$FF reserved

  // Valid opcode table for mutation engine and genome initialisation
  // All 63 implemented Layer 0 opcodes in a flat array
  VALID_OPCODE_COUNT = 67;
  VALID_OPCODES: array[0..VALID_OPCODE_COUNT-1] of UInt16 = (
    // Integer stack ops (8)
    OP_NOP,  OP_PUSH, OP_POP,  OP_DUP,
    OP_SWAP, OP_OVER, OP_ROT,  OP_DROP,
    // Integer arithmetic (9)
    OP_ADD,  OP_SUB,  OP_MUL,  OP_DIV,
    OP_MOD,  OP_NEG,  OP_ABS,  OP_INC,
    OP_DEC,
    // Bitwise (7)
    OP_AND,  OP_OR,   OP_XOR,  OP_NOT,
    OP_SHL,  OP_SHR,  OP_SAR,
    // Integer comparison (6)
    OP_EQ,   OP_NEQ,  OP_LT,   OP_GT,
    OP_LTE,  OP_GTE,
    // Control flow (6)
    OP_JMP,  OP_JZ,   OP_JNZ,  OP_CALL,
    OP_RET,  OP_HALT,
    // Memory (4)
    OP_LOAD, OP_STORE, OP_MLOAD, OP_MSTORE,
    // Float stack ops (5)
    OP_FPUSH, OP_FPOP, OP_FDUP, OP_FSWAP,
    OP_FDROP,
    // Float arithmetic (8)
    OP_FADD, OP_FSUB, OP_FMUL, OP_FDIV,
    OP_FNEG, OP_FABS, OP_FSQRT, OP_FMOD,
    // Float comparison (6)
    OP_FEQ,  OP_FNEQ, OP_FLT,  OP_FGT,
    OP_FLTE, OP_FGTE,
    // Conversion (2)
    OP_I2F,  OP_F2I,
    // System (6)
    OP_RAND, OP_FRAND, OP_PCNT, OP_YIELD,
    OP_IN,   OP_OUT
  );

  // Halt reason codes - written to halt_reason field before @Exit
  HR_NONE         = 0;
  HR_HALT         = 1;  // OP_HALT executed
  HR_YIELD        = 2;  // OP_YIELD - voluntary checkpoint
  HR_BOUNDS       = 3;  // ip >= GENOME_SIZE
  HR_DIV_ZERO     = 4;  // integer divide by zero
  HR_FDIV_ZERO    = 5;  // float divide by zero
  HR_UNUSED       = 6;  // hit @UNUSED opcode
  HR_HIGHER_LAYER = 7;  // Layer 1+ opcode not yet implemented

type
  TInstruction = packed record
    opcode: UInt16;  // 2 bytes
    flags:  UInt8;   // 1 byte  - imm_size, addressing mode
    pad:    UInt8;   // 1 byte  - reserved
    imm:    Int32;   // 4 bytes - immediate value
  end;               // 8 bytes total

  TGenome = array[0..(GENOME_SIZE-1)] of TInstruction;

  TVMState = packed record
    istack:      array[0..(STACK_SIZE-1)] of Int64;   // integer stack
    fstack:      array[0..(STACK_SIZE-1)] of Double;  // float stack
    isp:         Int64;                               // integer stack pointer
    fsp:         Int64;                               // float stack pointer
    ip:          Int64;                               // instruction pointer
    rng_state:   UInt64;                              // xorshift64 rng seed
    halt_reason: UInt64;                              // why execution stopped
    genome:      TGenome;                             // program genome
    {$IF N_PAD > 0}
    pad:         array[0..(N_PAD-1)] of Byte;         // 64-byte cache line pad
    {$ENDIF}
  end;

  TFitnessResult = record
    score:   Double;                // 0.0-1.0 normalised
    metrics: array[0..7] of Double; // benchmark-specific
    tag:     array[0..31] of Char;  // which benchmark
    version: UInt16;                // fitness file version
    passed:  Boolean;               // gate criterion met
  end;

  TFitnessFn = function(
    const genome: Pointer;
    genome_size:  UInt32;
    out result:   TFitnessResult
  ): Boolean; stdcall;

implementation

initialization
  Assert(SizeOf(TInstruction) = 8,              'TInstruction size mismatch');
  Assert(ISTACK_OFFSET      = 0,                'ISTACK_OFFSET mismatch');
  Assert(FSTACK_OFFSET      = 2048,             'FSTACK_OFFSET mismatch');
  Assert(ISP_OFFSET         = 4096,             'ISP_OFFSET mismatch');
  Assert(FSP_OFFSET         = 4104,             'FSP_OFFSET mismatch');
  Assert(IP_OFFSET          = 4112,             'IP_OFFSET mismatch');
  Assert(RNG_OFFSET         = 4120,             'RNG_OFFSET mismatch');
  Assert(HALT_REASON_OFFSET = 4128,             'HALT_REASON_OFFSET mismatch');
  Assert(GENOME_OFFSET      = 4136,             'GENOME_OFFSET mismatch');
  Assert(BASE_SIZE          = 36864,            'BASE_SIZE mismatch');
  Assert(SizeOf(TVMState)   = BASE_SIZE + N_PAD,'TVMState size mismatch');
  Assert(VALID_OPCODE_COUNT = 67,               'VALID_OPCODE_COUNT mismatch');

end.
