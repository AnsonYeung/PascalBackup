Program panlindrome;
Var i : Integer;
inp: String;
fil: String;
flag: Boolean;

Function isAlphabet(c: Char): Boolean;
Begin
	isAlphabet := (c >= 'A') And (c <= 'Z') Or (c >= 'a') And (c <= 'z');
End;

Begin
	Write('Enter a sentence: ');
	ReadLn(inp);
	fil := '';
	For i := 1 To Length(inp) Do
		If isAlphabet(inp[i]) Then
			fil := fil + lowerCase(inp[i]);
	flag := True;
	For i := 1 To Length(fil) div 2 Do
		If fil[i] <> fil[Length(fil) + 1 - i] Then
			flag := False;
	If flag Then
		WriteLn('The sentence is a palindrome.')
	Else
		WriteLn('The sentence is not a palindrome.');
	ReadLn();
End.