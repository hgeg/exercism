{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_pascals_triangle (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
version = Version [1,5,0,9] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/hgeg/exercism/haskell/pascals-triangle/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/bin"
libdir     = "/home/hgeg/exercism/haskell/pascals-triangle/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/lib/x86_64-linux-ghc-8.6.3/pascals-triangle-1.5.0.9-FYLUTpBaqmoBnbDAGQAA4a"
dynlibdir  = "/home/hgeg/exercism/haskell/pascals-triangle/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/lib/x86_64-linux-ghc-8.6.3"
datadir    = "/home/hgeg/exercism/haskell/pascals-triangle/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/share/x86_64-linux-ghc-8.6.3/pascals-triangle-1.5.0.9"
libexecdir = "/home/hgeg/exercism/haskell/pascals-triangle/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/libexec/x86_64-linux-ghc-8.6.3/pascals-triangle-1.5.0.9"
sysconfdir = "/home/hgeg/exercism/haskell/pascals-triangle/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pascals_triangle_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pascals_triangle_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pascals_triangle_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pascals_triangle_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pascals_triangle_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pascals_triangle_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
