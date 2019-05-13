module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Branch a (BST a) (BST a) | Leaf deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Leaf           = Nothing
bstLeft (Branch _ l _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Leaf           = Nothing
bstRight (Branch _ _ r) = Just r

bstValue :: BST a -> Maybe a
bstValue Leaf           = Nothing
bstValue (Branch v _ _) = Just v

empty :: BST a
empty = Leaf

fromList :: Ord a => [a] -> BST a
fromList []     = Leaf
fromList (x:xs) = Branch x left right
  where right = fromList $ filter (>x) xs
        left  = fromList $ filter (<=x) xs

insert :: Ord a => a -> BST a -> BST a
insert x Leaf = Branch x Leaf Leaf
insert x (Branch y l r) 
  | x > y     = Branch y l (insert x r)
  | otherwise = Branch y (insert x l) r

singleton :: a -> BST a
singleton x = Branch x Leaf Leaf

toList :: BST a -> [a]
toList Leaf      = []
toList (Branch v l r) = toList l ++ v : toList r
