Program mark6;
{$MACRO ON}
{$DEFINE numBalls:=6}
Type
result = Array[1..6] Of Integer;

Procedure Swap(Var x, y: Integer);
Var t: Integer;
Begin
	t := x;
	x := y;
	y := t;
End;

Function generator1: result;
Var i, j: Integer;
res: result;
noRepeat: Boolean;
Begin
	For i := 1 To 6 Do
		Repeat
			res[i] := Random(numBalls) + 1;
			noRepeat := True;
			j := 1;
			While (j <= i - 1) And noRepeat Do
			Begin
				If res[i] = res[j] Then
					noRepeat := False;
				Inc(j);
			End;
		Until noRepeat;
	generator1 := res;
End;

Function generator2: result;
Var numDrawn: Array[1..numBalls] Of Boolean;
res: result;
i: Integer;
Begin
	For i := 1 To numBalls Do
		numDrawn[i] := False;
	For i := 1 To 6 Do
	Begin
		Repeat
			res[i] := Random(numBalls) + 1;
		Until Not numDrawn[res[i]];
		numDrawn[res[i]] := True;
	End;
	generator2 := res;
End;

Function generator3: result;
Var balls: Array[1..numBalls] Of Integer;
i: Integer;
Begin
	For i := 1 To numBalls Do
		balls[i] := i;
	For i := 1 To 6 Do
		Swap(balls[i], balls[Random(numBalls - (i - 1)) + i]);
	For i := 1 To 6 Do
		generator3[i] := balls[i];
End;

Procedure PrintResult(Const res: result);
Var i: Integer;
Begin
	For i := 1 To 6 Do
		WriteLn(res[i]);
End;

Begin
	Randomize();
	PrintResult(generator1);
	WriteLn();
	PrintResult(generator2);
	WriteLn();
	PrintResult(generator3);
	WriteLn();
	ReadLn();
End.