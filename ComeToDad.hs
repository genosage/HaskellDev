import Data.List
import Data.Char

-- main ::IO ()
-- main = do
--     putStrLn "Table of squares:"
--     print_table 1 10

-- print_table :: Int -> Int -> IO ()
-- print_table cur max
--     | cur > max = return ()
--     | otherwise = do
--         putStrLn (table_entry cur)
--         print_table (cur+1) max

-- table_entry :: Int -> String
-- table_entry n = (show n) ++ "^2 = " ++ (show (n*n))


-- exclusive_or :: Bool -> Bool -> Bool
-- exclusive_or a b
--     | a == b = False
--     | otherwise = True

-- append_list :: [a] -> [a] -> [a]
-- append_list [] list = list
-- append_list (x:xs) list = x:(append_list xs list)

-- myReverse :: [a] -> [a]
-- myReverse [] = []
-- myReverse (x:xs) = (myReverse xs) ++ [x]

-- getNthElem :: Int -> [a] -> a
-- getNthElem 1 (x:xs) = x
-- getNthElem n (x:xs) = getNthElem (n-1) xs

-- factorial :: Int -> Int
-- factorial 0 = 1
-- factorial n = n * (factorial (n-1))

-- myElem :: Eq a => a -> [a] -> Bool
-- myElem _ [] = False
-- myElem n (x:xs)
--     | n == x = True
--     | otherwise = myElem n xs

-- longestPrefix :: Eq a => [a] -> [a] -> [a]
-- longestPrefix [] _ = []
-- longestPrefix _ [] = []
-- longestPrefix (x:xs) (y:ys)
--     | x == y = x:(longestPrefix xs ys)
--     | otherwise = []

-- mccarthy_91 :: Int -> Int
-- mccarthy_91 n = mccarthy_91' n 1
-- mccarthy_91' n 0 = n
-- mccarthy_91' n c
--     | n > 100 = mccarthy_91' (n-10) (c-1)
--     | otherwise = mccarthy_91' (n+11) (c+1)

-- min_max :: Int -> Int -> [Int]
-- min_max min max = [min..max]

-- ftoc :: Double -> Double
-- ftoc f = (5/9)*(f-32)

-- merge_list :: Ord a => [a] -> [a] -> [a]
-- merge_list [] list = list
-- merge_list list [] = list
-- merge_list (x:xs) (y:ys)
--     | x < y = x:(merge_list xs (y:ys))
--     | otherwise = y:(merge_list (x:xs) ys)

-- quicksort :: Ord a => [a] -> [a]
-- quicksort [] = []
-- quicksort (x:xs) = quicksort (filter (<=x) xs) ++ [x] ++ quicksort (filter (>x) xs)


-- data Tree k v = Leaf | Node k v (Tree k v) (Tree k v)
--         deriving (Eq, Show)

-- same_shape :: Tree a b -> Tree c d -> Bool
-- same_shape Leaf Leaf = True
-- same_shape Leaf (Node k v l r) = False
-- same_shape (Node k v l r) Leaf = False
-- same_shape (Node a b l1 r1) (Node c d l2 r2) = (same_shape l1 l2) && (same_shape r1 r2)

-- data Expression = Var Variable
--             | Num Integer
--             | Plus Expression Expression
--             | Minus Expression Expression
--             | Times Expression Expression
--             | Div Expression Expression

-- data Variable = A | B

-- eval :: Integer -> Integer -> Expression -> Integer
-- eval a _ (Var A) = a
-- eval _ b (Var B) = b
-- eval _ _ (Num n) = n


-- data Tree v = Leaf | Node v (Tree v) (Tree v)

-- tree_sort :: Ord a => [a] -> [a]
-- tree_sort [] = []
-- tree_sort list = print_tree (insert_list list)

-- insert_list :: Ord a => [a] -> Tree a
-- insert_list [] = Leaf
-- insert_list (x:xs) = insert_elem x (insert_list xs)

-- insert_elem :: Ord a => a -> Tree a -> Tree a
-- insert_elem a Leaf = Node a Leaf Leaf
-- insert_elem a (Node b l r)
--     | a <= b = Node b (insert_elem a l) r
--     | otherwise = Node b l (insert_elem a r)

-- print_tree :: Ord a => Tree a -> [a]
-- print_tree Leaf = []
-- print_tree (Node a l r) = (print_tree l) ++ [a] ++ (print_tree r)


-- transpose :: [[a]] -> [[a]]
-- transpose [[]] = [[]]
-- transpose [x] = [x]
-- transpose (x:xs) = transpose_helper x xs

