var k:integer;
var t,s,p,eps:real;

Begin
  read(t);
  t:=t*0.0174533; // radian
  s:=t; p:=t; k:=1; eps:= 0.0001;
  while abs(p)>eps do
  begin
    p:=-t*t*p/(2*k*(2*k+1));
    s:=s+p;
    k:=k+1;
  end;
  
  writeln('sin(',t,')=',s);
  writeln('pascal sin:', sin(t));
End.