program MultTable;
uses crt;
var n, i, j: integer;
const space : integer = 4;
begin
    write('Enter N: ');
    readln(n);
    for i := -1 to n do
    begin
        case i of 
            -1: begin
                write('|':space+1);
                for j := 1 to n do
                    write(j:space);
                writeln;
            end;
            0: begin
                for j := 1 to space do
                    write('-');
                write('+');
                for j := 1 to n * space do
                    write('-');
                writeln;
            end;
            else begin
                write(i:space, '|');
                for j := 1 to n do
                    write(i * j :space);
                writeln;
            end;
        end;
    end;
    readkey;
end.