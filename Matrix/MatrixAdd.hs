module MatrixAdd where
import Matrix
import MatrixInstances

sameShape :: (Matrix a) -> (Matrix a) -> Bool
pointwiseApply :: (a -> a -> b) -> (Matrix a) -> (Matrix a) -> (Matrix b)
add :: (Num a) => (Matrix a) -> (Matrix a) -> (Matrix a)
sub :: (Num a) => (Matrix a) -> (Matrix a) -> (Matrix a)

-- without changing the above, implement the declared functions.


sameShape m1 m2 = (numRows m1 == numRows m2 && numColumns m1 == numColumns m2)
pointwiseApply op m1 m2 =
    if sameShape m1 m2
    then fromRule (numRows m1, numColumns m2) (\val -> op (at m1 val) (at m2 val))
    else error "Different Sizes"
    
add a b = pointwiseApply (+) a b 
sub a b = pointwiseApply (-) a b