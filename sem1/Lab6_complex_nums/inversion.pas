Type Complex = record
    Re, Im: real;
    end;

procedure Inv(z: Complex; var w: Complex);
  var g: real;
  begin
    g:= sqr(z.Re) + sqr(z.Im);
    w.Re:= z.Re/g;
    w.Im:= -Z.Im/g;
  end;
   
var a, c: Complex;
Begin
  writeln('Invert Complex num:');
  write('A.Re: '); readln(a.Re); write('A.Im: '); readln(a.Im);
  Inv(a,c);
  write('1/A = C',' (C.Re = ', c.Re, ', C.Im = ', c.Im, ')');
end.