module Main (main) where

import Ls

main :: IO ()
main = do
  file <- getLine
  result <- ls file
  case result of
    Right files -> mapLs files
    Left err -> putStrLn $ "Error: " ++ show err

  -- mapM_ putStrLn files
