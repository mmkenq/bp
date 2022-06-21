uses crt;

Type Complex = record
    Re, Im: real;
    end;
    
procedure Add(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
  end;

procedure InputCMatrix(i: integer; var z: Complex);
  begin
    GoToXY(30,3); ClearLine(); GoToXY(30,3); write('Type Vector[',i,'].Re: ');
    read(z.Re);
    GoToXY(30,3); ClearLine(); GoToXY(30,3); write('Type Matrix[',i,'].Im: ');
    read(z.Im);
  end;

procedure OutputCMatrix(i, j: integer; var z: Complex);
  begin
    GoToXY(i,j); write(z.Re, ' + ', z.Im,'i');
  end;
  
const n = 2;
Type Matrix = array[1..n,1..n] of Complex;

procedure AddMatrix(a,b: Matrix; var c: Matrix);
  begin
    for var i:=1 to n do
      for var j:=1 to n do
        Add(a[i,j], b[i,j], c[i,j]);
  end;
  
var a,b,c: Matrix;
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
  
  writeln('Complex Matrix B:');
  for var i:=1 to n do
    for var j:=1 to n do
    begin
      InputCMatrix(i, j, b[i][j]);
      OutputCMatrix(15*j+10, i+8, b[i][j]);
    end;
  writeln;
  
  AddMatrix(a,b,c);
  writeln('Complex Matrix A + B:');
  for var i:=1 to n do
    for var j:=1 to n do
    begin
      OutputCMatrix(15*j+10, i+n*2+8, c[i][j]);
    end;
  writeln;
End.