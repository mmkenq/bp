Unit RealVectors;

Interface
uses crt;
const n=3;
const RADIAN = 57.29578;   // radian in degree
const DEGREE = 0.01745329; // degree in radians
Type Vector = array[1..n] of real;
procedure InputVector(var a: Vector; x,y: integer);
procedure OutputVector(a: Vector; x,y: integer);
procedure AddVector(a,b: Vector; var c: Vector);
procedure SubVector(a,b: Vector; var c: Vector);
procedure VectProd(a,b: Vector; var c: Vector);
function ScalProd(a,b: Vector): real;
function MixProd(a,b,c: Vector): real;
function getVectorsCos(a,b: Vector): real;
function LenVector(a: Vector): real;
procedure MenuRealVectors;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

procedure InputVector(var a: Vector; x,y: integer);
begin
  for var i:=1 to n do
  begin
    gotoxy(x+10*i, y);
    read(a[i]);
  end;
end;

procedure OutputVector(a: Vector; x,y: integer);
begin
  for var i:=1 to n do
  begin
    gotoxy(x+10*i, y);
    write(a[i]);
  end;
end;

procedure AddVector(a,b: Vector; var c: Vector);
begin
  for var i:=1 to n do c[i]:= a[i] + b[i];
end;

procedure SubVector(a,b: Vector; var c: Vector);
begin
  for var i:=1 to n do c[i]:= a[i] - b[i];
end;

procedure VectProd(a,b: Vector; var c: Vector);
begin
  c[1]:= a[2]*b[3] - a[3]*b[2];
  c[2]:= a[3]*b[1] - a[1]*b[3];
  c[3]:= a[1]*b[2] - a[2]*b[1];
end;

function ScalProd(a,b: Vector): real;
var s: real;
begin
    s:=0;
    for var i:=1 to n do s:= s + a[i]*b[i];
    ScalProd:=s;
end;

function MixProd(a,b,c: Vector): real;
var d: Vector;
begin
  VectProd(a,b,d);
  MixProd:= ScalProd(c,d);
end;

function getVectorsCos(a,b: Vector): real;
begin
  getVectorsCos:=(a[1]*b[1] + a[2]*b[2] + a[3]*b[3])/
        (sqrt(sqr(a[1]) + sqr(a[2]) + sqr(a[3])) *
            sqrt(sqr(b[1]) + sqr(b[2]) + sqr(b[3])));
end;

function LenVector(a: Vector): real;
begin
  LenVector:= sqrt(ScalProd(a,a));
end;

procedure MenuRealVectors;
var OK: boolean; MODE: integer;
var a,b,c: Vector;
begin
  clrscr;  
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/REAL VECTORS');
    writeln('1. Add      A+B');
    writeln('2. Sub      A-B');
    writeln('3. ScalProd A*B');
    writeln('4. VectProd AxB');
    writeln('5. MixProd (AxB)*C');
    writeln('6. find     A^B');
    writeln('7. Vector Length');
    writeln('0. Exit');
    gotoxy(1,2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        AddVector(a,b,c);
        write('Vector A + B:'); OutputVector(c, 16, 15);
        wait; clrscr;
      end;
      2: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        SubVector(a,b,c);
        write('Vector A - B:');   OutputVector(c, 16, 15);
        wait; clrscr;
      end;
      3: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        write('Vector A * B: ', ScalProd(a,b));
        wait; clrscr;
      end;
      4: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        VectProd(a,b,c);
        write('Vector A x B:');   OutputVector(c, 16, 15);
        wait; clrscr;
      end;
      5: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        write('Input Vector C:'); InputVector(c, 16, 15);
        write('A * (B x C): ', MixProd(a,b,c));
        wait; clrscr;
      end;
      6: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        write('A^B: ', arccos(getVectorsCos(a,b)), 'rad = ', arccos(getVectorsCos(a,b))*RADIAN, 'deg');
        wait; clrscr;
      end;
      7: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Length of Vector A: ', LenVector(a));
        wait; clrscr;
      end;
    else
    begin
      gotoxy(1,1); clearline; write('ERROR! Wrong Input');
      delay(3500); clearline; 
    end;  { case else }
    end; { case MODE }
  end; { while OK }
end;

End.