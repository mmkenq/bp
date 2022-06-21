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
procedure MenuComplexMatrices;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

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

procedure MenuComplexMatrices;
var OK: boolean; MODE: integer;
var a,b,c: MatrixC; var k: real;
begin
  clrscr;  
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/COMPLEX MATRICES');
    writeln('1. Add  A+B');
    writeln('2. Sub  A-B');
    writeln('3. Mult A*B');
    writeln('4. Prod A*k');
    writeln('5. Norm ||A||');
    writeln('0. Exit');
    gotoxy(1,2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        gotoxy(1,11); write('Input Complex Matrix A:');
        InputMatrixC(a, 1, 12); gotoxy(1,12); clearline; write('Done!');
        OutputMatrixC(a, 1, 12);
        gotoxy(1,13+N); write('Input Complex Matrix B:');
        InputMatrixC(b, 1, 14+N); gotoxy(1,14+N); clearline; write('Done!');
        OutputMatrixC(b, 1, 14+N);
        AddMatrixC(a,b,c);
        writeln; write('Complex Matrix A + B:');
        OutputMatrixC(c, 1, 15+2*N);
        wait; clrscr;
      end;
      2: begin
        gotoxy(1,11); write('Input Complex Matrix A:');
        InputMatrixC(a, 1, 12); gotoxy(1,12); clearline; write('Done!');
        OutputMatrixC(a, 1, 12);
        gotoxy(1,13+N); write('Input Complex Matrix B:');
        InputMatrixC(b, 1, 14+N); gotoxy(1,14+N); clearline; write('Done!');
        OutputMatrixC(b, 1, 14+N);
        SubMatrixC(a,b,c);
        writeln; write('Complex Matrix A - B:');
        OutputMatrixC(c, 1, 15+2*N);
        wait; clrscr;
      end;
      3: begin
        gotoxy(1,11); write('Input Complex Matrix A:');
        InputMatrixC(a, 1, 12); gotoxy(1,12); clearline; write('Done!');
        OutputMatrixC(a, 1, 12);
        gotoxy(1,13+N); write('Input Complex Matrix B:');
        InputMatrixC(b, 1, 14+N); gotoxy(1,14+N); clearline; write('Done!');
        OutputMatrixC(b, 1, 14+N);
        MultMatrixC(a,b,c);
        writeln; write('Complex Matrix A * B:');
        OutputMatrixC(c, 1, 15+2*N);
        wait; clrscr;
      end;
      4: begin
        gotoxy(1,11); write('Input Complex Matrix A:');
        InputMatrixC(a, 1, 12); gotoxy(1,12); clearline; write('Done!');
        OutputMatrixC(a, 1, 12);
        gotoxy(1,14+N); write('Input k: '); read(k);
        ProdMatrixC(k,a,c);
        writeln; write('Complex Matrix A * k:');
        OutputMatrixC(c, 1, 13+2*N);
        wait; clrscr;
      end;
      5: begin
        gotoxy(1,11); write('Input Complex Matrix A:');
        InputMatrixC(a, 1, 12); gotoxy(1,12); clearline; write('Done!');
        OutputMatrixC(a, 1, 12);
        gotoxy(1,14+N); write('Norm ||A||: ', NormMatrixC(a));
        wait; clrscr;
      end;
    else
    begin
      gotoxy(1,1); clearline; write('ERROR! Wrong Input');
      delay(3500); clearline; 
    end;  { case else }
    end; { case MODE }
  end; { while OK }
end;

End.