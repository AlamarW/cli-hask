{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_cli_hask (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/alamarw/cli-hask/.stack-work/install/x86_64-linux/e1d4447eae40970ac0100e61d8b2da548f22c9b4d37214d7998f26009d3f66b6/9.10.3/bin"
libdir     = "/home/alamarw/cli-hask/.stack-work/install/x86_64-linux/e1d4447eae40970ac0100e61d8b2da548f22c9b4d37214d7998f26009d3f66b6/9.10.3/lib/x86_64-linux-ghc-9.10.3-b4c3/cli-hask-0.1.0.0-5ojwjQu93dr6kWaAIT1q11-cli-hask"
dynlibdir  = "/home/alamarw/cli-hask/.stack-work/install/x86_64-linux/e1d4447eae40970ac0100e61d8b2da548f22c9b4d37214d7998f26009d3f66b6/9.10.3/lib/x86_64-linux-ghc-9.10.3-b4c3"
datadir    = "/home/alamarw/cli-hask/.stack-work/install/x86_64-linux/e1d4447eae40970ac0100e61d8b2da548f22c9b4d37214d7998f26009d3f66b6/9.10.3/share/x86_64-linux-ghc-9.10.3-b4c3/cli-hask-0.1.0.0"
libexecdir = "/home/alamarw/cli-hask/.stack-work/install/x86_64-linux/e1d4447eae40970ac0100e61d8b2da548f22c9b4d37214d7998f26009d3f66b6/9.10.3/libexec/x86_64-linux-ghc-9.10.3-b4c3/cli-hask-0.1.0.0"
sysconfdir = "/home/alamarw/cli-hask/.stack-work/install/x86_64-linux/e1d4447eae40970ac0100e61d8b2da548f22c9b4d37214d7998f26009d3f66b6/9.10.3/etc"

getBinDir     = catchIO (getEnv "cli_hask_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "cli_hask_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "cli_hask_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "cli_hask_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cli_hask_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cli_hask_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
