module EncryptWith where
import MapInside
import ToCharFun

encryptWith :: (Int -> Int) -> [String] -> [String]
encryptWith f lls = mapInside (toCharFun f) lls    
