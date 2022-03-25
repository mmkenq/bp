

procedure MakeStack(var Top: Ptr);
var Value: integer; var Ok: boolean;
var Kon: Ptr;
begin
  Ok:=True; Top:= Nil;
  while Ok do
    begin
    writeln('write num');
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

procedure ViewStack(top: Ptr);
begin
  while top <> Nil do
  begin
    writeln(top^.Inp);
    top:=top^.Next;
  end;
end;

procedure MergeStack(var top1: Ptr; var top2: Ptr);
var start: Ptr;
begin
  start:= top2;
  while top2^.Next <> Nil do
    begin
      top2:=top2^.Next;
    end;
  top2^.Next := top1;
  top1 := start;
  top2 := start;
end;

procedure RotateStack;
begin
  
end;

var Top1: Ptr;
var Top2: Ptr;
Begin
  writeln('STACK N1');
  MakeStack(Top1);
  writeln;
  
  writeln('STACK N2');
  MakeStack(Top2);
  
  writeln;
  MergeStack(Top1, Top2);
  ViewStack(Top2);
  
end.