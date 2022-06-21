Unit RealVectors;

Interface
uses crt;
const n=3;
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

Implementation
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

End.