{-
    This program will build on dictionary.hs and wordsToPhone from a previous
    assignment. You can copy your wordsToPhone source code here or you can simply
    include the line:
    
    import PTfuncsyntax
    
wordsToPhone a = numListToNum (newList a)
newList a = [charToPhoneDigit x | x <- a, x /= ' ' && x /= ',']
    
    and run this program in the same directory with your PFfuncsyntax.hs file.
    
    This program will ask the user to enter a 4-digit number. It will then list 
    off all of the english words that can be formed from that number on a standard 
    telephone keypad.
    
    Example of use:
    
    *Main> main
    Type a four-digit number:
    2376
    "Afro"
    "Bern"
    "berm"
    *Main> 

-}

charToPhoneDigit :: Char -> Int
charToPhoneDigit c 
 | c `elem` "abcABC" = 2
 | c `elem` "defDEF" = 3
 | c `elem` "ghiGHI" = 4
 | c `elem` "jklJKL" = 5
 | c `elem` "mnoMNO" = 6
 | c `elem` "pqrsPQRS" = 7
 | c `elem` "tuvTUV" = 8
 | c `elem` "wxyzWXYZ" = 9
 | otherwise = 0
 
wordsToPhone :: String -> Int
wordsToPhone a = numListToNum (newList a)
newList a = [charToPhoneDigit x | x <- a, x /= ' ' && x /= ',']

numListToNum a = (read :: String -> Int) (listInt a)
listInt [] = ""
listInt a = show (head a) ++ listInt (tail a)

main = do
    putStrLn "Type a four-digit number:"
    num <- readLn
    dictionary <- readFile "/usr/share/dict/american-english"
    let dict = words dictionary
    mapM_ putStrLn [show x|x<-dict, wordsToPhone(x) == num]