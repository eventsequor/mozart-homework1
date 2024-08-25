functor
import
    System(showInfo:Show print:Print)

export
    Calculate
    PrintTuple

define
   % FUNCTIONS
   fun {Calculate L}
      local 
         Even={NewCell 0} 
         Odd={NewCell 0}       
      in
         for P in L do
            if (P - 2 * (P div 2)) == 0 then
               if @Even == 0 then Even := 1 end
               Even := @Even * P
            else
               Odd := @Odd + P
            end           
         end
         %result(even:@Even odd:@Odd)
         result(@Even @Odd)
      end
   end

   proc {PrintTuple Value}
      {Print Value}
      {Show "\n"}
   end

    local 
        N=[1 2 3 4 5 6 7 8 9]
    in
        {Show "\n============================"}
        {Show "========== Task 1 =========="}
        {Show "============================\n"}
        {Show "Input list: \n"}
        {Task1.printTuple N}
        {PrintTuple {Calculate N}}      
    end
end