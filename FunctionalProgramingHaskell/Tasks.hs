


----------CS3.1.3----------

nTimes:: a -> Int -> [a]
nTimes x y
            | y>0 = helper x y []
            | y == 0 = []

helper x 0 acc = acc
helper x y acc = helper x (y - 1) (x : acc)