module Demo where

class (Eq a, Enum a, Bounded a) => SafeEnum a where
	ssucc :: a -> a
	ssucc x
		| x == maxBound = minBound
		| otherwise = succ x
		
	spred :: a -> a
	spred x
		| x == minBound = maxBound
		| otherwise = pred x

instance SafeEnum Int where
instance SafeEnum Char where
instance SafeEnum Bool where