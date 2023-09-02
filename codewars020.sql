-- Remove String Spaces
/*
Write a function that removes the spaces from the string, then return the resultant string.

Examples:

Input -> Output
"8 j 8   mBliB8g  imjB8B8  jl  B" -> "8j8mBliB8gimjB8B8jlB"
"8 8 Bi fk8h B 8 BB8B B B  B888 c hl8 BhB fd" -> "88Bifk8hB8BB8BBBB888chl8BhBfd"
"8aaaaa dddd r     " -> "8aaaaaddddr"
*/

-- given a table 'nospace' with column 'x', return a table with column 'x' and your result in a column named 'res'.
-- my answer and best practices
-- using translate(inputString, whatToReplace, whatToReplaceWith)
SELECT
x,
translate(x, ' ', '') as res
from nospace

-- most clever
-- using trim() with regex
select x, trim(regexp_replace(x, '[\s+]', '', 'g')) as res from nospace

-- using PostgreSQL function to use a while loop to iterate through the string and replace whitespace with empty space
CREATE OR REPLACE FUNCTION remove_spaces(input_string VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
  i INTEGER := 1;
  len INTEGER := LENGTH(input_string);
  output_string VARCHAR := '';
BEGIN
  WHILE i <= len LOOP
    IF SUBSTRING(input_string FROM i FOR 1) != ' ' THEN
      output_string := output_string || SUBSTRING(input_string FROM i FOR 1);
    END IF;
    i := i + 1;
  END LOOP;

  RETURN output_string;
END;
$$ LANGUAGE plpgsql;
SELECT x, remove_spaces(x) AS res FROM nospace

-- using replace() instead of translate also renaming table to NS
SELECT x
  ,REPLACE(NS.x,' ','') AS res
FROM nospace AS NS