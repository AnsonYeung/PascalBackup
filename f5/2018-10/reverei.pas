program reverse;
var i, n, r : longint;
begin
    n := 12345678;
    r := 0;
    {for i:= 0 to trunc(ln(n) / ln(10)) do
    begin
        r := r * 10 + n mod 10;
        n := n div 10;
    end;}
    while n <> 0 do
    begin
        r := r * 10 + n mod 10;
        n := n div 10;
    end;
    writeln('The reverse is ', r);
    readln;
end.