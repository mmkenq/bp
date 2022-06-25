Unit Stacks;
Interface
uses crt;
type
  Ptr = ^Stac;
  Stac = record
    Inf:integer;
    Next:Ptr;
end;

Procedure MakeStack(Var Top:Ptr);
Procedure ViewStack(Var Top:Ptr);
Procedure AddStack(Var Top:Ptr);
Procedure RotateStack(Var Top: Ptr);
Procedure ConStack(Var Top1, Top2: Ptr);
Procedure ChaceStack(Var Top:Ptr);
Procedure DeleteTop(Var Top:Ptr);
Procedure MenuStack;
procedure Wait;

Implementation
  Var Top,Kon,Kon2,Top1,Top2,temp: Ptr;
      Value: integer;
      x: Stac;
Procedure MenuStack;
Var Mode:integer;
    Ok:boolean;
begin
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln(' Стек:');
   writeln('    1: Ввести стек');
   writeln('    2: Добавить элементы к стеку');
   writeln('    3: Ввести второй стек и присоединить к первому');
   writeln('    4: Перевернуть стек');
   writeln('    5: Удалить верхушку стека');
   writeln('    6: Удалить стек');
   writeln('    7: Показать стек');
   writeln('    0: Выход');
   readln(Mode);
    case Mode of
     1:begin ClrScr; MakeStack(Top1); ClrScr; ViewStack(Top1); Wait end;
     2:begin ClrScr; AddStack(Top1); ClrScr; ViewStack(Top1); Wait end;
     3:begin ClrScr; MakeStack(Top2); ConStack(Top1,Top2); ClrScr; ViewStack(Top1);  Wait end;
     4:begin ClrScr; RotateStack(Top1); ViewStack(Top1); Wait end;
     5:begin ClrScr; DeleteTop(Top1); ViewStack(Top1); Wait end;
     6:begin ClrScr; ChaceStack(Top1) end;
     7:begin ClrScr; ViewStack(Top1); Wait end;
     0: Ok:=false;
       else
       begin
        writeln('Ошибка! Повторите Ввод!');
        Wait; 
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

//ввод стека
procedure MakeStack(Var Top: Ptr);
var
  Ok: boolean;
begin
  Ok := true;
  Top := nil;
  writeln('Введите стэк 0 для остановки ввода');
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
  writeln('Вводите новые элементы 0 для остановки ввода');
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
//показать стек
procedure ViewStack(Var Top: Ptr);
begin
  writeln('Стек:');
  Kon := Top;
  while Kon <> nil do
  begin
    write(Kon^.Inf); write(' ');
    Kon := Kon^.Next;
  end;
  writeln;
end;
//удалить первый эл стека
procedure DeleteTop(Var Top: Ptr);
begin
  Top := Top^.Next;
end;
//удалить стек
procedure ChaceStack (Var Top: Ptr);
begin
  Top := nil;
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
  temp := Top2;
  Top2 := Top;
  Top := temp;
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


