Unit ComplexMatrices;

Interface
uses crt, ComplexNums;
const n = 3;
Type MatrixC = array [1..n,1..n] of Complex;
procedure InputMatrixC(var z: MatrixC; x,y: integer);
procedure OutputMatrixC(z: MatrixC; x,y: integer);
//procedure ZeroMatrixC(var a: MatrixC);
//procedure OneMatrixC(var a: MatrixC);
procedure AddMatrixC(a,b: MatrixC; var c: MatrixC);
procedure SubMatrixC(a,b: MatrixC; var c: MatrixC);
procedure MultMatrixC(a,b: MatrixC; var c: MatrixC);
procedure ProdMatrixC(p: real; a: MatrixC; var b: MatrixC);
function NormMatrixC(a: MatrixC): real;

Implementation
procedure InputMatrixC(var z: MatrixC; x,y: integer);
  begin
    for var i:=1 to n do
      for var j:=1 to n do
      begin
        gotoxy(x,y); clearline; write('Type A[',i,'][',j,'].Re: ');
        read(z[i][j].Re);
        gotoxy(x,y); clearline; write('Type A[',i,'][',j,'].Im: '); 
        read(z[i][j].Im);
      end;
  end;

procedure OutputMatrixC(z: MatrixC; x,y: integer);
  begin
    for var i:=1 to n do
      for var j:=1 to n do
      begin
        GoToXY(x+10*j-10,y+i); write(z[i][j].Re, ' + ', z[i][j].Im,'i');
      end;
  end;

procedure AddMatrixC(a,b: MatrixC; var c: MatrixC);
begin
  for var i:= 1 to n do
    for var j:= 1 to n do
      AddC(a[i,j], b[i,j], c[i,j])
end;

procedure SubMatrixC(a,b: MatrixC; var c: MatrixC);
begin
  for var i:= 1 to n do
    for var j:= 1 to n do
      SubC(a[i,j], b[i,j], c[i,j])
end;

procedure MultMatrixC(a,b: MatrixC; Var c: MatrixC);
var p, s: Complex;
begin
  for var i:= 1 to n do
    for var j:= 1 to n do
      begin
      ZeroC(s);
      for var k:= 1 to n do
        begin
          MultC(a[i,k], b[k,j], p);
          AddC(s, p, s)
        end;
        c[i,j]:= s;
      end;
end;

procedure ProdMatrixC(p: real; a: MatrixC; var b: MatrixC);
begin
  for var i:= 1 to n do
    for var j:= 1 to n do
      ProdC(p, a[i,j], b[i,j])
end;
  
function NormMatrixC(a: MatrixC): real;
var z, s: real;
begin
  z:= 0;
  for var i:= 1 to n do
    begin
      s:= 0;
      for var j:= 1 to n do s:= s + ModulC(a[i,j]);
      if s > z then z:= s;
    end;
  NormMatrixC:= z;
end;

End.