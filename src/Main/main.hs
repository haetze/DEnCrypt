--Richard Stewing
-- <28.02.2016>
--module main where



import CryptoReadWrite
import System.Environment (getArgs)
import System.IO
import System.Directory

main = do
  args <- getArgs
  password <- getPassword
  case args of
    ("decrypt":inName:outName:_) -> do
      home <- getHomeDirectory
      s <- readFromDisk (home ++ "/" ++ inName) password
      writeFile (home ++ "/" ++ outName) s
    ("encrypt":inName:outName:_) -> do
      home <- getHomeDirectory
      s <- readFile (home ++ "/" ++ inName)
      writeToDisk (home ++ "/" ++ outName) s password
    ("-f":"decrypt":inName:outName:_) -> do
      s <- readFromDisk inName password
      writeFile  outName s
    ("-f":"encrypt":inName:outName:_) -> do
      home <- getHomeDirectory
      s <- readFile inName
      writeToDisk outName s password
    _ -> do
      putStrLn "Command syntax"
      putStrLn "encrypt/decrypt inName outName"
      


    
