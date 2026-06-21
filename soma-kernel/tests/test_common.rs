pub struct Tester {
    pub vm: soma_kernel::SomaVM,
}

impl Tester {
    pub fn new() -> Self {
        Self { vm: soma_kernel::SomaVM::new() }
    }

    pub fn run(&mut self, asm: &soma_kernel::Assembler) {
        self.vm.running = true;
        while self.vm.running {
            self.vm.step(&asm.bytes);
        }
    }

    pub fn top(&self) -> u64 {
        self.vm.stack[self.vm.sp - 1]
    }
}
