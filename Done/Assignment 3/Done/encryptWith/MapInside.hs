module MapInside where
mapInside :: (a -> b) -> [[a]] -> [[b]]
mapInside f lls = (map.map) f lls
