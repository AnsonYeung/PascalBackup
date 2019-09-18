Program QueueDataType;
Const size = 5;
Type queueType = Record
	front: Integer;
	count: Integer;
	data: Array[1..size] Of Integer;
End;
Var queue: queueType;
input, data, e: Integer;

Procedure Init(Var q: queueType);
Begin
	q.front := 1;
	q.count := 0;
End;

Function QueueRear(q: queueType): Integer;
Begin
	QueueRear := (q.front + q.count - 2) Mod size + 1;
End;

Procedure enqueue(Var q: queueType; data: Integer; Var err: Integer);
Begin
	err := 0;
	If q.count < size Then
	Begin
		Inc(q.count);
		q.data[QueueRear(q)] := data;
	End
	Else
		err := 1;
End;

Procedure dequeue(Var q: queueType; Var data: Integer; Var err: Integer);
Begin
	err := 0;
	If q.count > 0 Then
	Begin
		data := q.data[q.front];
		q.front := q.front mod size + 1;
		Dec(q.count);
	End
	Else
		err := 1;
End;

Procedure PrintQueue(q: queueType);
Var i: Integer;
Begin
	WriteLn();
	Write('Queue data:');
	For i := 1 to q.count Do
		Write(q.data[(q.front + i - 2) Mod size + 1]:4);
	WriteLn();
	WriteLn();
	WriteLn('Front: ', q.front, ', Rear: ', QueueRear(q), ', Count: ', q.count);
	WriteLn();
End;

Begin
	Init(queue);
	Repeat
		Write('What do you want to do? (1) enqueue (2) dequeue (3) exit > ');
		ReadLn(input);
		Case input Of
			1: Begin
				Write('Input enqueue data > ');
				ReadLn(data);
				enqueue(queue, data, e);
				Case e Of
					0: WriteLn('Enqueued ', data, ' to the queue.');
					1: WriteLn('Enqueue on full queue not allowed.');
				End;
			End;
			2: Begin
				dequeue(queue, data, e);
				Case e Of
					0: WriteLn('Dequeued ', data, ' from the queue.');
					1: WriteLn('Dequeue on empty queue not allowed.');
				End;
			End;
		End;
		PrintQueue(queue);
	Until input = 3;
End.