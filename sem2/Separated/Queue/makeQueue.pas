Type Ptr = ^Queu;
  Queu = record
    Int: integer;
    Next: Ptr;
  end;

var Left, Right, Top: Ptr;
Value: integer;

procedure MakeQueue;
var Ok: boolean;
begin
  Ok:= True; writeln('Write num');
  readln(Value); New(Top);
  if Value = 999 then
  begin
    Ok:=False;
    Top^.Next:=Nil;
  end;
  
  Top^.Int:= Value;
  Right:=Top; Left:=Top;
  while Ok do
  begin
    writeln('write num');
    readln(Value);
    if Value = 999 then
    begin
      Ok:=False; Top^.Next:=Nil;
    end
    else 
    begin
      New(Top);
      Right^.Next := Top;
      Top^.Int := Value;
      Right:= Top;
    end;
  end;
end;

Begin
  MakeQueue;  
end.