Unit RealMatrices;

Interface
uses crt;
const n=3;
Type Matrix = array[1..n,1..n] of Real;
procedure InputMatrix(var a: Matrix; x,y: integer);
procedure OutputMatrix(a: Matrix; x,y: integer);
procedure AddMatrix(a,b: Matrix; var c: Matrix);
procedure SubMatrix(a,b: Matrix; var c: Matrix);
procedure MultMatrix(a,b: Matrix; var c: Matrix);
procedure ProdMatrix(a: Matrix; k: real; var c: Matrix);

Implementation
procedure InputMatrix(var a: Matrix; x,y: integer);
  begin
    for var i:=1 to n do
      for var j:=1 to n do
      begin
        gotoxy(x+10*j-1, y+i-1);
        read(a[i][j]);
      end;
  end;

procedure OutputMatrix(a: Matrix; x,y: integer);
  begin
    for var i:=1 to n do
      for var j:=1 to n do
      begin
        gotoxy(x+10*j-1, y+i-1);
        write(a[i][j]);
      end;
  end;

procedure AddMatrix(a,b: Matrix; var c: Matrix);
begin
  for var i:=1 to n do
    for var j:=1 to n do c[i,j] := a[i,j] + b[i,j];
end;

procedure SubMatrix(a,b: Matrix; var c: Matrix);
begin
  for var i:=1 to n do
    for var j:=1 to n do c[i,j] := a[i,j] - b[i,j];
end;

procedure MultMatrix(a,b: Matrix; var c: Matrix);
begin
  for var i:=1 to n do
    for var j:=1 to n do
       for var k:=1 to n do c[i,j] := c[i,j] + a[i,k] * b[k,j];
end;

procedure ProdMatrix(a: Matrix; k: real; var c: Matrix);
begin
  for var i:=1 to n do
    for var j:=1 to n do c[i,j] := a[i,j] * k;
end;

End.