program GCD;
var x, y : integer;

function GCD_1(x,y:integer) : integer;
var i, gcd, tmp : integer;
begin
    if y > x then
    begin
        tmp := x;
        x := y;
        y := tmp;
    end;
    for i := 1 to x do
        if (x mod i = 0) and (y mod i = 0) then
            gcd := i;
    GCD_1 := gcd;
end;

function GCD_2(x,y:integer) : integer;
var gcd, tmp : integer;
begin
    if y > x then
    begin
        tmp := x;
        x := y;
        y := tmp;
    end;
    gcd := x;
    while (x mod gcd <> 0) or (y mod gcd <> 0) do
        gcd := gcd - 1;
    GCD_2 := gcd;
end;

function GCD_3(x,y:integer) : integer;
begin
    if x = 0 then
        GCD_3 := y
    else
        GCD_3 := GCD_3(y mod x, x);
end;

function GCD_4(x,y:integer) : integer;
var tmp : integer;
begin
    repeat
        tmp := y mod x;
        y := x;
        x := tmp;
    until x = 0;
    GCD_4 := y;
end;

begin
    while true do
    begin
        read(x,y);
        writeln(GCD_1(x,y));
        writeln(GCD_2(x,y));
        writeln(GCD_3(x,y));
        writeln(GCD_4(x,y));
    end;
end.