Unit Trees;
   Interface
     uses crt;
const n=11;
Type Node = record
  ch:char;
  Left,Right:byte;
end;  
var Tree: array of Node := new Node[15];
    Tree_length: byte;
    lvl,cnt: integer;
procedure MenuTree;
procedure Save;
procedure MyRead;
procedure ViewTree;
procedure TreeTab;
procedure Wait;
procedure WayHoriz(Next,Level:byte);
procedure WayDownUp(Next:byte);
procedure WayUpDown(Next:byte);

Implementation
//wait
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

//меню
procedure MenuTree;
 var Mode:integer;
     Ok:boolean;
     Level:byte;
begin
  lvl:= 2; cnt:= 1;
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln(' Выберите пункт');
   writeln(' 1: Создать дерево');
   writeln(' 2: Просмотреть сверху вниз');
   writeln(' 3: Просмотреть снизу вверх');
   writeln(' 4: Просмотреть эл n-го уровня');
   writeln(' 5: Создание файла таблицы');
   writeln(' 6: Просмотреть дерево');
   writeln(' 0: Выход');
   readln(Mode);
    case Mode of
     1:begin ClrScr; Save;
       end;
     2:begin ClrScr; MyRead; WayUpDown(1); Wait
       end;
     3:begin ClrScr; MyRead; WayDownUp(1); Wait
       end;
     4:begin ClrScr; MyRead;  write('Введите нужный уровень: '); GoToXY(30,4); read(Level); 
             GoToXY(30,5); write('Результат: '); GoToXY(30,6);
             WayHoriz(1,Level); Wait
       end;
     5:begin ClrScr; MyRead; TreeTab; Wait
       end;
     6:begin Clrscr; ViewTree; Wait
       end;
     0: Ok:=false;
     else
     begin
        writeln('Ошибка! Повторите Ввод!');
      Wait; 
     end;
    end; 
  end;
end;
//С верху вниз
procedure WayUpDown(Next:byte);
begin
  if Next<>0 then
    with Tree[Next] do
    begin
      write(ch);
      WayUpDown(Left);
      WayUpDown(Right);
    end;
end;
//С низу вверх
procedure WayDownUp(Next:byte);
begin
  if Next<>0 then
    with Tree[Next] do
    begin
      WayDownUp(Left);
      WayDownUp(Right);
      write(ch);
    end;
end;
//
procedure WayHoriz(Next,Level:byte);
begin
  if Next <> 0  {and Level > 0} then
    with Tree[Next] do
      if Level = 1 then write(ch)
      else 
      begin
        WayHoriz(Left,Level-1);
        WayHoriz(Right,Level-1);
      end;    
end;
//
procedure Save;
var ch:char;
    k:byte;
    Ok:boolean;
    TreeName:string[12];
    TreeFile:file of Node;
    FlowNode: Node;
begin
 Ok:=True;
 k:=0;
 writeln('Дайте дереву имя');
 readln(TreeName);
 ClrScr;
 assign(TreeFile,TreeName);
 rewrite(TreeFile);
 with FlowNode do
  while Ok do
  begin
   GoToXY(1,1); writeln('Будем ли продолжать ввод? y/n');
   GoToXY(1,2); readln(ch);
   ClrScr;
   if(cnt = 12) then
   begin
     ch:='n';
   end;
   if (ch='n') or (ch='N') or (ch='т') or (ch='Т') then
   begin
    Ok:=False;
    Close(TreeFile);
   end
   else if (ch='y') or (ch='Y') or (ch='н') or (ch='Н') then
   begin
     k+=1;
     GoToXY(33,3); write(k);
     GoToXY(30,5); write('Символ:');
     GoToXY(38,5); readln(ch); 
     if(cnt > 5) then lvl:=0;
     Left:= lvl;
     if(cnt < 6) then lvl+=1;
     Right:= lvl;
     if(cnt < 6) then lvl+=1;
     ClrScr;
     cnt+=1;
     write(TreeFile,FlowNode);
   end;
  end;
end;
//
procedure MyRead;
  var k:integer;
      FlowNode: Node;
      NTree:string[12];
      FTree: file of Node;
  begin
    GoToXY(30,1); write('Введите имя дерева:');
    GoToXY(30,2); readln(NTree);
    assign(FTree, NTree);
    ClrScr; GoToXY(30,3); k:=1;
    if FileExists(NTree) then begin
      reset(FTree);
      while not EOF(FTree)do
        with FlowNode do begin
          read( FTree, Tree[k]);
          k+=1;
        end;
        Tree_length:= k-1;
        close(FTree)
    end
    else
      write('Дерево ',NTree,' не найден!')
  end;
//
procedure ViewTree;
  var k:integer;
      FlowNode: Node;
      NTree:string[12];
      FTree: file of Node;
  begin
    GoToXY(30,1); write('Просмотр древа:');
    GoToXY(30,2); readln(NTree);
    assign(FTree, NTree);
    ClrScr; GoToXY(30,3); k:=1;
    if FileExists(NTree) then begin
      reset(FTree);
      while not EOF(FTree)do
        with FlowNode do begin
          read(FTree, FlowNode);
          GoToXY(30,k+1); write(k);
          GoToXY(35,k+1); write(ch);
          GoToXY(40,k+1); write(Left);
          GoToXY(45,k+1); write(Right);
          k+=1;
        end;
        close(FTree)
    end
    else
      write('Файл ',NTree,' не найден!')
  end;
//
procedure TreeTab;
var ch:char;
    k:byte;
    Ok:boolean;
    TreeName:string[12];
    TreeFile: Text;
    FlowNode: Node;
begin
  Ok:=True;
  writeln('Дайте таблице имя');
  GoToXY(30,4);
  readln(TreeName);
  ClrScr;
  assign(TreeFile,TreeName);
  rewrite(TreeFile);
  for var i:=1 to Tree_length do 
    with Tree[i] do begin
      WriteLn(TreeFile,i:3,ch:3,Left:3,Right:3);
    end;
    GoToXY(30,4); write('файл создан!');
    close(TreeFile); 
end;

end.
