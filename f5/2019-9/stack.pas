Program StackDataType;
Type stackType = Record
	top: Integer;
	data: Array[1..10] Of Integer;
End;

Var stack : stackType;
input, data, e: Integer;

Procedure Init(Var s: stackType);
Begin
	s.top := 0;
End;

Procedure Push(Var s: stackType; data: Integer; Var err: Integer);
Begin
	err := 0;
	If s.top = 10 Then
	Begin
		{WriteLn('Pushing full set is not allowed. Press any key to exit.');
		ReadLn();
		Halt();}
		err := 1;
	End
	Else
	Begin
		s.top := s.top + 1;
		s.data[s.top] := data;
	End;
End;

Procedure Pop(Var s: stackType; Var d: Integer; Var err: Integer);
Begin
	err := 0;
	If s.top = 0 Then
	Begin
		{WriteLn('Popping empty set is not allowed. Press any key to exit.');
		ReadLn();
		Halt();}
		err := 1;
	End
	Else
	Begin
		d := s.data[s.top];
		s.top := s.top - 1;
	End;
End;

Procedure PrintStack(s: stackType);
Var i: Integer;
Begin
	WriteLn();
	WriteLn('   Stack content:');
	WriteLn('|':15, '|':4);
	Write(' Top(', s.top:2, ' ) --> ');
	For i := s.top DownTo 1 Do
	Begin
		WriteLn('|', s.data[i]:2, ' |');
		Write('':14);
	End;
	WriteLn('|___|');
	WriteLn();
End;

Begin
	Init(stack);
	Repeat
		Write('What do you want to do? (1) push (2) pop (3) exit > ');
		ReadLn(input);
		Case input Of
			1: Begin
				Write('Input push data > ');
				ReadLn(data);
				Push(stack, data, e);
				Case e Of
					0: WriteLn('Pushed ', data, ' to the stack.');
					1: WriteLn('Push on full stack not allowed.');
				End;
			End;
			2: Begin
				Pop(stack, data, e);
				Case e Of
					0: WriteLn('Poped ', data, ' from the stack.');
					1: WriteLn('Popping on empty stack not allowed.');
				End;
			End;
		End;
		PrintStack(stack);
	Until input = 3;
End.