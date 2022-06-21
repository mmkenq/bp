uses crt;

const n=3;
Type Vector = array[1..n] of real;

procedure AddVector(a,b: Vector; var c: Vector);
begin
  for var i:=1 to n do c[i]:= a[i] + b[i];
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
  
  AddVector(a,b,c);
  write('Vector A+B = C:');
  OutputVector(c,17,3);
end.