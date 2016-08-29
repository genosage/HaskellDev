myAppend :: [a] -> [a] -> [a]
myAppend [] lst = lst
myAppend (x:xs) lst = x:(myAppend xs lst)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

getNthElem :: Int -> [a] -> a
getNthElem i [] = error "Stupid!"
getNthElem i lst
    | i < 1 = error "Stupid!"
    | i == 1 = head lst
    | otherwise = getNthElem (i-1) (tail lst)

factorial :: Int -> Int
factorial i
     | i < 0 = error "Stupid!"
     | i == 0 = 1
     | otherwise = i * (factorial (i-1))

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs)
    | a == x = True
    | otherwise = myElem a xs

longestPrefix :: String -> String -> String
longestPrefix _ [] = []
longestPrefix [] _ = []
longestPrefix (x:xs) (y:ys)
    | x == y = [x] ++ longestPrefix xs ys
    | otherwise = []

minToMax :: Int -> Int -> [Int]
minToMax min max
    | min > max = []
    | otherwise = [min] ++ minToMax (min+1) max