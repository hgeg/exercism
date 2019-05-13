module School (School, add, empty, grade, sorted) where

data School = Empty
            | Grade Int [String] School

add :: Int -> String -> School -> School
add gradeNum student Empty = Grade gradeNum [student] Empty
add gradeNum student (Grade n s gs) 
  | gradeNum <  n          = Grade gradeNum [student] (Grade n s gs)
  | gradeNum == n          = Grade n (s++[student]) gs
  | otherwise              = Grade n s (add gradeNum student gs)

empty :: School
empty = Empty

grade :: Int -> School -> [String]
grade _        Empty = [] 
grade gradeNum (Grade n s gs) 
  | gradeNum <  n    = []
  | gradeNum == n    = s
  | otherwise        = grade gradeNum gs

sorted :: School -> [(Int, [String])]
sorted Empty          = []
sorted (Grade n s gs) = (n, quicksort s) : sorted gs

quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (x:xs) = quicksort prec ++ (x : quicksort ante)
  where prec  = filter (<x)  xs
        ante  = filter (>=x) xs
