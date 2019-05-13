{-# LANGUAGE OverloadedStrings #-}
module Bob (responseFor) where

import Prelude hiding (any, all, null, filter)
import Data.Text (Text, any, all, null, filter, isSuffixOf)
import Data.Char

responseFor :: Text -> Text
responseFor xs
    | silence           = "Fine. Be that way!"
    | asked && yelledAt = "Calm down, I know what I'm doing!"
    | asked             = "Sure."
    | yelledAt          = "Whoa, chill out!"
    | otherwise         = "Whatever."
  where sentence = filter (not . isSpace) xs
        asked    = "?" `isSuffixOf` sentence
        yelledAt = any isUpper sentence && all (not.isLower) sentence
        silence  = null sentence
