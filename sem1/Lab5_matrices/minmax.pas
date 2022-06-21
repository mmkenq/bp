uses crt;

const s = 3;
const c = 3;

var a: array [1..s, 1..c] of real;
var z, r: real;

Begin
  GotoXY(9,3);
  writeln('Write a[]:');
  for var i:=1 to s do
    for var j:=1 to c do
      begin
        GoToXY(40,20);
        read(a[i,j]);
        GoToXY(40,20); write('                             ');
        GoToXY(11+10*j,3+i); writeln(a[i,j]);   
        if (i=s) and (j=c) then GoToXY(9,6+i);
      end;
      
  r:=10000000000;  // string minmax() value (result)
  for var i:=1 to s do
  begin
    z:=0;  // string max() value
    for var j:=1 to c do if z < a[i,j] then z:= a[i,j];
    if r > z then r:=z;
  end;
  writeln('minmax() = ', r);
end.