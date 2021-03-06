-------------------------------------------------CS1.2.07-------------------------------------------------
{-
Реализуйте функцию трех аргументов lenVec3, которая вычисляет длину трехмерного вектора. Аргументы функции 
задают декартовы координаты конца вектора, его начало подразумевается находящимся в начале координат. 
Для извлечения квадратного корня воспользуйтесь функцией sqrt, определенной в стандартной библиотеке.

GHCi> lenVec3 2 3 6
7.0
-}

lenVec3 x y z = sqrt (x^2 + y^2 + z^2)

-------------------------------------------------CS1.2.10-------------------------------------------------
{-
Напишите реализацию функции sign, которая возвращает 1, если ей передано положительное число, (-1), 
если отрицательное, и 0 в случае, когда передан 0.

GHCi> sign (-100)
-1
-}

sign x = if x > 0 then 1 else if x < 0 then (-1) else 0

-------------------------------------------------CS1.3.08-------------------------------------------------
{-
Реализуйте оператор |-|, который возвращает модуль разности переданных ему аргументов:

GHCi>  5 |-| 7
2
-}

x |-| y = abs(x - y)

-------------------------------------------------CS1.4.06-------------------------------------------------
{-
Вспомним функцию discount, которая возвращала итоговую сумму покупки с возможной скидкой. В качестве 
параметров ей передавались сумма без скидки sum, процент скидки proc, причем скидка начислялась, если 
переданная сумма превышает порог limit. Все эти параметры, как и возвращаемое значение, можно хранить в 
типе Double. 
(Здесь следует отметить, что в реальных финансовых приложениях использовать тип с плавающей точкой для 
хранения подобной информации не рекомендуется.) Тип функции можно задать в файле исходного кода вместе с 
ее определением:

discount :: Double -> Double -> Double -> Double
discount limit proc sum = if sum >= limit then sum * (100 - proc) / 100 else sum

Отметим, что объявление типа необязательно, хотя часто рекомендуется в качестве документации. Его обычно 
располагают перед определением функции, хотя это объявление верхнего уровня можно расположить в любом 
месте файла с исходным кодом.

Запишите тип функции standardDiscount, определенной как частичное применение функции discount:

standardDiscount :: ???
standardDiscount = discount 1000 5 
-}

discount :: Double -> Double -> Double -> Double
discount limit proc sum = if sum >= limit then sum * (100 - proc) / 100 else sum

standardDiscount :: Double -> Double
standardDiscount = discount 1000 5


-------------------------------------------------CS1.4.09-------------------------------------------------
{-
Реализуйте функцию twoDigits2Int, которая принимает два символа и возвращает число, составленное из этих 
символов, если оба символа числовые, и 100 в противном случае. (Первый символ рассматривается как 
количество десятков, второй — единиц.)

GHCi> twoDigits2Int '4' '2'
42
-}

import Data.Char
twoDigits2Int :: Char -> Char -> Int
twoDigits2Int x y = if isDigit x && isDigit y then 10 * digitToInt x + digitToInt y else 100


-------------------------------------------------CS1.4.11-------------------------------------------------
{-
Будем задавать точки на плоскости парами типа (Double, Double). Реализуйте функцию dist, которая 
возвращает расстояние между двумя точками, передаваемыми ей в качестве аргументов.

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = ???
-}

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt ((fst p2 - fst p1)^(2) + (snd p2 - snd p1)^(2))



-------------------------------------------------CS1.5.04-------------------------------------------------
{-
Определите функцию, вычисляющую двойной факториал, то есть произведение натуральных чисел, не 
превосходящих заданного числа и имеющих ту же четность. Например: 7!!=7*5*3*1, 8!!=8*6*4*2.
Предполагается, что аргумент функции может принимать только неотрицательные значения.
-}

doubleFact :: Integer -> Integer
doubleFact n = if n == 1 then 1 else if n == 2 then 2 else n * doubleFact (n - 2)


-------------------------------------------------CS1.5.08-------------------------------------------------
{-
Последовательность чисел Фибоначчи 0, 1, 1, 2, 3, 5, 8, 13, 21, легко определить рекурсивно, задав два
первых терминирующих значения и определив любое последующее как сумму двух непосредственно предыдущих:
F0 = 0 
F1 = 1 
Fn = F_n - 1 + F_n - 2 
На Haskell данное определение задаётся следующей функцией:
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
Эта функция определена лишь для неотрицательных чисел. Однако, из данного выше определения можно вывести
формулу для вычисления чисел Фибоначчи при отрицательных индексах, при этом последовательность будет 
следующей:
F_-1 = 1, F_-2 = -1, F_-10 = -55,... 

Измените определение функции fibonacci так, чтобы она была определена для всех целых чисел и порождала 
при отрицательных аргументах указанную последовательность.
-}

