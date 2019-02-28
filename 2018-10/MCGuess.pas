program MCGuess;
var i:integer;
begin
    randomize;
    writeln('Blind Guess');
    for i := 1 to 30 do
    begin
        write('MC Answer ', i:2, ' = ', chr(random(4) + 65), '':3);
        if i mod 3 = 0 then
            writeln;
    end;
    readln;
end.