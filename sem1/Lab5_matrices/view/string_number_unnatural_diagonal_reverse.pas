uses crt;

const s = 9;
var a: array[1..s, 1..s] of integer;

Begin
  for var i:=1 to s do
    for var j:=1 to s do
      a[i,j]:= 0;
  
  for var i:=1 to s do
    begin
      GoToXY(35,5+i);
      for var j:=1 to s do
        begin
          a[i, s+1-i]:= j;
          write(a[i,j]);
        end;
      writeln(' ');
    end
end.