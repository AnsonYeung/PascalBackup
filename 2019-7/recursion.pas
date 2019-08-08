program recursion;
Type fibFunc = function(n: Integer): Integer;
Var i: Integer;
	fib: fibFunc;
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

Function Power(a: Real; n: Real) : Real;
Var i : Integer; result : Real;
Begin
	If a = 0 Then
		If n <= 0 Then
			Power := 0/0
		Else
			Power := 0
	Else If a < 0 Then
		If n <> Trunc(n) Then
			Power := sqrt(-1)
		Else If Abs(Trunc(n)) mod 2 = 0 Then
			Power := Exp(n * Ln(-a))
		Else
			Power := -Exp(n * Ln(-a))
	Else
		Power := Exp(n * Ln(a));
End;

Function fib1core(n: Integer): Real;
Begin
	fib1core := (Power((1 + sqrt(5)) / 2, n) - Power((1 - sqrt(5)) / 2, n)) / sqrt(5);
End;

Function fib1(n: Integer): Integer;
Begin
	fib1 := Trunc(fib1core(n));
End;

Function fib2(n: Integer): Integer;
Var i, a, b, t: Integer;
Begin
	If n <= 2 Then
		fib2 := 1
	Else
	Begin
		a := 1;
		b := 1;
		For i := 3 To n Do
		Begin
			t := a + b;
			a := b;
			b := t;
		End;
		fib2 := b;
	End;
End;

Function fib3(n: Integer): Integer;
Begin
	If n > 2 Then
		fib3 := fib3(n - 1) + fib3(n - 2)
	Else
		fib3 := 1;
End;

Function FindGoldenRatio(phi: Real): Real;
Var calcPhi: Real;
Begin
	calcPhi := 1 + 1 / phi;
	If calcPhi = phi Then
		FindGoldenRatio := calcPhi
	Else
		FindGoldenRatio := FindGoldenRatio(calcPhi);
End;

Begin
	fib := @fib1;
	WriteLn(Factorial(15));
	For i := 1 To 10 Do
		WriteLn(fib(i));
	WriteLn(FindGoldenRatio((1-sqrt(5)) /2):0:10);
	ReadLn();
End.