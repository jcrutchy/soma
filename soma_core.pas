unit soma_core;

{$ASMMODE INTEL} // Intel syntax for readability

interface

uses
  soma_main;

procedure Execute(var State: TVMState);

implementation

procedure Execute(var State: TVMState);
label
  _Loop, _Fetch, _Execute, _NOP, _PUSH, _POP, _Exit;

// jump table array
const
  JumpTable: array[0..2] of Pointer = (
    @_NOP,
    @_PUSH,
    @_POP
  );

begin
  _Loop:
    if State.ip >= GENOME_SIZE then
    begin
      goto _Exit;
    end;

    // 1. Fetch
    // We get the pointer to the current instruction
    // In a real VM, you'd likely use a pointer to the genome block
    // Here we use the record field

    // 2. Dispatch (The Jump Table)
    // We load the opcode index, check bounds, then jump
    asm
      mov rax, State // point to State record
      mov rcx, [rax + 8192 + 2048 + 8] // load State.ip (simplified offset)
      // ... logic to scale index and jump
    end;

  // manual jump table implementation (Pascal labels)
  _Execute:
    // this is where you would normally have your dispatch logic
    // note: FPC doesn't allow "goto pointer" directly in high-level code,
    // so we use the computed jump table pattern

  _NOP:
    Inc(State.ip);
    goto _Loop;

  _PUSH:
    Inc(State.ip);
    Inc(State.sp);
    State.stack[State.sp] := State.genome[State.ip - 1].imm;
    goto _Loop;

  _POP:
    Inc(State.ip);
    Dec(State.sp);
    goto _Loop;

  _Exit:
end;

end.
