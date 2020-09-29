Program Encryption;

Function isAlphabet(c: Char): Boolean;
Begin
	isAlphabet := ((c >= 'A') And (c <= 'Z')) Or ((c >= 'a') And (c <= 'z'));
End;

Function UpperCase(str: String): String;
Var
s: String;
i: Integer;
Begin
	s := str;
	For i := 1 To Length(str) Do
		If (str[i] >= 'a') And (str[i] <= 'z') Then
			s[i] := Chr(Ord(str[i]) - 32);
	UpperCase := s;
End;

Function AlphabetFilter(str: String): String;
Var
i: Integer;
result: String;
Begin
	result := '';
	For i := 1 To Length(str) Do
		If isAlphabet(str[i]) Then
			result := result + str[i];
	AlphabetFilter := result;
End;

Function CharRot(c: Char; rot: Integer; extended: Boolean): Char;
Begin
	If extended And (c >= '!') And (c <= '~') Then
		CharRot := Chr(((Ord(c) + rot - 33) Mod 94 + 94) Mod 94 + 33)
	Else If isAlphabet(c) Then
		CharRot := Chr(((Ord(c) Mod 32 + rot - 1) Mod 26 + 26) Mod 26 + 1 + Ord(c) div 32 * 32)
	Else
		CharRot := c;
End;

Procedure DoCaesarCipher(x: Integer; encrypt: Boolean; extended: Boolean);
Var
str: String;
i: Integer;
rot: Integer;
Begin
	If encrypt Then
		Write('Input plain text: ')
	Else
		Write('Input ciphertext: ');
	ReadLn(str);
	If encrypt Then
		rot := x
	Else
		rot := -x;
	WriteLn('Result: ');
	For i := 1 To Length(str) Do
	Begin
		Write(CharRot(str[i], rot, extended));
	End;
End;

Procedure VigenCipher(encrypt: Boolean);
Var
i: Integer;
key: String;
keypos: Integer;
str: String;
encryptinteger: Integer;
Begin
	If encrypt Then
		encryptinteger := 1
	Else
		encryptinteger := -1;
	Write('Input key: ');
	ReadLn(key);
	key := UpperCase(key);
	If encrypt Then
		Write('Input plain text: ')
	Else
		Write('Input ciphertext: ');
	ReadLn(str);
	WriteLn('Result: ');
	keypos := 1;
	For i := 1 To Length(str) Do
	Begin
		Write(CharRot(str[i], encryptinteger * (Ord(key[keypos]) - 65), False));
		If isAlphabet(str[i]) Then
			keypos := keypos Mod Length(key) + 1;
	End;
End;

Procedure AutokeyCipher(encrypt: Boolean);
Var
key: String;
keypos: Integer;
str: String;
i: Integer;
c: Char;
Begin
	Write('Input key: ');
	ReadLn(key);
	If encrypt Then
		Write('Input plain text: ')
	Else
		Write('Input ciphertext: ');
	ReadLn(str);
	WriteLn('Result: ');
	If encrypt Then
	Begin
		key := key + str;
		key := UpperCase(key);
		key := AlphabetFilter(key);
		keypos := 1;
		For i := 1 To Length(str) Do
		Begin
			Write(CharRot(str[i], Ord(key[keypos]) - 65, False));
			If isAlphabet(str[i]) Then
				keypos := keypos + 1;
		End;
	End
	Else
	Begin
		key := UpperCase(key);
		keypos := 1;
		For i := 1 To Length(str) Do
		Begin
			c := CharRot(str[i], -Ord(key[keypos]) + 65, False);
			Write(c);
			If isAlphabet(c) Then
			Begin
				key := key + UpperCase(c);
				keypos := keypos + 1;
			End;
		End;
				
	End;
End;

Procedure Main();
Var
input: String;
encrypt: Boolean;
key: String;
cipherno: Integer;
numberinput: Integer;
Begin
	Write('Encrypt(E) / Decrypt(D)? ');
	Repeat
		ReadLn(input);
		input := LowerCase(input);
	Until (input = 'e') Or (input = 'd');
	encrypt := input = 'e';
	
	WriteLn('Select cipher:');
	WriteLn('(1) ROT13');
	WriteLn('(2) Caesar Cipher');
	WriteLn('(3) Vigenère Cipher');
	WriteLn('(4) ROT47');
	WriteLn('(5) Autokey Cipher');
	Write('Input the cipher: ');
	ReadLn(cipherno);
	Case cipherno Of
		1: DoCaesarCipher(13, encrypt, False);
		2: Begin
			Write('Enter the offset: ');
			ReadLn(numberinput);
			DoCaesarCipher(numberinput, encrypt, False);
		End;
		3: VigenCipher(encrypt);
		4: DoCaesarCipher(47, encrypt, True);
		5: AutokeyCipher(encrypt);
	End;
	WriteLn();
	WriteLn('Press enter to exit the program.');
	ReadLn();
End;

Begin
	Main();
End.