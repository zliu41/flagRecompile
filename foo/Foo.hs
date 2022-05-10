module Foo (foo) where

foo :: Int -> Int
foo = (+ 1)
{-# NOINLINE foo #-}
