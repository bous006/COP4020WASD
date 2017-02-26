module ComposeList where 
composeList :: [(a -> a)] -> (a -> a)
composeList fs = foldr (.) id fs