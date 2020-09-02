program Factorial;
uses crt;
var i, j : integer; result : longint;

function Factorial(n: integer) : longint;
var i : integer; result : longint;
begin
    result := 1;
    for i := 2 to n do
        result := result * i;
    Factorial := result;
end;

function Power(a: real; n: integer) : real;
var i : integer; result : real;
begin
    if a = 0 then
        if n <= 0 then
            Power := 0/0
        else
            Power := 0
    else if a < 0 then
        if Abs(n) mod 2 = 0 then
            Power := Exp(n * Ln(-a))
        else
            Power := -Exp(n * Ln(-a))
    else
        Power := Exp(n * Ln(a));
end;

begin
    for i := -2 to 4 do
    begin
        for j := -2 to 3 do
            write(Power(i, j):8:3);
        writeln;
    end;
    for i := 1 to 4 do
        writeln(i, '! = ', Factorial(i));
    for i := 1 to 5 do
    begin
        result := 1;
        for j := 1 to 5 do
        begin
            result := result * i;
            write(result:5);
        end;
        writeln;
    end;
    for i := 1 to 6 do
    begin
        for j := 1 to 6 do
            write(i, '+', j, '=', i + j:2, '':3);
        writeln;
    end;
    readkey;
end.
