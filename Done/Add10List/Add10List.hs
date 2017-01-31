module Add10List where
add10_list_rec :: [Integer] -> [Integer]
add10_list_comp :: [Integer] -> [Integer]

add10_list_rec [] = []
add10_list_rec (n:nl) = (n + 10) : add10_list_rec nl

add10_list_comp [] = []
add10_list_comp xs = [ x+10 | x <- xs]
