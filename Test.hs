module Main where
 
factorial n = if n == 0 then 1 else n * factorial (n - 1)
 
main = do putStrLn "What is 5! ?"
          x <- readLn
          if x == factorial 5
              then putStrLn "You're right!"
              else putStrLn "You're wrong!"

data List a = Cons a (List a)
            | Nil
            deriving (Show)

tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing