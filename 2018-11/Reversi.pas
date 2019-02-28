program Reversi;
uses crt;
const
{ Box char naming:
c for corner, e for edge,
u for upper, l for lower, l for left, r for right,
v for vertical, h for horizontal}
CUL : char = chr(218);
CLR : char = chr(217);
EH : char = chr(9473);

type
BoxStat = (Empty, Black, White);
BoardLoc = array [1..2] of Byte;

var
board : array [1..8, 1..8] of BoxStat;
i, j : integer;
isBlack : Boolean;

function BoardLocValid(loc : BoardLoc; isBlack : Boolean) : Boolean;
begin
    BoardLocValid := false;
end;

function ChooseLoc(isBlack : Boolean) : BoardLoc;
begin
    ChooseLoc[1] := 1;
    ChooseLoc[2] := 1;
end;

begin
    for i := 1 to 8 do
        for j := 1 to 8 do
            board[i, j] := Empty;
    write(EH, chr(218), 'Reversi Game', CUL);
    readkey;
end.