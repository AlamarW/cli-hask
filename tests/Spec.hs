module Main where

import Test.Hspec
import qualified Test_ls

main :: IO ()
main = hspec $ do
  Test_ls.spec
