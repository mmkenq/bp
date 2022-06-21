Type Complex = record
    Re, Im: real;
    end;

procedure Mult(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;

procedure Inv(z: Complex; var w: Complex);
  var g: real;
  begin
    g:= sqr(z.Re) + sqr(z.Im);
    w.Re:= z.Re/g;
    w.Im:= -Z.Im/g;
  end;

procedure Division(u,v: Complex; var w: Complex);
  var g: Complex;
  begin
    Inv(v,g);
    Mult(u, g, w);
  end;

var a,b,c: Complex;
Begin
  writeln('Division Complex num:');
  write('A.Re: '); readln(a.Re); write('A.Im: '); readln(a.Im);
  write('B.Re: '); readln(b.Re); write('B.Im: '); readln(b.Im);
  Division(a,b,c);
  write('A/B = C',' (C.Re = ', c.Re, ', C.Im = ', c.Im, ')');
end.