﻿unit RealVect;
     Interface
uses crt;
const nv = 5;
    Type Vector = array[1..nv] of real;  
    
procedure AddVect(x,y:Vector; var z:Vector);
function ScalProd(x,y:Vector):real;
procedure VectProd(x,y:Vector; var z:Vector);
function MixProd(x,y,z:Vector):real;
procedure MultRVect(a:real; x:Vector; var z:Vector);
procedure SubtVect(x,y:Vector; var z:Vector);
function ModulVect(x:Vector):real;
procedure InputV(x,y:integer; var z:Vector);
procedure OutputV(x,y:integer; z:Vector);
procedure MenuRealVect;

      Implementation

procedure AddVect(x,y:Vector; var z:Vector);
var i:integer;
  begin
     for i:=1 to nv do z[i]:=x[i]+y[i];
  end;

function ScalProd(x,y:Vector):real;
var k:integer; s:real;
  begin
     s:=0;
     for k:=1 to nv do s:=s+x[k]*y[k];
     ScalProd := s;
  end;

procedure VectProd(x,y:Vector; var z:Vector);
  begin
     z[1]:=x[2]*y[3] - y[2]*x[3];
     z[2]:=y[1]*x[3] - x[1]*y[3];
     z[3]:=x[1]*y[2] - y[1]*x[2];
  end;

function MixProd(x,y,z:Vector):real;
var w:Vector;
  begin
     VectProd(y,z,w);
     MixProd := ScalProd(x,w);
  end;

procedure MultRVect(a:real; x:Vector; var z:Vector);
var i:integer;
  begin
     for i:=1 to nv do 
        z[i]:=a*x[i];
  end;

procedure SubtVect(x,y:Vector; var z:Vector);
var i:integer;
  begin
     for i:=1 to nv do 
        z[i]:=x[i]-y[i];
  end;

function ModulVect(x:Vector):real;
  begin
     ModulVect:= sqrt(ScalProd(x,x));
  end;

procedure InputV(x,y:integer; var z:Vector);
var i:integer;
  begin
     GoToXY(x+5,y); writeln('(');
     for i:=1 to nv do
      begin
       
       GoToXY(x+6*i,y); readln(z[i]);
       
      end;
     GoToXY(x+6*nv+1,y); writeln(')');
  end;

procedure OutputV(x,y:integer; z:Vector);
var i:integer;
  begin
     GoToXY(x,y);
     write('(');
     for i:=1 to nv do
       begin
         write(z[i]);
         if (i < nv) then write(', ');
       end;
     write(')');
  end;

procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;

procedure MenuRealVect;
     var Mode:integer; Ok:boolean; f,w:real; x,y,z:Vector;
     begin
     Ok:=true;
     while (Ok) do
      begin
       clrscr;
       writeln(' Выберите операцию:');
       writeln('  1:Сумма векторов');
       writeln('  2:Скалярное умножение векторов');
       writeln('  3:Векторное произведение');
       writeln('  4:Умножение 3-х векторов');
       writeln('  5:Умножение числа на вектор');
       writeln('  6:Разность векторов');
       writeln('  7:Модуль вектора');
       writeln('  0:Выход');
       GoToXY(40,23); readln(Mode);
       GoToXY(40,23); writeln('   ');
       ClrScr;
     
     case Mode of
     1: begin
          InputV(5,10,x);
          InputV(5,15,y);
          AddVect(x,y,z);
          OutputV(5,20,z);
          Wait;
        end;
     2: begin
          InputV(5,10,x);
          InputV(5,15,y);
          f := ScalProd(x,y);
          GoToXY(5, 20);
          writeln(f);
          Wait;
        end;
     3: begin
          InputV(5,10,x);
          InputV(5,15,y);
          VectProd(x,y,z);
          OutputV(5,20,z);
          Wait;
        end;
     4: begin
          InputV(5,10,x);
          InputV(5,15,y);
          InputV(5,20,z);
          w := MixProd(x,y,z);
          GoToXY(5, 25);
          writeln(w);
          Wait;
        end;
     5: begin
          readln(f);
          InputV(5,10,x);
          MultRVect(f,x,z);
          OutputV(5,15,z);
          Wait;
        end;
     6: begin
          InputV(5,10,x);
          InputV(5,15,y);
          SubtVect(x,y,z);
          OutputV(5,20,z);
          Wait;
        end;
     7: begin
          InputV(5,10,x);
          f := ModulVect(x);
          GoToXY(5, 15);
          writeln(f);
          Wait;
        end;
     0: Ok:=false
     else
       begin
          GoToXY(30,21);
          writeln('Ошибка! Повторите ввод...');
          Wait;
       end;
     end;
   end;
 end;
end.
