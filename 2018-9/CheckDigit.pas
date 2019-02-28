program CheckDigit;
uses crt;
var id : string;
    sum : integer;
    i : integer;
    digit : char;
begin
    write('Enter the HKID: ');
    readln(id);
    if Length(id) = 7 then
    begin
        id := upcase(id);
        sum := (ord(id[1]) - 64) * 8;
        for i := 2 to 7 do
            sum := sum + (ord(id[i]) - 48) * (9 - i);
        sum := 11 - sum mod 11;
        case sum of
            10: digit := 'A';
            11: digit := '0';
            else digit := chr(48 + sum);
        end;
        writeln('Check Digit = ', digit);
    end
    else
        writeln('ID not in correct format.');
    readkey;
end.