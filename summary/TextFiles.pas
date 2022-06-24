Unit TextFiles;

Interface
uses crt;
const FILES_DIR = 'userfiles/';
const DEFAULT_EXT = '.txt';

procedure MenuTextFiles;
procedure MakeAndAddText;
procedure ViewText;
procedure BadBoys(n:integer);
procedure DeleteText;
procedure Wait;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

var ch:char; 
    ok:boolean; 
    TextName:string[12];
    Name:string[10]; 
    Mark:string[3]; 
    StudentText:Text;
    
//создать или добавить текстовый файл
procedure MakeAndAddText;
var ch:char;
    Ok:boolean;
    TextName:string[12];
    Name:string[10];
    Mark:string[4];
    StudentText: Text;
begin
 writeln('Write filename:');
 readln(TextName);
 GoToXY(1,2); ClearLine;
 assign(StudentText,concat(FILES_DIR, TextName, DEFAULT_EXT));
 {$I-}
  append(StudentText);
 {$I+}
 if not FileExists(concat(FILES_DIR, TextName, DEFAULT_EXT)) then rewrite(StudentText);
 Ok:=true;
 while Ok do
 begin
  GoToXY(1,1); writeln('Create new entry? y/n');
  GoToXY(1,2); readln(ch);
  ClrScr;
  if (ch='n') or (ch='N') or (ch='т') or (ch='Т') then
  begin
   Ok:=False;
   close(StudentText);
  end
  else 
  begin
   GoToXY(1,1); writeln('Write student name');
   GoToXY(1,2); readln(Name);
   GoToXY(1,3); writeln('Write student marks (ex.: "4 5" or "345")');
   GoToXY(1,4); readln(Mark);
   ClrScr;
//   GoToXY(1,4); ClearLine;
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
 writeln('Write filename:');
 readln(TextName);
 ClrScr;
 assign(StudentText,concat(FILES_DIR, TextName, DEFAULT_EXT));
 if not FileExists(concat(FILES_DIR, TextName, DEFAULT_EXT)) then
  begin 
   writeln('File ',TextName,' was not found!');
   exit;
  end;
 reset(StudentText); 
 if FileExists(concat(FILES_DIR, TextName, DEFAULT_EXT)) then 
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
 writeln('Where are our badboys? (write filename)');
 readln(TextName);
 ClrScr;
 assign(StudentText,concat(FILES_DIR, TextName, DEFAULT_EXT)); 
 if not FileExists(concat(FILES_DIR, TextName, DEFAULT_EXT)) then
  begin 
   writeln('File ',TextName,' was not found!');
   Wait;
   exit;
  end;
 NewName:='aaaa';
 assign(NewText,NewName); rewrite(NewText);
 reset(StudentText);
 
 if (n=1) then
   writeln('BadBoys Math(1):')
   else if (n=2)then
     writeln('BadBoys Algebra(2):')
     else if (n=3)then
       writeln('BadBoys Programming(3):');
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
    writeln('Write filename:');
    GoToXY(30,2); 
    read(TextName);
    assign(StudentText,concat(FILES_DIR, TextName, DEFAULT_EXT));
    Erase(StudentText);
  end;
  
//меню
procedure MenuTextFiles;
 var Mode:integer;
     Ok:boolean;
begin
 Ok:=True;
 while Ok do
  begin
   ClrScr;
   writeln('Menu/TEXT_FILES');
   writeln('  1: Create File (or Add to a File)');
   writeln('  2: View File');
   writeln('  3: BadBoys (1)');
   writeln('  4: BadBoys (2)');
   writeln('  5: BadBoys (3)');
   writeln('  6: Delete File');
   writeln('  0: Exit');
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
     6:begin Clrscr;  DeleteText; GoToXY(30,3); write('Deleted!');  Wait
       end;
     0: Ok:=false;
     else
     begin
        writeln('Error! Try again');
      Wait; 
     end;
    end; 
  end;
end;

end.