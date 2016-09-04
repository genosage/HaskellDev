import Card
import Data.List

sumList :: [Int] -> Int

sumList [] = 0
sumList (x:xs) = x + sumList xs

testIf :: [Int] -> Int
testIf [] = 0
testIf lst1
    | elem 5 [1,2,3]  = 1
    | otherwise = length lst2
    where lst2 = ([minBound..maxBound] :: [Card])

removeElem :: Int -> [a] -> [a]
removeElem _ [] = []
removeElem i (x:xs)
    | i < 0 = error "Index is less than 0!"
    | i == 0 = xs
    | otherwise = x:(removeElem (i-1) xs)

eliminate :: Maybe Int -> Int
eliminate Nothing = -1
eliminate (Just i) = i

--combinationHelper :: [a] -> [[a]]
--combinationHelper [] =  [[]]
--combinationHelper (x:xs) = (map (x:) (combinationHelper xs)) ++ (combinationHelper xs)

--combination :: Int -> [a] -> [[a]]
--combination i lst = [lst1 | lst1 <- combinationHelper lst, length lst1 == i] 

combination :: Int -> [a] -> [[a]]
combination 0 _ = [[]]
combination _ [] = []
combination n xs@(y:ys)
  | n < 0     = []
  | otherwise = case drop (n-1) xs of
                  [ ] -> []
                  [_] -> [xs]
                  _   -> [y:c | c <- combination (n-1) ys] ++ combination n ys