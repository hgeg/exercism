module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = compareLengths >> Just calculateDiff
  where compareLengths = if length xs == length ys then Just 0 else Nothing
        calculateDiff  = length . filter id $ zipWith (/=) xs ys
