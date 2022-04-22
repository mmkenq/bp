uses crt, Stak;//,Queues;//Group,Files,FilesT,Дерево;
Var Mode : integer;
    Ok: boolean;
    begin
    Ok:= True;
    While Ok do
      begin
      ClrScr;
      Writeln('Выберите списки');
      Writeln('  1.Стеки');
      Writeln('  2.Очередь');
      Writeln('  3.Группа');
      Writeln('  4.Файлы');
      Writeln('  5.Текстовые файлы');
      Writeln('  6.Дерево');
      Writeln('  0.Выход');
      GoToXY(40,23);
      Readln(Mode);
      GoToXY(1,1);
      ClrScr;
      Case Mode of
      1: MenuStack;
      //2: MenuQueue;
      //3: MenuGroup;
     // 4: MenuFiles;
     // 5: MenuFilesT;
     // 6: MenuTrees;
     // 0: Ok:=False;
      else
        begin
        GoToXY(30,20);
        Writeln('Ошибка повторите ввод!');
        delay (1000);
        end
      end
     end
    End.