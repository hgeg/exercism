module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number phone = consumeDigits . zip [isp..] digits
  where digits = filter isDigit phone
        isp    = if length digits == 10 then 1 else 0  

consumeDigits :: [(Integer, Char)] -> Maybe String
consumeDigits ((0, d):ds) = is29
consumeDigits ((1, d):ds) = 


is29 c = c>='2' && c<='9'
