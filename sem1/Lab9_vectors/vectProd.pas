uses crt;

const n=3;
Type Vector = array[1..n] of real;

procedure VectProd(a,b: Vector; var c: Vector);
begin
  c[1]:= a[2]*b[3] - a[3]*b[2];
  c[2]:= a[3]*b[1] - a[1]*b[3];
  c[3]:= a[1]*b[2] - a[2]*b[1];
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
  
  VectProd(a,b,c);
  write('Vector A x B = C:');
  OutputVector(c,17,3);
  writeln;
end.