module Isogram (isIsogram) where

import Data.Char

isIsogram :: String -> Bool
isIsogram word = (reduced lower) == lower
  where lower = map toLower word

reduced :: String -> String
reduced = foldr 
            (\c cs -> 
              if noRepeatCond c cs
                then cs 
                else c:cs
            ) ""
  where noRepeatCond c cs = isAlpha c 
                         && c `elem` cs 
