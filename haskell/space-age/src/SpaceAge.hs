module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

fromEarthYear :: Planet -> Float
fromEarthYear planet = case planet of
  Mercury ->   0.24084670
  Venus   ->   0.61519726
  Earth   ->   1.00000000
  Mars    ->   1.88081580
  Jupiter ->  11.86261500
  Saturn  ->  29.44749800
  Uranus  ->  84.01684600
  Neptune -> 164.79132000

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / (31557600 * fromEarthYear planet)
