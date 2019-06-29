module Phone (number) where

import Data.Char (isDigit)
import Control.Monad

number :: String -> Maybe String
number phone = case length digits of
                 11 -> m1 d >> validate ds
                 10 -> validate digits
                 _  -> Nothing
  where digits@(d:ds) = filter isDigit phone
        validate = foldr (liftM2 (:)) (Just "") .
                   zipWith ($) [m29, m09, m09, m29, m09, m09, m09, m09, m09, m09]
        m1  c    = toMaybe "" $ c == '1'
        m09 c    = toMaybe c  $ '0' <= c && c <= '9'
        m29 c    = toMaybe c  $ '2' <= c && c <= '9'

toMaybe :: a -> Bool -> Maybe a
toMaybe v t = if t then Just v else Nothing
