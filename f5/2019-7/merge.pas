program merge;
const N = 10;
Type
	List = Array[1..N] Of Integer;
	PInteger = ^Integer;
Var
	a, c: List;
	ptA, ptB: PInteger;
	i: Integer;

Procedure mergeSort(Var f, l: PInteger);
Var m, ptA, endA, ptB, endB, ptC: PInteger;
	result: Array Of Integer;
Begin
	If f < l Then
	Begin
		getmem(ptC, l - f + sizeof(Integer));
		m := f + (l - f) div 2;
		ptA := f;
		endA := m;
		ptB := m + 1;
		endB := l;
		l := l - f + ptC;
		f := ptC;
		mergeSort(ptA, endA);
		mergeSort(ptB, endB);
		While (ptA <= endA) And (ptB <= endB) Do
		Begin
			If ptA^ < ptB^ Then
			Begin
				ptC^ := ptA^;
				ptA := ptA + 1;
			End
			Else
			Begin
				ptC^ := ptB^;
				ptB := ptB + 1;
			End;
			ptC := ptC + 1;
		End;
		While ptA <= endA Do
		Begin
			ptC^ := ptA^;
			ptA := ptA + 1;
			ptC := ptC + 1;
		End;
		While ptB <= endB Do
		Begin
			ptC^ := ptB^;
			ptB := ptB + 1;
			ptC := ptC + 1;
		End;
	End;

End;

Begin
	a[1] := 1;
	a[2] := 5;
	a[3] := 10;
	a[4] := 3;
	a[5] := 11;
	a[6] := 2;
	a[7] := 4;
	a[8] := 6;
	a[9] := 7;
	a[10] := 8;
	ptA := @a[1];
	ptB := @a[10];
	mergeSort(ptA, ptB);
	For i := 1 To N Do
		Write((ptA + i - 1)^, ' ');
	ReadLn();
End.