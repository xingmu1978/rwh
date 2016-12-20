import Data.Char (isSpace)
data Color = Red | Green | Blue

class BasicEq a where
    isEqual :: a -> a -> Bool

instance Show Color where
    show Red   = "Red"
    show Green = "Green"
    show Blue  = "Blue"

trimLeadingSpaces xs = dropWhile isSpace xs

--dropSpaceTail maybeStuff "" = ""
--dropSpaceTail maybeStuff (x:xs)
--        | isSpace x = dropSpaceTail (x:maybeStuff) xs
--        | null maybeStuff = x : dropSpaceTail "" xs
--        | otherwise = reverse maybeStuff ++ x : dropSpaceTail "" xs

dropSpaceTail = reverse . trimLeadingSpaces . reverse

instance Read Color where
    readsPrec _ value =
        tryParse [("Red", Red), ("Green", Green), ("Blue", Blue)]
        where value' = dropWhile isSpace value
              tryParse [] = []
              tryParse ((attempt, result):xs) =
                if (take (length attempt) value') == attempt
                    then [(result, drop (length attempt) value')]
                    else tryParse xs

