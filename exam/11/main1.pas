uses ComplexNums;

const eps = 0.0001;
var z,s,t,p:Complex;
var k: integer;

Begin
  k:=1;
  InputC(z, 0, 0);
  ZeroC(s);
  ZeroC(p);
  OneC(t);
  
  while ModulC(t) > eps do
  begin
    ProdC(1/2/(2*k-1),z,p);
    MultC(p,t,t);
    AddC(t,s,s);
    k:=k+1;
  end;
  
  OutputC(s,0,3);
  writeln;
end.