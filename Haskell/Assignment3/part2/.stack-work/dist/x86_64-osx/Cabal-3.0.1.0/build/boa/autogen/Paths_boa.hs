{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_boa (
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
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/rabbit0v0/Haskell/Assignment3/part2/.stack-work/install/x86_64-osx/9d438f8f75e4298bd6e1a100d534c8cf0b4cce3966c76822d371a41880d41d3c/8.8.4/bin"
libdir     = "/Users/rabbit0v0/Haskell/Assignment3/part2/.stack-work/install/x86_64-osx/9d438f8f75e4298bd6e1a100d534c8cf0b4cce3966c76822d371a41880d41d3c/8.8.4/lib/x86_64-osx-ghc-8.8.4/boa-0.0.0-GMSuwDhGsnYBRchK4RgYLR-boa"
dynlibdir  = "/Users/rabbit0v0/Haskell/Assignment3/part2/.stack-work/install/x86_64-osx/9d438f8f75e4298bd6e1a100d534c8cf0b4cce3966c76822d371a41880d41d3c/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/rabbit0v0/Haskell/Assignment3/part2/.stack-work/install/x86_64-osx/9d438f8f75e4298bd6e1a100d534c8cf0b4cce3966c76822d371a41880d41d3c/8.8.4/share/x86_64-osx-ghc-8.8.4/boa-0.0.0"
libexecdir = "/Users/rabbit0v0/Haskell/Assignment3/part2/.stack-work/install/x86_64-osx/9d438f8f75e4298bd6e1a100d534c8cf0b4cce3966c76822d371a41880d41d3c/8.8.4/libexec/x86_64-osx-ghc-8.8.4/boa-0.0.0"
sysconfdir = "/Users/rabbit0v0/Haskell/Assignment3/part2/.stack-work/install/x86_64-osx/9d438f8f75e4298bd6e1a100d534c8cf0b4cce3966c76822d371a41880d41d3c/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "boa_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "boa_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "boa_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "boa_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "boa_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "boa_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
