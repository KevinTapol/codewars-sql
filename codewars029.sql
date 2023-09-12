-- Fake Binary
/*
Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string.

Note: input will never be an empty string
*/
-- given a table 'fakebin' with column 'x', return a table with column 'x' and your result in a column named 'res'.

-- my answer, best practices and most clever
-- using translate to grab every possible instance string and replace with '0' or '1'
SELECT
x,
translate(x, '0123456789', '0000011111') as res
from fakebin

-- regex_replace() with ranges
select x,   regexp_replace(regexp_replace(x, '[0-4]', '0', 'g'), '[5-9]', '1', 'g')
AS res from fakebin;

