program Tree;
uses crt;
var level, i, j, k : integer;

begin
    randomize;
    write('Level? ');
    readln(level);
    for i := 2 to level + 1 do
    begin
        for j := 1 to i do
        begin
            write('':WindMaxX div 2 - j);
            for k := 1 to j * 2 - 1 do
            begin
                if (i = j) or (k = 1) or (k = (j * 2 - 1)) then
                    write('*')
                else write('\');
                delay(1)
            end;
            writeln;
        end;
    end;
    write('|':WindMaxX div 2);
    {* Animation *}
    cursoroff;
    while true do
    begin
        GoToXY(WindMaxX div 2, 2);
        TextColor(random(16)+1);
        write('*');
        delay(1000);

    end;
    readkey;
end.