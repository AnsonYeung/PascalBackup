Program BlackJack;
{$IFDEF LOCAL}
Uses Console;
{$ENDIF}
Type
Card = Record
	num: Integer;
	suit: Integer;
End;
DeckType = Array Of Card;

Procedure Swap(Var c1: Card; Var c2: Card);
Var
t: Card;
Begin
	t := c1;
	c1 := c2;
	c2 := t;
End;

Procedure InitDeck(Var deck: DeckType; deckSize: Integer);
Var i, j, k: Integer;
Begin
	For k := 0 To deckSize - 1 Do
		For i := 0 To 12 Do
			For j := 0 To 3 Do
			Begin
				deck[k * 52 + i * 4 + j].num := i;
				deck[k * 52 + i * 4 + j].suit := j;
			End;
	For i := 0 To deckSize * 52 - 1 Do
		Swap(deck[i], deck[Random(i + 1)]);
End;

Function numToStr(num: Integer): String;
Begin
	If num = 0 Then
		numToStr := 'A'
	Else If num = 9 Then
		numToStr := '10'
	Else If num = 10 Then
		numToStr := 'J'
	Else If num = 11 Then
		numToStr := 'Q'
	Else If num = 12 Then
		numToStr := 'K'
	Else
		numToStr := Chr(Ord('1') + num);
End;

Function suitToStr(suit: Integer): String;
Begin
	Case suit Of
		0: suitToStr := '♣';
		1: suitToStr := '♦';
		2: suitToStr := '♥';
		3: suitToStr := '♠';
	End;
End;

Function cardToStr(c: Card): String;
Begin
	cardToStr := suitToStr(c.suit) + numToStr(c.num);
End;

Function minVal(c: Card): Integer;
Begin
	If c.num >= 10 Then
		minVal := 10
	Else
		minVal := c.num + 1;
End;

Procedure DrawCardTo(Var c: Card; deck: DeckType; Var cardDrawn: Integer);
Begin
	c := deck[cardDrawn];
	Inc(cardDrawn);
End;

Procedure BlackJackGame(Var deck: DeckType);
Var
dealerDeck: DeckType;
playerDeck: DeckType;
playerMinVal: Integer;
cardDrawn: Integer;
Begin
	WriteLn('Black Jack Game');
	cardDrawn := 0;
	SetLength(dealerDeck, 22);
	SetLength(playerDeck, 22);
	DrawCardTo(dealerDeck[0], deck, cardDrawn);
	WriteLn('Dealer Card: ', cardToStr(dealerDeck[0]));
	DrawCardTo(playerDeck[0], deck, cardDrawn);
	playerMinVal := minVal(playerDeck[0]);
	DrawCardTo(playerDeck[1], deck, cardDrawn);
	playerMinVal := playerMinVal + minVal(playerDeck[1]);
	WriteLn('Your Cards: ', cardToStr(playerDeck[0]), ', ', cardToStr(playerDeck[1]));
	Repeat

	Until playerMinVal >= 21;
End;

Procedure Main();
Var
deck: DeckType;
Begin
	{$IFDEF LOCAL}
	SetConsoleTitle(' ========= C A S I N O ========= ');
	{$ENDIF}
	Randomize();
	SetLength(deck, 312);
	InitDeck(deck, 6);
	BlackJackGame(deck);
	ReadLn();
End;

Begin
	Main();
End.
