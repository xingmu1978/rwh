import Data.Char (digitToInt)

asInt :: String -> Either String Int
asInt xs = loop (Right 0) xs

loop :: Either String Int -> String -> Either String Int 
loop acc [] = acc
loop (Left msg) _ = Left msg
loop (Right acc) (x:xs) =
    if x `elem` ['0'..'9']
    then loop (Right (acc*10 + digitToInt x)) xs
    else Left "illegal int string"
    
