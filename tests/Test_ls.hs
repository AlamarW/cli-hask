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
        result <- ls "."
        case result of
          Right files -> files `shouldSatisfy` (not . null)
          Left err -> expectationFailure $ "Expected success but got error: " ++ show err
      context "when used with String" $ do
        it "returns either a valid directory list or a directory-related error" $ property $
	  \x -> ioProperty $ do
	    result <- ls x
	    return $ case result of
	      Left (DirOtherError _ _) -> False  -- Reject non-directory errors
	      Left _ -> True  -- Accept directory-related errors
	      Right _files -> True  -- Success case: valid directory

