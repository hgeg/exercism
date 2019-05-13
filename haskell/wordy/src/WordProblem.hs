module WordProblem (answer) where

import Text.Read (readMaybe)
import Control.Monad ((>=>))

data Expr = Plus  Expr Expr
          | Minus Expr Expr
          | Mult  Expr Expr
          | Div   Expr Expr
          | Term  Integer
  deriving (Eq, Show)

answer :: String -> Maybe Integer
answer = clean >=> parse >=> Just <$> eval

eval :: Expr -> Integer
eval (Term t)     = t
eval (Plus  t1 t2) = eval t1 + eval t2
eval (Minus t1 t2) = eval t1 - eval t2
eval (Mult  t1 t2) = eval t1 * eval t2
eval (Div   t1 t2) = div (eval t1) (eval t2)

parse :: [String] -> Maybe Expr
parse []  = Nothing
parse [t] = Term <$> (readMaybe t :: Maybe Integer)
parse lst 
    | op == "plus"          = Just Plus  <*> t1 <*> t2 
    | op == "minus"         = Just Minus <*> t1 <*> t2
    | op == "multiplied"    = Just Mult  <*> t1 <*> t2 
    | op == "divided"       = Just Div   <*> t1 <*> t2
    | otherwise             = Nothing 
  where p  = init lst
        op = last p
        t1 = parse . init $ p
        t2 = parse [last lst]

clean :: String -> Maybe [String] 
clean raw = case words . init $ raw of
              ("What":"is":ts) -> Just $ filter (/="by") ts
              _                -> Nothing

