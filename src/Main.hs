module Main (main) where

import Ls

main :: IO ()
main = do
  file <- getLine
  files <- ls file
  mapLs files

  -- mapM_ putStrLn files
