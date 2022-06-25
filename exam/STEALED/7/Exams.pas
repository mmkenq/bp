Unit Exams;
     Interface
     uses crt, MenuInMenu;
     
     Type matrixInt = array[1..25,1..25] of integer;
     
     procedure MenuExam;
     procedure Exam1;
     procedure Exam2;
     
     Implementation
     
     procedure Exam1;
     var z:integer;
      e:real;
      w:real;
      p,p1:real;
      k:integer;
     begin
       e:=0.001;
       writeln('Введите z:');
       read(z);
       p:=1;
       p1:=1;
       k:=2;
       
       while (abs(p) > e) do
       begin
         p:=p*(z/k);
         //writeln('p:',abs(p),' w:',w);
         w:=w+p;
         k:=k+1;
       end;
       
       k:=1;
       
       while (abs(p1) > e) do
       begin
          p1:=p1*(1/z);
          w:=w+p1;
          k:=k+1;
       end;
       
       writeln('answer:',w);
       
       Wait;
     end;
     
     procedure Exam2;
     var 
         a:matrixInt;
         i,j:integer;
         min:integer;
     begin
       writeln('Введите размер матрицы:');
       read(i);
       
       for var height:=1 to i do
       begin
         for var width:=1 to i do
         begin
           a[width,height]:=random(20);
         end;
       end;
       
       min:=a[i,1];
       
       for var height:=1 to i do
       begin
         for var width:=1 to i do
         begin
           write(a[width,height]:4)
         end;
         writeln;
       end;
       
       writeln;
       
       for var size:=1 to i do
       begin
         if (a[i-size+1,size] < min) then min:= a[i-size+1,size];
         
         if (size <> i) then
         begin
           if (a[i-size,size] < min) then min:=a[i-size,size];
           if (a[i-size+1,size+1] < min) then min:=a[i-size+1,size+1];
         end;
       end;
       
       writeln('min:',min);
       
       Wait
     end;

     procedure MenuExam;
     var mode:integer;
     begin
       writeln('1. №1');
       writeln('2. №2');
       writeln;
       writeln('0.назад');
       readln(mode);
       
       case mode of
         1:begin ClrScr; Exam1 end;
         2:begin ClrScr; Exam2 end;
         0:begin ClrScr; end;
       end;
     end;
end.