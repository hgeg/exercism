module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n = map row [1..n] 

row :: Int -> [Integer]
row 1 = [1]
row n = zipWith (+) prev $ reverse prev
  where prev = 0 : row (n-1)
