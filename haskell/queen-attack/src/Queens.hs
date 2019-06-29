module Queens (boardString, canAttack) where

import Data.List (intersperse)

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines [ intersperse ' ' [queenCheck (Just (r, c)) | c <- [0..7]] | r <- [0..7] ]
  where queenCheck sq 
          | sq == white = 'W'
          | sq == black = 'B'
          | otherwise  = '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (rw, cw) (rb, cb) = rdiff==cdiff || rdiff==0 || cdiff==0
  where rdiff = abs $ rw - rb
        cdiff = abs $ cw - cb
