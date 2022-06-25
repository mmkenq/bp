unit Exam;
interface
uses Compl, crt;

procedure Exam1;
procedure Exam2;
procedure Wait; 
procedure MenuExam;
  
implementation

procedure Wait;
begin
  writeln('Для выхода назад нажмите на любую клавишу..');
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure Exam1;
var 
  z, w, p, z2 : complex;
  k, x, y : integer;
  e : real;

Begin
  GOTOXY(75, 1);
 write('Введите комплексное число z:');
 Input(x, y, z);
 ClrScr;
 writeln('Введите точность e:');
 Readln(e);
 mult(z, z, z2); // Посчитаем z^2, чтобы каждый раз заново не считать
 prod(1/2, z2, p); // Нашли изначальное число, от которого будем отталкиваться
 w := p;
 k := 2;
 while Modul(p)>=e do
 begin
   prod((2*k-1)/(k+1)/(2*k-3), p, p); 
   mult(z2, p, p);
   add(w, p, w);
   k:=k+1;
 end;
 writeln('Ответ:');
 Output(x, y, w);
End;


procedure Exam2;
const
  n = 5;
type
  vect = array[1..n] of real;
var 
  a: vect;
  sum,srAr: real;
  ak : complex;
  k, i : integer;
  Begin
  for k:=1 to n do
  begin
    ak.Re := k*cos(3*k+1)*cos(3*k+1); //Считаем вещественную часть
    ak.Im := -sin(k*k+2*k); // Считаем мнимую
    a[k] := Modul(ak); // Заполняем вектор модулями 
    sum :=sum+a[k]; // Считаем сумму, чтобы потом найти среднее арифметическое
  end;
 
  srAr := sum/n;
  
  writeln('Вектор:');
  for k:=1 to n do
    write(a[k]:7:3);
  writeln;
  writeln('Среднее арифметическое чисел |Ak|:');
  writeln(srAr:0:3);
  End;
  
  
  procedure MenuExam;
  var 
    Mode:integer;
    begin
  ClrScr;
  GoTOXY(10, 5);
  Writeln('Выберите задание:');
  GoTOXY(5, 7);
  Writeln('1. Сумма');
  GoTOXY(5, 9);
  Writeln('2. Вещественный вектор');
  GoTOXY(5, 13);
  Writeln('0. Назад');
  GoTOXY(5, 15);
  readln(Mode);
    case Mode of
    1: 
      begin
        ClrScr;
        Exam1;
        Wait;
      end;
    2: 
      begin
        ClrScr;
        Exam2;
        Wait;
      end;
      end;
      end;
      
  End.
  