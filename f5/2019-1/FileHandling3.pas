program FileHandling3;
Uses Crt;
Const Loc : String = 'E:\s151204\test\';
Var f : text;
	c : char;
	cnts : Array['A'..'Z'] Of Integer;

Begin
	For c := 'A' To 'Z' Do
	Begin
		cnts[c] := 0;
	End;
	Assign(f, Loc + 'ALL.TXT');
	Reset(f);
	While Not EOF(f) Do
	Begin
		Read(f, c);
		c := UpCase(c);
		If (c >= 'A') And (c <= 'Z') Then
			Inc(cnts[c]);
	End;
	Close(f);
	For c := 'A' To 'Z' Do
	Begin
		Write(c, ':', cnts[c]:6, '':2);
		If (Ord(c) - Ord('A')) Mod 5 = 4 Then
			WriteLn();
	End;
	ReadKey();
End.