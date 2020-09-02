program greeting;
uses crt;
var name : string;
begin
    write(' Your name is ?');
    readln(name);
    writeln('Hi ', name, ', I am Mr. Computer.');
    writeln('Nice to meet you.');
    readkey;
end.