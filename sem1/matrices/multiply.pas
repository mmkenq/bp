uses crt;

const s = 2; // strings
const c = 2; // columns
var i,j,k:integer;

var a,b,v: array[1..s,1..c] of real;

Begin
  writeln('Программа для умножения матриц');
  GotoXY(9,3);
  writeln('Введите a:');
  for i:=1 to s do
    for j:=1 to c do
      begin
        GoToXY(40,20);
        read(a[i,j]);
        GoToXY(40,20); write('                             ');
        GoToXY(11+10*j,3+i); writeln(a[i,j]);   
        if (i=s) and (j=c) then GoToXY(9,6+i);
      end;
      
  writeln('Введите b:');
  GoToXY(40,20);
  for i:=1 to s do
    for j:=1 to c do
      begin
        GoToXY(40,20);
        read(b[i,j]);
        GoToXY(40,20); write('                             ');
        GoToXY(11+10*j,9+i); writeln(b[i,j]);
        if (i=s) and (j=c) then GoToXY(9,12+i);
      end;
      
      
  writeln('Умножение a*b=');
    for i:=1 to s do
    for j:=1 to c do
      begin
        for k:=1 to s do
          begin
            v[i,j] := a[i,k] * b[k,j];
          end;
        GoToXY(10*j+11,15+i); writeln(v[i,j]);
      end;
  
End.