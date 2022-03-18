// cos

var t,p,s,eps:real; var k:integer;
begin
  readln(t); p:=1; s:=1; k:=0; eps:=0;
  while abs(p) > eps do
  begin
    k := k+1;
    p := p*t*t/2*t/(2*t-1);
    s := s+p;
  end;
  write(cos(s));
  write(s);
  
end.