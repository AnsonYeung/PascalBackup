program SmallCafe;
uses crt;
var customers : integer;
begin
    write('Enter the number of customers: ');
    readln(customers);
    writeln('Large tables requied: ', customers div 6);
    writeln('Small tables required: ', (customers + 1) div 2 - customers div 6 * 3);
    readkey;
end.