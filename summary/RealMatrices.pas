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
procedure MenuRealMatrices;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

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

procedure MenuRealMatrices;
var OK: boolean; MODE: integer;
var a,b,c: Matrix;
var k: real;
begin
  clrscr;  
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/REAL MATRICES');
    writeln('1. Add      A+B');
    writeln('2. Sub      A-B');
    writeln('3. Mult     A*B');
    writeln('4. Prod     A*k');
    writeln('0. Exit');
    gotoxy(1,2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        gotoxy(1,10);
        write('Input Matrix A:'); InputMatrix(a, 16, 10);
        write('Input Matrix B:'); InputMatrix(b, 16, 14);
        AddMatrix(a,b,c);
        write('Matrix A + B:');   OutputMatrix(c, 16, 18);
        wait; clrscr;
      end;
      2: begin
        gotoxy(1,10);
        write('Input Matrix A:'); InputMatrix(a, 16, 10);
        write('Input Matrix B:'); InputMatrix(b, 16, 14);
        SubMatrix(a,b,c);
        write('Matrix A - B:');   OutputMatrix(c, 16, 18);
        wait; clrscr;
      end;
      3: begin
        gotoxy(1,10);
        write('Input Matrix A:'); InputMatrix(a, 16, 10);
        write('Input Matrix B:'); InputMatrix(b, 16, 14);
        MultMatrix(a,b,c);
        write('Matrix A * B:');   OutputMatrix(c, 16, 18);
        wait; clrscr;
      end;
      4: begin
        gotoxy(1,10);
        write('Input Matrix A:'); InputMatrix(a, 16, 10);
        write('Input k: '); readln(k);
        ProdMatrix(a,k,c);
        write('Matrix A * k:');   OutputMatrix(c, 16, 15);
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