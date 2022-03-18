uses Crt, Compl, CompMatr, VectR, VectC, Stak, Queues; 
var Mode: integer;
    Ok: boolean;
    begin
      Ok:= true;
      while Ok do
        begin
          ClrScr;
          GoToXY(0, 1);writeln('Выбери пункт');
          GoToXY(0, 3);writeln('1: Комплексные числа');
          GoToXY(0, 5);writeln('false: Комплексные матрицы');
          GoToXY(0, 7);writeln('2: Стеки');
          GoToXY(0, 9);writeln('3: Очереди');
          GoToXY(0, 11);writeln('0 Выход');
          GoToXY(0, 13); readln(Mode);
          GoToXY(0, 13); clearline;
            Case Mode of
              1: MenuComplex;
              2: MenuStack;
              3: MenuQueue;
              0: Ok:= false
              else
                begin
                  GoToXY(30, 24);
                  writeln('Ошибка! Повторите ввод!');
                  delay(1000);
                end;
            end;
        end;
    end.