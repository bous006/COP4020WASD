module Matrix (Matrix, fillWith, fromRule, numRows, numColumns, at, mtranspose, mmap) where
newtype Matrix a = Mat ((Int,Int), (Int,Int) -> a)

fillWith :: (Int,Int) -> a -> (Matrix a)
fillWith (n,m) k = Mat ((n,m), (\(_,_) -> k))

fromRule :: (Int,Int) -> ((Int,Int) -> a) -> (Matrix a)
fromRule (n,m) f = Mat ((n,m), f)

numRows :: (Matrix a) -> Int
numRows (Mat ((n,_),_)) = n

numColumns :: (Matrix a) -> Int
numColumns (Mat ((_,m),_)) = m

at :: (Matrix a) -> (Int, Int) -> a
at (Mat (_,r)) = (\c -> r c)

mtranspose :: (Matrix a) -> (Matrix a)
mtranspose (Mat ((n,m),f)) = (Mat ((m,n),\(j,i) -> f (i,j)))

mmap :: (a -> b) -> (Matrix a) -> (Matrix b)
mmap h (Mat ((n,m),f)) = (Mat ((n,m), h.f))