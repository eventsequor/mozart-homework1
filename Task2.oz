functor
import
    System(showInfo:Show)
    Utils(printList:PrintList)

export
    AddingPolynomials
    MainTask

define   

    fun {AddingPolynomials P1 P2}
        local 
            S1
            S2
            LengthP1
            LengthP2
            Out={NewCell nil}
            EndLength
        in
            {List.length P1 ?LengthP1}
            {List.length P2 ?LengthP2}
            if LengthP1==LengthP2 then
                S1 = P1
                S2 = P2
            end
            if LengthP1>LengthP2 then
                S1 = P1
                S2 = {CompletePolynomial P2 LengthP1-LengthP2}
            end
            if LengthP2>LengthP1 then
                S1 = {CompletePolynomial P1 LengthP2-LengthP1}
                S2 = P2
            end
            {List.length S1 ?EndLength}
            Out := {AddingListByPos S1 S2 EndLength nil}
            @Out
        end
    end

    fun {CompletePolynomial P L}
        if L > 0 then 
            {CompletePolynomial {Append [0] P} L-1}
        else
            P
        end
    end
    
    fun {AddingListByPos L1 L2 P OUT}
        local C1 C2 in
            if P < 1 then
                OUT
            else
                {List.nth L1 P ?C1}
                {List.nth L2 P ?C2}
                if OUT == nil then
                    {AddingListByPos L1 L2 (P-1) [C1+C2]}
                else
                    {AddingListByPos L1 L2 (P-1) {Append [C1+C2] OUT}}
                end          
            end
        end
    end

    proc {MainTask}
        local GET GET2 in
            {Show "\n============================"}
            {Show "========== Task 2 =========="}
            {Show "============================\n"}
            {Show "Tests"}
            {Show "Resolution of exercise 1: [1 -2] + [4 3 2 1] = [4 3 3 -1]"}
            GET = {PrintList {AddingPolynomials [1 (0-2)] [4 3 2 1]}}
            {Show "Answers exercise 1: \n" # GET # "\n"}
            {Show "Resolution of exercise 1: [3 0 0 4 1 -5] + [0 2 -1 1 4 10] = [3 2 -1 5 5 5]"}
            GET2 = {PrintList {AddingPolynomials [3 0 0 4 1 (0-5)] [0 2 (0-1) 1 4 10]}}
            {Show "Answers: exercise 2:\n" # GET2}
        end
    end
end