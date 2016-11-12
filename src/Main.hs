import System.Environment
import System.Process

main :: IO ()
main = getArgs
    >>= flip (readProcess "llvm-config") [] . mappend ["--system-libs", "--libs"]
    >>= putStrLn . mappend "  " . unwords . ("extra-libraries:" :) . fmap (drop 2) . concatMap words . lines
