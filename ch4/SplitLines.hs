splitLines :: String -> [String]
splitLines [] = []
splitLines cs = 
    let (pre, suf) = break isLineTerminator cs
    in if pre==""
       then splitLines $ drop 1 suf
       else pre : case suf of 
                ('\r':'\n':rest) -> splitLines rest
                ('\r':rest) -> splitLines rest
                ('\n':rest) -> splitLines rest
                _ -> []

isLineTerminator c = c=='\r' || c=='\n'

