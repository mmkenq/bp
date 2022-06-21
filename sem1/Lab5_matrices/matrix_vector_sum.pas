uses crt;

const s = 2; // strings
const c = 2; // columns
var i,j:integer;

var a: array[1..s,1..c] of real;
var b, v: array[1..s] of real;

Begin
  writeln('Программа для произведения матрицы на вектор');
  GotoXY(9,3);
  writeln('Введите матрицу a:');
  for i:=1 to s do
    for j:=1 to c do
      begin
        GoToXY(40,20);
        read(a[i,j]);
        GoToXY(40,20); write('                             ');
        GoToXY(11+10*j,3+i); writeln(a[i,j]);   
        if (i=s) and (j=c) then GoToXY(9,6+i);
      end;
      
  writeln('Введите вектор b:');
  GoToXY(40,20);
  for i:=1 to s do
      begin
        GoToXY(40,20);
        read(b[i]);
        GoToXY(40,20); write('                             ');
        GoToXY(11+10*j,9+i); writeln(b[i]);
        if (i=s) then GoToXY(9,12+i);
      end;
      
      
  writeln('Произведение матрицы a и вектора b =');
    for i:=1 to s do
      for j:=1 to c do
        begin
          v[i] := v[i]+ a[i,j] * b[j];
          GoToXY(10*i+11,15+i); writeln(v[i]);
        end;
  
End.