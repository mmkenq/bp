Type Complex = record
    Re, Im: real;
    end;
    
procedure Add(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
  end;
  
var a,b,c: Complex;
Begin
  writeln('Sum Complex num:');
  write('A.Re: '); readln(a.Re); write('A.Im: '); readln(a.Im);
  write('B.Re: '); readln(b.Re); write('B.Im: '); readln(b.Im);
  Add(a,b,c);
  write('A + B = C', ' (C.Re = ', c.Re, ', C.Im = ', c.Im, ')');
end.