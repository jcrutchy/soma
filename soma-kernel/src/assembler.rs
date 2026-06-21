use crate::codon::Codon;

pub struct Assembler {
    pub bytes: Vec<u8>,
}

impl Assembler {
    pub fn new() -> Self { Self { bytes: Vec::new() } }

    pub fn push(&mut self, val: u64) {
        self.bytes.push(Codon::PUSH8 as u8);
        self.bytes.extend_from_slice(&val.to_le_bytes());
    }

    pub fn op(&mut self, opcode: Codon) {
        self.bytes.push(opcode as u8);
    }

    pub fn get_pc(&self) -> usize {
        self.bytes.len()
    }
}
