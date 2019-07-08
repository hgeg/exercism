module TwelveDays (recite) where

import Data.List (intercalate)

gift :: Int -> String
gift n = intercalate ", " . reverse . take (n+1) $
    firstGift : ["two Turtle Doves","three French Hens","four Calling Birds","five Gold Rings","six Geese-a-Laying","seven Swans-a-Swimming","eight Maids-a-Milking","nine Ladies Dancing","ten Lords-a-Leaping","eleven Pipers Piping","twelve Drummers Drumming"]
  where firstGift = if n==0 then "a Partridge in a Pear Tree" else "and a Partridge in a Pear Tree" 

day :: Int -> String
day = (!!) ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

recite :: Int -> Int -> [String]
recite start stop = map verse [start-1..stop-1]
    where verse d = "On the " ++ day d ++ " day of Christmas my true love gave to me: " ++ gift d ++ "."
