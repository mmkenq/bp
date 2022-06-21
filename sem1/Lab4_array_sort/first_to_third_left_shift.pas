uses crt;
const n = 9;
var a: array [1..n] of real;
var glass: real;
var m,k: integer;

Begin
    writeln('Введите a[1..n]:');
    for k:=1 to n do
    begin
      GoToXY(40,20); read(a[k]);
      GoToXY(40,20); clearline;
      GoToXY(7*k, 2); writeln(a[k]);
    end;
      
    
    m:=trunc(n/3);
    for k:=1 to m do
    begin
      glass:=a[3*k];
      a[3*k]:=a[3*k-2];
      a[3*k-2]:=a[3*k-1];
      a[3*k-1]:=glass;
    end;
    
    gotoxy(0,3);
    writeln('2,3 сдвигаются <- , а 1 встает на 3:');
    for k:=1 to n do 
    begin
      gotoxy(7*k, 4); write(a[k]);
    end;
    
end.