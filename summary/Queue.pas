Unit Queue;
Interface
Uses Crt, Stack;    
type
  PtrQ = ^Queu;
  Queu=record
    Inf:integer;
    Next:PtrQ;
end;

Procedure MakeQueue(var Left,Right:PtrQ);
Procedure AddQueue(var Right:PtrQ);
Procedure ViewQueue(var Left:PtrQ);
procedure DeleteLeft(var Left:PtrQ);
Procedure DeleteQueue(var Left:PtrQ);
procedure DeleteNQueue(var Left,Right:PtrQ);
Procedure MenuQueue;
Procedure Wait;

Implementation
var x: Queu;
    y, temp,Tmpr,Tmpl ,kon, top, right,left: PtrQ;
    value: integer;
//меню
Procedure MenuQueue;
  var ok:boolean; mode:integer;
  Begin
    ok:=True;
    while ok do
    begin
      Clrscr;
      writeln('Menu/QUEUE:');
      writeln('  1: Make queue');
      writeln('  2: Add to queue');
      writeln('  3: Show queue');
      writeln('  4: Delete queue');
      writeln('  5: Delete 1st element');
      writeln('  6: Delete number from queue');;
      writeln('  0: Exit');
      readln(mode);
        case mode of
        1:begin Clrscr; MakeQueue(Tmpl,Tmpr); ClrScr; ViewQueue(Tmpl); Wait end;
        2:begin Clrscr; AddQueue(Tmpr); ClrScr; ViewQueue(Tmpl); Wait end;
        3:begin Clrscr; ViewQueue(Tmpl); Wait end;
        4:begin Clrscr; DeleteQueue(Tmpl); ClrScr; ViewQueue(Tmpl); Wait end;
        5:begin Clrscr; DeleteLeft(Tmpl); ClrScr; ViewQueue(Tmpl); Wait end;
        6:begin Clrscr; DeleteNQueue(Tmpl,Tmpr); ClrScr; ViewQueue(Tmpl); Wait end;
        0:ok:=False;
          else
          begin
            GoToXY(30,21);
            writeln('Error! Try again..');
            Wait
          end;
        end;
    end;
  end;
  
//wait
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

//создать очередь
procedure MakeQueue(var Left,Right:PtrQ);
var Ok: boolean;
begin
  Ok := true; 
  writeln('Write queue (0 for break)');
  readln(value);
  New(top);
  if value = 0 then 
  begin
    Ok := false;
    Top^.next := Nil;
  end;
  Top^.Inf :=value; Right:=Top; Left:=Top;
    while Ok do
  begin
    //writeln('Введите число: ');
    readln(value);
    if value = 0 then 
    begin
      Ok := false;
      Top^.next := Nil;
    end
    else
    begin
      New(Top);
      Right^.Next := Top;
      Top^.inf := value;
      Right := Top;
    end;
  end;
end;

//добавить эл в список
procedure AddQueue(var Right:PtrQ);
var Ok: boolean;
begin
  Ok := true;
  writeln('Write new nums (0 for break)');
    while Ok do
  begin
    readln(value);
    if value = 0 then 
    begin
      Ok := false;
      Top^.next := Nil;
    end
    else
    begin
      New(Top);
      Right^.Next := Top;
      Top^.inf := value;
      Right := Top;
    end;
  end;
end;

//просмотр очереди
procedure ViewQueue(var Left:PtrQ);
begin
  writeln('Queue:');  
  Kon := Left;
  while Kon <> nil do
  begin
    write(Kon^.Inf); write(' ');
    Kon := Kon^.Next;
  end;
  writeln;
end;
//удалить первый эл
procedure DeleteLeft(var Left:PtrQ);
begin
  Left := Left^.Next;
end;
//удалить очередь
procedure DeleteQueue(var Left:PtrQ);
begin
  Left := nil;
end;
//удалить число из очереди
procedure DeleteNQueue(var Left,Right:PtrQ);
begin
  writeln('Write the number you want to delete: ');
  readln(value);
  Kon := Left;
  
  if Kon^.Inf = value then DeleteLeft(Left)
  else begin
    while (Kon^.Next <> nil) and (Kon^.Next^.Inf <> value) do
      Kon := Kon^.Next;
    if (Kon^.Next <> nil) and (Kon^.Next^.Next = nil)then
    begin
      Kon^.Next:=Kon^.Next^.Next;
      Right:=Kon;
    end;
  
    if (Kon^.Next <> nil) then 
      Kon^.Next:=Kon^.Next^.Next
    else
      writeln('Could not find the number, try another..');
   end;
end;
end.
