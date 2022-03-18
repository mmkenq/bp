Type Ptr = ^Stak;
Stak = record 
Inp: integer;
Next: Ptr
end;
var Top: Ptr; var Kon: Ptr;
procedure MakeStack;
var Value: integer; var Ok: boolean;
begin
  Ok:=True; Top:= Nil;
  while Ok do
    begin writeln('write num');
    readln(Value);
    if Value = 999 then Ok:= False
    else
      begin
        New(Kon);
        Kon^.Inp:= Value;
        Kon^.Next:=Top; 
        Top:=Kon;
      end;
    end;
end;

procedure AddStack;
var Value:integer; var Ok: boolean;
begin
  Ok:=True;
  while Ok do
  begin
    writeln('add num');
    readln(Value);
    if Value = 999 then Ok:= False
    else
    begin
      New(Kon);
      Kon^.Inp:=Value;
      Kon^.Next:=Top;
      Top:=Kon;
    end;
  end;
end;

Begin
  Writeln('Making Stack');
  MakeStack;
  writeln('Adding to stack)');
  AddStack;
End.