var s:real; var n,f:integer;// f - factorial), s - sum
begin
  s:=0; n:=2; f:=1;
  while n<>102 do
    begin
      write('s: ',s,' '); write('n: ',n,' '); writeln('f: ',f); 
      s:=s+n/f;
      f:=f*(f+2);
      
      n:=n+2;
    end;
  write(s);
end.