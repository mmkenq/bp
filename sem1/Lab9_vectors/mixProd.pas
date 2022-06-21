uses crt;

const n=3;
Type Vector = array[1..n] of real;

function ScalProd(a,b: Vector): real;
var s: real;
begin
    s:=0;
    for var i:=1 to n do s:= s + a[i]*b[i];
    ScalProd:=s;
end;

procedure VectProd(a,b: Vector; var c: Vector);
begin
  c[1]:= a[2]*b[3] - a[3]*b[2];
  c[2]:= a[3]*b[1] - a[1]*b[3];
  c[3]:= a[1]*b[2] - a[2]*b[1];
end;

function MixProd(a,b,c: Vector): real;
var d: Vector;
begin
  VectProd(a,b,d);
  MixProd:= ScalProd(c,d);
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

var a,b,c: Vector;
Begin
  write('Input Vector A:');
  InputVector(a, 17, 1);
  
  write('Input Vector B:');
  InputVector(b, 17, 2);
  
  write('Input Vector C:');
  InputVector(c, 17, 3);
  
  writeln('MixProd (A x B) * C = D:', MixProd(a,b,c));
end.