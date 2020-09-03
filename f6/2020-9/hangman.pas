Program Hangman;
Uses SysUtils;
{$IFDEF LOCAL}
Const dataLoc: String = '../data/';
{$ELSE}
Const dataLoc: String = './';
{$ENDIF}
Var
loc: String;
dict: Array Of String;
dictSize: Integer;
dictFile: Text;
str: String;
i: Integer;
playAgain: Boolean;

Function UpperCase(str: String): String;
Var
ret: String;
i: Integer;
Begin
	ret := str;
	WriteLn(str);
	For i := 1 To Length(ret) Do
		If (ret[i] >= 'a') And (ret[i] <= 'z') Then
			ret[i] := Chr(Ord(ret[i]) - 32);

	WriteLn(ret);
	UpperCase := ret;
End;

Function dictFilter(word: String): Boolean;
Var
i: Integer;
ok: Boolean;
Begin
	ok := True;
	For i := 1 To Length(word) Do
		If (word[i] < 'a') Or (word[i] > 'z') Then
			ok := False;
	dictFilter := ok And (Length(word) >= 5);
End;

Procedure HangmanTitle(wordNum: Integer);
Begin
	WriteLn('H A N G M A N');
	WriteLn('=============');
	WriteLn('Number of words: ', wordNum);
	WriteLn();
End;

Procedure Hangman(word: String);
Var
i: Integer;
clue: String;
lives: Integer;
input: String;
remaining: Integer;
ok: Boolean;
Begin
	clue := '';
	For i := 1 To Length(word) Do
		clue := clue + '_';
	lives := 9;
	remaining := Length(word);
	While (lives > 0) And (remaining > 0) Do
	Begin
		WriteLn('Clue: ', clue, '':5, 'Lives: ', lives);
		Repeat
			Write('Please choose a letter: ');
			ReadLn(input);
		Until (Length(input) = 1) And (input[1] >= 'a') And (input[1] <= 'z');
		ok := False;
		For i := 1 To Length(word) Do
			If (word[i] = input) Then
				Begin
					clue[i] := input[1];
					remaining := remaining - 1;
					ok := True;
				End;
		If Not ok Then
		Begin
			lives := lives - 1;
			WriteLn('You guessed incorrectly. Lose 1 life.');
		End;
		WriteLn();
	End;
	If lives > 0 Then
	Begin
		WriteLn('You win! The secret word was ', word);
	End
	Else
	Begin
		WriteLn('You lost! The secret word was ', word);
	End;
End;

Begin
	
	Randomize();

	Repeat
		Write('Enter file name: ');
		ReadLn(str);
	Until FileExists(dataLoc + str);

	Assign(dictFile, dataLoc + str);
	Reset(dictFile);
	dictSize := 0;
	While Not EOF(dictFile) Do
	Begin
		ReadLn(dictFile, str);
		If dictFilter(str) Then
			dictSize := dictSize + 1
	End;
	SetLength(dict, dictSize);
	Reset(dictFile);
	i := 0;
	While (Not EOF(dictFile)) And (i < dictSize) Do
	Begin
		ReadLn(dictFile, dict[i]);
		If dictFilter(dict[i]) Then
			i := i + 1;
	End;
	Close(dictFile);

	HangmanTitle(dictSize);

	Repeat
		Hangman(dict[Random(dictSize)]);
		Repeat
			Write('Do you want to play again? (Y/N) ');
			ReadLn(str);
			str := UpperCase(str);
		Until (str = 'Y') Or (str = 'N');
		playAgain := str = 'Y';
	Until Not playAgain;

End.