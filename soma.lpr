program soma;

uses
  soma_main,
  soma_core,
  soma_types;

var
  StateSize: Integer;

begin
  StateSize := SizeOf(soma_types.TVMState);
  if (StateSize mod 64) <> 0 then
  begin
    Writeln('ALIGNMENT ERROR: TVMState size is ', StateSize);
    Writeln('Size must be a multiple of 64.');
    Writeln('Press Enter to exit...');
    Readln;
    Halt(1); // exit with error code
  end;
  Writeln('Alignment check passed! Size is: ', StateSize);
  Writeln('Execution finished. Press Enter to exit...');
  Readln;
end.
