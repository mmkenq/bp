Unit RealNumsArithmetics;

Interface
uses crt;
function RealSin(x: real): real;
function RealCos(x: real): real;
procedure MenuRealNumsArithmetics;
const eps = 0.001;

Implementation
procedure Wait;
begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey
end;

function RealSin(x: real): real;
var k:integer; var p,s:real;
begin
  x:=x*0.0174533; // radian
  s:=x; p:=x; k:=1;
  while abs(p)>eps do
  begin
    p:=-x*x*p/(2*k*(2*k+1));
    s:=s+p;
    k:=k+1;
  end;
  RealSin:=s;
end;

function RealCos(x: real): real;
var k:integer; var p,s:real;
begin
  x:=x*0.0174533; // radian
  s:=1; p:=1; k:=1;
  while abs(p) > eps do
  begin
    p := -x*x*p/(2*k*(2*k-1));
    s := s+p;
    k := k+1;
  end;
  RealCos:= s;
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

End. { Implementation }