-- Is it a palindrome?
/*
Write a function that checks if a given string (case insensitive) is a palindrome.

A palindrome is a word, number, phrase, or other sequence of symbols that reads the same backwards as forwards, such as madam or racecar.
*/
--given a table 'ispalindrome' with column 'str', return a table with column 'str' and your result in a column named 'res'.
-- my answer
SELECT
str,
reverse(upper(str)) = upper(str) as res
from ispalindrome

-- best practices
-- same as my answer but using lower() instead of upper()
select str, reverse(lower(str)) = lower(str) as res from ispalindrome

-- most clever
-- case-insensitive comparison with ~*
select str, reverse(str) ~* str res
from ispalindrome

-- postgres with regex
CREATE OR REPLACE FUNCTION is_palindrome(str_in TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    str TEXT;
BEGIN
    str := LOWER(str_in);
    str := regexp_replace(str, '[^a-zA-Z0-9]', '', 'g');
    RETURN str = REVERSE(str);
END;
$$ LANGUAGE plpgsql;

SELECT str, "is_palindrome"(str) AS res FROM ispalindrome;