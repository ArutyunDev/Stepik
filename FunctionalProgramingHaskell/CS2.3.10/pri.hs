module Demo where

class Printable a where
    toString :: a -> String
	
instance Printable Bool where
    toString True = "true"
    toString False = "false"
instance Printable () where
	toString () = "unit type"
instance (Printable a, Printable b) => Printable (a,b) where
	toString (x, y) = "(" ++ toString x ++ "," ++ toString y ++ ")" 
--        | (fst == True) = "(true,false)"
--        | fst x False && snd () = "(false,unit type)"