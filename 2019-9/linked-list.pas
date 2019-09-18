Program LnkedListProg;
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

Procedure InsertMiddle(Var l: LinkedList; s: String; prevNode: NodeType; Var e: Integer);
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

Begin
	
End.