data Tree v = Leaf | Node v (Tree v) (Tree v)

add :: Ord a => a -> Tree a -> Tree a
add n Leaf = Node n Leaf Leaf
add n (Node v l r) = if n < v the:t n Node v (add n l) r else Node v l (add n r)

tripleList :: Num a => [a] -> (a,a,a)
tripleList [] = (0,0,0)
tripleList lst = (lengthList lst,sumList lst,sumSquareList lst)

lengthList :: Num a => [a] -> a
lengthList [] = 0
lengthList (x:xs) = 1 + lengthList xs

sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x:xs) = x + sumList xs

sumSquareList :: Num a => [a] -> a
sumSquareList [] = 0
sumSquareList (x:xs) = x * x + sumSquareList xs

tripleListOnepass :: Num a => [a] -> (a,a,a)
tripleListOnepass [] = (0,0,0)
tripleListOnepass (x:xs) = let (length,sum,sumSquare) = tripleListOnepass xs
                            in (length+1,sum+x,sumSquare+x*x)