Unit ComplexNums;

Interface
uses crt;
const eps = 0.001;
Type Complex = record  Re, Im: real end;
procedure InputC(var z: Complex; x,y: integer);
procedure OutputC(z: Complex; x,y: integer);
procedure OneC(var w: Complex);
procedure ZeroC(var w: Complex);
procedure AddC(u,v: Complex; var w: Complex);
procedure SubC(u,v: Complex; var w: Complex);
procedure MultC(u,v: Complex; var w: Complex);
procedure InvC(z: Complex; var w: Complex);
procedure DivC(u,v: Complex; var w: Complex);
procedure ProdC(k: real; z: Complex; var w: Complex);
procedure ConjC(z: Complex; var w: Complex);
procedure CosC(z: Complex; var s: Complex);
procedure SinC(z: Complex; var s: Complex);
function ModulC(z: Complex): real;
procedure MenuComplexNums;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

procedure OneC(var w: Complex);
begin
  w.Re:= 1;
  w.Im:= 0;
end;

procedure ZeroC(var w: Complex);
begin
  w.Re:= 0;
  w.Im:= 0;
end;

procedure InputC(var z: Complex; x,y: integer);
  begin
    gotoxy(x,y); clearline; write('Type z.Re: '); read(z.Re);
    gotoxy(x,y); clearline; write('Type z.Im: '); read(z.Im);
  end;

procedure OutputC(z: Complex; x,y: integer);
  begin
    gotoxy(x,y); write(z.Re, ' + ', z.Im, 'i');;
  end;
 
procedure AddC(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
  end;
  
procedure SubC(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re - v.Re;
    w.Im:= u.Im - v.Im;
  end;

procedure MultC(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;
  
procedure InvC(z: Complex; var w: Complex);
  var g: real;
  begin
    g:= sqr(z.Re) + sqr(z.Im);
    w.Re:= z.Re/g;
    w.Im:= -Z.Im/g;
  end;

procedure DivC(u,v: Complex; var w: Complex);
  var g: Complex;
  begin
    InvC(v,g);
    MultC(u, g, w);
  end;
  
procedure ProdC(k: real; z: Complex; var w: Complex);
begin
  w.Re:=z.Re * k;
  w.Im:=z.Im * k;
end;

procedure ConjC(z: Complex; var w: Complex);
begin
  w.Re:= z.Re;
  w.Im:= -z.Im;
end;

procedure CosC(z: Complex; var s: Complex);
var tmp, p: Complex; k: integer;
begin
  MultC(z,z, tmp);
  OneC(p); OneC(s); k:=1;
  while ModulC(p) > eps do
  begin
    MultC(p,tmp,p);
    ProdC(-1/(2*k*(2*k-1)), p, p);
    AddC(s,p,s);
    k:= k+1;
  end;
end;

procedure SinC(z: Complex; var s: Complex);
var tmp, p: Complex; k: integer;
begin
  k:=1; p.Re:=z.Re; p.Im:=z.Im; s.Re:=z.Re; s.Im:=z.Im;
  MultC(z,z, tmp);
  while ModulC(p) > eps do
  begin
    MultC(tmp,p,p);
    ProdC(-1/((2*k)*(2*k+1)), p, p);
    AddC(s,p,s);
    k:=k+1;
  end;
end;

function ModulC(z: Complex): real;
  begin
    ModulC:= sqrt(sqr(z.Re)+sqr(z.Im));
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

End.