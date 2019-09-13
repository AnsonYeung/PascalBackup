Program StackDataType;
Type stackType = Record
	top: Integer;
	data: Array[1..10] Of Integer;
End;

Var stack : stackType;
input, data: Integer;

Procedure Init(Var s: stackType);
Begin
	s.top := 0;
End;

Procedure Push(Var s: stackType; data: Integer);
Begin
	s.top := s.top + 1;
	s.data[s.top] := data;
End;

Procedure Pop(Var s: stackType; Var d: Integer);
Begin
	If s.top = 0 Then
	Begin
		WriteLn('Popping empty set is not allowed. Press any key to exit.');
		ReadLn();
		Halt();
	End;
	d := s.data[s.top];
	s.top := s.top - 1;
End;

Procedure PrintStack(s: stackType);
Var i: Integer;
Begin
	WriteLn();
	WriteLn('   Stack content:');
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
				Push(stack, data);
				WriteLn('Pushed ', data, ' to the stack.');
			End;
			2: Begin
				Pop(stack, data);
				WriteLn('Poped ', data, ' from the stack.');
			End;
		End;
		PrintStack(stack);
	Until input = 3;
End.