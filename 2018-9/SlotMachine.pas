program SlotMachine(input, output);
USES cRt;
var i : integer;
    response : char;
    slots : array[1..3] of integer;

begin
    writeln('*** SLOT MACHINE ***');
    writeln('Press any key to start!');
    readln;
    randomize;
    repeat
        for i:=1 to 3 do
            slots[i] := random(6) + 1;
        for i:=1 to 3 do
            write(slots[i]:2);
        writeln;
        if (slots[1] = slots[2]) and (slots[1] = slots[3]) then;
            writeln('~~~ BINGO ~~~');
        writeln;
        write('Continue? (y/n) ');
        readln(response);
    until response = 'n';
end.
