var a : array of array of real;
    n, i, j : integer;
    Max :real;
begin
  Write('Введите размер матрицы: ');
  Read(n);
  SetLength(a,n);
  for i := 0 to n - 1 do
    SetLength(a[i],n);  
  
  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
      a[i][j] := random(100);
  
  for I := 0 to n - 1 do
  begin  
    for j := 0 to n - 1 do
      Write(a[i][j]:4);
    Writeln;
  end;
  
  max := -MaxInt;
  for i:= 0 to n - 1 do
    for j:= 0 to n - 1 do
      if I + j >= n then
        if max < A[i][j] then max := A[i][j];
      
  Writeln('Максимамльное значение: ', max);
  
  
end.