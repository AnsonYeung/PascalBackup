program distance;
uses crt;
var a : integer;
    b : integer;
    c : integer;
    x1 : integer;
    x2 : integer;
    numerator : integer;
    denominator : real;
    denominatorsq : integer;
begin
    write('Enter the value of a: ');
    readln(a);
    write('Enter the value of b: ');
    readln(b);
    write('Enter the value of c: ');
    readln(c);
    write('Enter the value of x1: ');
    readln(x1);
    write('Enter the value of x2: ');
    readln(x2);
    numerator := abs(a * x1 + b * x2 + c);
    denominatorsq := a * a + b * b;
    denominator := sqrt(denominatorsq);
    writeln('The value of numerator  : ', numerator:5);
    writeln('The value of denominator: ', denominator:5:3);
    writeln('The value of d: ', numerator / denominator:5:3);
    readkey;
end.