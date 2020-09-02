Program FileAccess2;
Uses Crt;
Var cls, stuName : String;
    clsNum : Integer;
    Height : Real;
    DummyFile : Text;
Begin
    Assign(DummyFile, 'E:\s151204\dummy.txt');
    Reset(DummyFile);
    While Not EOF(DummyFile) Do
    Begin
        ReadLn(DummyFile, cls);
        ReadLn(DummyFile, clsnum);
        ReadLn(DummyFile, stuName);
        ReadLn(DummyFile, Height);
        WriteLn(cls:3, clsNum:3, stuName:10, Height:8:2);
    End;
    Close(DummyFile);
    ReadKey();
End.