use soma_kernel::{vm::SomaVM, assembler::Assembler, codon::Codon};

fn main() {
    let mut asm = Assembler::new();

    // Example: A simple program to demonstrate the VM is running
    // PUSH 10, PUSH 20, IADD, HLT
    asm.push(10);
    asm.push(20);
    asm.op(Codon::IADD);
    asm.op(Codon::HLT);

    let mut vm = SomaVM::new();
    vm.running = true;

    while vm.running {
        vm.step(&asm.bytes);
    }

    println!("Execution finished. Final stack top: {}", vm.stack[vm.sp - 1]);
}
