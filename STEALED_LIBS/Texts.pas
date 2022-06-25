Unit Texts;
     Interface
     uses crt;
     
procedure MenuText;
procedure MakeAndAddText;
procedure ViewText;
procedure BadBoys(n:integer);
procedure DeleteText;
procedure Wait;

Implementation

var ch:char; 
    ok:boolean; 
    TextName:string[12];
    Name:string[10]; 
    Mark:string[3]; 
    StudentText:Text;

//меню
procedure MenuText;
 var Mode:integer;
     Ok:boolean;
begin
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln(' Выберите пункт');
   writeln('     1: Создать файл или добавить текст в существующий');
   writeln('     2: Просмотреть файл');
   writeln('     3: Двоечники по (1)');
   writeln('     4: Двоечники по (2)');
   writeln('     5: Двоечники по (3)');
   writeln('     6: Удаление файла');
   writeln('     0: Выход');
   readln(Mode);
    case Mode of
     1:begin ClrScr; MakeAndAddText;
       end;
     2:begin ClrScr; ViewText; Wait
       end;
     3:begin ClrScr; BadBoys(1);
       end;
     4:begin ClrScr; BadBoys(2);
       end;
     5:begin ClrScr; BadBoys(3);
       end;
     6:begin Clrscr;  DeleteText; GoToXY(30,3); write('Удалено!');  Wait
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
//wait
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;
//создать или добавить текстовый файл
procedure MakeAndAddText;
var ch:char;
    Ok:boolean;
    TextName:string[12];
    Name:string[10];
    Mark:string[4];
    StudentText: Text;
begin
 writeln('Введите имя файла');
 readln(TextName);
 GoToXY(1,2); ClearLine;
 assign(StudentText,TextName);
 {$I-}
  append(StudentText);
 {$I+}
 if not FileExists(TextName) then rewrite(StudentText);
 Ok:=true;
 while Ok do
 begin
  GoToXY(1,1); writeln('Будем ли продолжать ввод? y/n');
  GoToXY(1,2); readln(ch);
  ClrScr;
  if (ch='n') or (ch='N') or (ch='т') or (ch='Т') then
  begin
   Ok:=False;
   close(StudentText);
  end
  else 
  begin
   GoToXY(1,1); writeln('Введите фамилию студента');
   GoToXY(1,2); readln(Name);
   GoToXY(1,3); writeln('Введите его оценки');
   GoToXY(1,4); readln(Mark);
   ClrScr;
   //GoToXY(1,4); ClearLine;
   write(StudentText,Name:10,Mark:4);
  end;
 end; 
end;
//показать текст
procedure ViewText;
var k:integer;
    TextName:string[12];
    Name:string[10];
    Mark:string[4];
    StudentText: Text;
begin
 k:=1;
 writeln('Введите имя файла');
 readln(TextName);
 ClrScr;
 assign(StudentText,TextName);
 if not FileExists(TextName) then
  begin 
   writeln('Файл ',TextName,' не найден!');
   exit;
  end;
 reset(StudentText); 
 if FileExists(TextName) then 
 while not EOF(StudentText) do
 begin
  k:=k+1;
  read(StudentText,Name,Mark);
  GoToXY(1,k); writeln(Name);
  GoToXY(12,k); Writeln(Mark);
 end;
 close(StudentText);
end;
//показать текст из заданного файла
procedure ViewTextFile(RandText:Text; RandName:string[12]);
var k:integer;
    Name:string[10];
    Mark:string[4];
begin
 k:=1;
 assign(RandText,RandName);
 reset(RandText);
 while not EOF(RandText) do
 begin
  k:=k+1;
  read(RandText,Name,Mark);
  GoToXY(1,k); writeln(Name);
  GoToXY(12,k); Writeln(Mark);
 end;
 close(RandText);
end;
//список двоечников
procedure BadBoys(n:integer);
var i:integer;
    Name:string[10];
    Mark:string[4];
    NewName,TextName:string[12];
    NewText,StudentText:Text;
    //Ln:boolean;
begin
 writeln('Введите имя файла, в котором хотите найти двоечников');
 readln(TextName);
 ClrScr;
 assign(StudentText,TextName); 
 if not FileExists(TextName) then
  begin 
   writeln('Файл ',TextName,' не найден!');
   Wait;
   exit;
  end;
 NewName:='aaaa';
 assign(NewText,NewName); rewrite(NewText);
 reset(StudentText);
 
 if (n=1) then
   writeln('Двоечники по мат. анализу(1):')
   else if (n=2)then
     writeln('Двоечники по алгебре(2):')
     else if (n=3)then
       writeln('Двоечники по программированию(3):');
 while not EOF(StudentText) do
 begin
  read(StudentText,Name,Mark);
   if Mark[n+1]='2' then  Write(NewText,Name:10,Mark:4); 
 end;
  close(NewText);
  close(StudentText);
  ViewTextFile(NewText,NewName);
  Wait;
  Erase(NewText);
end;
//удалить файл
procedure DeleteText;
  var k:integer;
  begin
    GoToXY(30,1); 
    writeln('Файл для очистки:');
    GoToXY(30,2); 
    read(TextName);
    assign(StudentText,TextName);
    Erase(StudentText);
  end;
end.