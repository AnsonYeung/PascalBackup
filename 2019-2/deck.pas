Program deckProg;
Type
Card = String[2];
Var
deck: Array[0..51] Of Card;
i: Integer;
c1, c2: Card;

Procedure Swap(Var c1, c2: Card);
Var t: Card;
Begin
	t := c1;
	c1 := c2;
	c2 := t;
End;

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
		0: c22str := 'A';
		9: c22str := 'T';
		10: c22str := 'J';
		11: c22str := 'Q';
		12: c22str := 'K';
		Else c22str := Chr(c2 + 49);
	End;
End;

Procedure InitDeck();
Var i, j: Integer;
Begin
	For i := 0 To 3 Do
		For j := 0 To 12 Do
			deck[i * 13 + j] := c12str(i) + c22str(j);
End;

Procedure ShuffleDeck();
Var i: Integer;
Begin
	For i := 0 To 51 Do
		Swap(deck[i], deck[random(52)]);
End;

Function Value(Const c: Card): Integer;
Var
val: Integer;
Begin
	Case c[2] Of
		'A': val := 0;
		'T': val := 40;
		'J': val := 44;
		'Q': val := 48;
		'K': val := 52;
		Else val := 4 * (Ord(c[2]) - 49);
	End;
	Case c[1] Of
		'S': val := val + 3;
		'H': val := val + 2;
		'C': val := val + 1;
		'D': ;
	End;
	Value := val;
End;

Begin
	Randomize();
	InitDeck();
	ShuffleDeck();
	c1 := deck[0];
	c2 := deck[1];
	WriteLn(c1);
	WriteLn(c2);
	If Value(c1) > Value(c2) Then
		WriteLn('Player 1 wins!')
	Else
		WriteLn('Player 2 wins!');
	ReadLn();
End.