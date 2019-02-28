Program Grading;
Uses Crt;

Var
markFile : Text;
gradeCnt : Array['A'..'F'] Of Integer;
stuCnt, gradeMaxCnt, scale : Integer;
mark : Real;
i : Integer;
c : Char;


Function CalculateGrade(mark : Real) : Char;
Begin
	If mark < 50 Then
		CalculateGrade := 'F'
	Else If mark <= 60 Then
		CalculateGrade := 'E'
	Else If mark <= 70 Then
		CalculateGrade := 'D'
	Else If mark <= 80 Then
		CalculateGrade := 'C'
	Else If mark <= 90 Then
		CalculateGrade := 'B'
	Else
		CalculateGrade := 'A';
End;


Begin

	For c := 'A' To 'F' Do
	Begin
		gradeCnt[c] := 0;
	End;
	stuCnt := 0;

	Assign(markFile, 'C:\Users\S151204\Downloads\mark3.txt');
	Reset(markFile);
	While Not EOF(markFile) Do
	Begin
		ReadLn(markFile, mark);
		c := CalculateGrade(mark);
		gradeCnt[c] := gradeCnt[c] + 1;
		Inc(stuCnt);
	End;
	Close(markFile);

	gradeMaxCnt := 0;
	For c := 'A' To 'F' Do
		If gradeCnt[c] > gradeMaxCnt Then
			gradeMaxCnt := gradeCnt[c];
	scale := gradeMaxCnt div 50 + 1;

	For c := 'A' To 'F' Do
	Begin
		GoToXY(1, Ord(c) - 64);
		Write(c, '|':4);
		For i := 1 To gradeCnt[c] div scale Do
			Write(Chr(254));
		GoToXY(60, Ord(c) - 64);
		Write(gradeCnt[c], ' (', round(gradeCnt[c] / stuCnt * 100), '%)');
	End;

	ReadKey;

End.