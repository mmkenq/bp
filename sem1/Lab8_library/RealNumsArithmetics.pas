Unit RealNumsArithmetics;

Interface
uses crt;
function RealSin(x: real): real;
function RealCos(x: real): real;
const eps = 0.001;

Implementation
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
  
End. { Implementation }