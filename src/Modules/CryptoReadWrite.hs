{-# LANGUAGE OverloadedStrings #-}
--Richard Stewing
--25.02.2016
--CryptoReadWrite.hs
--Wrapper for crypto read write functions


module CryptoReadWrite where

import Crypto

import qualified Data.ByteString.Char8 as B
import System.Posix.Terminal
import System.Posix.IO (stdInput)


--writeToDisk:: location -> content -> password -> IO ()
writeToDisk:: String -> String -> String -> IO ()
writeToDisk location s  p = do 
  B.writeFile location (ciph p s)

--readFromDisk:: location -> password -> IO String
readFromDisk:: String -> String -> IO String
readFromDisk location p = do
  s <- B.readFile location
  return . B.unpack . decipher p $ B.unpack s



getPassword:: IO String
getPassword = do
  tc <- getTerminalAttributes stdInput
  setTerminalAttributes stdInput (withoutMode tc EnableEcho) Immediately
  password <- getLine
  setTerminalAttributes stdInput tc Immediately
  return password 
