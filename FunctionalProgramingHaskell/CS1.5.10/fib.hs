module Fib where

fibonacci :: Integer -> Integer -> Integer -> Integer
fibonacci fib1 fib2 n | n == 0    = 0
            | n == 1    = 1
            | n > 1     = 