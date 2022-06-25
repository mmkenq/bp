Unit SubTrees;
     Interface
     uses crt;
Type NodePtr=^Node;
     Node=record
      KeyN: byte;
      Name:char;
      left,right:NodePtr;
     end;
var key,symbol:char;
    Ok:boolean; level:byte;
    Top,leaf:NodePtr;
    
Procedure MenuSubTree;  
Procedure MakeTree(var Top:NodePtr); 
Procedure MakeSubTrees(leaf:NodePtr);
Procedure ViewTree(Top:NodePtr);
Procedure AddSubTree(Top:NodePtr);
Procedure WayUpDown(Top:NodePtr);
Procedure WayDownUp(Top:NodePtr);  
Procedure WayHoriz(Top:NodePtr; level:byte); 
//Procedure BeautifulViewBT(Top:NodePtr; x,y:byte);
Procedure DeleteElem(Top:NodePtr);
    
Implementation
    
Procedure Wait;
 begin
  repeat
  until KeyPressed;
  while KeyPressed do
  Readkey;
 end;    

Procedure MenuSubTree;
var Mode:integer;
     Ok:boolean;
begin
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln(' Выберите пункт');
   writeln(' 1: Создать дерево');
   writeln(' 2: Вывести дерево');
   writeln(' 3: Просмотр сверху-вниз');
   writeln(' 4: Просмотр снизу-вверх');
   writeln(' 5: Поуровненвый просмотр');
   writeln(' 6: Добавить элемент в дерево');
   //writeln(' 7: Красивый просмотр дерева');
   writeln(' 8: Удаление элемента');
   writeln(' 0: Выход');
   readln(Mode);
    case Mode of
     1:begin
        ClrScr;
        MakeTree(Top);
       end;
     2:begin
        ClrScr;
        ViewTree(Top);
        Wait;
       end;
     3:begin
        ClrScr;
         WayUpDown(Top);
        Wait;
       end;
     4:begin
        ClrScr;
         WayDownUp(Top);
        Wait;
       end;  
     5:begin
        ClrScr;
         writeln('Введите уровень который хотите просмотреть');
         read(level);
         WayHoriz(Top,level);
        Wait;
       end;
     6:begin
        ClrScr;
         AddSubTree(Top);
        Wait;
       end;
     //7:begin
        //ClrScr;
         //BeautifulViewBT(Top, 30, 1);
        //Wait;
       //end;
     7:begin
        ClrScr;
         DeleteElem(Top);
       end;
     0: begin
         exit;
        end;
     else
     begin
      writeln('Пункт ',Mode,' отсутствует');
      Wait; 
     end;
    end; 
  end;
end;


  
Procedure MakeTree(var Top:NodePtr);
begin
 New(Top);
 MakeSubTrees(Top);
end;

Procedure MakeSubTrees(leaf:NodePtr);
var Top:NodePtr;
begin 
 writeln('Введите текущий узел');
 readln(leaf^.Name);
 ClrScr;
 writeln(leaf^.Name,' имеет левое поддерево?(Y/н для ввода узла)');
 readln(key);
 ClrScr;
 if key in ['y','Y','н','Н'] then
 begin
  New(Top);
  leaf^.left:=Top;
  MakeSubTrees(Top);
 end
 else
  leaf^.left:=Nil;
  
 writeln(leaf^.Name,' имеет правое поддерево?(Y/н для ввода узла)');
 readln(key);
 ClrScr;
 if key in ['y','Y','н','Н'] then
 begin
  New(Top);
  leaf^.right:=Top;
  MakeSubTrees(Top);
 end
 else
  leaf^.right:=Nil;
end;

Procedure WayUpDown(Top:NodePtr);
begin
 if Top<>Nil then
 begin
  write(Top^.Name);
  WayUpDown(Top^.left);
  WayUpDown(Top^.right);
 end;
end;

Procedure WayDownUp(Top:NodePtr);
begin
 if Top<>Nil then
 begin
  WayDownUp(Top^.left);
  WayDownUp(Top^.right);
  write(Top^.Name);
 end;
