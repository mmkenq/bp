unit extask2;

Interface

uses crt;
procedure task2;
Implementation
procedure task2;
const nmax=9;
var a:array[1..nmax,1..nmax] of real;
    n,i,j:integer;
    mx:real;
begin
clrscr;
randomize;
repeat
write('Размер матрицы до ',nmax,' n=');
readln(n);
until n in [1..nmax];
writeln('Исходная матрица:');

mx:=a[1,1];
for i:=1 to n do
 begin
  for j:=1 to n do
   begin
    a[i,j]:=random*9;
    if(j>=i)and(j<=n-i+1)then
     begin
      textcolor(14);
      if a[i,j]>mx then mx:=a[i,j];
     end
    else textcolor(15);
    write(a[i,j]:5:2);
   end;
  writeln;
 end;
writeln;
write('Максимальный в выделеной области=',mx:0:2);
readln
end;
end.