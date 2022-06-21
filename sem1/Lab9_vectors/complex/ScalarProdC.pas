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

procedure InputVectorC(var a: VectorC);
begin
  for var i:=1 to n do
  begin
    GoToXY(30,1); ClearLine; GoToXY(30,1); write('Type Vector[',i,'].Re: ');
    read(a[i].Re);
    GoToXY(30,1); ClearLine; GoToXY(30,1); write('Type Vector[',i,'].Im: ');
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

var a, b: VectorC;
var c: Complex;
Begin
  writeln;
  write('Input Complex Vector A:');
  InputVectorC(a);
  OutputVectorC(a,1,3);
  
  write('Input Complex Vector B:');
  InputVectorC(b);
  OutputVectorC(b,1,5);
  
  ScalProdC(a,b,c);
  writeln;
  writeln('A * B: ', c.Re, ' + ', c.Im, 'i');
  
  
end.