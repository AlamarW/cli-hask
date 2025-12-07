module Commands.Ls
  ( ls
  ) where

import System.Directory

-- list the contents of the current folder

ls :: FilePath -> IO [FilePath]
ls fp = listDirectory fp


