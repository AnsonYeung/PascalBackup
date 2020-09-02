Program LnkedListProg;
Uses Console;
Const
size = 5;
null = -1;

Type NodeType = Record
	data: String;
	next: Integer;
	prev: Integer;
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
		l.list[i].prev := null;
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
	SearchPrevPos := l.list[SearchDataPos(l, s)].prev;
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
		node.prev := null;
		If l.head <> null Then
			l.list[l.head].prev := pos;
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
		node.prev := null;
		If prevNode.prev <> null Then
			node.prev := l.list[prevNode.prev].next
		Else
			node.prev := l.head;
		If node.next <> null Then
			l.list[node.next].prev := pos;
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
Var p, n, cur: Integer;
Begin
	e := 0;
	cur := SearchDataPos(l, str);
	If cur <> null Then
	Begin
		p := l.list[cur].prev;
		n := l.list[cur].next;
		l.list[cur].data := '';
		If p = null Then
		Begin
			l.head := n;
			l.list[n].prev := null;
		End
		Else If n = null Then
		Begin
			l.list[p].next := null;
		End
		Else
		Begin
			l.list[p].next := l.list[cur].next;
			l.list[l.list[cur].next].prev := p;
		End;
	End
	Else
		e := -1;
End;

Procedure PrintList(l: LinkedList);
Var i: Integer;
	c: Integer;
Begin
	WriteLn('+-----+------+-------+------+---------------+');
	WriteLn('| pos | prev | index | next |   data        |');
	WriteLn('+-----+------+-------+------+---------------+');
	c := 1;
	i := l.head;
	While i <> null Do
	Begin
		WriteLn('|', c:3, '|':3, l.list[i].prev:4, '|':3, i:4, '|':4, l.list[i].next:4, '|':3, l.list[i].data:14, '|':2);
		WriteLn('+-----+------+-------+------+---------------+');
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