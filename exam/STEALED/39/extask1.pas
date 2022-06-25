unit extask1;

interface

uses crt,extask2, Compl;

procedure Res(f: complex);
procedure task1;
procedure Wait;
procedure MenuExPrograms;
implementation

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

const
  nmax = 20;

procedure Res(f: complex);
begin
  if f.Im < 0 then write(f.Re:5:1, ' -', -f.Im:0:1, '*i  ')
  else write(f.Re:5:1, ' +', f.Im:0:1, '*i  ');
end;

procedure task1;
var
  a: array[1..nmax] of complex;
  n, k: integer;
  sum: complex;
begin
  repeat
    write('Размер вектора от 2 до ', nmax, ' n=');
    readln(n);
  until n in [2..nmax];
  writeln('Вектор комплексных чисел:');
  for k := 1 to n do
  begin
    a[k].Re := k * sin(k + 1) * sin(k + 1);
    a[k].Im := cos(k * k + 2);
    Res(a[k]);
  end;
  writeln;
  sum.Re := 0;
  sum.Im := 0;
  for k := 1 to n do Add(sum,a[k],sum);
{  begin
    sum.Re := sum.Re + a[k].Re;
    sum.Im := sum.Im + a[k].Im;
  end;}
  sum.Re := sum.Re / n;
  sum.Im := sum.Im / n;
  writeln('Среднее арифметическое =', sum.Re:0:2, sum.Im:0:2,'*i');
end;

procedure MenuExPrograms;
var
  Mode: integer;
  Ok: boolean;
begin
  Ok := True;
  while Ok do
  begin
    ClrScr;
    writeln('УКАЖИТЕ РЕЖИМ');
    writeln('  1.Task 1');
    writeln('  2.Task 2');
    writeln('  0.Выход из программы');
    Readln(Mode);
    GoToXY(40, 23); 
    Clearline;
    
    case Mode of
      1:
        begin
          task1;
          Wait;
        end;
       2:
        begin
          task2;
          Wait;
        end;
      0: Ok := False;
    end;
  end
end;
end.