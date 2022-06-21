uses crt;
const n = 9;
var a,b: array [1..n] of real;
var k,m: integer;

Begin
    writeln('Введите a[1..n]:');
    for k:=1 to n do
    begin
      GoToXY(40,20); read(a[k]);
      GoToXY(40,20); clearline;
      GoToXY(7*k, 2); writeln(a[k]);
    end;
     

    m:=1;
    for k:=1 to n do
    if(a[k]<0.0) then 
      begin
        b[m]:=a[k];
        m:=m+1;
      end;
      
    for k:=1 to n do
    if(a[k]>0.0) then 
      begin
        b[m]:=a[k];
        m:=m+1;
      end;
    
    
    gotoxy(0,3);
    writeln('Отрицательные впереди:');
    for k:=1 to n do 
    begin
      gotoxy(7*k, 4); write(b[k]);
    end;
    
end.