program ArithmeticMenu;
uses crt, RealNumsArithmetics, RealVectors, RealMatrices,
     ComplexNums, ComplexVectors, ComplexMatrices;
const RADIAN = 57.29578;   // radian in degree
const DEGREE = 0.01745329; // degree in radians
const N = 3;

procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
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

procedure MenuComplexVectors;
var OK: boolean; MODE: integer;
var a,b, res: VectorC; var c: Complex;
begin
  clrscr;  
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/COMPLEX VECTORS');
    writeln('1. Length of Complex Vector A');
    writeln('2. ScalProdC              A*B');
    writeln('3. VectProdC              AxB');
    writeln('4. AddVectC               A+B');
    writeln('5. SubVectC               A-B');
    writeln('0. Exit');
    gotoxy(1,2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        gotoxy(1,11); write('Input Vector A: ');
        InputVectorC(a, 1, 12); writeln;
        write('Length of Vector A: ', LenVectorC(a));
        gotoxy(1,12); clearline; writeln('Done!'); 
        wait; clrscr;
      end;
      2: begin
        gotoxy(1,11); write('Input Vector A: ');
        InputVectorC(a, 1, 12); writeln;
        gotoxy(1,12); clearline; write('Done!');
        
        gotoxy(1,17); writeln('Input Vector B: ');
        InputVectorC(b, 1, 18);
        gotoxy(1,18); clearline; write('Done!');
        
        ScalProdVectorC(a,b,c);
        gotoxy(1,23); write('Result A * B:'); OutputC(c, 15, 23);
        wait; clrscr;
      end;
      3: begin
        gotoxy(1,11); write('Input Vector A: ');
        InputVectorC(a, 1, 12); writeln;
        gotoxy(1,12); clearline; write('Done!');
        
        gotoxy(1,17); writeln('Input Vector B: ');
        InputVectorC(b, 1, 18);
        gotoxy(1,18); clearline; write('Done!');
        
        VectProdVectorC(a,b,res);
        gotoxy(1,23); write('Result Vector A x B:');
        OutputVectorC(res, 1, 24);
        wait; clrscr;
      end;
      4: begin
        gotoxy(1,11); write('Input Vector A: ');
        InputVectorC(a, 1, 12); writeln;
        gotoxy(1,12); clearline; write('Done!');
        
        gotoxy(1,17); writeln('Input Vector B: ');
        InputVectorC(b, 1, 18);
        gotoxy(1,18); clearline; write('Done!');
        
        AddVectorC(a,b,res);
        gotoxy(1,23); write('Result Vector A + B:');
        OutputVectorC(res, 1, 24);
        wait; clrscr;
      end;
      5: begin 
        gotoxy(1,11); write('Input Vector A: ');
        InputVectorC(a, 1, 12); writeln;
        gotoxy(1,12); clearline; write('Done!');
        
        gotoxy(1,17); writeln('Input Vector B: ');
        InputVectorC(b, 1, 18);
        gotoxy(1,18); clearline; write('Done!');
        
        SubVectorC(a,b,res);
        gotoxy(1,23); write('Result Vector A - B:');
        OutputVectorC(res, 1, 24);
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

procedure MenuComplexNums;
var OK: boolean; MODE: integer;
var a,b,c: Complex;
var k: real;
begin
  clrscr;  
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/COMPLEX NUMS');
    writeln('1. Add      A+B');
    writeln('2. Sub      A-B');
    writeln('3. Inv      1/A');
    writeln('4. Mult     A*B');
    writeln('5. Div      A/B');
    writeln('6. Prod     A*k');
    writeln('7. Conj     A -> `A');
    writeln('8. Cos      cos(A)');
    writeln('9. Sin      sin(A)');
    writeln('10. Modul   abs(A)');
    writeln('0. Exit');
    gotoxy(1,2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        InputC(b, 1, 16);
        gotoxy(1,18); write('Complex Num B: ');    OutputC(b, 16, 18);
        AddC(a,b,c); gotoxy(1,16); clearline; write('Done!');
        gotoxy(1,19); write('Complex Num A + B:'); OutputC(c, 21, 19);
        wait; clrscr;
      end;
      2: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        InputC(b, 1, 16);
        gotoxy(1,18); write('Complex Num B: ');    OutputC(b, 16, 18);
        SubC(a,b,c); gotoxy(1,16); clearline; write('Done!');
        gotoxy(1,19); write('Complex Num A - B:'); OutputC(c, 21, 19);
        wait; clrscr;
      end;
      3: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        gotoxy(1,16); clearline; write('Done!');   InvC(a,c); 
        gotoxy(1,18); write('Complex Num 1/A:');   OutputC(c, 18, 18);
        wait; clrscr;
      end;
      4: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        InputC(b, 1, 16);
        gotoxy(1,18); write('Complex Num B: ');    OutputC(b, 16, 18);
        MultC(a,b,c); gotoxy(1,16); clearline; write('Done!');
        gotoxy(1,19); write('Complex Num A * B:'); OutputC(c, 21, 19);
        wait; clrscr;
      end;
      5: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        InputC(b, 1, 16);
        gotoxy(1,18); write('Complex Num B: ');    OutputC(b, 16, 18);
        DivC(a,b,c); gotoxy(1,16); clearline; write('Done!');
        gotoxy(1,19); write('Complex Num A * B:'); OutputC(c, 21, 19);
        wait; clrscr;
      end;
      6: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        gotoxy(1,16); clearline; write('Real Num k: '); read(k);
        ProdC(k, a, c);
        gotoxy(1,18); write('Complex Num A = A*k: '); OutputC(c, 17, 18);
        wait; clrscr;
      end;
      7: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        gotoxy(1,16); clearline; write('Done!');   ConjC(a,c); 
        gotoxy(1,18); write('Complex Num `A: ');   OutputC(c, 17, 18);
        wait; clrscr;
      end;
      8: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        gotoxy(1,16); clearline; write('Done!');   CosC(a,c); 
        gotoxy(1,18); write('Cos(A): ');   OutputC(c, 10, 18);
        wait; clrscr;
      end;
      9: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        gotoxy(1,16); clearline; write('Done!');   SinC(a,c); 
        gotoxy(1,18); write('Sin(A): ');   OutputC(c, 10, 18);
        wait; clrscr;
      end;
      10: begin
        InputC(a, 1, 16); write('Complex Num A:'); OutputC(a, 16, 17);
        gotoxy(1,16); clearline; write('Done!');
        gotoxy(1,18); write('Abs(A): ', ModulC(a));
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


procedure MenuRealVectors;
var OK: boolean; MODE: integer;
var a,b,c: Vector;
begin
  clrscr;  
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/REAL VECTORS');
    writeln('1. Add      A+B');
    writeln('2. Sub      A-B');
    writeln('3. ScalProd A*B');
    writeln('4. VectProd AxB');
    writeln('5. MixProd (AxB)*C');
    writeln('6. find     A^B');
    writeln('7. Vector Length');
    writeln('0. Exit');
    gotoxy(1,2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        AddVector(a,b,c);
        write('Vector A + B:'); OutputVector(c, 16, 15);
        wait; clrscr;
      end;
      2: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        SubVector(a,b,c);
        write('Vector A - B:');   OutputVector(c, 16, 15);
        wait; clrscr;
      end;
      3: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        write('Vector A * B: ', ScalProd(a,b));
        wait; clrscr;
      end;
      4: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        VectProd(a,b,c);
        write('Vector A x B:');   OutputVector(c, 16, 15);
        wait; clrscr;
      end;
      5: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        write('Input Vector C:'); InputVector(c, 16, 15);
        write('A * (B x C): ', MixProd(a,b,c));
        wait; clrscr;
      end;
      6: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Input Vector B:'); InputVector(b, 16, 14);
        write('A^B: ', arccos(getVectorsCos(a,b)), 'rad = ', arccos(getVectorsCos(a,b))*RADIAN, 'deg');
        wait; clrscr;
      end;
      7: begin
        gotoxy(1, 13);
        write('Input Vector A:'); InputVector(a, 16, 13);
        write('Length of Vector A: ', LenVector(a));
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

procedure MenuRealNumsArithmetics;
var OK: boolean; MODE: integer;
var x: real; // cos, sin
begin
  clrscr;
  OK:= true;
  while OK do
  begin
    gotoxy(1, 3);
    writeln('Menu/REAL ARITHMETICS');
    writeln('1. cos(x)');
    writeln('2. sin(x)');
    writeln('0. Exit');
    gotoxy(1, 2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: begin
        gotoxy(1,2); clearline;
        write('Input x (in degrees): '); read(x);
        gotoxy(1,2); clearline;
        write('cos(',x,') = ', RealCos(x));
        Wait;
      end;
      2: begin
        gotoxy(1,2); clearline;
        write('Input x (in degrees): '); read(x);
        gotoxy(1,2); clearline;
        write('sin(',x,') = ', RealSin(x));
        Wait;
      end
    else
      begin
        gotoxy(1,1); clearline; write('ERROR! Wrong Input');
        delay(3500); clearline; 
      end;  { else }
    end; { case MODE }
   end; { while OK }
end;

procedure Menu;
var OK: boolean; MODE: integer;
begin
  OK:= true;
  while OK do
  begin
    clrscr;
    gotoxy(1, 3); clearline; writeln('MENU');
    writeln('1. Real Nums (cos, sin)');
    writeln('2. Real Vectors');
    writeln('3. Real Matrices');
    writeln('4. Complex Nums');
    writeln('5. Complex Vectors');
    writeln('6. Complex Matrices');
    writeln('0. Exit');
    gotoxy(1, 2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: MenuRealNumsArithmetics;
      2: MenuRealVectors;
      3: MenuRealMatrices;
      4: MenuComplexNums;
      5: MenuComplexVectors;
      6: MenuComplexMatrices;
    else
    begin
      gotoxy(1,1); clearline; write('ERROR! Wrong Input');
      delay(3500); clearline; 
    end;  { else }
    end; { case MODE }
  end; { while OK }
end; { Menu }


Begin
  Menu;
end.