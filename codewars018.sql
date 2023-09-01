-- Remove First and Last Character

/*
It's pretty straightforward. Your goal is to create a function that removes the first and last characters of a string. You're given one parameter, the original string. You don't have to worry with strings with less than two characters.
*/
--given a table 'removechar' with column 's', return a table with column 's' and your result in a column named 'res'.

-- my answer and best practice
-- create a substring starting at the index after the first index with the length -2
SELECT
s,
substring(s, 2, length(s)-2) as res
from removechar

-- most clever
-- using regex with substring to select only characters between the first and last
select s, substring(s from '^.(.*).$') res
from removechar

-- case when then all characters from the left without the final and then all characters from the right without the final
SELECT s, CASE length(s) >= 2
            WHEN true THEN right(left(s, -1), -1)
            ELSE s
          END AS res
FROM removechar;

-- regex replace
SELECT s,

REGEXP_REPLACE(s,'^.(.*).$', '\1') AS res
--The regular expression ^.(.*).$ matches any character at the beginning (^.), 
--captures everything in between ((.*))
--and matches any character at the end (.$). The replacement expression \1 
--refers to the captured group, effectively removing the first and last characters.
FROM removechar;

-- substring and char_length
SELECT s, SUBSTR(s, 2, CHAR_LENGTH(s) - 2) AS res
FROM removechar

-- trim 
SELECT s, RIGHT(left_trim, LENGTH(left_trim)-1) as res FROM (
SELECT s, LEFT(s, LENGTH(s)-1) as left_trim FROM removechar
) f

-- 
SELECT s, LEFT(RIGHT(s,-1),-1) AS res FROM removechar