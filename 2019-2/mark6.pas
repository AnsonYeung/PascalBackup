Program mark6;
{$MACRO ON}
{$mode objfpc}
{$inline on}
Uses Console, SysUtils;
Type
mark6res = Array[1..6] Of Integer;
XY = Record
	x: Real;
	y: Real;
End;
Ball = Record
	position: XY;
	velocity: XY;
	color: Integer;
End;

Const
numBalls = 49;

Var
ob: Array[0..(300 * 150 - 1)] Of Word;
curColor: Word;
t1: Array[0..(300 * 100 - 1)] Of Word;
t2: Array[0..(300 * 50 - 1)] Of Word;

Procedure Swap(Var x, y: Integer);
Var t: Integer;
Begin
	t := x;
	x := y;
	y := t;
End;

Function generator1: mark6res;
Var i, j: Integer;
res: mark6res;
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

Function generator2: mark6res;
Var numDrawn: Array[1..(numBalls)] Of Boolean;
res: mark6res;
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

Function generator3: mark6res;
Var balls: Array[1..(numBalls)] Of Integer;
i: Integer;
Begin
	For i := 1 To numBalls Do
		balls[i] := i;
	For i := 1 To 6 Do
		Swap(balls[i], balls[Random(numBalls - (i - 1)) + i]);
	For i := 1 To 6 Do
		generator3[i] := balls[i];
End;

Procedure PrintScr;
Var i : LongInt;
Begin
	WriteAttr(ob, 0, 0);
	For i := 0 To 300 * 100 - 1 Do
		t1[i] := ob[i];
	For i := 0 To 300 * 50 - 1 Do
		t2[i] := ob[300 * 100 + i];
	writeattr(t1, 0, 0);
	writeattr(t2, 0, 100);
End;

Procedure WritePx(Const x, y: Integer);
Begin
	ob[x * 2 + y * 300] := curColor;
	ob[x * 2 + y * 300 + 1] := curColor;
End;

Procedure WritePxN(Const x, y, n: Integer);
Var i: Integer;
Begin
	For i := 1 To n Do
	Begin
		ob[x * 2 + y * 300 + i * 2 - 2] := curColor;
		ob[x * 2 + y * 300 + i * 2 - 1] := curColor;
	End;
End;

Procedure WriteNum(Const num, x, y: Integer);
Var i, j: Integer;
Begin
	If (num < -1) Or (num > 9) Then
		Raise Exception.Create('WriteNum can only write one number at a time');
	Case num Of
		-1:
		For i := x To x + 2 Do
			For j := y To y + 4 Do
				WritePx(i, j);
		0: Begin
			WritePx(x, y);
			WritePx(x + 1, y);
			WritePx(x + 2, y);
			WritePx(x + 2, y + 1);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x, y + 4);
			WritePx(x, y + 3);
			WritePx(x, y + 2);
			WritePx(x, y + 1);
		End;
		1: Begin
			WritePx(x + 2, y);
			WritePx(x + 2, y + 1);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
		End;
		2: Begin
			WritePx(x, y);
			WritePx(x + 1, y);
			WritePx(x + 2, y);
			WritePx(x + 2, y + 1);
			WritePx(x + 2, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x, y + 2);
			WritePx(x, y + 3);
			WritePx(x, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x + 2, y + 4);
		End;
		3: Begin
			WritePx(x, y);
			WritePx(x + 1, y);
			WritePx(x + 2, y);
			WritePx(x + 2, y + 1);
			WritePx(x + 2, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x, y + 4);
		End;
		4: Begin
			WritePx(x, y);
			WritePx(x, y + 1);
			WritePx(x, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x + 2, y);
			WritePx(x + 2, y + 1);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
		End;
		5: Begin
			WritePx(x + 2, y);
			WritePx(x + 1, y);
			WritePx(x, y);
			WritePx(x, y + 1);
			WritePx(x, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x, y + 4);
		End;
		6: Begin
			WritePx(x + 2, y);
			WritePx(x + 1, y);
			WritePx(x, y);
			WritePx(x, y + 1);
			WritePx(x, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x, y + 4);
			WritePx(x, y + 3);
		End;
		7: Begin
			WritePx(x, y);
			WritePx(x + 1, y);
			WritePx(x + 2, y);
			WritePx(x + 2, y + 1);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x + 2, y + 4);
		End;
		8: Begin
			WritePx(x, y);
			WritePx(x + 1, y);
			WritePx(x + 2, y);
			WritePx(x, y + 1);
			WritePx(x + 2, y + 1);
			WritePx(x, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x + 2, y + 2);
			WritePx(x, y + 3);
			WritePx(x + 2, y + 3);
			WritePx(x, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x + 2, y + 4);
		End;
		9: Begin
			WritePx(x, y);
			WritePx(x + 1, y);
			WritePx(x + 2, y);
			WritePx(x, y + 1);
			WritePx(x + 2, y + 1);
			WritePx(x, y + 2);
			WritePx(x + 1, y + 2);
			WritePx(x + 2, y + 2);
			WritePx(x + 2, y + 3);
			WritePx(x, y + 4);
			WritePx(x + 1, y + 4);
			WritePx(x + 2, y + 4);
		End;
	End;
End;

