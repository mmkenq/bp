function shoot_to_center(x,y: real):integer;
begin
  if (x = 0.0) and (y = 0.0) then shoot_to_center:= 10
  else shoot_to_center:= 0;
end;

function shoot_to_rhomb(x,y: real):integer;
begin
  if (abs(x) + abs(y)) < 10 then shoot_to_rhomb:= 3
  else shoot_to_rhomb:=0;
end;

function shoot_to_circle(x,y: real):integer;
begin
  if ((x * x) + (y * y)) < 100 then shoot_to_circle:=2
  else shoot_to_circle:=0;
end;

function shoot_to_rectangle(x,y: real):integer;
begin
  if (abs(x) < 10) and (abs(y) < 10) then shoot_to_rectangle:=1
  else shoot_to_rectangle:=0;
end;


var x,y: real;
var res, tmp: integer;
Begin
  
  writeln('Программа: попади в круг в 1 или 3 четверти');
  randomize;
  // x,y := random(max-min+1)+min;
  x:=random*20-10;
  y:=random*20-10;
  writeln('Randomized (x: ', x, ' y: ', y,')');
  if(x < 0) and (y > 0) then
  begin
    writeln('промазал, во 2 четверть');
    exit();
  end;
  if(x > 0) and (y < 0) then
  begin
    writeln('промазал, в 4 четверть');
    exit();
  end;


  write('В центр: ');
  tmp:=0;
  tmp:= shoot_to_center(x,y);
  if(tmp = 0) then writeln('не попали')
  else writeln('попали');
  
  write('В ромб: ');
  tmp:=0;
  tmp:= shoot_to_rhomb(x,y);
  if(tmp = 0) then writeln('не попали')
  else writeln('попали');

  write('В квадрат: ');
  tmp:= 0;
  tmp:= shoot_to_rectangle(x,y);
  if(tmp = 0) then writeln('не попали')
  else writeln('попали');

  write('В круг: ');
  tmp:=0;
  tmp:= shoot_to_circle(x,y);
  if(tmp <> 0) then writeln('Попал! Награда: ', tmp, ' очка')
  else writeln('Не попал.. К сожалению, ты не получил награду.');
  
End.