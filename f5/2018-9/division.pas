program division;
uses crt;
var dividend : integer;
    divisor : integer;
begin
    write('Input dividend: ');
    readln(dividend);
    write('Input divisor: ');
    readln(divisor);
    writeln(divisor:5, ' | ', dividend:5);
    writeln('      -------');
    writeln('        ', dividend div divisor :5, '...', dividend mod divisor :5);
    readkey;
end.