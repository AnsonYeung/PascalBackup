
Program chickenAndRabbit;

Var heads, legs, halflegs : integer;
Begin
  write('Enter the number of heads: ');
  readln(heads);
  write('Enter the number of legs: ');
  readln(legs);
  halflegs := legs div 2;
  writeln('The number of chicken is ', 2 * heads - halflegs,
          ' and the number of rabbits is ', halflegs - heads;
  readln;
End.
