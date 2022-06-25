uses complexbibl, ComplexVectorBibl;
var a : VectorC;
var b : Complex;
begin
  for var i :integer := 1 to SizeVectorC do 
  begin
    b := randomC();
    setVectorC(a,b,i);
  end;
  for var i :integer := 1 to SizeVectorC do
    Write(getVectorC(a,i),' ');
  Writeln;
  
  
  var sum : Complex;
  zeroC(sum);
  var proiz : Complex;
  odinC(proiz);
  
  for var i := 1 to SizeVectorC do
  begin
    zeroC(sum);
    for var j : integer := 1 to i do
      sumC(getVectorC(a,j), sum, sum);
    proizC(proiz,sum, proiz);
   end;
  
  
  Writeln(proiz.re, ' ', proiz.im)
  
end.