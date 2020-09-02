program binSearch;
Type
	IntArray = Array Of Integer;
	PIntArray = ^IntArray;
Var
	data: IntArray;
	target, result: Integer;

Function binarySearch(arr: IntArray; target: Integer; f: Integer; l: Integer): Integer;
Var m: Integer;
	isFound: Boolean;
Begin
	m := (f + l) div 2;
	If f > l Then
		binarySearch := -1
	Else If arr[m] = target Then
		binarySearch := m
	Else If arr[m] > target Then
		binarySearch := binarySearch(arr, target, f, m - 1)
	Else If arr[m] < target Then
		binarySearch := binarySearch(arr, target, m + 1, l);
End;

Function binarySearch2(arr: PIntArray; target: Integer; f: Integer; l: Integer): Integer;
Var m: Integer;
	isFound: Boolean;
Begin
	m := (f + l) div 2;
	If f > l Then
		binarySearch2 := -1
	Else If arr^[m] = target Then
		binarySearch2 := m
	Else If arr^[m] > target Then
		binarySearch2 := binarySearch2(arr, target, f, m - 1)
	Else If arr^[m] < target Then
		binarySearch2 := binarySearch2(arr, target, m + 1, l);
End;

Begin
	SetLength(data, 10);
	data[1] := 2;
	data[2] := 3;
	data[3] := 5;
	data[4] := 7;
	data[5] := 13;
	data[6] := 19;
	data[7] := 23;
	data[8] := 29;
	data[9] := 31;
	Write('Enter target data: ');
	readln(target);
	{result := binarySearch(data, target, 1, 9);}
	result := binarySearch2(@data, target, 1, 9);
	If result <> -1 Then
		WriteLn(target, ' is found at ', result)
	Else
		WriteLn('Not Found');
	ReadLn;
End.