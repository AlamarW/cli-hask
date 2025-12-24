module Ls (ls, mapLs, LsError(..)) where

import System.Directory
import Control.Exception (try, IOException)
import System.IO.Error (isDoesNotExistError, isPermissionError, isIllegalOperation, ioeGetErrorType)
import GHC.IO.Exception (IOErrorType(..))

-- Custom error type for directory-related errors
data LsError
  = DirDoesNotExist FilePath
  | DirPermissionDenied FilePath
  | NotADirectory FilePath
  | DirInvalidPath FilePath
  | DirOtherError FilePath String
  deriving (Show, Eq)

-- list the contents of the current folder
ls :: FilePath -> IO (Either LsError [FilePath])
ls fp = do
  result <- try (listDirectory fp) :: IO (Either IOException [FilePath])
  return $ case result of
    Left err
      | isDoesNotExistError err -> Left (DirDoesNotExist fp)
      | isPermissionError err -> Left (DirPermissionDenied fp)
      | isIllegalOperation err -> Left (NotADirectory fp)
      | ioeGetErrorType err == InvalidArgument -> Left (DirInvalidPath fp)
      | otherwise -> Left (DirOtherError fp (show err))
    Right files -> Right files

mapLs :: [FilePath] -> IO ()
mapLs fs = mapM_ putStrLn fs
