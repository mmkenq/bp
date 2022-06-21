uses crt;

Type Complex = record
    Re, Im: real;
    end;

const n = 2;
Type Matrix = array[1..n,1..n] of Complex;
  
procedure Mult(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;

procedure InputCMatrix(i, j: integer; var z: Complex);
  begin
    GoToXY(30,3); ClearLine(); GoToXY(30,3); write('Type Matrix[',i,'][',j,'].Re: ');
    read(z.Re);
    GoToXY(30,3); ClearLine(); GoToXY(30,3); write('Type Matrix[',i,'][',j,'].Im: ');
    read(z.Im);
  end;

procedure OutputCMatrix(i, j: integer; var z: Complex);
  begin
    GoToXY(i,j); write(z.Re, ' + ', z.Im,'i');
  end;

procedure ProdMatrix(r: real; a:Matrix; var b: Matrix);
  begin
    for var i:=1 to n do
      for var j:=1 to n do
        begin
          b[i,j].Re:= a[i,j].Re * r;
          b[i,j].Im:= a[i,j].Im * r;
        end;
  end;

var a: Matrix;
var r: real;
Begin
    GoToXY(1,4);
  writeln('Complex Matrix A:');
  for var i:=1 to n do
    for var j:=1 to n do
    begin
      InputCMatrix(i, j, a[i][j]);
      OutputCMatrix(15*j+10, i+4, a[i][j]);
    end;
  writeln;
  
  writeln('Scalar B:');
  read(r);
  writeln;
  
  ProdMatrix(r,a,a);
  
  writeln('Complex Matrix A * B:');
  for var i:=1 to n do
    for var j:=1 to n do
    begin
      OutputCMatrix(15*j+10, i+n*2+8, a[i][j]);
    end;
  writeln;
End.