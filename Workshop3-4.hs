data Tree v = Leaf | Node v (Tree v) (Tree v)

add :: Ord a => a -> Tree a -> Tree a
add n Leaf = Node n Leaf Leaf
add n (Node v l r) = if n < v then Node v (add n l) r else Node v l (add n r)

addList :: Ord a => [a] -> Tree a
addList [] = Leaf
addList (x:xs) = add x (addList xs)

printTree :: Ord a => Tree a -> [a]
printTree Leaf = []
printTree (Node v l r) = (printTree l) ++ [v] ++ (printTree r)

sortList :: Ord a => [a] -> [a]
sortList [] = []
sortList lst = printTree (addList lst)


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

mergeList :: Ord a => [a] -> [a] -> [a]
mergeList [] lst = lst
mergeList lst [] = lst
mergeList (x:xs) (y:ys)
    | x < y = x:(mergeList xs (y:ys))
    | otherwise = y:(mergeList (x:xs) ys)


quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort (filter (<=x) xs) ++ [x] ++ quickSort (filter (>x) xs)

--data Tree k v = Leaf | Node k v (Tree k v) (Tree k v)
--    deriving (Eq, Show)

--same_shape :: Tree a b -> Tree c d -> Bool
--same_shape Leaf Leaf = True
--same_shape Leaf (Node k v l r) = False
--same_shape (Node k v l r) Leaf = False
--same_shape (Node k1 v1 l1 r1) (Node k2 v2 l2 r2) = (same_shape l1 l2) && (same_shape r1 r2)

data Expression = 
    Var Variable
    | Num Integer
    | Plus Expression Expression
    | Minus Expression Expression
    | Times Expression Expression
    | Div Expression Expression

data Variable = A | B

eval :: Integer -> Integer -> Expression -> Integer
eval a _ (Var A) = a
eval _ b (Var B) = b
eval a b (Num n) = n
eval a b (Plus e1 e2) = (eval a b e1) + (eval a b e2)
eval a b (Minus e1 e2) = (eval a b e1) - (eval a b e2)
eval a b (Times e1 e2) = (eval a b e1) * (eval a b e2)
eval a b (Div e1 e2) = (eval a b e1) `div` (eval a b e2)


transpose :: [[a]] -> [[a]]
transpose [] = error "transpose of zero-height matrix"
transpose list@(xs:xss)
  | len > 0   = transpose' len list
  | otherwise = error "transpose of zero-width matrix"
  where len = length xs

transpose' :: Int -> [[a]] -> [[a]]
transpose' len [] = replicate len []
transpose' len (xs:xss)
  | len == length xs = zipWith (:) xs (transpose' len xss)
  | otherwise = error "transpose of non-rectangular matrix"
