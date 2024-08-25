functor
import
      System(showInfo:Show) 
      Application(exit:Exit)
      Task1(printTuple:PrintTuple calculate:Calculate)
define
   % CALL PROGRAM
   local 
      N = [1 2 3 4 5 6 7 8 9]
   in
      {Show "\n============================"}
      {Show "========== Task 1 =========="}
      {Show "============================\n"}
      {Show "Input list: \n"}
      {Task1.printTuple N}
      {PrintTuple {Calculate N}}      
   end
   {Exit 0}
end