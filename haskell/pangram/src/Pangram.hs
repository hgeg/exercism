module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram = match . lower
  where lower = map toLower
        match str = all (`elem` str) ['a'..'z']
