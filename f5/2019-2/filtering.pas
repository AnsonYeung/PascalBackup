Program Filtering;
Uses Windows;
Const
Black: Integer = 0;
Blue: Integer = 1;
Green: Integer = 2;
Red: Integer = 4;
Gray: Integer = 8;
Aqua: Integer = 3;
Purple: Integer = 5;
Yellow: Integer = 6;
LightGray: Integer = 7;
LightBlue: Integer = 9;
LightGreen: Integer = 10;
LightRed: Integer = 12;
LightAqua: Integer = 11;
LightPurple: Integer = 13;
LightYellow: Integer = 14;
White: Integer = 15;
Var
hStdin: Handle;
hStdout: Handle;
phoneFile: Text;
i, cnt: Integer;
c: Char;
stuID: Array[1..40] Of String[7];
cls: Array[1..40] Of String[2];
clsno: Array[1..40] Of Integer;
stuName: Array[1..40] Of String;
phoneNum: Array[1..40] Of String[8];
currentEntry: String;

Procedure InitConsole();
Begin
	hStdin := GetStdHandle(STD_INPUT_HANDLE);
	hStdout := GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleMode(hStdin, 161);
End;

Procedure GoToXY(Const X, Y: Integer);
Var
Loc: Coord;
Begin
	hStdout := GetStdHandle(STD_OUTPUT_HANDLE);
	Loc.X := X;
	Loc.Y := Y;
	SetConsoleCursorPosition(hStdout, Loc);
End;

Function ReadKey(): Char;
Var
key: Char;
read: Integer;
Begin
	hStdin := GetStdHandle(STD_INPUT_HANDLE);
	ReadConsole(hStdin, @key, 1, @read, Nil);
	If read <> 1 Then
		Halt(1);
	ReadKey := key;
End;

Procedure SetConsoleColor(Const color: Word);
Begin
	SetConsoleTextAttribute(hStdout, color);
End;

Procedure TextBackground(Const color: Integer);
Var
CurrentInfo: CONSOLE_SCREEN_BUFFER_INFO;
Begin
	hStdout := GetStdHandle(STD_OUTPUT_HANDLE);
	GetConsoleScreenBufferInfo(hStdout, @CurrentInfo);
	SetConsoleColor(CurrentInfo.wAttributes And 15 + color * 16);
End;

Procedure TextColor(Const color: Integer);
Var
CurrentInfo: CONSOLE_SCREEN_BUFFER_INFO;
Begin
	hStdout := GetStdHandle(STD_OUTPUT_HANDLE);
	GetConsoleScreenBufferInfo(hStdout, @CurrentInfo);
	SetConsoleColor(CurrentInfo.wAttributes And 240 + color);
End;

Procedure ClrScr();
Var
screen: Coord;
cCharsWritten: DWord;
CurrentInfo: CONSOLE_SCREEN_BUFFER_INFO;
Begin
	hStdout := GetStdHandle(STD_OUTPUT_HANDLE);
	GetConsoleScreenBufferInfo(hStdout, @CurrentInfo);
	screen.X := 0;
	screen.Y := 0;
	FillConsoleOutputCharacter(hStdout, ' ', CurrentInfo.dwSize.X * CurrentInfo.dwSize.Y, screen, @cCharsWritten);
	FillConsoleOutputAttribute(hStdout, CurrentInfo.wAttributes, CurrentInfo.dwSize.X * CurrentInfo.dwSize.Y, screen, @cCharsWritten);
	GoToXY(0, 0);
End;

Function ToStr(Const x: Integer): String;
Var s: String;
Begin
	Str(x, s);
	ToStr := s;
End;

Function ExistsEntry(Const s: String): Boolean;
Var i, j: Integer;
exists, existsOne: Boolean;
Begin
	existsOne := False;
	For i := 1 To Length(s) - Length(currentEntry) + 1 Do
	Begin
		exists := True;
		For j := 1 To Length(currentEntry) Do
			If s[i + j - 1] <> currentEntry[j] Then
				exists := False;
		existsOne := existsOne Or exists; 
	End;
	ExistsEntry := existsOne;
End;

Procedure WriteAll();
Begin
	SetConsoleColor(Black * 16 + Red);
	SetConsoleColor(Black * 16 + Gray);
	For i := 1 To cnt Do
	Begin
		If ExistsEntry(stuID[i]) Or ExistsEntry(cls[i]) Or ExistsEntry(ToStr(clsno[i])) Or ExistsEntry(stuName[i]) Or ExistsEntry(phoneNum[i]) Then
			WriteLn(stuID[i]:8, cls[i]:3, clsno[i]:3, stuName[i]:25, phoneNum[i]:9);
	End;
End;

Begin
	InitConsole();
	SetConsoleColor(Black * 16 + Gray);
	Assign(phoneFile, 'data\phone.bk');
	Reset(phoneFile);
	cnt := 0;
	While Not EOF(phoneFile) Do
	Begin
		Inc(cnt);
		Read(phoneFile, stuID[cnt]);
		Read(phoneFile, c);
		Read(phoneFile, cls[cnt]);
		Read(phoneFile, c);
		Read(phoneFile, clsno[cnt]);
		Read(phoneFile, c);
		stuName[cnt] := '';
		Repeat
			Read(phoneFile, c);
			If c <> Chr(9) Then
				stuName[cnt] := stuName[cnt] + c;
		Until c = Chr(9);
		ReadLn(phoneFile, phoneNum[cnt]);
	End;
	Close(phoneFile);
	currentEntry := '';
	Repeat
		WriteLn('Enter text (Enter to quit) >', currentEntry);
		WriteAll();
		GoToXY(28 + Length(currentEntry), 0);
		c := ReadKey();
		If c = Chr(8) Then
			currentEntry := Copy(currentEntry, 1, Length(currentEntry) - 1)
		Else If (c in ['A'..'Z']) Or (c in ['a'..'z']) Or (c in ['0'..'9']) Or (c = ' ') Then
			currentEntry := currentEntry + c;
		ClrScr();
	Until c = Chr(13);
End.