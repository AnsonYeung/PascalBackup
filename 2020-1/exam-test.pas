const max = 10;
type stack = record
	Top:0..max;
	Data: array[1..max] of string;
end;

var s1, s2 : stack;
	stg : string;
	e1, e2 : Integer;

procedure PUSH(stg:string; var sta: stack; var e: integer);
begin
	if sta.Top = max then
		e := -1
	else 
	begin
		sta.Top := sta.top + 1;
		sta.Data[sta.Top] := stg;
		e := sta.Top;
	End;
end;

procedure POP(var stg: string; var sta: stack; var e: integer);
begin
	if sta.top = 0 then
		e := -1
	else
	begin
		stg:= sta.Data[sta.Top];
		sta.Top := sta.Top - 1;
		e := sta.Top;
	end;
end;

procedure print(var sta: stack);
var i : integer;
begin
	write('Stack values: ');
	for i := 1 to sta.top do
	begin
		write(sta.data[i]);
		write(' ');
	end;
	writeln;
end;

begin
	push('J', s1, e1);
	push('G', s1, e1);
	push('V', s1, e1);
	push('K', s1, e1);
	push('G', s1, e1);
	push('P', s1, e1);
	print(s1);
	print(s2);

	repeat
		pop(stg, s1, e1);
		push(stg, s2, e2);
	until (e1 = -1) or (e2 = -1);
	pop(stg, s2, e2);
	print(s1);
	print(s2);
	write(stg);
	readln;
end.