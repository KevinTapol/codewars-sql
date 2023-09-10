-- MakeUpperCase
/*
Write a function which converts the input string to uppercase.
*/
--given a table 'makeuppercase' with column 's', return a table with column 's' and your result in a column named 'res'

-- my answer, best practices and most clever
-- using upper()
SELECT
s,
upper(s) as res
from makeuppercase

-- there are no deviations other than spaces, single line answers or removing the key word as for alias which imo is bad practices