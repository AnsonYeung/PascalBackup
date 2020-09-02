
Program calculation(input, output);

Const PI = 3.14;

Var radius, height : integer;
Begin
  write('Please enter the radius ');
  readln(radius);
  write('Please enter the height ');
  readln(height);
  writeln('The volume is ', radius * radius * height * PI / 3:0:1, ' cubic unit'
  );
  writeln('The total surface area is ', PI * radius * sqrt(radius * radius +
          height * height) + PI * radius * radius: 0: 2, ' square unit');
  readln;
End.
