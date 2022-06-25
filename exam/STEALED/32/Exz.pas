Unit Exz;
        Interface
Uses crt;
type Ptr=^Stac;
     Stac = record
        Inf: integer;
        Next: Ptr
     end;
     
procedure Matr();
procedure Vetr();
procedure ViewStack(Top: Ptr);
procedure MenuExz;

Implementation
var val:integer;
    Kon: Ptr;
    
Procedure Wait;
  begin
    repeat until Keypressed;
    while Keypressed do readKey;
  end;
   
Procedure MenuExz;
  Var ok:boolean; mode:integer; x,y:byte;
  Begin
    ok:=True;
    while ok do
    begin
      Clrscr;
      writeln(' 1: задача №1');
      writeln(' 2: задача №2');    
      writeln;
      writeln(' 0: Выход');
      writeln;
      writeln('Выберите пункт: ');
      gotoxy(17,6);
      readln(mode);
        case mode of
        1:begin
            Clrscr; 
             Matr(); 
            Wait
        end;
         2:begin
            Clrscr; 
             Vetr(); 
            Wait
        end;
       
        0:ok:=False;
        else
        begin
          GoToXY(30,21);
          writeln('Ошибка!Повторите Ввод');
          Wait
        end
      end
    end
  end;
    
procedure ViewStack(Top: Ptr);  // Просмотр
begin
  Kon := Top;
  while Kon <> Nil do
  begin
    writeln(Kon^.Inf,' ');
    Kon := Kon^.Next
  end;
end;
    




procedure Matr();
type complex=record
     re,im:real;
end;
             
{процедура вывода комплексного числа}
procedure Vivod(var f:complex);
begin
write(f.re:5:2);
if f.im<0 then write(f.im:0:2,'i ')
else write('+',f.im:0:2,'i ');
end;

{функция модуля}
function Modul(f:complex):real;
begin
Modul:=sqrt(sqr(f.re)+sqr(f.im))
end;


const n = 3;
var  a:array[1..n,1..n] of complex;
     k,m:byte;
     max:real;
     x:complex;     
begin 
writeln;
writeln('Заполнить комплекснозначную матрицу a[1..n,1..n] числами akm = cos(3k^2+m)-i*sin^2(k+2m) и найти максимальное значение из модулей чисел akm.'); 
writeln;
writeln('Матрица комплексных чисел:');
writeln;
for k:=1 to n do
begin
 for m:=1 to n do begin
   a[k,m].re:=cos(3*k*k+m);
   a[k,m].im:=-sqr(sin(k+2*m));
   Vivod(a[k,m]);
  end;
writeln;
end;

{ищем максимальный модуль}
max:=Modul(a[1,1]);
x:=a[1,1];
for k:=1 to n do
for m:=1 to n do
 if Modul(a[k,m]) > max then
 begin
  max:=Modul(a[k,m]);
  x:=a[k,m];
 end;
 writeln;
write('Максимальный модуль: ',max,' у числа ');
Vivod(x);
end;





procedure Vetr();
const n=10;
var a:array[1..n] of real;
    i:byte;
    min1,min2:real;
begin
  writeln;
  writeln('C помощью датчика случайных чисел заполнить вещественный вектор a[1..n].  Найти "второй" минимальный элемент вектора');
  writeln('т.е. элемент, который больше самого маленького элемента вектора, но меньше всех остальных. ');
  writeln;
  writeln('Исходный массив:');
  writeln;

for i:=1 to n do 
 a[i] := random(10);
 for i := 1 to n do
  begin
   write(a[i]:5);
  end;

if a[1]<a[2] then
 begin
  min1:=a[1];
  min2:=a[2];
 end
else
  
 begin
  min1:=a[2];
  min2:=a[1];
 end;
for i:=3 to n do
if a[i]<min1 then
 begin
  min2:=min1;
  min1:=a[i];
 end
else if a[i]<min2 then min2:=a[i];
writeln;
writeln;
writeln('Второй минимальный элемент=',min2);
end;
end.
