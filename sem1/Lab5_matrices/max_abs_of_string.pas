uses crt;

const s = 3;
const c = 3;

var a: array [1..s, 1..c] of real;
var z, z1, n: real;

Begin
  GotoXY(9,3);
  writeln('Write a:');
  for var i:=1 to s do
    for var j:=1 to c do
      begin
        GoToXY(40,20);
        read(a[i,j]);
        GoToXY(40,20); write('                             ');
        GoToXY(11+10*j,3+i); writeln(a[i,j]);   
        if (i=s) and (j=c) then GoToXY(9,6+i);
      end;
      
  z:=0; z1:=0;
  for var i:=1 to s do
  begin
    n:=0;
    for var j:=1 to c do n:=n+abs(a[i,j]);
    if n>z then 
    begin
      z:=n;
      z1:=i;
    end;
  end;
  writeln(z1, ' string is first Max(), its value = ', z);
end.