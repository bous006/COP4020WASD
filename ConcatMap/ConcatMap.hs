module ConcatMap where
import Prelude hiding (concatMap)

concatMap :: (a -> [b]) -> [a] -> [b]
concatMap f ls = foldr ((++) . f) []