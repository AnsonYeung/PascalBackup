Program Img;
Type imgType = Array[1..8, 1..8] Of Boolean;
Var img1, img2, img3: imgType;

Function ReadImg(filename: String): imgType;
Var f: Text;
c: Char;
i, j: Integer;
img: imgType;
begin
    i := 1;
    j := 1;
    Assign(f, filename);
    Reset(f);
    While Not EOF(f) Do
    begin
        Read(f, c);
        If c = '0' Then
        Begin
            img[i, j] := False;
            i := i + 1;
            If i > 8 Then
            Begin
                i := 1;
                j := j + 1;
            End;
        End
        Else If c = '1' Then
        Begin
            img[i, j] := True;
            i := i + 1;
            If i > 8 Then
            Begin
                i := 1;
                j := j + 1;
            End;
        End;
    end;
    Close(f);
    ReadImg := img;
End;

procedure PrintImg(img: imgType);
Var i, j: Integer;
begin
    For j := 1 To 8 Do
    Begin
        For i := 1 To 8 Do
            If img[i, j] Then
                Write('W')
            Else
                Write(' ');
        WriteLn();
    End;
end;

function ComputeSecret(img1, img2: imgType): imgType;
Var i, j : Integer;
img: imgType;
Begin
    For i := 1 To 8 Do
        For j := 1 To 8 Do
            img[i, j] := img1[i, j] And img2[i, j];
    ComputeSecret := img;
End;

begin
    img1 := ReadImg('data\a.img');
    img2 := ReadImg('data\b.img');
    PrintImg(img1);
    WriteLn();
    PrintImg(img2);
    WriteLn();
    img3 := ComputeSecret(img1, img2);
    PrintImg(img3);
    ReadLn();
end.