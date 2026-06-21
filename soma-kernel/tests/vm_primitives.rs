mod test_common;
use test_common::Tester;
use soma_kernel::{Assembler, Codon};

// --- POSITIVE TESTS ---

#[test]
fn test_math_ops() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    // (10 + 20) * 2 - 5 = 55
    asm.push(10); asm.push(20); asm.op(Codon::IADD);
    asm.push(2); asm.op(Codon::IMUL);
    asm.push(5); asm.op(Codon::ISUB);
    asm.op(Codon::HLT);
    t.run(&asm);
    assert_eq!(t.top(), 55);
}

#[test]
fn test_stack_manipulation() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    // DUP, OVER, ROT, SWAP
    asm.push(1); asm.push(2); asm.push(3); // [1, 2, 3]
    asm.op(Codon::DUP);                    // [1, 2, 3, 3]
    asm.op(Codon::OVER);                   // [1, 2, 3, 3, 2]
    asm.op(Codon::SWAP);                   // [1, 2, 3, 2, 3]
    asm.op(Codon::POP); asm.op(Codon::POP); // [1, 2, 3]
    asm.op(Codon::ROT);                    // [2, 3, 1]
    asm.op(Codon::HLT);
    t.run(&asm);
    assert_eq!(t.top(), 1);
    assert_eq!(t.vm.stack[t.vm.sp - 2], 3);
    assert_eq!(t.vm.stack[t.vm.sp - 3], 2);
}

// --- EDGE / CORNER CASE TESTS ---

#[test]
fn test_wrapping_behavior() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    // Test 0 - 1 = U64_MAX
    asm.push(0); asm.push(1); asm.op(Codon::ISUB); asm.op(Codon::HLT);
    t.run(&asm);
    assert_eq!(t.top(), u64::MAX);
}

#[test]
fn test_branching_conditions() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    // If cond=1, jump to addr. If cond=0, don't.
    let target = 15; 
    asm.push(0); asm.push(target as u64); asm.op(Codon::JIF); // Should NOT jump
    asm.push(99); asm.op(Codon::HLT);
    // ... code at 15
    asm.push(77); asm.op(Codon::HLT);
    
    t.run(&asm);
    assert_eq!(t.top(), 99); // Assert we didn't jump
}

#[test]
fn test_stack_overflow_protection() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    // Force stack past 1024
    for _ in 0..1025 { asm.push(1); }
    t.run(&asm);
    assert_eq!(t.vm.running, false); // VM should have halted
}

#[test]
fn test_invalid_opcode() {
    let mut t = Tester::new();
    // 0xFF is not a defined Codon, should NOP and HLT
    let asm = Assembler { bytes: vec![0xFF, Codon::HLT as u8] };
    t.run(&asm);
    assert_eq!(t.vm.running, false);
}

#[test]
fn test_empty_stack_ops() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    // Attempting to POP an empty stack
    asm.op(Codon::POP); asm.op(Codon::HLT);
    t.run(&asm);
    // Depending on your implementation, this should either panic or set running=false
    // If you haven't handled this, this test will fail, which is good!
    assert_eq!(t.vm.running, false);
}
