uses crt;

const n=3;
Type Vector = array[1..n] of real;

procedure getVectorsCorner(a,b: Vector; var u: real);
begin
  u:=(a[1]*b[1] + a[2]*b[2] + a[3]*b[3])/
        (sqrt(sqr(a[1]) + sqr(a[2]) + sqr(a[3])) *
            sqrt(sqr(b[1]) + sqr(b[2]) + sqr(b[3])));
  u:=arccos(u);
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

var a,b: Vector;
var c: real;
const rad = 57.2958;
Begin
  write('Input Vector A:');
  InputVector(a, 17, 1);
  
  write('Input Vector B:');
  InputVector(b, 17, 2);
  
  getVectorsCorner(a,b, c);
  writeln;
  writeln('A^B: ', c * 57,2958);
end.