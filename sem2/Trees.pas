// Деревья
unit Trees;

interface
Uses Crt;
type
  NodePtr = ^Node;
  Node = record
    Name: char;
    Left, Right: NodePtr
  end;

procedure MenuTrees;
procedure MakeTree(var Top: NodePtr);// Создание дерева
procedure WayUpDown(Top: NodePtr);// Обход сверху вниз
procedure WayDownUp(Top: NodePtr);// Обход снизу вверх
procedure WayHoriz(Top: NodePtr; Level: byte);// Обход вершин одного уровня
function High(Top: NodePtr): byte;// Высота дерева
procedure ViewTree(Top: NodePtr);// Просмотр дерева
procedure AddSubTree(Top: NodePtr);// Добавление поддерева
procedure DeleteSubTree(Top: NodePtr);// Удаление поддерева
procedure Wait;
implementation

var
  Symbol, Key: char;
  Ok, Flag: boolean;
  Top, Leaf: NodePtr;
  Mode, Level: byte;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MakeSubTrees(Leaf: NodePtr);
var
  Top: NodePtr;
begin
  GoToXY(30, 18); writeln('Введите текущий узел:');
  GoToXY(40, 19); readln(Leaf^.Name);
  GoToXY(30, 18); writeln(' ');
  GoToXY(40, 19); writeln(' ');
  GoToXY(25, 20); writeln(Leaf^.Name, ' имеет левое поддерево?:');
  GoToXY(40, 21); readln(Key);
  GoToXY(25, 20); writeln(' ');
  GoToXY(40, 21); writeln(' ');
  if Key in ['y', 'Y', 'н', 'Н'] then
  begin
    new(Top); Leaf^.Left := Top; MakeSubTrees(Top)
  end
  else Leaf^.Left := nil;
  GoToXY(25, 20); writeln(Leaf^.Name, ' имеет правое поддерево?:');
  GoToXY(40, 21); readln(Key);
  GoToXY(25, 20); writeln(' ');
  GoToXY(40, 21); writeln(' ');
  if Key in ['y', 'Y', 'н', 'Н'] then
  begin
    new(Top); Leaf^.Right := Top; MakeSubTrees(Top)
  end
  else Leaf^.Right := nil;
end;

procedure MakeTree(var Top: NodePtr);
begin
  new(Top); MakeSubTrees(Top)
end;

procedure WayUpDown(Top: NodePtr);
begin
  if Top <> nil then
  begin
    write(Top^.Name, ' ');
    WayUpDown(Top^.Left);
    WayUpDown(Top^.Right)
  end
end;

procedure WayDownUp(Top: NodePtr);
begin
  if Top <> nil then
  begin
    WayDownUp(Top^.Left);
    WayDownUp(Top^.Right);
    write(Top^.Name, ' ')
  end
end;

procedure WayHoriz(Top: NodePtr; Level: byte);
begin
  if Top <> nil then
    if Level = 1 then write(Top^.Name, ' ')
    else
    begin
      WayHoriz(Top^.Left, Level
     - 1);
      WayHoriz(Top^.Right, Level
     - 1)
    end
end;

function High(Top: NodePtr): byte;
var
  HighLeft, HighRight: byte;
begin
  if Top = nil then High := 0
  else
  begin
    HighLeft := High(Top^.Left);
    HighRight := High(Top^.Right);
    if HighLeft > HighRight then High := HighLeft + 1
    else High := HighRight + 1
  end
end;

procedure ViewTree(Top: NodePtr);
var
  i, HighTree: byte;
begin
  HighTree := High(Top);
  for i := 1 to HighTree do
  begin
    writeln; WayHoriz(Top, i)
  end end;

procedure SearchNode(Top: NodePtr; var Leaf: NodePtr);
begin
  if (Top <> nil) and (Flag = True) then
  begin
    if Symbol = Top^.Name then
    begin
      Flag := False; Leaf := Top
    end
    else
    begin
      SearchNode(Top^.Left, Leaf);
      SearchNode(Top^.Right, Leaf)
    end
  end
end;

procedure AddSubTree(Top: NodePtr);
begin
  GoToXY(30, 18); writeln('Введите искомый узел');
  GoToXY(40, 19); readln(Symbol);
  Flag := True; SearchNode(Top, Leaf); ClrScr;
  if Flag = True then
  begin
    write('Узел ', Symbol, ' не найден'); Wait
  end
  else
  begin
    GoToXY(25, 20);
    writeln('Желаете построить левое поддерево у ', Leaf^.Name, ' ?');
    GoToXY(40, 21); readln(Key);
    GoToXY(23, 20);
    writeln(' ');
    GoToXY(40, 21); writeln(' ');
    if Key in ['y', 'Y', 'н', 'Н'] then
      if Leaf^.Left <> nil then
      begin
        GoToXY(25, 19);
        writeln('Левое поддерево у ', Leaf^.Name, ' уже есть');
        GoToXY(25, 20); writeln('Все-таки желаете?');
        GoToXY(40, 21); readln(Key);
        GoToXY(25, 19);
        writeln(' ');
        GoToXY(25, 20); writeln(' ');
        GoToXY(40, 21); writeln(' ');
        if Key in ['y', 'Y', 'н', 'Н'] then
        begin
          MakeTree(Top); Leaf^.Left := Top
        end
      end
      else
      begin
        MakeTree(Top); Leaf^.Left := Top
      end;
    GoToXY(25, 20);
    writeln('Желаете построить правое поддерево у ', Leaf^.Name, ' ?');
    GoToXY(40, 21); readln(Key);
    GoToXY(23, 20);
    writeln(' ');
    GoToXY(40, 21); writeln(' ');
    if Key in ['y', 'Y', 'н', 'Н'] then
      if Leaf^.Right <> nil then
      begin
        GoToXY(25, 19);
        writeln('Правое поддерево у ', Leaf^.Name, ' уже есть');
        GoToXY(25, 20); writeln('Все-таки желаете?');
        GoToXY(40, 21); readln(Key);
        GoToXY(25, 19);
        writeln(' ');
        GoToXY(25, 20); writeln(' ');
        GoToXY(40, 21); writeln(' ');
        if Key in ['y', 'Y', 'н', 'Н'] then
        begin
          MakeTree(Top); Leaf^.Right := Top
        end
      end
      else
      begin
        MakeTree(Top); Leaf^.Right := Top
      end
  end
