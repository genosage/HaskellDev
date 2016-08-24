type HTML = [HTML_element]

data HTML_element
    = HTML_text String
    | HTML_font Font_tag HTML
    | HTML_p HTML
    | HTML_ul [HTML]
    | HTML_ol [HTML]
    deriving(Show)

data Font_tag = Font_tag String
    deriving(Show)

strip_font_tags :: HTML -> HTML
strip_font_tags [] = []
strip_font_tags (HTML_text x:xs) = HTML_text x:strip_font_tags xs
strip_font_tags (HTML_p x:xs) = HTML_p (strip_font_tags x):strip_font_tags xs
strip_font_tags (HTML_ul x:xs) = HTML_ul (map strip_font_tags x):strip_font_tags xs
strip_font_tags (HTML_ol x:xs) = HTML_ol (map strip_font_tags x):strip_font_tags xs
strip_font_tags (HTML_font (Font_tag a) x:xs) =  strip_font_tags x ++ strip_font_tags xs


data Mtree a = Mnode a [Mtree a]
    deriving(Show)

showMtree :: Show a => Mtree a -> String
showMtree a = showMtreeNew 0 a

showMtreeNew :: Show a => Int -> Mtree a -> String
showMtreeNew i (Mnode n []) = printSpace i ++ show n ++ "\n"
showMtreeNew i (Mnode n lst) = showMtreeNew i (Mnode n []) ++ listToString(map (showMtreeNew (i+1)) lst)

printSpace :: Int -> String
printSpace i
    | i==0 = ""
    | otherwise = " " ++ printSpace (subtract 1 i)

listToString :: [String] -> String
listToString [] = ""
listToString (x:xs) = x ++ listToString xs