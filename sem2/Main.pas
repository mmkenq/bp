uses crt, Stak, Queue, Group;//, File, TFile, Tree;

Var Mode: integer;
    ok: boolean;
    
Begin
  ok:= True;
  while ok do
    begin
     ClrScr;
     Writeln('Menu');
     Writeln('  1) Stack');
     Writeln('  2) Queue');
     Writeln('  3) Group');
     Writeln('  4) File');
     Writeln('  5) Text File');
     Writeln('  6) Tree');
     Writeln('  0) Exit');
     GoToXY(40,23);
     Readln(Mode);
     GoToXY(1,1);
     ClrScr;
    Case Mode of
     1: MenuStack;
     2: MenuQueue;
     3: MenuGroup;
     //4: MenuFiles;
     //5: MenuFilesT;
     //6: MenuTrees;
     //0: Ok:=False;
    else
      begin
        GoToXY(30,20);
        Writeln('Error. Try again!');
        delay (1000);
      end
    end
  end
End.