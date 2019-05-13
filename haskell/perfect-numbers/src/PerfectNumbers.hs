module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify num
  | num < 1        = Nothing
  | aliquot == num = Just Perfect --like me
  | aliquot >  num = Just Abundant
  | aliquot <  num = Just Deficient
  | otherwise      = Nothing
  where aliquot = sum factors
        factors = [x | x <- [1..half], num `rem` x == 0]
        half    = div num 2
