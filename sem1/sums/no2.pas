var s:real; var n:integer;
begin
  s:=0;
  for n:=1 to 33 do
    begin
    s:=s+1/(3*n-2)/(3*n+1); 
    end;
  write(s);
end.