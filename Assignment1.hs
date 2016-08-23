module Assignment1 (elementPosition, everyNth, elementBefore) where

    elementPosition :: Eq t => t -> [t] -> Int
    elementPosition elt (x:xs)
        | elt == x = 0
        | otherwise = 1 + elementPosition elt xs
    elementPosition _ [] = error "illegal!"

    everyNth :: Int -> [t] -> [t]
    everyNth 0 _ = error "illegal!"
    everyNth n lst
        | n > length lst = []
        | otherwise = head (drop (n - 1) lst) : everyNth n (drop n lst)

    elementBefore :: Eq a => a -> [a] -> Maybe a
    elementBefore _ [_] = Nothing
    elementBefore _ [] = Nothing
    elementBefore elt (x:xs)
        | elt == x = Nothing
        | elt == head xs = Just x
        | otherwise = elementBefore elt xs