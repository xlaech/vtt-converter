module Main where

import System.Environment
import System.Exit

import Lib

main :: IO ()
main = do
    contents <- getArgs >>= parse
    putStrLn $ "Successfully loaded " ++ (show $ length contents) ++ " files."

parse :: [FilePath] -> IO [String]
parse ["-h"] = usage   >> exit
parse ["-v"] = version >> exit
parse fs     = mapM readFile fs

usage   = putStrLn "Usage: vtt-contverter [-vh] [file1 ...]"
version = putStrLn "vtt-converter 0.1 - Haskell Implementation"
exit    = exitWith ExitSuccess