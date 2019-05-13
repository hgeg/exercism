{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_resistor_colors (
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
version = Version [1,0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/hgeg/exercism/haskell/resistor-colors/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/bin"
libdir     = "/home/hgeg/exercism/haskell/resistor-colors/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/lib/x86_64-linux-ghc-8.6.3/resistor-colors-1.0.0.0-FPgmZqcjZnE5BrJunannkd"
dynlibdir  = "/home/hgeg/exercism/haskell/resistor-colors/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/lib/x86_64-linux-ghc-8.6.3"
datadir    = "/home/hgeg/exercism/haskell/resistor-colors/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/share/x86_64-linux-ghc-8.6.3/resistor-colors-1.0.0.0"
libexecdir = "/home/hgeg/exercism/haskell/resistor-colors/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/libexec/x86_64-linux-ghc-8.6.3/resistor-colors-1.0.0.0"
sysconfdir = "/home/hgeg/exercism/haskell/resistor-colors/.stack-work/install/x86_64-linux/lts-13.5/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "resistor_colors_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "resistor_colors_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "resistor_colors_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "resistor_colors_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "resistor_colors_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "resistor_colors_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
