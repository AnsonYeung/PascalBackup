Program sort;
Uses Sysutils;
Const size = 5;
Var list : Array[1..size] Of Integer;
	i: Integer;

Procedure SwapInt(Var a, b: Integer);
Var tmp : Integer;
Begin
	tmp := a;
	a := b;
	b := tmp;
End;

Procedure bubblesort();
Var i, pass: Integer;
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
				SwapInt(list[i], list[i + 1]);
			End;
		Dec(pass);
	End;
End;

Procedure selectionsort();
Var largestLoc: Integer;
	i, pass: Integer;
Begin
	For pass := size DownTo 2 Do
	Begin
		largestLoc := 1;
		For i := 2 To pass Do
			If list[largestLoc] < list[i] Then
				largestLoc := i;
		SwapInt(list[largestLoc], list[pass]);
	End;
End;

Procedure selectionsort2();
Var smallestLoc: Integer;
	i, pass: Integer;
Begin
	For pass := 1 to size - 1 Do
	Begin
		smallestLoc := pass;
		For i := pass + 1 To size Do
			If list[smallestLoc] > list[i] Then
				smallestLoc := i;
		SwapInt(list[smallestLoc], list[pass]);
	End;
End;

Procedure insertionsort();
Var currentNum, i, pass: Integer;
Begin
	For pass := 2 To size Do
	Begin
		currentNum := list[pass];
		i := pass;
		While (i > 1) And (list[i - 1] > currentNum) Do
		Begin
			list[i] := list[i - 1];
			i := i - 1;
		End;
		list[i] := currentNum;
	End;
End;

Begin
	randomize();
	list[1] := random(10);
	list[2] := random(10);
	list[3] := random(10);
	list[4] := random(10);
	list[5] := random(10);
	insertionsort();

	for i := 1 To Size Do
		writeLn(list[i]);
	ReadLn;
End.