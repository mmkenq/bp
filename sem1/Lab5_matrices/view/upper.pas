uses crt;

const s = 15;
var a: array[1..s, 1..s] of integer;

Begin
  for var i:=1 to s do
    for var j:=1 to s do
      a[i,j]:= 0;
   
  for var i:=1 to s-1 do a[i, i+1]:=1;
 
 
  { Output }
  for var i:=1 to s do
    begin
      GoToXY(35,5+i);
      for var j:= 1 to s do write(a[i,j]);
      writeln('');
    end
    
end.