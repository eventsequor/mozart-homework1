functor
import
    System(showInfo:Show print:Print)
    Utils(printList:PrintList)
export
    MainTask4
define
    local X={NewCell nil} NValue={NewCell nil} in
        proc {Fill List}
            X := {Append [2] @X}
            X := {Append [4] @X}
        end
        fun {CreateSecuence N}
            if N<2 then
            [0]
            else
                X := [4 1]
                NValue := N
                if @NValue > 1 then NValue := ((@NValue-2) div 2)  end
                {For 1 @NValue 1 Fill}
                X := {Append [1] @X}
                @X
            end
        end
    end    
    fun {IntToFloat Number}
        local 
            IsNumber
            {Int.is Number ?IsNumber}
            OutPut
        in
            if IsNumber then {Int.toFloat Number ?OutPut} OutPut else Number end
        end
    end
    fun {FunctionH B A N}
        local 
            B1 A1 N1 OutPut Auxiliar
        in     
            B1 = {IntToFloat B} 
            A1 = {IntToFloat A}
            N1 = {IntToFloat N}
            Auxiliar = (B1-A1)
            {Float.'/' Auxiliar N1 ?OutPut}
            OutPut
        end        
    end
    local S Sequence NewSequence 
        ResultFun={NewCell nil}
        Acu={NewCell 0.0} 
        H={NewCell nil}
        PolynomialX={NewCell nil}
    in
        fun {Calculate B A N Polynomial}
            PolynomialX := Polynomial
            H := {FunctionH B A N}
            {Float.'/' @H 3.0 ?S}
            Sequence = {CreateSecuence N}
            Acu := 0.0
            NewSequence = {Map Sequence Yk}
            (S * {ReduceSumList NewSequence})
        end
        fun {Yk Value} 
            ResultFun := {IntToFloat Value} * {IntToFloat {Function (@Acu * @H)}}
            Acu := @Acu + 1.0
            @ResultFun
        end
        fun {Function Value}
            {CalculatePolynomial @PolynomialX Value}
        end
    end
    local Acu={NewCell 0.0} in
        fun {ReduceSumList List}
            Acu := 0.0
            local Del in
                Del = {Map List Acumulator}
            end
            @Acu
        end
        fun {Acumulator Value}
            Acu := {IntToFloat @Acu} + {IntToFloat Value}
            @Acu
        end
    end
    local LengthPol={NewCell 0} Xx={NewCell 0} in
        fun {CalculatePolynomial Poly X}
            Xx := X
            local L Trans G in
                {List.length Poly L}
                LengthPol := (L-1)
                Trans = {Map Poly ResolvePos}
                {ReduceSumList Trans}
            end
        end
        fun {ResolvePos Value}
            local FI3 in
                {Number.pow {IntToFloat @Xx} {IntToFloat @LengthPol} ?FI3}
                LengthPol := @LengthPol - 1
                {IntToFloat Value} * FI3
            end
        end
    end

    proc {MainTask4}
        {Show "\n============================"}
        {Show "========== Task 4 =========="}
        {Show "============================\n"}
        {Show "Tests"}
        local B A N Polynomial Result in
            B=4
            A=0
            N=10
            Polynomial = [1 0 0 0] % X^3
            {Show "Given the following values: b=" # B # " a=" # A # " n=" # N # " polynomial="#{PrintList Polynomial}}
            Result = {Calculate B A N Polynomial}
            {Show "The integral result is: "#Result}
        end
    end
end