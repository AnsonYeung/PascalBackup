program FileAccess;
Var i, input, count, sum : integer;
    f : text;
    s : string;
begin
    Assign(f, 'E:\s151204\data.txt');
    Reset(f);
    repeat
        ReadLn(f, s);
        WriteLn(s);
    until EOF(f);
    Close(f);
    ReadLn();
end.