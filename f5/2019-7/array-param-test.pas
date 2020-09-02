{ 
	Program result:
		Array is passed as value, it will be copyed. Writing to an array will not affect the array outside!
		It is bad as it will take up some memory and waste processing time,
		but can be prevented by using procedure 'var' parameter.
		Const will completely prevent writing to the array
}

Program arrayParam;
Type IntArray = Array[1..10] Of Integer;
Var data: IntArray;
	i: Integer;

Procedure test(d: IntArray);
Begin
	For i := 1 To 10 Do
	Begin
		Write(d[i]:2, ' -> ');
		d[i] := Random(10) + 1;
		WriteLn(d[i]:2);
	End;
End;

Begin
	Randomize();
	For i := 1 to 10 Do
	Begin
		data[i] := Random(10) + 1;
		Write(data[i]:2, ' ');
	End;
	WriteLn();

	test(data);

	For i := 1 to 10 Do
	Begin
		Write(data[i]:2, ' ');
	End;

	ReadLn();
End.