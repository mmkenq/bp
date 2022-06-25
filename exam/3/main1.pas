uses ComplexNums;

const eps = 0.001;
var z, p, w, s: Complex;
var k: integer;

Begin
  k:= 1;
  InputC(z,0,0);
  ProdC(2, z, z);
  MultC(z,z,z);
  
  ZeroC(p);
  OneC(w);
  ZeroC(s);
  
  while ModulC(w) > eps do
  begin
    ProdC(-1/2/k/(2*k-1), z, p);
    MultC(w, p, w);
    AddC(w, s, s);
    k:= k+1;
  end;
  
  // TODO: WHY INVERT S????
  s.Re:= -s.Re; s.Im:= -s.Im;
  OutputC(s,0,3);
  writeln;
end.