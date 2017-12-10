import System.Environment (getArgs)
import System.Directory (doesFileExist)

main :: IO()
main = do
    args <- getArgs
    let filename = case args of -- Note that the indentation must be the same as case
                        (a:_) -> a 
                        _ -> "input.txt"

    exists <- doesFileExist filename
    input <- if exists then readFile filename else return ""
    
    print $ countWords input

countWords :: String -> [Int]
countWords input = map (length.words) (lines input)