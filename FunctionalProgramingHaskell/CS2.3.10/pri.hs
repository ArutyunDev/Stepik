module Demo where

class Printable a where
    toString :: a -> String
	
instance Printable Bool where
    toString x = if x then "true" else "false"
instance Printable () where
	toString () = "unit type"	
instance (Printable a, Printable b) => Printable (a,b) where
	toString y
		| fst y == True && snd y == False = "(true,false)"
--        | fst True && snd False = "(true,false)"
--        | fst x False && snd () = "(false,unit type)"