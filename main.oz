functor
import
      System(showInfo:Show) 
      Application(exit:Exit)
      Task1
      Task2
define
   % CALL PROGRAM
   {Task1.mainTask1}
   {Task2.mainTask2}
   {Exit 0}
end