module Diamond (diamond) where

diamond :: Char -> Maybe [String]
diamond c 
  | c<'A' || c > 'Z' = Nothing
  | otherwise        = Just . mirrored $ map (expand c) ['A'..c]

expand :: Char -> Char -> String
expand end chr = mirrored $ map match $ reverse ['A'..end]
  where match x = (if chr == x then chr else ' ')

mirrored :: [a] -> [a]
mirrored [] = []
mirrored xs = xs ++ rs
  where (_:rs) = reverse xs
