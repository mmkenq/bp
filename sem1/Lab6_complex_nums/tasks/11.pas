// z - Complex
// Task: (z^6 + z^4 + 2)/ z^2 + 1

uses crt;

Type Complex = record
    Re, Im: real;
    end;

procedure Add(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
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
  
procedure Input(var z: Complex);
  begin
    GoToXY(30,5);
    write('Type A.Re: '); read(z.Re);
    GoToXY(30,5); ClearLine(); GoToXY(30,5);
    write('Type A.Im: '); read(z.Im);
  end;

procedure Output(z: Complex);
  begin
    GoToXY(30, 6);
    writeln('A = ', z.Re, ' + ', z.Im, '*i');
  end;


var z,w,g,s: Complex;
Begin
  Input(z);
  s.Re:=z.Re; s.Im:= z.Im;
  w.Re:=0; w.Im:=0;
  Mult(z,z,g); g.Re := g.Re + 1;
  
  for var i:=1 to 5 do Mult(z,s,z);
  w.Re:=z.Re; w.Im := z.Im;
  z.Re:=s.Re; z.Im:=s.Im;
  for var i:=1 to 3 do Mult(z,s,z);
  Add(w,z,w);
  w.Re := w.Re + 2;
  Division(w,g,w);
  
  Output(w);
end.