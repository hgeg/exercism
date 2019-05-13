module CryptoSquare (encode) where

import Data.Char

encode :: String -> String
encode xs = chunkify r . concat . transpose . split c $ normalized
  where normalized = map toLower $ filter isAlphaNum xs  
        (r, c) = size.length $ normalized

split :: Int -> String -> [String]   
split c xs 
  | length xs > c = take c xs : (split c $ drop c xs)
  | otherwise     = [xs ++ pad c ]
  where pad n = take n . repeat $ ' '

transpose :: [String] -> [String]
transpose xs
  | (length.head) xs > 0 = firstLetters xs : (transpose $ restOfIt xs)
  | otherwise            = []
  where firstLetters = map head
        restOfIt    = map tail

chunkify :: Int -> String -> String
chunkify r xs 
  | r == 0         = xs
  | length xs == 0 = xs
  | otherwise      = take r xs ++ " " ++ (chunkify r $ drop r xs)

size :: Int -> (Int, Int)
size len = (r, c)
  where c = ceiling . sqrt . conv $ len
        r = ceiling $ conv len / conv c
        conv n = fromIntegral n :: Double 
