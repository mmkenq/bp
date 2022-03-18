// sin

var x,sum,k,add,eps:real;
begin
  writeln;
  write('x=');
  readln(x);
  x:=x*0.0174533; //чтобы вводить углы а не радианы
//  write('eps=');
//  readln(eps);
  eps:=0;
  
  add:=x;
  sum:=add;
  k:=1;
  while abs(add) > eps do
  begin
    k:=k+2;
    add:=-add*x*x/(k*(k-1));
    sum:=sum+add;
  end;
  writeln('sin=',sum);
  writeln('check: ',sin(x));
end.