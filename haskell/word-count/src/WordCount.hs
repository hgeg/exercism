module WordCount (wordCount) where

import Data.Char

wordCount :: String -> [(String, Int)]
wordCount = enumerate 
          . filter (not . null) 
          . map normalize 
          . words 
          . map (\c -> if c == ',' then ' ' else toLower c)

normalize :: String -> String
normalize ('\'':w) = normalize . init $ w
normalize word     = filter (\c -> not $ (isPunctuation c || isSymbol c) && c/='\'') word

enumerate :: [String] -> [(String, Int)]
enumerate []       = []
enumerate w@(x:xs) = (x,c) : enumerate rest  
  where rest = filter (/=x) xs
        c    = length w - length rest
