functor
import
    System(showInfo:Show print:Print)
export
    MainTask
    Evaluate
    
define
    proc {Evaluate Record1 Record2 Answer}
        local LengthR1 LengthR2 in
            {Record.width Record1 ?LengthR1}
            {Record.width Record2 ?LengthR2}
           if LengthR1 == LengthR2 then
                local AreKeyEquals AreValuesEquals in
                    {AllKeysAreEquals Record1 Record2 AreKeyEquals}
                    {AllValuesAreEquals Record1 Record2 AreValuesEquals}
                    if AreKeyEquals andthen AreValuesEquals then 
                        Answer=equals
                    else 
                        if AreKeyEquals andthen AreValuesEquals==false then
                            Answer=equivalent 
                        else 
                            local Ans in
                                {Contains Record1 Record2 Ans}
                                if Ans then Answer=subsimilar else Answer=different end
                            end
                        end
                    end
                end
            else
                local Ans in
                    {Contains Record1 Record2 Ans}
                    if Ans then Answer=subsimilar else Answer=different end
                end
            end           
        end
    end

    proc {Contains Record1 Record2 Answer}
        local ListKeys1 ListKeys2 
            Counter={NewCell 0}        
        in
            {Record.arity Record1 ?ListKeys1}
            {Record.arity Record2 ?ListKeys2}
            for P in ListKeys1 do
                local Member in
                    {List.member P ListKeys2 ?Member}
                    if Member then Counter := @Counter + 1 end
                end
            end
            for P in ListKeys2 do
                local Member in
                    {List.member P ListKeys1 ?Member}
                    if Member then Counter := @Counter + 1 end
                end
            end
            if @Counter > 0 then Answer=true else Answer=false end
        end        
    end
    
    proc {AllKeysAreEquals Record1 Record2 Answer}
        local ListKeys1 ListKeys2 Xs LengthR1 TotalEquals={NewCell 0} in
            {Record.arity Record1 ?ListKeys1}
            {Record.arity Record2 ?ListKeys2}
            {Record.width Record1 ?LengthR1}
            {List.number 1 LengthR1 1 ?Xs}
            for P in Xs do
                local ValueKey1 ValueKey2 in
                    {List.nth ListKeys1 P ?ValueKey1}
                    {List.nth ListKeys2 P ?ValueKey2}
                    if ValueKey1 == ValueKey2 then TotalEquals := @TotalEquals + 1 end
                end
            end            
            if LengthR1 == @TotalEquals then Answer=true else Answer=false end
        end
    end
    proc {AllValuesAreEquals Record1 Record2 Answer}
        local ListValues1 ListValues2 Xs LengthR1 TotalEquals={NewCell 0} in
            {Record.toList Record1 ?ListValues1}
            {Record.toList Record2 ?ListValues2}
            {Record.width Record1 ?LengthR1}
            {List.number 1 LengthR1 1 ?Xs}
            for P in Xs do
                local ValueKey1 ValueKey2 in
                    {List.nth ListValues1 P ?ValueKey1}
                    {List.nth ListValues2 P ?ValueKey2}
                    if ValueKey1 == ValueKey2 then TotalEquals := @TotalEquals + 1 end
                end
            end            
            if LengthR1 == @TotalEquals then Answer=true else Answer=false end
        end
    end
    proc {MainTask}
        {Show "\n============================"}
        {Show "========== Task 5 =========="}
        {Show "============================\n"}
        {Show "Tests"}

        local 
            A=tuple1(a:1 b:2 c:3)
            B=tuple2(a:1 b:2 c:3)
            C=tuple3(a:4 b:2 c:3)
            D=tuple4(a:4 b:2 c:3 f:21 g:43)
            E=tuple5(d:3 e:2 f:4)
            EqualsTest 
            EquivalentTest
            SubsimilarTest
            DifferentTest
        in
            {Show "\n>>>>>>>> Equals records"}
            {Show "Record A:\n"}
            {Print A}
            {Show "\n\nRecord B:\n"}
            {Print B}
            {Show "\n\nResult: \n"}
            {Evaluate A B EqualsTest}
            {Print EqualsTest}
            {Show "\n"}

            {Show "\n>>>>>>>> Equivalent records"}
            {Show "Record A:\n"}
            {Print A}
            {Show "\n\nRecord C:\n"}
            {Print C}
            {Show "\n\nResult: \n"}
            {Evaluate A C EquivalentTest}
            {Print EquivalentTest}
            {Show "\n"}

            {Show "\n>>>>>>>> Subsimilar records"}
            {Show "Record A:\n"}
            {Print A}
            {Show "\n\nRecord D:\n"}
            {Print D}
            {Show "\n\nResult: \n"}
            {Evaluate A D SubsimilarTest}
            {Print SubsimilarTest}
            {Show "\n"}

            {Show "\n>>>>>>>> Different records"}
            {Show "Record A:\n"}
            {Print A}
            {Show "\n\nRecord E:\n"}
            {Print E}
            {Show "\n\nResult: \n"}
            {Evaluate A E DifferentTest}
            {Print DifferentTest}
            {Show "\n"}
        end
    end
end