Unit ComplexVectors;

Interface
uses crt, ComplexNums;
const n = 3;
Type VectorC = array[1..n] of Complex;
procedure InputVectorC(var a: VectorC; x,y: integer);
procedure OutputVectorC(a: VectorC; x,y: integer);
procedure AddVectorC(a, b: VectorC; var c: VectorC);
procedure SubVectorC(a, b: VectorC; var c: VectorC);
procedure ScalProdVectorC(a,b: VectorC; var c: Complex);
procedure VectProdVectorC(a,b: VectorC; var c: VectorC);
function LenVectorC(a: VectorC): real;
procedure MenuComplexVectors;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

procedure InputVectorC(var a: VectorC; x,y: integer);
begin
  for var i:=1 to n do
  begin
    InputC(a[i],x,y); OutputC(a[i], x, y+i);
  end;
end;

procedure OutputVectorC(a: VectorC; x,y: integer);
begin
  for var i:=1 to n do
  begin
     OutputC(a[i], x, y+i-1);
  end;
end;

procedure AddVectorC(a, b: VectorC; var c: VectorC);
begin
  for var i:= 1 to n do AddC(a[i], b[i], c[i]);
end;
        
procedure SubVectorC(a, b: VectorC; var c: VectorC);
begin
  for var i:= 1 to n do SubC(a[i], b[i], c[i]);
end;

procedure ScalProdVectorC(a,b: VectorC; var c: Complex);
var z,w:Complex;
begin
  ZeroC(c);
  for var i:=1 to n do
  begin
    ConjC(b[i],z);
    MultC(a[i],z,w);
    AddC(c,w,c);
  end;
end;

procedure VectProdVectorC(a,b: VectorC; var c: VectorC);
var p,t: Complex;
  begin
    MultC(a[2],b[3], p);
    MultC(a[3],b[2], t);
    SubC(p,t, c[1]);
    
    MultC(a[3],b[1], p);
    MultC(a[1],b[3], t);
    SubC(p,t, c[2]);
    
    MultC(a[1],b[2], p);
    MultC(a[2],b[1], t);
    SubC(p,t, c[3]);
  end;
  
function LenVectorC(a: VectorC): real;
var p,s: Real;
begin
  s:=0;
  for var i:=1 to n do
    begin
      p:= sqr(a[i].Re) + sqr(a[i].Im);
      s:= s + p;
    end;
  s:=sqrt(s);
  LenVectorC:= s;
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

End.