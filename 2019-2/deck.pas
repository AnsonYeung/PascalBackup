Program deck;
Var deck: Array[0..51] Of String[2];

Function c12str(Const c1: Integer): Char;
Begin
	Case c1 Of
		0: c12str := 'S';
		1: c12str := 'H';
		2: c12str := 'C';
		3: c12str := 'D';
	End;
End;

Function c22str(Const c2: Integer): Char;
Begin
	Case c2 Of
		0: c12str := 'A';
		9: c12str := 'T';
		10: c12str := 'J';
		11: c12str := 'Q';
		12: c12str := 'K';
		else c12str := Chr(c2 + 49);
	End;
End;

Procedure InitDeck();
Var i, j: Integer;
Begin
	For i := 0 To 3 Do
		For j := 0 To 12 Do
		Begin
			deck[i * 4 + j][1] := 'S';
			deck[i * 4 + j][2] := '2';			
		End;
End;

Begin
	
End;