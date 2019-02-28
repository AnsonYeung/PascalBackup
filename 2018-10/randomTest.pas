program ramdpmTest;
var i:integer;
begin
    randomize;
    for i := 0 to 20000 do
    begin
        randomize;
        writeln(random(5)+1);
    end;
    readln;
end.