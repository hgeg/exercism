module Prime (nth) where

nth :: Int -> Maybe Integer
nth n 
  | n>0       = Just . head . drop (n-1) $ primes
  | otherwise = Nothing

primes :: [Integer]
primes = filter isPrime [2..]
  where isPrime n = all (\x -> rem n x /= 0) [2..limit n]
        limit n = floor . sqrt . fromIntegral $ n
