-- Reversed Strings

/*
Complete the solution so that it reverses the string passed into it.

'world'  =>  'dlrow'
'word'   =>  'drow'
*/

-- given a table 'solution' with column 'str', return a table with column 'str' and your result in a column named 'res'.

-- my answer, best practices and most clever
SELECT
str,
reverse(str) as res
from solution

-- renaming the table with the alias of s
SELECT 
  s.str, 
  REVERSE(s.str) AS res 
FROM solution as s;

-- using functions
CREATE OR REPLACE FUNCTION myrevFCT(text) RETURNS text AS $$
SELECT array_to_string(ARRAY(
  SELECT substring($1, s.i,1) FROM generate_series(length($1), 1, -1) AS s(i)
  ), '');
$$ LANGUAGE SQL IMMUTABLE STRICT;

SELECT str, myrevFCT(str) AS res from solution;