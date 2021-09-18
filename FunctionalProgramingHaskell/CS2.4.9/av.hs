module Demo where

--class (Num a, Integral a) => SafeEnum a where
avg :: Int -> Int -> Int -> Double
avg x y z = fromInteger(toInteger(x) + toInteger(y) + toInteger(z)) / 3.0
--avg x y z = toEnum(x + y + z) / toEnum(3) 
--avg x y z = sqrt (fromInteger(x) + fromInteger(y) + fromInteger(z))
--instance SafeEnum Int where/