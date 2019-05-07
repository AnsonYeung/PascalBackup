Program sort;
Uses Sysutils;
Const size = 5;
Var list : Array[1..size] Of Integer;
	i, pass: Integer;

Procedure bubblesort();
Var i: Integer;
	tmp: Integer;
	flag: Boolean;
Begin
	pass := size - 1;
	flag := True;
	While (pass >= 1) And flag Do
	Begin
		flag := False;
		For i := 1 To pass Do
			If list[i] > list[i + 1] Then
			Begin
				flag := True;
				tmp := list[i];
				list[i] := list[i + 1];
				list[i + 1] := tmp;
			End;
		Dec(pass);
	End;
End;

Begin
	list[1] := 18;
	list[2] := 16;
	list[3] := 19;
	list[4] := 17;
	list[5] := 15;
	if size in [1,5] Then
	Begin
		writeln('test');
	End;
	bubblesort;

	for i := 1 To Size Do
		writeLn(list[i]);
	ReadLn;
End.