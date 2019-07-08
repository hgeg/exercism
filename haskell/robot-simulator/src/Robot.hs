module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

type Coordinates = (Integer, Integer)

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum, Bounded)

class (Eq a, Bounded a, Enum a) => Direction a where
    left :: a -> a
    left  v = if v == minBound then maxBound else pred v
    right :: a -> a
    right v = if v == maxBound then minBound else succ v

instance Direction Bearing

data Robot = Robot {
  bearing     :: Bearing,
  coordinates :: (Integer, Integer) 
}

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move r           []         = r
move (Robot b c) ('R':rest) = move (Robot (right b) c)      rest
move (Robot b c) ('L':rest) = move (Robot (left  b) c)      rest
move (Robot b c) ('A':rest) = move (Robot b (advance b c))  rest
  where advance :: Bearing -> Coordinates -> Coordinates
        advance North (x, y) = (x, y+1)
        advance East  (x, y) = (x+1, y)
        advance South (x, y) = (x, y-1)
        advance West  (x, y) = (x-1, y)
move _           _         = error "invalid instructions"

