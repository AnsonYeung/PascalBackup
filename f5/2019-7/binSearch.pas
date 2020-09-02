program binSearch;
Var f, m, l, target: Integer;
	data: Array[1..9] Of Integer;
	isFound: Boolean;
Begin
	data[1] := 2;
	data[2] := 3;
	data[3] := 5;
	data[4] := 7;
	data[5] := 13;
	data[6] := 19;
	data[7] := 23;
	data[8] := 29;
	data[9] := 31;
	readln(target);
	f := 1;
	l := 3;
	isFound := False;
	While Not isFound And (f <= l) Do
	Begin
		{m := (f + l) div 2;}
		m := f div 2 + l div 2;
		If target > data[m] Then
			f := m + 1
		Else If target < data[m] Then
			l := m - 1
		Else
			isFound := True;
	End;

	If isFound Then
		WriteLn(target, ' is found at ', m)
	Else
		WriteLn('Not Found');
	ReadLn;
End.