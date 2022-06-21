uses crt;

const s = 15;
var a: array [1..s, 1..s] of integer;
var m: integer;

Begin
  for var i:=1 to s do
    for var j:=1 to s do
      a[i,j]:= 0;
    
  m:= trunc(s/2);
  for var i:=1 to m do
    for var j:=s+1-i to s do
      a[i, j]:= 1;
  for var i:=m+1 to s do
    for var j:=i to s do
      a[i, j]:= 1;
 
 
  { output }
  for var i:=1 to s do
    begin
      GoToXY(35,5+i);
      for var j:= 1 to s do write(a[i,j]);
      writeln('');
    end
    
end.