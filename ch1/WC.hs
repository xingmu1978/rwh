
main = interact wordCount
    where wordCount input = (show . sum . \input -> (map (length . words) (lines input))) input ++ "\n"
