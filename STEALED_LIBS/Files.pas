Unit Files;
  Interface
  uses crt, Stacks;
Type Student=record
  Name:string[10];
  Mark:string[4];
end;
procedure MenuFile;
procedure ViewFile;
procedure AddFile;
procedure MakeFile;
procedure WiewTwo;
procedure DeleteStudents;

procedure Wait;
Implementation
//меню
procedure MenuFile;
 var Mode:integer;
     Ok:boolean;
begin
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln(' Выберите пункт');
   writeln(' 1: Создать файл');
   writeln(' 2: Вывести файл');
   writeln(' 3: Добавить данные в файл');
   writeln(' 4: Найти двоешников');
   writeln(' 5: Удалить файл');
   writeln(' 0: Выход');
   readln(Mode);
    case Mode of
     1:begin ClrScr; MakeFile;
       end;
     2:begin ClrScr; ViewFile; Wait
       end;
     3:begin ClrScr; AddFile;
       end;
     4:begin ClrScr; WiewTwo; Wait
       end;
     5:begin ClrScr; DeleteStudents; GoToXY(30,3); write('Удалено!');  Wait
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
//создать файл 
procedure MakeFile;
var ch:char;
    Ok:boolean;
    FileName:string[12];
    StudentFile: file of Student;
    FlowStudent: Student;
begin
 Ok:=True;
 writeln('Дайте файлу имя');
 readln(FileName);
 ClrScr;
 assign(StudentFile,FileName);
 rewrite(StudentFile);
 with FlowStudent do
  while Ok do
  begin
   GoToXY(1,1); writeln('Будем ли продолжать ввод? y/n');
   GoToXY(1,2); readln(ch);
   ClrScr;
   if (ch='n') or (ch='N') or (ch='т') or (ch='Т') then
   begin
    Ok:=False;
    Close(StudentFile);
   end
   else if (ch='y') or (ch='Y') or (ch='н') or (ch='Н') then
   begin
    GoToXY(1,1); writeln('Введите фамилию студента');
    GoToXY(1,2); readln(Name);
    GoToXY(1,3); writeln('Введите его оценки');
    GoToXY(1,4); readln(Mark);
    ClrScr;
    
    write(StudentFile,FlowStudent);
   end;
  end;
end;
// просмотреть файл
procedure ViewFile;
var k:integer;
    FileName:string[12];
    FlowStudent:Student;
    StudentFile:file of Student;
begin
 k:=3;
 writeln('Введите имя файла, который хотите просмотреть');
 readln(FileName);
 assign(StudentFile,FileName);
 reset(StudentFile);
 with FlowStudent do
  while not EOF(StudentFile) do
  begin
   k:=k+1;
   read(StudentFile,FlowStudent);
   GoToXY(1,k); write(Name);
   GoToXY(21,k); write(Mark);
  end;
 close(StudentFile); 
 writeln;
end;
//добавить в файл
procedure AddFile;
var ch:char;
    Ok:boolean;
    NewName,FileName:string[12];
    NewFile,StudentFile:file of Student;
    FlowStudent:Student;
begin
 Ok:=True;
 writeln('Введите имя файла'); readln(FileName);
 assign(StudentFile,FileName); reset(StudentFile);
 NewName:='aaaa';
 assign(NewFile,NewName); rewrite(NewFile);
 ClrScr;
 while not EOF(StudentFile) do
 begin
  read(StudentFile,FlowStudent);
  write(NewFile,FlowStudent);
 end;
 with FlowStudent do 
  While Ok do
  begin
   GoToXY(1,1); writeln('Будем ли продолжать ввод? y/n');
   GoToXY(1,2); readln(ch);
   ClrScr;
   if (ch='n') or (ch='N') or (ch='т') or (ch='Т') then
   begin
    Ok:=False;
    Close(NewFile);
   end
   else if (ch='y') or (ch='Y') or (ch='н') or (ch='Н') then
   begin
    GoToXY(1,1); writeln('Введите фамилию студента');
    GoToXY(1,2); readln(Name);
    GoToXY(1,3); writeln('Введите его оценки');
    GoToXY(1,4); readln(Mark);
    ClrScr;
   
    GoToXY(1,4); ClearLine;
    write(NewFile,FlowStudent);
   end;
  end;
  close(StudentFile);
  erase(StudentFile);
  rename(NewFile,FileName);
end;
//Найти двойки
procedure WiewTwo;
var flag:boolean;
    FileName:string[12];
    StudentFile:file of Student;
    FlowStudent:Student;
begin
 writeln('Введите имя файла,в котором хотите найти двоечников'); readln(FileName);
 assign(StudentFile,FileName); reset(StudentFile);
 ClrScr;
 Writeln('Список двоечников:');
 with flowstudent do
 while not EOF(StudentFile) do
 begin
  flag:= False; 
  read(StudentFile,FlowStudent);
  for var i:=1 to length(Mark) do 
    if Mark[i]='2' then flag:= True;
  if (flag = True)then Writeln(Name:10,Mark:5);
 end;
  close(StudentFile);
end;
//Удалить файл
procedure DeleteStudents;
  var k:integer;
      FileName:string[12];
      StudentFile:file of Student;
  begin
    GoToXY(30,1); 
    writeln('Файл для очистки:');
    GoToXY(30,2); 
    read(FileName);
    assign(StudentFile,FileName);
    Erase(StudentFile);
  end;
end.
