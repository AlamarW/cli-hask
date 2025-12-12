module Test_ls (spec) where

import Test.Hspec
import Test.QuickCheck
import Ls

spec :: Spec
spec = do
  describe "Prelude" $ do
    describe "read" $ do
      it "can parse integers" $ do
        read "10" `shouldBe` (10 :: Int)

    describe "head" $ do
      it "returns the first element of a list" $ do
        head [23 ..] `shouldBe` 23

  describe "Commands" $ do
    describe "Ls" $ do
      it "can return a list of dirs" $ do
        files <- ls "."
        files `shouldSatisfy` (not . null)
      context "when used with String" $ do
        it "is not null" $ property $
	  \x -> ioProperty $ do
	    files <- ls x
	    return (not (null files))