-- transpose_helper :: [a] -> [[a]] -> [[a]]
-- transpose_helper [] _ = []
-- transpose_helper [x] [[]] = [[x]]
-- transpose_helper (x:xs) list = (x:(map head list)):(transpose_helper xs (map tail list))

-- list_triple :: Num a => [a] -> (a,a,a)
-- list_triple [] = (0,0,0)
-- list_triple (x:xs) = (i1+1,i2+x,i3+x*x)
--     where (i1,i2,i3) = list_triple xs


-- maybeApply :: (a -> b) -> Maybe a -> Maybe b
-- maybeApply _ Nothing = Nothing
-- maybeApply f (Just a) = Just (f a)

-- zWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-- zWith _ [] _ = []
-- zWith _ _ [] = []
-- zWith f (x:xs) (y:ys) = (f x y):(zWith f xs ys)

-- linearEqn :: Num a => a -> a -> [a] -> [a]
-- linearEqn _ _ [] = []
-- linearEqn a b list = map (+b) (map (*a) list)

-- sqrtPM :: (Floating a, Ord a) => a -> [a]
-- sqrtPM x
--     | x > 0 = let y = sqrt x in [y, -y] 
--     | x == 0 = [0]
--     | otherwise = []

-- allSqrts :: (Floating a, Ord a) => [a] -> [a]
-- allSqrts list = concat (map sqrtPM list)

-- filter_map :: (Floating a, Ord a) => [a] -> [a]
-- filter_map list = map sqrt (filter (>=0) list)

-- new_filter_map :: (Floating a, Ord a) => [a] -> [a]
-- new_filter_map [] = []
-- new_filter_map (x:xs)
--     | x >= 0 = (sqrt x):(new_filter_map xs)
--     | otherwise = new_filter_map xs


-- maybe_tail :: [a] -> Maybe [a]
-- maybe_tail [] = Nothing
-- maybe_tail (x:xs) = Just xs

-- maybe_drop1 :: Int -> [a] -> Maybe [a]
-- maybe_drop1 n list
--     | n <= 0 = Just list
--     | otherwise = case result of
--         Nothing -> Nothing
--         Just l -> maybe_drop1 (n-1) l
--     where result = maybe_tail list

-- maybe_drop2 :: Int -> [a] -> Maybe [a]
-- maybe_drop2 n list
--     | n <= 0 = Just list
--     | otherwise = (maybe_tail list) >>= (maybe_drop2 (n-1))

-- data Tree a = Empty | Node (Tree a) a (Tree a)

-- print_tree :: Show a => Tree a -> IO ()
-- print_tree Empty = putStr ""
-- print_tree (Node l a r) = do
--     print_tree l
--     print a
--     print_tree r

-- str_to_num :: String -> Maybe Int
-- str_to_num [] = Nothing
-- str_to_num list = str_to_num' list 0

-- char_to_num :: Char -> Maybe Int
-- char_to_num x
--     | isDigit x = Just (digitToInt x)
--     | otherwise = Nothing

-- str_to_num' :: String -> Int -> Maybe Int
-- str_to_num' [] sum = Just sum
-- str_to_num' (x:xs) sum = do
--     n <- char_to_num x
--     sum1 <- str_to_num' xs (sum*10+n)
--     return sum1

-- lines_to_num :: IO Int
-- lines_to_num = do
--     line <- getLine
--     let num = str_to_num line in
--         case num of
--             Nothing -> return 0
--             Just n -> do
--                 sum <- lines_to_num
--                 return (n+sum)

-- fibs :: Int -> [Integer]
-- fibs 0 = []
-- fibs 1 = [0]
-- fibs n = [0, 1] ++ fibs_helper 0 1 (n-2)

-- fibs_helper _ _ 0 = []
-- fibs_helper a b n = (a+b):(fibs_helper b (a+b) (n-1))


-- Question 1
-- Ord a => a -> a -> Bool
-- Num a => [a] -> [a]
-- error
-- [1,2]
-- error


-- Question 3
data Distance = Feet Float | Meters Float

-- Question 4
data Test = A | B | C
    deriving (Eq, Ord)

-- Question 6
data Ttree t = Nil | Node3 t (Ttree t) (Ttree t) (Ttree t)

same_shape :: Ttree t -> Ttree t -> Bool
same_shape Nil Nil = True
same_shape Nil (Node3 _ _ _ _) = False
same_shape (Node3 _ _ _ _) Nil = False
same_shape (Node3 _ l1 m1 r1) (Node3 _ l2 m2 r2) = same_shape l1 l2 && same_shape m1 m2 && same_shape r1 r2

subsequences1 :: [a] -> [[a]]
subsequences1 [] = [[]]
subsequences1 (x:xs) = (subsequences1 xs) ++ (map (x:) (subsequences1 xs))




