program recursion;
procedure try1(y : Integer);
Begin
	y := y + 1;
	WriteLn('Hi, ', y);
	If y < 10 Then
		try1(y);
	WriteLn('Hi, ', y);
End;

Function rec(y: Integer): Integer;
Begin
	If y > 0 Then
		rec := y + rec(y - 1)
	Else
		rec := 0;
End;

Function factorial(y: Integer): Integer;
Begin
	If y > 0 Then
		factorial := y * factorial(y - 1)
	Else
		factorial := 1;
End;

Begin
	WriteLn(Factorial(17));
	ReadLn();
End.