end;

Procedure WayHoriz(Top:NodePtr; level:byte);
begin
 if Top<>Nil then
 if level=1 then write(Top^.Name)
 else
 begin
  WayHoriz(Top^.left,level-1);
  WayHoriz(Top^.right,level-1);
 end;
end;

function High(Top:NodePtr):byte;
var Highleft,Highright:byte;
begin
 if Top=Nil then High:=0
 else
 begin
  Highleft:=High(Top^.left);
  Highright:=High(Top^.right);
  if Highleft>Highright then 
   High:=Highleft+1
  else
   High:=Highright+1;
 end;
end;

Procedure WHoriz(Top:NodePtr; Level:byte);
  begin
    if Top<>Nil then
      if Level=1 then write(Top^.Name)
      else begin
        WHoriz(Top^.Left,Level-1);
        WHoriz(Top^.Right,Level-1);
      end
  end;

Procedure ViewTree(Top:NodePtr);
  var i,HighTree:byte;
  begin
    HighTree:=High(Top);
    for i:=1 to HighTree do begin
      writeln;
      WHoriz(Top,i);
    end
  end;

Procedure Search(Top:NodePtr; var leaf:NodePtr);
begin
 if(Top<>Nil)and(Ok=True) then
 begin
  if Symbol=Top^.Name then
  begin
   Ok:=False; leaf:=Top;
  end
  else
  begin
   Search(Top^.left,leaf);
   Search(Top^.right,leaf);
  end;
 end;
end;

Procedure BeautifulViewBT(Top:NodePtr; x,y:byte);
begin
   GoToXY(x,y);
   if(Top <> Nil) then writeln(Top^.Name);
   if(Top^.Left <> Nil) then BeautifulViewBT(Top^.Left, x-10, y+1);
   if(Top^.Right <> Nil) then BeautifulViewBT(Top^.Right, x+10, y+1); 
end;

Procedure AddSubTree(Top:NodePtr);
begin
 writeln('Введите искомый узел');
 readln(Symbol);
 Ok:=True; Search(Top,leaf); ClrScr;
 if Ok=true then
 begin
  write('Узел ',Symbol,' не найден')
 end
 else
  begin
   writeln('Хотите построить левое поддерево? из узла ',leaf^.Name,' ?');
   readln(key);
   ClrScr;
   if key in ['y','Y','н','Н'] then
    if leaf^.left<>Nil then
    begin
     writeln('Левое поддерево из узла ', leaf^.Name,' уже есть');
     writeln('Все-таки хотите продолжить?');
     readln(key);ClrScr;
     if key in ['y','Y','н','Н'] then
     begin
      MakeTree(Top);
      leaf^.left:=Top;
     end
    end
    else
    begin
       MakeTree(Top); Leaf^.Left := Top
    end;
    writeln('Хотите построить правое поддерево из узла ',leaf^.Name,' ?');
    readln(key);
    ClrScr;
    if key in ['y','Y','н','Н'] then
     if leaf^.right<>Nil then
     begin
      writeln('Левое поддерево из узла ', leaf^.Name,' уже есть');
      writeln('Все-таки хотите продолжить?');
      readln(key);ClrScr;
      if key in ['y','Y','н','Н'] then
        begin
        MakeTree(Top);
        leaf^.right:=Top;
      end
     end
      else
      begin
       MakeTree(Top); Leaf^.Right := Top
      end;
   end;
  end;
    
Procedure DeleteElem(Top:NodePtr);
begin
  writeln('Введите узел, который надо удалить');
  readln(Symbol);
  Ok:=True; Search(Top,leaf); ClrScr;
  if Ok=true then
  begin
    write('Узел ',Symbol,' не найден')
  end
  else
  begin
      if(leaf^.left <> Nil) then leaf^.left := Nil;
      if(leaf^.right <> Nil) then leaf^.right := Nil; 
  end;
  
end;
end.