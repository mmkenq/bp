uses ComplexNums;

const Eps = 0.001;
var z, p, s, t: Complex;
var k: integer;

Begin
  k:=1;
  InputC(z,0,0);
  MultC(z,z,z);
  
  ZeroC(p); AddC(z,p,p);
  ZeroC(s);
  OneC(t);
  
  while ModulC(p) > Eps do
  begin
    ProdC((2*k-1)/(k+1)/(2*k-3), z, p);
    MultC(t, p, t);
    AddC(t, s, s);
    k:=k+1;
  end;
  
  // TODO: WHY INVERT??
  s.Re:= -s.Re;
  s.Im:= -s.Im;
  
  OutputC(s, 0,3);
end.