end;

procedure DeleteSubTree(Top: NodePtr);
begin
  GoToXY(30, 18); writeln('Введите искомый узел');
  GoToXY(40, 19); readln(Symbol);
  Flag := True; SearchNode(Top, Leaf); ClrScr;
  if Flag = True then
  begin
    write('Узел ', Symbol, ' не найден'); Wait
  end
  else
  begin
    GoToXY(25, 20);
    writeln('Желаете удалить левое поддерево ', Leaf^.Name, ' ?');
    GoToXY(40, 21); readln(Key);
    GoToXY(25, 20);
    writeln(' ');
    GoToXY(40, 21); writeln(' ');
    if Key in ['y', 'Y', 'н', 'Н'] then
    begin
      GoToXY(25, 20);
      writeln('Действительно желаете удалить левое поддерево?');
      GoToXY(40, 21); readln(Key);
      GoToXY(25, 20);
      writeln(' ');
      GoToXY(40, 21); writeln(' ');
      if Key in ['y', 'Y', 'н', 'Н'] then Leaf^.Left := nil
    end;
    GoToXY(25, 20);
    writeln(' Желаете удалить правое поддерево ', Leaf^.Name, ' ?');
    GoToXY(40, 21); readln(Key);
    GoToXY(25, 20);
    writeln(' ');
    GoToXY(40, 21); writeln(' ');
    if Key in ['y', 'Y', 'н', 'Н'] then
    begin
      GoToXY(25, 20);
      writeln(' Действительно желаете удалить правое поддерево?');
      GoToXY(40, 21); readln(Key);
      GoToXY(25, 20);
      writeln(' ');
      GoToXY(40, 21); writeln(' ');
      if Key in ['y', 'Y', 'н', 'н'] then Leaf^.Right := nil
    end
  end
end;

procedure MenuTrees; //Меню операций с деревьями
const N = 9;
var Ok : boolean; Vect, i : integer;
    Headline : array[1..N] of string;
begin
  Headline[1] := 'Создание дерева';
  Headline[2] := 'Обход сверху вниз';
  Headline[3] := 'Обход снизу вверх';
  Headline[4] := 'Обход вершин одного уровня';
  Headline[5] := 'Высота дерева';
  Headline[6] := 'Просмотр дерева';
  Headline[7] := 'Добавление поддерева';
  Headline[8] := 'Удаление поддерева';
  Headline[9] := 'Назад';
  Ok := true;
  while Ok do
  begin
    Vect := 1;
    ClrScr;
    GoToXY(20,1); writeln('Деревья (выберите режим)');
    
    TextColor(0);TextBackground(15);
    GoToXY(5,2);write(Headline[1]);
    TextColor(15);TextBackground(0);
    
    for i := 2 to N do
      begin
        GoToXY(5,i+1);write(Headline[i]);
      end;
      GoToXY(5,2);
    
  while true do
    begin
      case ReadKey of
        '&' : begin   //Вверх
                GoToXY(5,Vect+1);write(Headline[Vect]);
                Dec(Vect);
                if Vect = 0 then
                  Vect := N;  
                TextColor(0);TextBackground(15);
                GoToXY(5,Vect+1);write(Headline[Vect]);
                TextColor(15);TextBackground(0);
              end;
        '(' : begin   //Вниз
                GoToXY(5,Vect+1);write(Headline[Vect]);
                Inc(Vect);
                if Vect > N then
                  Vect := 1; 
                TextColor(0);TextBackground(15);
                GoToXY(5,Vect+1);write(Headline[Vect]);
                TextColor(15);TextBackground(0);
              end;
        #13 : break
      end;
    end;
    ClrScr;
    case Vect of 
      1 : MakeTree(Top);
      2 : begin WayUpDown(Top); Wait end;
      3 : begin WayDownUp(Top); Wait end;
      4 : begin
          GoToXY(30, 18); writeln('Введите уровень');
          GoToXY(40, 19); readln(Level); ClrScr;
          WayHoriz(Top, Level); Wait
          end;
      5 : begin writeln(High(Top):3); Wait end;
      6 : begin ViewTree(Top); Wait end;
      7 : AddSubTree(Top);
      8 : DeleteSubTree(Top);
      9 : begin
            GoToXY(5,N+1);writeln(Headline[N]);
            Ok:=False;GoToXY(20,20)
          end;
    end;
  end;
end;
end.