Type Complex = record
    Re, Im: real;
    end;

procedure Mult(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;

var a,b,c: Complex;

Begin
  writeln('Multiply Complex num:');
  write('A.Re: '); readln(a.Re); write('A.Im: '); readln(a.Im);
  write('B.Re: '); readln(b.Re); write('B.Im: '); readln(b.Im);
  Mult(a,b,c);
  write('A * B = C', ' (C.Re = ', c.Re, ', C.Im = ', c.Im, ')');
end.