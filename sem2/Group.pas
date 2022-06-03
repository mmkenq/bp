Unit Group;

Interface
uses crt;
Type PtrVertic=^StackVertic;
StackVertic = record
  Number:Integer;
  Name : String[20];
  Next: PtrVertic;
end;

PtrHoriz=^StackHoriz;
StackHoriz = record
  Number : integer;
  Group : string[10];
  Head : PtrVertic;
  Next : PtrHoriz;
end;


procedure Wait;
procedure MenuGroup;
Procedure MakeMenuVertic(var Vertic: PtrVertic);
procedure ViewMenuVertic(Vertic: PtrVertic; n: integer);

procedure MakeMenuHoriz(var Horiz: PtrHoriz);
procedure invGroup(Top: PtrVertic; var vertic: PtrVertic);
procedure ViewMenuHoriz(ch: boolean; var Horiz: PtrHoriz);
procedure ViewMenuVertic2(Vertic: PtrVertic; n: integer);


Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

Procedure MakeMenuVertic(Var Vertic: PtrVertic);
var Top: PtrVertic;
Ok: boolean;
NameValue: string[20];
k: integer;
begin
  Ok:= True;
  Vertic:= Nil;
  k:= 0;
  While Ok do
    Begin
      Writeln('Введите Фамилию студента (или "0")');
      Readln(NameValue);
      k:= k+1;
      if (NameValue='0') then Ok:=False
      else
        begin
          New(Top);
          Top^.Next:=Vertic;
          Top^.Number:= k;
          Top^.Name := NameValue;
          Vertic:=Top;
        end;
    end;
end;

procedure ViewMenuVertic(Vertic: PtrVertic; n: integer);
var
  Top: PtrVertic;
  PozX, PozY: integer;
begin
  Top := Vertic;
  PozY := 2;
  PozX := 12 * n - 7;
  while Top <> nil do
  begin
    PozY := PozY + 1;
    GoToXY(PozX, PozY);
    Writeln(Top^.Name);
    Top := Top^.Next;
  end;
end;

procedure MakeMenuHoriz(var Horiz: PtrHoriz);
var
  Vertic: PtrVertic;
  Top: PtrHoriz;
  GroupValue: string[10];
  Ok: Boolean;
  k: integer;
begin
  Ok := True;
  Horiz := nil;
  k := 0;
  while Ok do
  begin
    Writeln('Введите название новой группы (или "0" для завершения)');
    Readln(GroupValue);
    k := k + 1;
    if (GroupValue = '0') then Ok := False
        else
    begin
      New(Top);
      Top^.Next := Horiz;
      Top^.Number := k;
      Top^.Group := GroupValue;
      MakeMenuVertic(Vertic);
      Top^.Head := Vertic;
      Horiz := Top;
    end;
  end;
end;


procedure invGroup(Top: PtrVertic; var vertic: PtrVertic);
var
  bot: PtrVertic;
  k: integer;
begin
  Vertic := nil;
  while Top <> nil do
  begin
    k := k + 1;
    New(Bot);
    Bot^.Next := Vertic;
    Bot^.Number := k;
    Bot^.Name := Top^.Name;
    Vertic := Bot;
    Top := top^.Next;
  end;
end;

procedure ViewMenuVertic2(Vertic: PtrVertic; n: integer);
var
  Top: PtrVertic;
  PozX, PozY: integer;
begin
  Top := Vertic;
  invGroup(Top, Top);
  PozY := 2;
  PozX := 12 * n - 7;
  while Top <> nil do
  begin
    PozY := PozY + 1;
    GoToXY(PozX, PozY);
    Writeln(Top^.Name);
    Top := Top^.Next;
  end;
end;

procedure ViewMenuHoriz(ch: boolean; var Horiz: PtrHoriz);
var
  Top: PtrHoriz;
  n, k: integer;
begin
  Top := Horiz;
  n := 0;
  while Top <> nil do
  begin
    n := n + 1;
    write(n:5, '.', Top^.Group:6);
    Top := Top^.Next;
  end;
  GoToXY(30, 22); Writeln('Выберите пункт меню');
  GoToXY(39, 23); readln(n);
  Top := Horiz;
  k := 1 + Horiz^.Number;
  while (Top^.Number + n <> k) do
    Top := Top^.Next;
  if ch = true then
    ViewMenuVertic2(Top^.Head, n)
  else
    ViewMenuVertic(Top^.Head, n); 
end;

procedure MenuGroup;
var mode:integer;
var ok:boolean;
var a:PtrVertic;
var b:PtrHoriz;
begin
 ok:=True;
 
 while ok do
  begin
   ClrScr;
   writeln(' Group:');
   writeln('    1: Create Horiz Menu');
   writeln('    2: Create Vertic Menu');
   writeln('    3: View Vertic Menu');
   writeln('    4: View Horiz Menu');
   writeln('    0: Выход');
   readln(mode);
    case mode of
     1:begin ClrScr; MakeMenuHoriz(b); Wait end;
     2:begin ClrScr; MakeMenuVertic(a); Wait end;
     3:begin ClrScr; ViewMenuVertic(a, 3); Wait end;
     4:begin ClrScr; ViewMenuHoriz(false, b); Wait end;
     0: Ok:=false;
       else
       begin
        writeln('Error! Try again, please..');
        Wait; 
       end;
     end; 
  end;
end;

End. // Implementation