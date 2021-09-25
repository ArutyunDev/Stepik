module Demo where

ol :: Integral a => [a] -> [a]

ol x = helper x (length(x)) (x!!((length(x))-1)) (length(x)-2) []

helper x 0 z n d = d
helper x y z n d = if (odd z) then helper x (y-1) (x!!n) (n-1) (z : d) else helper x (y-1) (x!!n) (n-1) d
--OKOKOKOKhelper x y z n d = if (z `mod` 2 == 0) then helper x (y-1) (x!!n) (n-1) (z : d) else helper x (y-1) (x!!n) (n-1) d
--OKhelper x y z n d = if (z `mod` 2 == 0) then helper x (y-1) (x!!n) (n-1) (z : d) else helper x (y-1) (x!!n) (n-1) d
--OKhelper x y z n d = if (z `mod` 2 == 0) then helper x (y-1) (x!!n) (n+1) (z : d) else helper x (y-1) (x!!n) (n+1) d
--OKhelper x y z n d = if (z `mod` 2 == 0) then helper x 0 z n (z : d) else helper x 0 z n d
--helper x y = y
--helper x y z (length(x)) d = d
--helper x y z d = if (z `mod` 2 == 0) then helper x (y - 1) (x!!y) (z : d) else helper x (y - 1) (x!!y) (z : d)