Procedure DrawCircle(Const radius, xOffset, yOffset: Integer; Const hollow: Boolean);
Var
i, j, a, b: Integer;
Begin
	For i := -radius To radius Do
		If i = 0 Then
			If hollow Then
			Begin
				WritePx(xOffset - radius + 1, yOffset);
				WritePx(xOffset + radius - 1, yOffset);
			End
			Else
				WritePxN(xOffset - radius + 1, yOffset, 2 * radius - 1)
		Else
			If hollow Then
			Begin
				If Abs(i) = radius Then
				Begin
					a := 0;
					b := Trunc(Sqrt(Sqr(radius) - Sqr(radius - 0.5)));
				End
				Else
				Begin
					a := Trunc(Sqrt(Sqr(radius) - Sqr(Abs(i) + 0.5)));
					b := Trunc(Sqrt(Sqr(radius) - Sqr(Abs(i) - 0.5)));
				End;
				For j := a To b Do
					WritePx(xOffset + j, yOffset + i);
				For j := a To b Do
					WritePx(xOffset - j, yOffset + i);
			End
			Else
				WritePxN(xOffset - Trunc(Sqrt(Sqr(radius) - Sqr(Abs(i) - 0.5))), yOffset + i, 2 * Trunc(Sqrt(Sqr(radius) - Sqr(Abs(i) - 0.5))) + 1);
End;

Function CircleInCircle(Const r, x, y, rO, xO, yO: Real): Boolean;
Begin
	CircleInCircle := (Sqr(x - xO) + Sqr(y - yO)) < Sqr(rO - r);
End;

Procedure PrintResult(Const res: mark6res);
Const
oneSec: Real = 0.00001157407;
acc: Real = 500;
ranV: Integer = 200;
ballRadius: Integer = 6;
Var
i: Integer;
tmp1, tmp2: Integer;
start, last, past: TDateTime;
pastSec: Integer;
balls: Array[1..(numBalls)] Of Ball;
b: Ball;
fps: LongInt;
Begin
	SetConsoleFont('Consolas', 0, 6);
	SetConsoleSize(300, 150);
	TextBackground(Black);
	ClrScr();
	curColor := White * 16;
	DrawCircle(70, 75, 75, True);
	curColor := Black * 16;
	DrawCircle(69, 75, 75, True);
	start := Time();
	last := start;
	pastSec := -32768;
	fps := 0;
	For i := 0 To 300 * 150 - 1 Do
		ob[i] := White;
	For i := 1 To numBalls Do
	Begin
		balls[i].position.x := ballRadius * 2 * ((i - 1) Mod 5) + 55;
		balls[i].position.y := ballRadius * 2 * ((i - 1) div 5) + 21;
		balls[i].velocity.x := 0;
		balls[i].velocity.y := 0;
		balls[i].color := (i - 1) Mod 3;
	End;
	While True Do
	Begin
		curColor := Black * 16;
		DrawCircle(69, 75, 75, False);
		past := (Time() - last) / oneSec;
		last := Time();
		For i := 1 To numBalls Do
		Begin
			b := balls[i];
			If Not CircleInCircle(ballRadius, b.position.x + b.velocity.x * past, b.position.y + b.velocity.y * past + 1 / 2 * acc * past * past, 68, 75, 75) Then
			Begin
				b.velocity.x := Trunc(random() * ranV + random() * ranV + ranV) Mod (2 * ranV) - ranV;
				b.velocity.y := Trunc(random() * ranV + random() * ranV + ranV) Mod (2 * ranV) - ranV;
			End
			Else
			Begin
				b.position.x := b.position.x + b.velocity.x * past;
				b.position.y := b.position.y + b.velocity.y * past + 1 / 2 * acc * past * past;
				b.velocity.y := b.velocity.y + acc * past;
			End;
			balls[i] := b;
		End;
		For i := 1 To numBalls Do
		Begin
			Case balls[i].color Of
				0: curColor := Red * 16;
				1: curColor := Green * 16;
				2: curColor := Blue * 16;
			End;
			DrawCircle(ballRadius, Round(balls[i].position.x), Round(balls[i].position.y), False);
			{ Glowing effect }
			curColor := White * 16;
			DrawCircle(ballRadius, Round(balls[i].position.x), Round(balls[i].position.y), True);
		End;
		curColor := White * 16;
		If Trunc((Time() - start) / oneSec) <> pastSec Then
		Begin
			curColor := Black * 16;
			WriteNum(-1, 0, 0);
			WriteNum(-1, 4, 0);
			WriteNum(-1, 8, 0);
			curColor := White * 16;
			WriteNum(fps Div 100, 0, 0);
			WriteNum((fps Mod 100) Div 10, 4, 0);
			WriteNum(fps Mod 10, 8, 0);
			fps := 0;
			pastSec := Trunc((Time() - start) / oneSec);
			tmp1 := pastSec;
			i := 1;
			While tmp1 > 0 Do
			Begin
				tmp2 := tmp1 Mod 10;
				tmp1 := tmp1 Div 10;
				curColor := Black * 16;
				WriteNum(-1, 150 - i * 4, 1);
				curColor := White * 16;
				WriteNum(tmp2, 150 - i * 4, 1);
				Inc(i);
			End;
		End;
		PrintScr();
		Inc(fps);
		Sleep(0);
	End;
End;

Begin
	CursorOff();
	Randomize();
	PrintResult(generator3());
	ReadLn();
End.