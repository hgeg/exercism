module Anagram (anagramsFor) where

import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\ac -> smallCase ac /= small
                                 && lexNum (smallCase ac) == lexSm) xss
  where small = smallCase xs
        lexSm = lexNum small

lexNum :: String -> Int
lexNum xs = product $ map pridx xs

smallCase :: String -> String
smallCase = map toLower

pridx :: Char -> Int
pridx ' ' = 2
pridx x   = primes !! (ord x - 97)

primes :: [Int]
primes = [3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113]
