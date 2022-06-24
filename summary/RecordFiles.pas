Unit RecordFiles;

Interface
uses crt;
type student = record
  Name: string[10];
  Mark: string[3];
end;
const FILES_DIR = 'userfiles/';

procedure Wait;
procedure MakeFile;
procedure ViewFile;
procedure AddFile;
procedure ViewFive;
procedure DeleteFile;
procedure MenuRecordFiles;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

procedure MakeFile;
  var ch: char;
  Ok: boolean;
  FileName: string[12];
  StudentFile: file of student;
  FlowStudent: student;
begin
  Ok:= True;
  write('Filename: ');
  readln(FileName);
  assign(StudentFile, concat(FILES_DIR, FileName));
  rewrite(StudentFile);
    with FlowStudent do
        while Ok do
        begin
          GoToXY(30,10); write('New entry? (Y/n)');
          GoToXY(30,11); readln(ch);
          GoToXY(30,11); clearline;
          if ch = 'n' then
          begin
            Ok:= False; close(StudentFile);
          end
          else
          begin
            GoToXY(30,20); writeln('Student name:');
            GoToXY(30,21); readln(Name);
            GoToXY(30,22); writeln('Marks (ex.: "4 5" or "345")');
            GoToXY(30,23); readln(Mark);
            GoToXY(30,20); clearline;
            GoToXY(30,21); clearline;
            GoToXY(30,22); clearline;
            GoToXY(30,23); clearline;
            write(StudentFile, FlowStudent);
          end;
        end;
end;

procedure ViewFile;
var k:integer;
    FileName:string[12];
    FlowStudent:Student;
    StudentFile:file of Student;
begin
 k:=3;
 write('Filename to open: ');
 readln(FileName);
 if FileExists(concat(FILES_DIR,FileName)) then
 begin
   assign(StudentFile,concat(FILES_DIR, FileName));
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
 end
 else writeln('File does not exist!');
end;

procedure AddFile;
var ch:char;
    Ok:boolean;
    NewName,FileName:string[12];
    NewFile,StudentFile:file of Student;
    FlowStudent:Student;
begin
 Ok:=True;
 writeln('Write Filename'); readln(FileName);
 assign(StudentFile, concat(FILES_DIR,FileName)); reset(StudentFile);
 NewName:='aaaa';
 assign(NewFile, concat(FILES_DIR, NewName)); rewrite(NewFile);
 ClrScr;
 while not EOF(StudentFile) do
 begin
  read(StudentFile,FlowStudent);
  write(NewFile,FlowStudent);
 end;
 with FlowStudent do 
  While Ok do
  begin
   GoToXY(1,1); writeln('Write new entry? y/n');
   GoToXY(1,2); readln(ch);
   ClrScr;
   if (ch='n') or (ch='N') or (ch='т') or (ch='Т') then
   begin
    Ok:=False;
    Close(NewFile);
   end
   else if (ch='y') or (ch='Y') or (ch='н') or (ch='Н') then
   begin
    GoToXY(1,1); writeln('Student name:');
    GoToXY(1,2); readln(Name);
    GoToXY(1,3); writeln('Write student marks:');
    GoToXY(1,4); readln(Mark);
    ClrScr;
   
    GoToXY(1,4); ClearLine;
    write(NewFile,FlowStudent);
   end;
  end;
  close(StudentFile);
  erase(StudentFile);
  rename(NewFile,concat(FILES_DIR,FileName));
end;

procedure ViewFive;
var flag:integer;
    FileName:string[12];
    StudentFile:file of Student;
    FlowStudent:Student;
begin
 writeln('Where are our great students? (filename)'); readln(FileName);
 assign(StudentFile,concat(FILES_DIR, FileName)); reset(StudentFile);
 ClrScr;
 Writeln('A-mark students:');
 with flowstudent do
 while not EOF(StudentFile) do
 begin
  flag:= 0;
  read(StudentFile,FlowStudent);
  for var i:=1 to length(Mark) do 
    if Mark[i]='5' then flag:= flag + 1;
  if (flag = 2)then Writeln(Name:10,Mark:5);
 end;
  close(StudentFile);
end;

procedure DeleteFile;
  var k:integer;
      FileName:string[12];
      StudentFile:file of Student;
begin
    GoToXY(30,1); 
    writeln('Filename to delete:');
    GoToXY(30,2); 
    read(FileName);
    assign(StudentFile,concat(FILES_DIR, FileName));
    Erase(StudentFile);
end;

procedure MenuRecordFiles;
var mode:integer;
    ok:boolean;
begin
 ok:=True;
 while ok do
  begin
   ClrScr;
   writeln('Menu/RECORD_FILES:');
   writeln('    1: Make File');
   writeln('    2: View File');
   writeln('    3: Add to a File');
   writeln('    4: Show fives');
   writeln('    5: Delete file');
   writeln('    0: Exit');
   readln(mode);
    case mode of
     1:begin ClrScr; MakeFile; Wait end;
     2:begin ClrScr; ViewFile; Wait end;
     3:begin ClrScr; AddFile; Wait end;
     4:begin ClrScr; ViewFive; Wait end;
     5:begin ClrScr; DeleteFile; Wait end;
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