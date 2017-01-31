-- $Id: CubeOddsTests.hs,v 1.1 2015/01/21 14:16:07 leavens Exp leavens $
module CubeOddsTests where
import CubeOdds
import Testing
main = dotests "CubeOddsTests $Revision: 1.1 $" tests
tests :: [TestCase [Integer]]
tests = [eqTest (cubeOdds []) "==" []
        ,eqTest (cubeOdds [3]) "==" [27]
        ,eqTest (cubeOdds [4]) "==" [4]
        ,eqTest (cubeOdds [4,3]) "==" [4,27]
        ,eqTest (cubeOdds [1,2,3,4,5,6]) "==" [1,2,27,4,125,6]
        ,eqTest (cubeOdds [3,10,3,5,600,0,-2,-1,-3])
                "==" [27,10,27,125,600,0,-2,-1,-27]
        ]
