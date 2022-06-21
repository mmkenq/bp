// cos

var k:integer;
var t,p,s,eps:real;
begin
  read(t);
  t:=t*0.017; // radian
  s:=1; p:=1; k:=1; eps:=0.0001;
  while abs(p) > eps do
  begin
    p := -t*t*p/(2*k*(2*k-1));
    s := s+p;
    k := k+1;
  end;
  writeln(s);
  write('pascal cos(s):', cos(t));  
end.