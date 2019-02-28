program Grade;
uses crt;
var input:char;
    exiting:boolean;

begin
    exiting := false;
    while not exiting do
    begin
        write('Which grade do you want? ');
        readln(input);
        case input of
            'a': writeln('Average');
            'b': writeln('Bad');
            'c': writeln('Credit');
            'd': writeln('Distinction');
            'e': writeln('Excellent');
            'f': writeln('Fantastic');
            'g': writeln('Good');
            'u': writeln('Undefeatable!!!');
            'z': exiting:=true;
            else writeln('No comment');
        end;
    end;
end.