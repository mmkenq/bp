Unit ComplexVectors;

Interface
uses crt, ComplexNums;
const n = 3;
Type VectorC = array[1..n] of Complex;
procedure InputVectorC(var a: VectorC; x,y: integer);
procedure OutputVectorC(a: VectorC; x,y: integer);
procedure AddVectorC(a, b: VectorC; var c: VectorC);
procedure SubVectorC(a, b: VectorC; var c: VectorC);
procedure ScalProdVectorC(a,b: VectorC; var c: Complex);
procedure VectProdVectorC(a,b: VectorC; var c: VectorC);
function LenVectorC(a: VectorC): real;

Implementation
procedure InputVectorC(var a: VectorC; x,y: integer);
begin
  for var i:=1 to n do
  begin
    InputC(a[i],x,y); OutputC(a[i], x, y+i);
  end;
end;

procedure OutputVectorC(a: VectorC; x,y: integer);
begin
  for var i:=1 to n do
  begin
     OutputC(a[i], x, y+i-1);
  end;
end;

procedure AddVectorC(a, b: VectorC; var c: VectorC);
begin
  for var i:= 1 to n do AddC(a[i], b[i], c[i]);
end;
        
procedure SubVectorC(a, b: VectorC; var c: VectorC);
begin
  for var i:= 1 to n do SubC(a[i], b[i], c[i]);
end;

procedure ScalProdVectorC(a,b: VectorC; var c: Complex);
var z,w:Complex;
begin
  ZeroC(c);
  for var i:=1 to n do
  begin
    ConjC(b[i],z);
    MultC(a[i],z,w);
    AddC(c,w,c);
  end;
end;

procedure VectProdVectorC(a,b: VectorC; var c: VectorC);
var p,t: Complex;
  begin
    MultC(a[2],b[3], p);
    MultC(a[3],b[2], t);
    SubC(p,t, c[1]);
    
    MultC(a[3],b[1], p);
    MultC(a[1],b[3], t);
    SubC(p,t, c[2]);
    
    MultC(a[1],b[2], p);
    MultC(a[2],b[1], t);
    SubC(p,t, c[3]);
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
End.