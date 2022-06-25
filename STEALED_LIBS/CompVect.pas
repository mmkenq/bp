﻿unit CompVect;
     Interface
uses CRT, Compl;

const ncv = 5;

Type CompV = array[1..ncv] of Complex;
      
procedure AddCompVect(x,y:CompV; var z:CompV);
function ScalProdCompVect(x,y:CompV):Complex;
procedure ProdCompVect(x,y:CompV; var z:CompV);
function MixProdCompVect(x,y,z:CompV):Complex;
procedure ScalMultCompVect(a:real; x:CompV; var z:CompV);
procedure SubtCompVect(x,y:CompV; var z:CompV);
function ModulCompVect(x:CompV):real;
procedure InputCompV(x,y:integer; var z:CompV);
procedure OutputCompV(x,y:integer; z:CompV);
procedure MenuCompVect;

      Implementation

procedure AddCompVect(x,y:CompV; var z:CompV);
var i:integer;
  begin
     for i:=1 to ncv do Add(x[i],y[i],z[i]);
  end;
  
function ScalProdCompVect(x,y:CompV):Complex;
var k:integer; p,s:Complex;
  begin
     Zero(s);
     for k:=1 to ncv do
      begin
       Codj(y[k],y[k]);
       Mult(x[k],y[k],p);
       Add(s,p,s);
      end;
     ScalProdCompVect:= s;
  end;

procedure ProdCompVect(x,y:CompV; var z:CompV);
var w,s:Complex;
  begin
     Mult(x[2],y[3],s); Mult(x[3],y[2],w); Prod(-1,w,w); Add(s,w,z[1]);
     Mult(x[3],y[1],s); Mult(x[1],y[3],w); Prod(-1,w,w); Add(s,w,z[2]);
     Mult(x[1],y[2],s); Mult(x[2],y[1],w); Prod(-1,w,w); Add(s,w,z[3]);
  end;

function MixProdCompVect(x,y,z:CompV):Complex;
var w:CompV;
  begin
     ProdCompVect(y,z,w);
     MixProdCompVect := ScalProdCompVect(x,w);
  end;

procedure ScalMultCompVect(a:real; x:CompV; var z:CompV);
var i:integer;
  begin
     for i:=1 to ncv do 
       Prod(a,x[i],z[i]);
  end;

procedure SubtCompVect(x,y:CompV; var z:CompV);
var i:integer;
  begin
     for i:=1 to ncv do
      begin
       Prod(-1,y[i],y[i]);
       Add(x[i],y[i],z[i]);
      end;
  end;

function ModulCompVect(x:CompV):real;
var i:integer; s:real;
  begin
    for i:=1 to ncv do 
      s := s + (x[i].Re*x[i].Re)+(x[i].Im*x[i].Im);
    ModulCompVect:= s;
  end;

procedure InputCompV(x,y:integer; var z:CompV);
var i:integer;
  begin
     for i:=1 to ncv do
      begin  
       Input(i*x+10*i,y,z[i]);
       Output(i*x+10*i,y,z[i]);
      end;
  end;

procedure OutputCompV(x,y:integer; z:CompV);
var i:integer;
  begin
     GoToXY(x,y);
     for i:=1 to ncv do
      begin
        Output(i*x+10*i,y,z[i]);
        if (i < 3) then write(', ');
      end;
  end;

procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;

procedure MenuCompVect;
var Mode:integer; Ok:boolean; b:real; f,w:Complex; x,y,z:CompV;
begin
     Ok:=true;
     while (Ok) do
      begin
       clrscr;
       writeln(' Выберите операцию:');
       writeln('  1:Сумма комплексных векторов');
       writeln('  2:Скалярное произведение комплексных векторов');
       writeln('  3:Умножение комплексных векторов');
       writeln('  4:Произведение 3-х комплексных векторов');
       writeln('  5:Умножение скаляра на комплексный вектор');
       writeln('  6:Разность комплексных векторов');
       writeln('  7:Модуль комплексного вектора');
       writeln('  0:Выход');
       GoToXY(40,23); readln(Mode);
       GoToXY(40,23); writeln('   ');
       ClrScr;
       
      case Mode of
      1: begin
          InputCompV(10,10,x);
          InputCompV(10,15,y);
          AddCompVect(x,y,z);
          OutputCompV(10,20,z);
          Wait;
         end;
      2: begin
          InputCompV(10,10,x);
          InputCompV(10,15,y);
          f := ScalProdCompVect(x,y);
          Output(10,20,f);
          Wait;
         end;
      3: begin
          InputCompV(10,10,x);
          InputCompV(10,15,y);
          ProdCompVect(x,y,z);
          OutputCompV(10,20,z);
          Wait;
         end;
      4: begin
          InputCompV(10,10,x);
          InputCompV(10,15,y);
          InputCompV(10,20,z);
          w := MixProdCompVect(x,y,z);
          Output(10,30,w);
          Wait;
         end;
      5: begin
          GoToXY(10,10);
          readln(b);
          InputCompV(10,15,x);
          ScalMultCompVect(b,x,z);
          OutputCompV(10,20,z);
          Wait;
         end;
      6: begin
          InputCompV(10,10,x);
          InputCompV(10,15,y);
          SubtCompVect(x,y,z);
          OutputCompV(10,20,z);
          Wait;
         end;
      7: begin
          InputCompV(10,10,x);
          b := ModulCompVect(x);
          GoToXY(10,15); 
          writeln(b);
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