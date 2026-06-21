#[allow(dead_code)]
#[repr(u8)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Codon {
    // --- CONTROL ---
    NOP    = 0x00,
    HLT    = 0x01,
    JMP    = 0x02,
    JIF    = 0x03,
    JNF    = 0x04,
    CALL   = 0x05,
    RET    = 0x06,
    SWAP   = 0x07, // Replaced YLD

    // --- INT ARITHMETIC ---
    IADD   = 0x08,
    ISUB   = 0x09,
    IMUL   = 0x0A,
    IDIV   = 0x0B,
    IMOD   = 0x0C,
    INEG   = 0x0D,
    POP    = 0x0E, // Replaced IABS
    ICONV  = 0x0F,

    // --- FLOAT ARITHMETIC ---
    FADD   = 0x10,
    FSUB   = 0x11,
    FMUL   = 0x12,
    FDIV   = 0x13,
    FMOD   = 0x14,
    FNEG   = 0x15,
    FABS   = 0x16,
    FCONV  = 0x17,

    // --- BITWISE / LOGIC ---
    AND    = 0x18,
    OR     = 0x19,
    XOR    = 0x1A,
    NOT    = 0x1B,
    SHL    = 0x1C,
    SHR    = 0x1D,
    SAR    = 0x1E,
    POPCNT = 0x1F,

    // --- COMPARE ---
    EQ     = 0x20,
    NEQ    = 0x21,
    LT     = 0x22,
    LTE    = 0x23,
    GT     = 0x24,
    GTE    = 0x25,
    ZERO   = 0x26,
    NZERO  = 0x27,

    // --- MEMORY ---
    LD     = 0x28,
    ST     = 0x29,
    LDB    = 0x2A,
    STB    = 0x2B,
    ALLOC  = 0x2C,
    FREE   = 0x2D,
    DUP    = 0x2E, // Replaced COPY
    OVER   = 0x2F, // Replaced FILL
    ROT    = 0x30,

    // --- GENOME ---
    GADDR  = 0x31,
    GNEW   = 0x32,
    GDEL   = 0x33,
    GMETA  = 0x34,
    GLOG   = 0x35,
    GFLUSH = 0x36,
    GHASH  = 0x37,
    GSIGN  = 0x38,

    // --- ENTITY / IO ---
    SYSCALL = 0x39,
    SPAWN   = 0x3A,
    SEND    = 0x3B,
    RECV    = 0x3C,
    EMIT    = 0x3D,
    PCNT    = 0x3E,
    SCHED   = 0x3F,
    DIE     = 0x40,

    // --- ARCHITECTURAL PREFIXES ---
    // Immediate Prefix (8-byte constant)
    PUSH8 = 0xF0, 
}
