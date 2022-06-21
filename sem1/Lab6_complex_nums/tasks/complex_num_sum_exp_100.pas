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

function Modul(z: Complex): real;
  begin
    Modul:= sqrt(sqr(z.Re)+sqr(z.Im));
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


var z,s,w: Complex;
Begin
  s.Re:=1; s.Im:=0;
  Input(z);
  w.Re:=z.Re; w.Im:=z.Im;
  
  for var i:= 1 to 99 do
  begin
    Add(s,z,s);
    Mult(z,w,z);
  end;
  Add(s,z,s);
  Output(s);
end.