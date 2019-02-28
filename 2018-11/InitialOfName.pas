program initial_of_name(input, output);
var
aname, bname, abbr : string;
pos : integer;

begin
    writeln('Sample Run :');
    write('Input Name? ');
    readLn(aname);
    bname := ' ';
    pos := 1;
    while (pos < Length(aname)) and (aname[pos] <> ' ') do
    begin
        bname := bname + UpCase(aname[pos]);
        pos := pos + 1;
    end;
    abbr := '';
    while (pos < Length(aname)) do
    begin
        if (aname[pos] = ' ') then
        begin
            while aname[pos] = ' ' do
                pos := pos + 1;
            abbr := abbr + UpCase(aname[pos]) + '.';
        end;
        pos := pos + 1;
    end;
    bname := abbr + bname;
    writeln('Output Name: ', bname);
    readln;
end.