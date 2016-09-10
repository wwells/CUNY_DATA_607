library(stringr)

example.obj <- "1. A small sentence.  - 2. Another tiny sentence."

#basics 
str_extract(example.obj, "small")
str_extract(example.obj, ignore.case("SMALL"))
unlist(str_extract_all(example.obj, "sentence"))
unlist(str_extract_all(example.obj, "tiny|sentence"))

#generelizing regex
str_extract(example.obj, 'sm.ll') # . is any
str_extract(example.obj, 'sm[abc]ll') # [abc] is any character
str_extract(example.obj, 'sm[a-p]ll') # specifiy range
str_extract_all(example.obj, '[s. ]') # all 's' '.' and blank space
str_extract_all(example.obj, '[[:punct:]]') # all punctuation
str_extract_all(example.obj, '[[:punct:]ABC]') # add to predefined char class
str_extract_all(example.obj, '[^[a]]') # use ^ to get everything BUT

#quantifiers
str_extract(example.obj, "s[[:alpha:]]{3}l") # use quantifier to repeat char
str_extract(example.obj, "A.+sentence") # use + and . to find multiple occurences
unlist(str_extract_all(example.obj, "(.en){1,5}"))
unlist(str_extract_all(example.obj, ".en{1,5}"))

#metacharacters
unlist(str_extract_all(example.obj, "\\."))

#shortcuts
unlist(str_extract_all(example.obj, "\\w+"))
