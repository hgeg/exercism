module ResistorColors (Color(..), value) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Show, Read)

digit :: Color -> Char
digit Black  = '0'
digit Brown  = '1'
digit Red    = '2'
digit Orange = '3'
digit Yellow = '4'
digit Green  = '5'
digit Blue   = '6'
digit Violet = '7'
digit Grey   = '8'
digit White  = '9'

value :: [Color] -> Int
value = read . map digit
