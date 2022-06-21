Unit ComplexNums;

Interface
uses crt;
const eps = 0.001;
Type Complex = record  Re, Im: real end;
procedure InputC(var z: Complex; x,y: integer);
procedure OutputC(z: Complex; x,y: integer);
procedure OneC(var w: Complex);
procedure ZeroC(var w: Complex);
procedure AddC(u,v: Complex; var w: Complex);
procedure SubC(u,v: Complex; var w: Complex);
procedure MultC(u,v: Complex; var w: Complex);
procedure InvC(z: Complex; var w: Complex);
procedure DivC(u,v: Complex; var w: Complex);
procedure ProdC(k: real; z: Complex; var w: Complex);
procedure ConjC(z: Complex; var w: Complex);
procedure CosC(z: Complex; var s: Complex);
procedure SinC(z: Complex; var s: Complex);
function ModulC(z: Complex): real;

Implementation
procedure OneC(var w: Complex);
begin
  w.Re:= 1;
  w.Im:= 0;
end;

procedure ZeroC(var w: Complex);
begin
  w.Re:= 0;
  w.Im:= 0;
end;

procedure InputC(var z: Complex; x,y: integer);
  begin
    gotoxy(x,y); clearline; write('Type z.Re: '); read(z.Re);
    gotoxy(x,y); clearline; write('Type z.Im: '); read(z.Im);
  end;

procedure OutputC(z: Complex; x,y: integer);
  begin
    gotoxy(x,y); write(z.Re, ' + ', z.Im, 'i');;
  end;
 
procedure AddC(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
  end;
  
procedure SubC(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re - v.Re;
    w.Im:= u.Im - v.Im;
  end;

procedure MultC(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;
  
procedure InvC(z: Complex; var w: Complex);
  var g: real;
  begin
    g:= sqr(z.Re) + sqr(z.Im);
    w.Re:= z.Re/g;
    w.Im:= -Z.Im/g;
  end;

procedure DivC(u,v: Complex; var w: Complex);
  var g: Complex;
  begin
    InvC(v,g);
    MultC(u, g, w);
  end;
  
procedure ProdC(k: real; z: Complex; var w: Complex);
begin
  w.Re:=z.Re * k;
  w.Im:=z.Im * k;
end;

procedure ConjC(z: Complex; var w: Complex);
begin
  w.Re:= z.Re;
  w.Im:= -z.Im;
end;

procedure CosC(z: Complex; var s: Complex);
var tmp, p: Complex; k: integer;
begin
  MultC(z,z, tmp);
  OneC(p); OneC(s); k:=1;
  while ModulC(p) > eps do
  begin
    MultC(p,tmp,p);
    ProdC(-1/(2*k*(2*k-1)), p, p);
    AddC(s,p,s);
    k:= k+1;
  end;
end;

procedure SinC(z: Complex; var s: Complex);
var tmp, p: Complex; k: integer;
begin
  k:=1; p.Re:=z.Re; p.Im:=z.Im; s.Re:=z.Re; s.Im:=z.Im;
  MultC(z,z, tmp);
  while ModulC(p) > eps do
  begin
    MultC(tmp,p,p);
    ProdC(-1/((2*k)*(2*k+1)), p, p);
    AddC(s,p,s);
    k:=k+1;
  end;
end;

function ModulC(z: Complex): real;
  begin
    ModulC:= sqrt(sqr(z.Re)+sqr(z.Im));
  end;
  
End.