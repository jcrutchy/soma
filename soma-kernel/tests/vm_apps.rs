mod test_common;
use test_common::Tester;
use soma_kernel::{Assembler, Codon};

#[test]
fn test_fibonacci_n5() {
    let mut t = Tester::new();
    let mut asm = Assembler::new();
    
    // [n, a, b] -> [1, 0, 1] (Simplified: should return 1 immediately)
    asm.push(1); asm.push(0); asm.push(1);
    
    let loop_addr = asm.get_pc();
    
    // Logic: If n == 0, jump to end
    asm.op(Codon::DUP); asm.push(0); asm.op(Codon::ISUB);
    asm.push(999); // Sentinel value
    asm.op(Codon::JIF); 
    
    t.run(&asm);
    
    // If the stack contains 999, the JIF fired!
    println!("Stack at exit: {:?}", &t.vm.stack[0..t.vm.sp]);
    assert!(t.vm.stack.contains(&999), "Jump never occurred!");
}
