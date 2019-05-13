module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake 0 = []
handshake n = reverse $ check moves n []
  where moves = [("wink":), ("double blink":), ("close your eyes":), ("jump":), reverse]
        check [] _     = id
        check (m:ms) n = check ms (n `quot` 2) . (if n `rem` 2 == 1 then m else id)
