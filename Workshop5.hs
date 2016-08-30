maybeApply :: (a -> b) -> Maybe a -> Maybe b
maybeApply _ Nothing = Nothing
maybeApply f (Just a) = Just (f a)


zWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zWith _ [] _ = []
zWith _ _ [] = []
zWith f (x:xs) (y:ys) = (f x y) : (zWith f xs ys)


linearEqn :: Num a => a -> a -> [a] -> [a]
linearEqn _ _ [] =[]
linearEqn a b lst = map (+b) (map (*a) lst)


sqrtPM :: (Floating a, Ord a) => a -> [a]
sqrtPM x
  | x > 0 = let y = sqrt x in [y, -y]
  | x == 0 = [0]
  | otherwise = []

allSqrts :: (Floating a, Ord a) => [a] -> [a]
allSqrts [] = []
allSqrts (x:xs) = (sqrtPM x) ++ (allSqrts xs)


sqrtList :: (Floating a, Ord a) => [a] -> [a]
sqrtList [] = []
sqrtList lst = map sqrt (filter (>=0) lst)

sqrtListOnce :: (Floating a, Ord a) => [a] -> [a]
sqrtListOnce [] = []
sqrtListOnce (x:xs)
  | x >= 0 = (sqrt x) : (sqrtListOnce xs)
  | otherwise = sqrtListOnce xs