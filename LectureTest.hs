countdown :: Int -> IO ()
countdown 0 = putStrLn "Done"
countdown n = do
    putStrLn (show n)
    countdown (n-1)

main = do
    putStrLn "Input Number:"
    n <- getLine
    countdown (read n)