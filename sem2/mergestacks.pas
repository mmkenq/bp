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

procedure ViewStack(kon: Ptr);
begin
  while kon <> Nil do
  begin
    writeln(kon^.Inp);
    kon:=kon^.Next;
  end;
end;

procedure MergeStack(var Top1: Ptr; var Kon2: Ptr);
begin
  Kon2:= Top1;
end;

var Top2: Ptr; var Kon2: Ptr;
Begin
  writeln('STACK N1');
  MakeStack;
  writeln;
  
  writeln('STACK N2');
  MakeStack;
  
  
  {  ViewStack(Kon);
  ViewStack(Kon2); }
  writeln;
  MergeStack(Top, Kon2);
  ViewStack(Kon);
  
end.