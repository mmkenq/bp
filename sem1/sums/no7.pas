var k:integer; var s:real;
begin
	s:= 0;
	for k:=1 to 50 do
		begin
			s:= s + 2 * k/(2 * k-1);
		end;

	write(s);
end.

