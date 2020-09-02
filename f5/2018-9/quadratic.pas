program quadratic;
uses crt;
var a, b, c, delta : integer;
begin
    write('a=? ');
    readln(a);
    write('b=? ');
    readln(b);
    write('c=? ');
    readln(c);
    if a = 0 then
    begin
        writeln('The equation is linear');
        writeln('The solution is ', -c / b :0:2)
    end
    else
    begin
        writeln('The equation is quadratic');
        delta := b * b - 4 * a * c;
        if delta < 0 then
            writeln('The equation has no real roots.')
        else if delta = 0 then
        begin
            writeln('The equation has repeated real roots:');
            writeln(-b / (2 * a) :0:2)
        end
        else
        begin
            writeln('The equation has two distinct real roots:');
            writeln((-b + sqrt(delta)) / (2 * a) :0:2, ' ', (-b - sqrt(delta)) / (2 * a) :0:2)
        end
    end;
    readkey
end.