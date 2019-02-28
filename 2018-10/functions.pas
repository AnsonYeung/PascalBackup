program functions;
uses crt;

function c_to_f(C:real):real;
begin
    c_to_f := 9 / 5 * c + 32
end;

function get_Day(x : integer):string;
begin
    case x of
        1: get_Day := 'Monday';
        2: get_Day := 'Tuesday';
        3: get_Day := 'Wednesday';
        4: get_Day := 'Thursday';
        5: get_Day := 'Friday';
        6: get_Day := 'Saturday';
        7: get_Day := 'Suncday';
        else get_Day := '';
    end;
end;

begin
    writeln(get_Day(5));
    readkey;
end.