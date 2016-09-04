module Proj1 (feedback, initialGuess, nextGuess, GameState) where
  
import Card
import Data.List

type GameState = [[Card]]

-- answer -> guess
feedback :: [Card] -> [Card] -> (Int,Int,Int,Int,Int)
feedback lst1 lst2 = (i1,i2,i3,i4,i5)
    where i1 = correctCard lst1 lst2
          i3 = correctRank lst1 lst2
          i5 = correctSuit lst1 lst2
          (i2,i4) = lowerAndHigher lst1 lst2 


correctCard :: [Card] -> [Card] -> Int
correctCard [] _ = 0
correctCard (x:xs) lst
    | elem x lst = i+1
    | otherwise = i
    where i = correctCard xs lst


correctSuit :: [Card] -> [Card] -> Int
correctSuit [] _ = 0
correctSuit ((Card s r):xs) lst
    | elem targetSuit suitList = i2+1
    | otherwise = i1
    where suitList = map (`div` 13) (map fromEnum lst)
          targetSuit = fromEnum s
          index = eliminate (elemIndex targetSuit suitList)
          i1 = correctSuit xs lst
          i2 = correctSuit xs (removeElem index lst)


correctRank :: [Card] -> [Card] -> Int
correctRank [] _ = 0
correctRank ((Card s r):xs) lst
    | elem targetRank rankList = i2+1
    | otherwise = i1
    where rankList = map (`mod` 13) (map fromEnum lst)
          targetRank = fromEnum r
          index = eliminate (elemIndex targetRank rankList)
          i1 = correctRank xs lst
          i2 = correctRank xs (removeElem index lst)


lowerAndHigher :: [Card] -> [Card] -> (Int,Int)
lowerAndHigher [] _ = (0,0)
lowerAndHigher ((Card s r):xs) lst
    | targetRank < (head sortedRankLst) = (i1+1,i2)
    | targetRank > (last sortedRankLst) = (i1,i2+1)
    | otherwise = (i1,i2)
    where sortedRankLst = sort (map (`mod` 13) (map fromEnum lst))
          targetRank = fromEnum r
          (i1,i2) = lowerAndHigher xs lst


initialGuess :: Int -> ([Card],GameState)
initialGuess i = (initialGuessHelper i, combination i lst)
    where lst = ([minBound..maxBound] :: [Card])


nextGuess :: ([Card],GameState) -> (Int,Int,Int,Int,Int) -> ([Card],GameState)
nextGuess (lst, gameState) fTuple = (lst1, gameState1)
    where gameState1 = [gs | gs <- gameState, feedback gs lst == fTuple]
          lst1 = gameState1!!0

removeElem :: Int -> [a] -> [a]
removeElem _ [] = []
removeElem i (x:xs)
    | i < 0 = error "Index is less than 0!"
    | i == 0 = xs
    | otherwise = x:(removeElem (i-1) xs)


eliminate :: Maybe Int -> Int
eliminate Nothing = -1
eliminate (Just i) = i


initialGuessHelper :: Int -> [Card]
initialGuessHelper i
    | i == 2 = [Card Club R6, Card Heart R10]
    | i == 3 = [Card Club R4, Card Heart R8, Card Spade Queen]
    | i == 4 = [Card Club R3, Card Diamond R6, Card Heart R9, Card Spade Queen]


combination :: Int -> [a] -> [[a]]
combination 0 _ = [[]]
combination _ [] = []
combination n xs@(y:ys)
    | n < 0     = []
    | otherwise = case drop (n-1) xs of
                  [ ] -> []
                  [_] -> [xs]
                  _   -> [y:c | c <- combination (n-1) ys] ++ combination n ys









