functor
import
    System(showInfo:Show) 

export
    PrintList

define
    fun {PrintList L}
        local R={NewCell "["} in
            for P in L do
                if @R == "[" then R := @R # P else R := @R # " " # P end
                 
            end
            R := @R # "]"
            @R
        end
    end
end