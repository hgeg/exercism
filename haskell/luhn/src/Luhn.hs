module Luhn (isValid) where

import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid n 
  | length sanitized > 1 = (==0) . (`rem` 10) . sum . skipDouble $ sanitized
  | otherwise            = False
  where skipDouble = map reduce . zipWith (*) (cycle [1,2])
        sanitized  = map digitToInt . filter isDigit . reverse $ n 
        reduce x   = if x>9 then x-9 else x
