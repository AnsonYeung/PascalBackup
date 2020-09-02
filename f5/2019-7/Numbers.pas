Unit Numbers;
Interface

Type
BigInt = Class
Private
	value: Array Of Int64;
Public
	Constructor Create(); Overload;
	Constructor Create(n: Int64); Overload;
	Constructor Create(n: String); Overload;
	Procedure Print();
	Operator :=(n: Int64) bi: BigInt;
End;

Implementation

Constructor BigInt.Create();
Begin
	SetLength(Self.value, 1);
	Self.value[0] := 0;
End;

Constructor BigInt.Create(n: Int64);
Begin
	SetLength(Self.value, 1);
	Self.value[0] := n;
End;

Constructor BigInt.Create(n: String);
Begin
	
End;

Procedure BigInt.Print();
Begin
	
End;

Operator :=(n: Int64) bi: BigInt;
Begin
	SetLength(bi.value, 1);
	bi.value[0] := n;
End;

End.