uses crt;

const s = 15;
var a: array [1..s, 1..s] of integer;

Begin
  for var i:=1 to s do
    for var j:=1 to s do
      a[i,j]:= 0;
    
  for var i:=1 to s do a[i,i]:=1;
  for var i:=1 to s do
    for var j:=i+1 to s do
      a[i,j]:=2;
 
  { output }
  for var i:=1 to s do
    begin
      GoToXY(35,5+i);
      for var j:= 1 to s do write(a[i,j]);
      writeln('');
    end
    
end.