fibonacci :: Integer -> Integer
fibonacci n | n == 0    =0
            | n == 1    =1
            | n > 0    =fibonacci(n - 1) + fibonacci(n-2)
            | n == -1    =1
            | n < 0    = fibonacci(n + 2) - fibonacci(n + 1)


-------------------------------------------------CS1.5.10-------------------------------------------------
{-
Реализация функции для вычисления числа Фибоначчи, основанная на прямом рекурсивном определении, крайне 
неэффективна - количество вызовов функции растет экспоненциально с ростом значения аргумента. GHCi 
позволяет отслеживать использование памяти и затраты времени на вычисление выражения, для этого следует 
выполнить команду :set +s:

GHCi> :set +s
GHCi> fibonacci 30
832040
(8.36 secs, 298293400 bytes)

С помощью механизма аккумуляторов попробуйте написать более эффективную реализацию, имеющую линейную 
сложность (по числу рекурсивных вызовов). Как и в предыдущем задании, функция должна быть определена для 
всех целых чисел.
-}

fibonacci :: Integer -> Integer
fibonacci n | n >= 0	= helper n 0 1
			| n < 0		= helperminus n 0 1

helper 0 a b = a
helper 1 a b = b
helper n a b = helper (n - 1) (b) (a + b)

helperminus 0 a b = a
helperminus (-1) a b = b
helperminus n a b = helperminus (n + 1) (b) (a - b) 


-------------------------------------------------CS1.6.06-------------------------------------------------
{-
Реализуйте функцию seqA, находящую элементы следующей рекуррентной последовательности

a_0 = 1; a_1 = 2 ; a_2 = 3; a_k+3 = a_k+2 + a_k+1 - 2 a_k.
Попытайтесь найти эффективное решение.

GHCi> seqA 301
1276538859311178639666612897162414
-}

seqA :: Integer -> Integer
seqA n = helper n 1 2 3

helper 0 b c d = b
helper 1 b c d = c
helper 2 b c d = d

helper a b c d = helper (a - 1) c d (d + c - 2 * b)


-------------------------------------------------CS1.6.08-------------------------------------------------
{-
Реализуйте функцию, находящую сумму и количество цифр десятичной записи заданного целого числа.

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = undefined
GHCi> sum'n'count (-39)
(12,2)
-}

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = (sum, count)
    where (sum, count) = helper (abs(x) `div` 10) (abs(x) `mod` 10) (0)
helper 0 sum count = (sum, count + 1)
helper xd sum count = helper (xd `div` 10) (sum + xd `mod` 10) (count + 1)


-------------------------------------------------CS1.6.09-------------------------------------------------
{-
Реализуйте функцию, находящую значение определённого интеграла от заданной функции ff на заданном 
интервале [a,b][a,b] методом трапеций. (Используйте равномерную сетку; достаточно 1000 элементарных 
отрезков.)

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b = undefined
GHCi> integration sin pi 0
-2.0
Результат может отличаться от -2.0, но не более чем на 1e-4.
-}

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b = helper f a b ((b-a)/1000) 1 (a + ((b-a)/1000)) 0

helper f a b h 1000 xi sum = (h/2)*(sum + f(a) + f(b))
helper f a b h n xi sum = helper f a b h (n + 1) (xi + h) (sum + 2*f(xi))


















-------------------------------------------------CS3.1.3-------------------------------------------------
{-
Реализуйте функцию addTwoElements, которая бы добавляла два переданных ей значения в голову переданного 
списка.

GHCi> addTwoElements 2 12 [85,0,6]
[2,12,85,0,6]
-}

addTwoElements :: a -> a -> [a] -> [a]
addTwoElements x y z = x : y : z

-------------------------------------------------CS3.1.4-------------------------------------------------
{-
Реализуйте функцию nTimes, которая возвращает список, состоящий из повторяющихся значений ее первого 
аргумента.
Количество повторов определяется значением второго аргумента этой функции.
GHCi> nTimes 42 3
[42,42,42]
GHCi> nTimes 'z' 5
"zzzzz"
-}

nTimes:: a -> Int -> [a]
nTimes x y
            | y>0 = helper x y []
            | y == 0 = []
helper x 0 acc = acc
helper x y acc = helper x (y - 1) (x : acc)

