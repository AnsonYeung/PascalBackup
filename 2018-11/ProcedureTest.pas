program ProcedureTest;
var
    S: string;
    num, err: integer;
    numr: real;
begin
    numr := 246.135;
    writeln(numr:4:0);
    while true do
    begin
        readln(S);
        Val(S, num, err);
        writeln(num:20, err:20);
        Val(S, numr, err);
        writeln(numr:20, err:20);
    end;
end.