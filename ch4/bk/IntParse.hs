import Data.Char (digitToInt, isDigit)
import Data.List (foldl')

asInt :: String -> Maybe Int
asInt str = foldl' acc (Just 0) str
    where acc (Just num) c 
            | (isDigit c) = Just $ (num*10) + (digitToInt c)
            | otherwise = Nothing
          acc Nothing _ = Nothing
 