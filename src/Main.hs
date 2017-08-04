{-# LANGUAGE ApplicativeDo #-}

module Main where

import Control.Monad

import System.IO

import Parsers
import {-# SOURCE #-} Functions

main :: IO ()
main = do
  putStrLn "Please specify the input file:"
  file <- getLine
  allCodes <- readFile file
  putStrLn "File contents:"
  putStrLn allCodes
  putStrLn $ case p <|| allCodes of
    (Left  o) -> "Error:\n" ++ o
    (Right o) -> o
  where p = do
          f <- functionP
          newLines0P
          return f
--
