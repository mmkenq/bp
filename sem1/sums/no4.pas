var s,e:real; var n,f:integer;// e - entity, s - sum
begin
  s:=0; n:=2; e:=0; f:=1;
  while n<>102 do
    begin
      // write('s: ',s,' '); write('n: ',n,' '); writeln('e: ',e); 
     
      e:=n/f;
      s:=s+e;
      
      f:=f*(f+2);
      n:=n+2;
    end;
  write(s);
end.