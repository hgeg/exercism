module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int

instance Eq Clock where
  (==) (Clock h1 m1) (Clock h2 m2) = (h1==h2) && (m1==m2)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock (adjust 24 $ h + div m 60) $ adjust 60 m
  where adjust lim val
          | val >= 0   = rem val lim
          | otherwise  = adjust lim (val + lim)

toString :: Clock -> String
toString (Clock h m) = hh ++ ":" ++ mm
  where hh = (if h<10 then "0" else "") ++ show h
        mm = (if m<10 then "0" else "") ++ show m

addDelta :: Int -> Int -> Clock -> Clock
addDelta dh dm (Clock h m) = fromHourMin (h + dh) (m + dm)
