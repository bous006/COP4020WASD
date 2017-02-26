module ToCharFun where
toCharFun :: (Int -> Int) -> (Char -> Char)
toCharFun fs = toEnum.fs.fromEnum 