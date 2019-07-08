module Matrix (saddlePoints) where

import Data.Array (Array, Ix, assocs)

saddlePoints :: (Ix a, Ix b, Num a, Num b, Ord e) => Array (a, b) e -> [(a,b)]
saddlePoints matrix = map fst . filter (isSaddle) $ unwrapped
  where isSaddle ((r, c), e) = all (<=e) (getRow r) && all (>=e) (getCol c)
        getRow r  = map snd . filter ((==r) . fst . fst) $ unwrapped
        getCol c  = map snd . filter ((==c) . snd . fst) $ unwrapped
        unwrapped = assocs matrix

