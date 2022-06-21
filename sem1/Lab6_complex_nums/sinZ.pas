uses crt;

Type Complex = record
    Re, Im: real;
    end;    

function Modul(z: Complex): real;
begin
  Modul:= sqrt(sqr(z.Re) + sqr(z.Im))
end;

procedure Zero(var u: Complex);
  begin
    u.Re:=0; u.Im:=0;
  end;
  
procedure One(var u: Complex);
  begin
    u.Re:=1; u.Im:=0;
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

procedure Prod(a: real; z: Complex; var w: Complex);
  begin
    w.Re:= a*z.Re;
    w.Im:= a*z.Im;
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

var eps: real;
var z,p,s: Complex;
var k: integer;

Begin
  Input(z);
  k:=1; p.Re:=z.Re; p.Im:=z.Im; s.Re:=z.Re; s.Im:=z.Im;
  
  Mult(z,z,z);
  while Modul(p) > eps do
  begin
    Mult(z,p,p);
    Prod(-1/((2*k)*(2*k+1)), p, p);
    Add(s,p,s);
    k:=k+1;
  end;
  
  gotoxy(27,6);
  write('sin');
  Output(s);
End.