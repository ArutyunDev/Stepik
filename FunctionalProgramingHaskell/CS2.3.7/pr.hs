module Demo where

class Printable a where
    toString :: a -> String

--	toString ::a -> String

instance Printable Bool where
    toString True = "True"
    toString False = "False"
instance Printable () where
	toString () = "unit type"
--	toString False = "False"
--	toString "()" = "unit type"
--	toString False = "False"
--    False == False = "false"
--    () == () = "unit type"



{-
Instance Printable Char where
    "true"  = "true"
    "false" = "false"
    () = "unit type"
	-}

