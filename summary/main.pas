program ArithmeticMenu;
uses crt, RealNumsArithmetics, RealVectors, RealMatrices,
     ComplexNums, ComplexVectors, ComplexMatrices,
     Stack, Queue, Files;
     
procedure Menu;
var OK: boolean; MODE: integer;
begin
  OK:= true;
  while OK do
  begin
    clrscr;
    gotoxy(1, 3); clearline; writeln('MENU');
    writeln('__________FIRST SEMESTR__________');
    writeln;
    writeln('1. Real Nums (cos, sin)');
    writeln('2. Real Vectors');
    writeln('3. Real Matrices');
    writeln('4. Complex Nums');
    writeln('5. Complex Vectors');
    writeln('6. Complex Matrices');
    writeln; writeln;
    
    writeln('__________SECOND SEMESTR__________');
    writeln;
    writeln('7. Stack');
    writeln('8. Queue');
//    writeln(' 9. Double Menu');
    writeln('10. Files');
    writeln('0. Exit');
    writeln;
    
    gotoxy(1, 2); clearline; write('Input: '); readln(MODE);
    case MODE of
      0: OK:= false;
      1: MenuRealNumsArithmetics;
      2: MenuRealVectors;
      3: MenuRealMatrices;
      4: MenuComplexNums;
      5: MenuComplexVectors;
      6: MenuComplexMatrices;
      7: MenuStack;
      8: MenuQueue;
//      9: ;
      10: MenuFiles;
    else
    begin
      gotoxy(1,1); clearline; write('ERROR! Wrong Input');
      delay(3500); clearline; 
    end;  { else }
    end; { case MODE }
  end; { while OK }
end; { Menu }


Begin
  Menu;
end.