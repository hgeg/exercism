module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate ""       = ""
abbreviate (' ':xs) = abbreviate xs
abbreviate ('-':xs) = abbreviate xs
abbreviate (x  :xs) 
  | isLetter x      = (toUpper x) : (abbreviate $ rest xs)
  | otherwise       = abbreviate $ rest xs
  
rest :: String -> String 
rest xs =  dropWhile isLower $ dropWhile isUpper xs
