uses crt;

Type Complex = record
    Re, Im: real;
    end;
    
const n = 2;
Type Matrix = array[1..n,1..n] of Complex;

procedure Zero(var u: Complex);
  begin
    u.Re:=0; u.Im:=0;
  end;

procedure Add(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
  end;
  
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
  
procedure MultMatrix(a,b: Matrix; var c: Matrix);
  var P,S: Complex;
  begin
    for var i:=1 to n do
      for var j:=1 to n do
      begin
        Zero(S);
        for var k:=1 to n do
        begin
          Mult(a[i,k], b[k,j], P);
          Add(S,P,S);
        end;
        c[i,j]:=S;
      end;
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
  
  MultMatrix(a,b,c);
  writeln('Complex Matrix A * B:');
  for var i:=1 to n do
    for var j:=1 to n do
    begin
      OutputCMatrix(15*j+10, i+n*2+8, c[i][j]);
    end;
  writeln;
End.