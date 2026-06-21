use crate::codon::Codon;

pub struct SomaVM {
    pub stack: [u64; 1024],
    pub sp: usize,
    pub pc: usize,
    pub call_stack: [usize; 256],
    pub csp: usize,
    pub running: bool,
}

const SOMA_MAX_CALL_DEPTH: usize = 256;
const SOMA_MAX_STACK_DEPTH: usize = 1024;

impl SomaVM {
    pub fn new() -> Self {
        Self {
            stack: [0; 1024],
            sp: 0,
            pc: 0,
            call_stack: [0; 256],
            csp: 0,
            running: false,
        }
    }

    fn verify_state(&mut self) -> bool {
        if self.sp >= SOMA_MAX_STACK_DEPTH || self.csp >= SOMA_MAX_CALL_DEPTH {
            self.running = false;
            return false;
        }
        true
    }

    pub fn step(&mut self, memory: &[u8]) {
        if !self.running || self.pc >= memory.len() {
            self.running = false;
            return;
        }

        if !self.verify_state() { return; }

        let opcode_byte = memory[self.pc];
        self.pc += 1;

        // Safer opcode decoding
        let opcode = match opcode_byte {
            0x00..=0x30 => unsafe { std::mem::transmute::<u8, Codon>(opcode_byte) },
            0xF0 => Codon::PUSH8,
            _ => Codon::NOP,
        };

        // DEBUG / TESTING
        println!("DEBUG: PC={:02} | Op={:?} | SP={:?}", self.pc, opcode, self.sp);

        match opcode {
            Codon::NOP => {}
            Codon::HLT => self.running = false,
            Codon::JMP => {
                self.pc = self.stack[self.sp - 1] as usize;
                self.sp -= 1;
            }
            Codon::JIF => {
                let addr = self.stack[self.sp - 1] as usize;
                let cond = self.stack[self.sp - 2];
                self.sp -= 2;
                if cond != 0 { self.pc = addr; }
            }
            Codon::SWAP => {
                let a = self.stack[self.sp - 1];
                let b = self.stack[self.sp - 2];
                self.stack[self.sp - 1] = b;
                self.stack[self.sp - 2] = a;
            }
            Codon::POP => {
                if self.sp > 0 { self.sp -= 1; } 
                else { self.running = false; }
            }
            Codon::IADD => {
                if self.sp >= 2 {
                    let b = self.stack[self.sp - 1];
                    let a = self.stack[self.sp - 2];
                    self.sp -= 1;
                    self.stack[self.sp - 1] = a.wrapping_add(b);
                } else { self.running = false; }
            }
            Codon::ISUB => {
                if self.sp >= 2 {
                    let b = self.stack[self.sp - 1];
                    let a = self.stack[self.sp - 2];
                    self.sp -= 1;
                    self.stack[self.sp - 1] = a.wrapping_sub(b);
                } else { self.running = false; }
            }
            Codon::IMUL => {
                if self.sp >= 2 {
                    let b = self.stack[self.sp - 1];
                    let a = self.stack[self.sp - 2];
                    self.sp -= 1;
                    self.stack[self.sp - 1] = a.wrapping_mul(b);
                } else { self.running = false; }
            }
            Codon::DUP => {
                let a = self.stack[self.sp - 1];
                self.stack[self.sp] = a;
                self.sp += 1;
            }
            Codon::OVER => {
                let a = self.stack[self.sp - 2];
                self.stack[self.sp] = a;
                self.sp += 1;
            }
            Codon::ROT => {
                // Rotates top 3: [c, b, a] (where a is top) becomes [b, a, c]
                let a = self.stack[self.sp - 1];
                let b = self.stack[self.sp - 2];
                let c = self.stack[self.sp - 3];
                self.stack[self.sp - 3] = b;
                self.stack[self.sp - 2] = a;
                self.stack[self.sp - 1] = c;
            }
            Codon::PUSH8 => {
                let mut bytes = [0u8; 8];
                bytes.copy_from_slice(&memory[self.pc..self.pc + 8]);
                let val = u64::from_le_bytes(bytes);
                self.stack[self.sp] = val;
                self.sp += 1;
                self.pc += 8;
            }
            _ => {}
        }
    }
}
