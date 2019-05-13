module Minesweeper (annotate) where

import Data.List (intersect)

data Cell = M | N Int deriving Eq
instance Show Cell where
  show M     = "*"
  show (N 0) = " "
  show (N x) = show x

cell :: Char -> Cell
cell '*' = M
cell _   = N 0

annotate :: [String] -> [String]
annotate [] = []
annotate m  = partition w . unmap . mark w mpos . remap $ flat
  where w    = length . head $ m
        flat = concat m
        mpos = map fst . filter ((=='*') . snd) $ zip [0..] flat 

remap :: String -> [Cell]
remap = map cell

mark :: Int -> [Int] -> [Cell] -> [Cell]
mark w m = zipWith update [0..]
  where count       = length . intersect m . neighbors
        neighbors i = [i+oh+ov | oh <- [1, 0, -1],
                                 ov <- [w, 0, -w],
                                 let r = rem i w , 
                                 oh + r >= 0     ,
                                 oh + r < w      ]
        update :: Int -> Cell -> Cell
        update _ M = M
        update i _ = N $ count i

unmap :: [Cell] -> String
unmap = concatMap show

partition :: Int -> String -> [String]
partition i l
    | i < length l = fst p : partition i (snd p)
    | otherwise    = [l]
  where p = splitAt i l
