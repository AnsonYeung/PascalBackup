program DenBinConvert;
var
d : integer;
b : string;

function Den2Bin(x : integer) : string;
var b : string;
begin
    b := '';
    repeat
        b := chr(48 + x mod 2) + b;
        x := x div 2;
    until x = 0;
    Den2Bin := b;
end;

function Bin2Den(x : string) : integer;
var d : integer;
begin
    d := 0;
    repeat
        d := d * 2;
        case b[1] of 
            '0': ;
            '1': d := d + 1;
            else writeln('Error reading the binary number');
        end;
        b := copy(b, 2, Length(b) - 1);
    until b = '';
    Bin2Den := d;
end;

begin
    d := 45;
    b := '1011010';
    writeln(Den2Bin(d));
    writeln(Bin2Den(b));
    readln;
end.