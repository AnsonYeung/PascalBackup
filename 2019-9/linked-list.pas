Program LnkedListProg;
Uses Console;
Const
size = 5;
null = -1;

Type NodeType = Record
	data: String;
	next: Integer;
End;

Type LinkedList = Record
	list: Array[1..size] Of NodeType;
	head: Integer;
End;

Var l: LinkedList;
	e: Integer;

Procedure Init(Var l: LinkedList);
Var i: Integer;
Begin
	For i := 1 To size Do
	Begin
		l.list[i].data := '';
		l.list[i].next := null;
	End;
	l.head := null;
End;

Function SearchFreePos(l: LinkedList): Integer;
Var i: Integer;
Begin
	SearchFreePos := 1;
	While (SearchFreePos <= size) And (l.list[SearchFreePos].data <> '')  Do
		Inc(SearchFreePos);
	If SearchFreePos = size + 1 Then
		SearchFreePos := null;
End;

Function SearchDataPos(l: LinkedList; s: String): Integer;
Var p: Integer;
Begin
	p := l.head;
	While (p <> null) And (l.list[p].data <> s) Do
		p := l.list[p].next;
	SearchDataPos := p;
End;

Procedure InsertBegin(Var l: LinkedList; s: String; Var e: Integer);
Var node: NodeType;
	pos: Integer;
Begin
	e := 0;
	pos := SearchFreePos(l);
	If pos <> null Then
	Begin
		node.data := s;
		node.next := l.head;
		l.list[pos] := node;
		l.head := pos;
	End
	Else
		e := -1;
End;

Procedure InsertAfter(Var l: LinkedList; s: String; Var prevNode: NodeType; Var e: Integer);
Var node: NodeType;
	pos: Integer;
Begin
	e := 0;
	pos := SearchFreePos(l);
	If pos <> null Then
	Begin
		node.data := s;
		node.next := prevNode.next;
		l.list[pos] := node;
		prevNode.next := pos;
	End
	Else
		e := -1;
End;

Procedure InsertAfter(Var l: LinkedList; s: String; prevStr: String; Var e: Integer);
Var p: Integer;
Begin
	p := SearchDataPos(l, prevStr);
	InsertAfter(l, s, l.list[p], e);
End;

Procedure PrintList(l: LinkedList);
Var i: Integer;
Begin
	WriteLn('+-----+---------------+-------+');
	WriteLn('| pos |   data        | next  |');
	WriteLn('+-----+---------------+-------+');
	For i := 1 To size Do
	Begin
		Write('|', i:4, '|':2, l.list[i].data:14, '|':2, l.list[i].next:5, '|':3);
		If l.head = i Then
			Write(' (head)');
		WriteLn();
		WriteLn('+-----+---------------+-------+');
	End;
	WriteLn();
End;

Begin
	Init(l);
	PrintList(l);
	InsertBegin(l, 'fdsa', e);
	PrintList(l);
	InsertAfter(l, 'A', 'fdsa', e);
	PrintList(l);
	InsertAfter(l, 'Happy', 'fdsa', e);
	PrintList(l);
	InsertBegin(l, 'Happy', e);
	PrintList(l);
	ReadKey();
End.