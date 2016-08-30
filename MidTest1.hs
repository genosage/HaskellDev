merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge lst [] = lst
merge [] lst = lst
merge (x:xs) (y:ys)
  | x < y = x : (merge xs (y:ys))
  | otherwise = y : (merge (x:xs) ys)

data Tree a = Empty | Node (Tree a) a (Tree a)
  deriving(Show)

add :: Ord a => a -> Tree a -> Tree a
add a Empty = Node Empty a Empty
add a (Node l b r)
  | a < b = Node (add a l) b r
  | otherwise = Node l b (add a r)