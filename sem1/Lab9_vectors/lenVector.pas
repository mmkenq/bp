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

function LenVector(a: Vector): real;
begin
  LenVector:= sqrt(ScalProd(a,a));
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

var a:Vector;
Begin
  write('Input Vector A:');
  InputVector(a, 16, 1);
  writeln;
  writeln('Length of Vector A: ', LenVector(a));
end.