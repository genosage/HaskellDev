insertList :: Ord a => a -> [a] -> [a]
insertList t [] = [t]
insertList t (x:xs)
    | x < t = x:insertList t xs
    | otherwise = t:x:xs