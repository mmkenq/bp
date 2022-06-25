uses crt,Stacks,Queues,Files,Texts,Trees,SubTrees, RDTree, Compl, CompMatr, CompVect, RealVect;
Var Mode: integer; 
    Ok:Boolean;
    
procedure Wait;
begin
  while Ok do
  repeat until KeyPressed;
  while KeyPressed do ReadKey
end;

Begin
  Ok:= true;
  begin
    clrscr;
    writeln('Вкажiть режим:');
    writeln('   1: Stacks');
    writeln('   2: Queues');
    writeln('   3: Files');
    writeln('   4: Text Files');
    writeln('   5: Trees');
    writeln('   6: Dynamic Tree');
    writeln('   7: Binary search tree');
    writeln('   8. Complex Nums');
    writeln('   9. Complex Matrices');
    writeln('   10. Vectors');
    writeln('   11. Complex Vectors');
    writeln('   0: Exit');
    readln(Mode);
    case Mode of
      1: MenuStack;
      2: MenuQueue;
      3: MenuFile;
      4: MenuText;
      5: MenuTree;
      6: MenuSubTree;
      7: MenuDTree;
      8: MenuComplex;
      9: MenuCompMatr;
      10: MenuRealVect;
      11: MenuCompVect; 
      0: Ok:=false;
      else
      begin
        GoToXY(30,21);
        writeln('Errot! Try again!');
        Wait;
      end;
    end;
  end; 
End.