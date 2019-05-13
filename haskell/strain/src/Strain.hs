module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not.p)

keep :: (a -> Bool) -> [a] -> [a]
keep p (x:xs) = case p x of
                  True  -> x : (keep p xs)
                  False -> keep p xs
keep _ []     = []
