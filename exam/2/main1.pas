uses ComplexNums;

const eps = 0.001;
var z, p, w, s: Complex;
var k: integer;

Begin
    InputC(z,0,0);
    if ModulC(z) >= 1/5 then writeln('Modul(z) = ', ModulC(z), ' >= 1/5')
    else
    begin
      k:=2;
      ProdC(5,z,w);
      p.Re:= w.Re; p.Im:= w.Im;
      s.Re:= w.Re; s.Im:= w.Im;
      
      while ModulC(w) > eps do
      begin
        ProdC(5*(k-1)*(k-1)/k/k, z, p);
        MultC(p, w, w);
        AddC(w, s, s);
        k:=k+1;
      end;
      
      OutputC(s, 0, 3);
      writeln;
    end;
end.