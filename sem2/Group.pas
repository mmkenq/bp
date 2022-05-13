Unit Group;

Interface
uses crt;
//type
  {Group stuff}
//end;

//procedure MakeGroup;
procedure Wait;
procedure MenuGroup;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

procedure MenuGroup;
var mode:integer;
    ok:boolean;
begin
 ok:=True;
 while ok do
  begin
   ClrScr;
   writeln(' Group:');
   writeln('    1: Create Group');
   writeln('    2: do smth');
   writeln('    3: do smth');
   writeln('    0: Выход');
   readln(mode);
    case mode of
     1:begin ClrScr; writeln('nothing here yet'); Wait end;
     2:begin ClrScr; writeln('nothing here yet'); Wait end;
     3:begin ClrScr; writeln('nothing here yet'); Wait end;
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