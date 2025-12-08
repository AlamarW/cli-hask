module Ls (ls, mapLs) where

import System.Directory

-- list the contents of the current folder

ls :: FilePath -> IO [FilePath]
ls fp = listDirectory fp

mapLs :: [FilePath] -> IO ()
mapLs fs = mapM_ putStrLn fs
