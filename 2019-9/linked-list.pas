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

Function SearchPrevPos(l: LinkedList; s: String): Integer;
Var p: Integer;
Begin
	p := l.head;
	While (l.list[p].next <> null) And (l.list[l.list[p].next].data <> s) Do
		p := l.list[p].next;
	If l.list[p].next <> null Then
		SearchPrevPos := p
	Else
		SearchPrevPos := null;
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

Procedure RemoveStr(Var l: LinkedList; str: String; Var e: Integer);
Var p: Integer;
Begin
	e := 0;
	p := SearchPrevPos(l, str);
	If p <> null Then
	Begin
		l.list[p].next := l.list[l.list[p].next].next;
	End
	Else If l.list[l.head].data = str Then
	Begin
		l.head := l.list[l.head].next;
	End
	Else
	Begin
		e := -1;
	End;
End;

Procedure PrintList(l: LinkedList);
Var i: Integer;
	c: Integer;
Begin
	WriteLn('+-----+-------+-------+---------------+');
	WriteLn('| pos | index | next  |   data        |');
	WriteLn('+-----+-------+-------+---------------+');
	c := 1;
	i := l.head;
	While i <> null Do
	Begin
		WriteLn('|', c:3, '|':3, i:4, '|':4, l.list[i].next:5, '|':3, l.list[i].data:14, '|':2);
		WriteLn('+-----+-------+-------+---------------+');
		i := l.list[i].next;
		Inc(c);
	End;
	WriteLn();
End;

Begin
	Init(l);
	PrintList(l);
	InsertBegin(l, 'foo', e);
	PrintList(l);
	InsertAfter(l, 'baz', 'foo', e);
	PrintList(l);
	InsertAfter(l, 'test', 'foo', e);
	PrintList(l);
	InsertBegin(l, 'bar', e);
	PrintList(l);
	RemoveStr(l, 'bar', e);
	PrintList(l);
	ReadKey();
End.