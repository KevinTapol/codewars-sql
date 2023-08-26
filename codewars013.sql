-- Vowel Count
/*
Return the number (count) of vowels in the given string.

We will consider a, e, i, o, u as vowels for this Kata (but not y).

The input string will only consist of lower case letters and/or spaces.
*/

-- # write your SQL statement here: you are given a table 'getcount' with column 'str', return a table with column 'str' and your result in a column named 'res'.

-- my answer using regex to replace everything that is not aeiou from the string with an empty space and return the length in a new column named res
select
str,
length(regexp_replace(str, '[^aeiou]', '', 'g')) 
as res
from getcount;

-- best practices and most clever
-- similar to mine but in caps and one line
SELECT str, LENGTH(REGEXP_REPLACE(str, '[^aeiou]', '', 'g')) AS res
FROM getcount

-- creating a column name res with the length of each element in column str but subtracting the length using translate(inputString, charactersToBeReplaced, newCharacters)
-- The TRANSLATE() function returns the string from the first argument after the characters specified in the second argument are translated into the characters specified in the third argument.
SELECT str, LENGTH(str) - LENGTH(TRANSLATE(str,'aeiou','')) AS res
FROM getcount;

-- using translate() and regex to remove every lowercase letter that is not aeiou and return the length
SELECT str, LENGTH(TRANSLATE(str, 'qwrtypsdfghjklzxcvbnm ', '')) AS res
FROM getcount;

-- using cardinality()
select str,
       cardinality(array_positions(str_arr, 'a'))
       + cardinality(array_positions(str_arr, 'o'))
       + cardinality(array_positions(str_arr, 'u'))
       + cardinality(array_positions(str_arr, 'i'))
       + cardinality(array_positions(str_arr, 'e')) as res
from (
    select 
      str,
      string_to_array(str::text, null) as str_arr 
    from getcount
     )_

-- nested replace() for aeiou with empty string
select
    str,
    length(str)
    - length(
        replace(replace(replace(replace(replace(
            lower(str), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')
    ) as res
from getcount

-- nested select statements using regex matches for aeiou
SELECT 
  str, 
  (SELECT COUNT(*) FROM regexp_matches(str, '[aeiou]', 'g')) as res 
FROM 
  getcount;