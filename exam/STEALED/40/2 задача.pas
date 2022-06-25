program Variant40;
uses crt;
const n = 5;
Type Matrix = array[1..n, 1..n] of real;

procedure InputVect(var x : Matrix); {Ввод}
var i, j : integer;
begin
 for i := 1 to n do
   for j := 1 to n do
   begin
    readln(x[i, j]);
    writeln(' ');
   end;
end;

procedure OutputVect(x : Matrix); {Вывод}
var i, j : integer;
begin
 for i := 1 to n do
 begin
   writeln;
   for j := 1 to n do
   begin
    write(x[i, j]: 5);
   end;
 end;
end;

procedure MaxElem (x : Matrix);
var i, j : integer;
     max : real;
begin
  max := 1;
  for i := 1 to n do
  begin
   writeln;
   for j := 1 to n do
     begin
       if (j >= n - i + 1) and (j <= i) then
         begin
         if max < x [i, j] then
           max := x [i, j];
         end
       else 
         x[i, j] := 0;
       write (x[i, j]:3,' ');
     end;
   end;
   writeln;
   write ('max = ', max);
end;

var a : Matrix;
    i, j: integer;
begin
  InputVect (a);
  OutputVect (a);
  MaxElem (a);
end.
