{-
    Write and submit a Haskell program (distribution.hs) that computes and displays 
    the distribution of characters in a given sample of text.
    
    Output of your program should look like this:
    
    Please enter a string of text (the bigger the better): 
    The rain in Spain stays mainly in the plain.
    The distribution of characters in "The rain in Spain stays mainly in the plain." is:
    iiiiii
    nnnnnn
    aaaaa
    sss
    ttt
    ee
    hh
    ll
    pp
    yy
    m
    r
    
    Notice about this example:
    * The text: 'The rain ... plain' is provided by the user as input to your program.
    * Uppercase characters are converted to lowercase
    * Spaces and punctuation marks are ignored completely.
    * Characters that are more common appear first in the list.
    * Where the same number of characters occur, the lines are ordered alphabetically. 
      For example, in the printout above, the letters e, h, l, p and y both occur twice 
      in the text and they are listed in the output in alphabetical order.
    * Letters that do not occur in the text are not listed in the output at all.
-}

import Data.Char (toLower)
import Data.List


main = do
    putStrLn "Enter Sentance"
    answer <- getLine
    let word = map toLower answer
    putStrLn ("The distribution of characters in "++show answer++" is:")
    mapM_ putStrLn (lengsortletter word)

editLets n = sort $ filter (`elem`['a'..'z']) n

groupLets h = group $ editLets h

letLength h = map length $ groupLets h

groupLength h = sort $ reverse $ zip (letLength h) (groupLets h)

onlyLetters h = map (\(a,b) -> b) (groupLength h) 

lengsortletter h = sortBy (\x y -> length y `compare` length x) $ onlyLetters h