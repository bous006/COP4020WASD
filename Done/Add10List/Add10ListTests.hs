-- $Id: Add10ListTests.hs,v 1.1 2015/01/21 14:06:28 leavens Exp leavens $
module Add10ListTests where
import Testing
import Add10List  -- you have to put your solutions in module Add10List

version = "Add10ListTests $Revision: 1.1 $"
recursive_tests = (tests add10_list_rec)
comprehension_tests = (tests add10_list_comp)

-- do main to run our tests
main :: IO()
main = do startTesting version
          errs_comp <- run_test_list 0 comprehension_tests
          total_errs <- run_test_list errs_comp recursive_tests
          doneTesting total_errs

-- do test_comprehension to test just add10_list_comp
test_comprehension :: IO()
test_comprehension = dotests version comprehension_tests

-- do test_recursive to test just add10_list_rec
test_recursive :: IO()
test_recursive = dotests version recursive_tests

tests :: ([Integer] -> [Integer]) -> [TestCase [Integer]]
tests f = 
    [(eqTest (f []) "==" [])
    ,(eqTest (f (1:[])) "==" (11:[]))
    ,(eqTest (f (3:1:[])) "==" (13:11:[]))
    ,(eqTest (f [1,5,7,1,7]) "==" [11,15,17,11,17])
    ,(eqTest (f [7 .. 21]) "==" [17 .. 31])
    ,(eqTest (f [8,4,-2,3,1,10000000,10])
           "==" [18,14,8,13,11,10000010,20])
    ]
