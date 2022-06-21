Unit Stack;
Interface
uses crt;
type
  Ptr = ^Stak;
  Stak = record
    Inf:integer;
    Next:Ptr;
end;
procedure MakeStack(Var Top:Ptr);
procedure ViewStack(Var Top:Ptr);
procedure AddStack(Var Top:Ptr);
procedure ConStack(Var Top1, Top2: Ptr);
procedure RotateStack(Var Top: Ptr);
procedure DeleteStack(Var Top:Ptr);
procedure MenuStack;
procedure Wait;
Implementation
  Var Top,Kon,Kon2,Top1,Top2,temp: Ptr;
      Value: integer;
      x: Stak;
procedure MenuStack;
Var Mode:integer;
    Ok:boolean;
begin
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln(' Stack:');
   writeln('    1: Make stack');
   writeln('    2: Add to stack');
   writeln('    3: Make 2nd stack and connect to 1st');
   writeln('    4: Show stack');
   writeln('    5: Delete stack');
   writeln('    6: Rotate stack');
   writeln('    0: Exit');
   readln(Mode);
    case Mode of
     1:begin ClrScr; MakeStack(Top1); ClrScr; ViewStack(Top1); Wait end;
     2:begin ClrScr; AddStack(Top1); ClrScr; ViewStack(Top1); Wait end;
     3:begin ClrScr; MakeStack(Top2); ConStack(Top1,Top2); ClrScr; ViewStack(Top1);  Wait end;
     4:begin ClrScr; ViewStack(Top1); Wait end;
     5:begin ClrScr; DeleteStack(Top1) end;
     6:begin ClrScr; RotateStack(Top1); ViewStack(Top1); Wait end;
     0: Ok:=false;
       else
       begin
        writeln('Ошибка! Повторите Ввод!');
        Wait; 
       end;
     end; 
  end;
end; 

procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

//ввод стека
procedure MakeStack(Var Top: Ptr);
var
  Ok: boolean;
begin
  Ok := true;
  Top := nil;
  writeln('Write stack (0 for break)');
  while Ok do
  begin
    readln(value);
    if value = 0 then Ok := false
    else
    begin
      New(kon);
      Kon^.Next := Top;
      Kon^.inf := value;
      Top := kon;
    end;
  end;
end;

//добавление эл к стеку
procedure AddStack(Var Top: Ptr);
var
  Ok: boolean;
begin
  Ok := true;
  writeln('Write new elements (0 for break)');
  while Ok do
  begin
    readln(value);
    if value = 0 then Ok := false
    else
    begin
      New(kon);
      Kon^.Next := Top;
      Kon^.inf := value;
      Top := kon;
    end;
  end;
end;

// показать стек
procedure ViewStack(Var Top: Ptr);
begin
  writeln('Stack:');
  Kon := Top;
  while Kon <> nil do
  begin
    write(Kon^.Inf); write(' ');
    Kon := Kon^.Next;
  end;
  writeln;
end;

// перевернуть стек
procedure RotateStack(Var Top: Ptr);
begin
  Kon := Top; Top2 := nil;
  while Kon <> nil do
  begin
    New(Kon2);
    Kon2^.Next := Top2;
    Kon2^.inf := Kon^.inf;
    Top2 := Kon2;
    Kon := Kon^.Next;
  end;
  Top := Top2;
end;

// удалить стек
procedure DeleteStack (Var Top: Ptr);
begin
  Top := nil;
end;

// соеденить стеки
procedure ConStack(Var Top1, Top2: Ptr);
begin
  Kon2 := Top2;
  while Kon2^.Next  <> nil do
    Kon2 := Kon2^.Next;
  Kon2^.Next := Top1;
  Top1 := Top2;
end;
end.


