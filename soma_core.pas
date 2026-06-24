unit soma_core;

{$ASMMODE INTEL} // Intel syntax for readability

interface

uses
  soma_main;

procedure Execute(var State: TVMState);

implementation

procedure Execute(var State: TVMState);
var
  JumpTable: array[0..2] of Pointer;
label
  _NOP, _PUSH, _POP, _Loop, _Exit;
begin
  JumpTable[0] := @_NOP;
  JumpTable[1] := @_PUSH;
  JumpTable[2] := @_POP;

  asm
  // Preserve caller-saved registers that we are about to clobber
      push rbx
      push r12
      push r13
      push r14

    mov rbx, [State]        // Load State pointer
    mov r12, [rbx + 2056]   // Load ip
    mov r13, [rbx + 2048]   // Load sp
    lea r14, [rbp - 32]    // Load address of JumpTable on stack

    _Loop:
    cmp r12, 1024
    jge _Exit

    // Fetch Opcode
    lea rax, [rbx + 2064]
    movzx rdx, word ptr [rax + r12*8]

    // Dispatch: [r14 + rdx*8]
    mov rax, [r14 + rdx*8]
    jmp rax

    _NOP:
      inc r12
      jmp _Loop

    _PUSH:
      inc r12
      inc r13
      jmp _Loop

    _POP:
      inc r12
      dec r13
      jmp _Loop

    _Exit:
    mov [rbx + 2056], r12
    mov [rbx + 2048], r13

    // Restore registers
        pop r14
        pop r13
        pop r12
        pop rbx
  end;
end;

end.
