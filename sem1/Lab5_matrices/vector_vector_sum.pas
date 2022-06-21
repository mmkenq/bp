uses Crt;
const n=5;
var a,b,c:array[1..n]of real;
i:integer;
Begin
  ClrScr;
  for i:=1 to n do
  begin
    GotoXY(40,20);read(a[i]);GotoXY(40,20);write('    ');
    GotoXY(11,3+i);write (a[i]);
  end;
  GotoXY (15,3+n div 2);write('+');
  for i:=1 to n do
  begin
    GotoXY(40,20);read(b[i]);GotoXY(40,20);write('    ');
    GotoXY(19,3+i);write (b[i]);
  end;
  GotoXY(23,3+n div 2);write('=');
  for i:=1 to n do
  begin
    GotoXY(27,3+i);
    c[i]:=a[i]+b[i];
    write (c[i]);
    end;
    writeln;
end.