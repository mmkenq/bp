uses crt;

const n=3;
Type Complex = record
    Re, Im: real;
    end;
Type VectorC = array[1..n] of Complex;

procedure Sub(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re - v.Re;
    w.Im:= u.Im - v.Im;
  end;
  
procedure Mult(u,v: Complex; var w: Complex);
  begin
    w.Re:= u.Re * v.Re - u.Im*v.Im;
    w.Im:= u.Re * v.Im + u.Im*v.Re;
  end;
  
procedure VectProdC(a,b: VectorC; var c: VectorC);
var p,t: Complex;
  begin
    Mult(a[2],b[3], p);
    Mult(a[3],b[2], t);
    Sub(p,t, c[1]);
    
    Mult(a[3],b[1], p);
    Mult(a[1],b[3], t);
    Sub(p,t, c[2]);
    
    Mult(a[1],b[2], p);
    Mult(a[2],b[1], t);
    Sub(p,t, c[3]);
  end;
  
var a,b,c: VectorC;

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

Begin
  writeln;
  write('Input Complex Vector A:');
  InputVectorC(a);
  OutputVectorC(a,2,3);
  
  write('Input Complex Vector B:');
  InputVectorC(b);
  OutputVectorC(b,1,5);
  
  VectProdC(a,b,c);
  writeln;
  write('Complex Vector C = A x B:');
  OutputVectorC(c,1,8);
end.