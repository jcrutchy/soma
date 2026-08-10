program random_fuzz;
{$mode Delphi}
{$H+}
uses soma_types, soma_core, soma_evolution, SysUtils, Math;

var
  State: TVMState;
  G: TGenome;
  rng: UInt64;
  i: Integer;
  haltCounts: array[0..15] of Integer;
  hr: Integer;
begin
  FillChar(haltCounts, SizeOf(haltCounts), 0);
  rng := $BADC0FFEE0DDF00D;

  for i := 1 to 100000 do
  begin
    RandomGenome(G, rng);
    FillChar(State, SizeOf(State), 0);
    State.genome := G;
    Write('.'); if (i mod 100) = 0 then Writeln(' ', i);
    Flush(Output);
    Execute(State);

    hr := State.halt_reason;
    if (hr >= 0) and (hr <= 15) then
      Inc(haltCounts[hr])
    else
      Writeln('unexpected halt_reason ', hr, ' at genome ', i);

    if (i mod 20000) = 0 then
    begin
      Writeln(i, ' random genomes executed without crashing');
      Flush(Output);
    end;
  end;

  Writeln;
  Writeln('Halt reason distribution over 100000 random genomes:');
  for hr := 0 to 15 do
    if haltCounts[hr] > 0 then
      Writeln('  ', hr, ': ', haltCounts[hr]);

  Writeln;
  Writeln('FUZZ TEST COMPLETE: 100000 random genomes, zero crashes');
end.
