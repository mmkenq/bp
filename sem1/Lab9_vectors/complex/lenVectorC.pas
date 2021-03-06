uses crt;

const n=3;
Type Complex = record
    Re, Im: real;
    end;
Type VectorC = array[1..n] of Complex;

procedure Zero(var u: Complex);
  begin
    u.Re:=0; u.Im:=0;
  end;
  
procedure Add(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re + v.Re;
    w.Im:= u.Im + v.Im;
  end;

procedure Conj(w: Complex; var z: Complex);
begin
  z.Re:= w.Re;
  z.Im:= -w.Im;
end;

procedure Mult(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;

procedure ScalProdC(a,b: VectorC; var c: Complex);
var z,w:Complex;
begin
  Zero(c);
  for var i:=1 to n do
  begin
    Conj(b[i],z);
    Mult(a[i],z,w);
    Add(c,w,c);
  end;
end;

function LenVectorC(a: VectorC): real;
var p,s: Real;
begin
  s:=0;
  for var i:=1 to n do
    begin
      p:= sqr(a[i].Re) + sqr(a[i].Im);
      s:= s + p;
    end;
  s:=sqrt(s);
  LenVectorC:= s;
end;


procedure InputVectorC(var a: VectorC);
begin
  for var i:=1 to n do
  begin
    GoToXY(30,2); ClearLine; GoToXY(30,2); write('Type Vector[',i,'].Re: ');
    read(a[i].Re);
    GoToXY(30,2); ClearLine; GoToXY(30,2); write('Type Vector[',i,'].Im: ');
    read(a[i].Im);
  end;
end;

procedure OutputVectorC(a: VectorC; x,y: integer);
begin
  for var i:=1 to n do
  begin
     GoToXY(20*i+x, y); writeln(a[i].Re, ' + ', a[i].Im,'i');
  end;
end;

var a: VectorC;
Begin
  write('Input Complex Vector A:');
  InputVectorC(a);
  OutputVectorC(a,1,3);

  
  writeln('Length of A: ',lenVectorC(a));
end.