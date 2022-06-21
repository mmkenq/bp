uses crt;

Type Complex = record
    Re, Im: real;
    end;
    
const n = 2;
Type Matrix = array[1..n,1..n] of Complex;

function Modul(z:Complex): real;
  begin
    Modul:= sqrt(sqr(z.Re)+sqr(z.Im)); 
  end;

function NormMatrix(a:Matrix):real;
  var z,s:real;
  begin
    z:=0;
    for var i:=1 to n do
    begin
      s:=0;
      for var j:=1 to n do s:= s+Modul(a[i,j]);
      if s>z then z:=s;
    end;
    NormMatrix:= z;
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

var a:Matrix;
Begin
  GoToXY(1,4);
  writeln('Complex Matrix A :');
  for var i:=1 to n do
    for var j:=1 to n do
    begin
      InputCMatrix(i, j, a[i][j]);
      OutputCMatrix(15*j+10, i+4, a[i][j]);
    end;
  writeln;
  
  writeln('NormMatrix ||A|| : ', NormMatrix(a));
  writeln;
  
End.