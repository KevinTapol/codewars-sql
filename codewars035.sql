-- Function 2 - squaring an argument
/*
write a function that takes an argument and returns the square of it
given a table 'square' with column 'n'
return a table with:
this column and your result in a column named 'res'
*/

-- my answer, best practices and most clever
SELECT
n,
n*n as res
from square

-- using power(base, exponent)
SELECT n,
       CAST(POWER(n, 2)as int) as res
FROM square

-- using pow(base, exponent) and type conversion with ::int
select n, pow(n, 2)::int res
from square

-- postgres function using base^exponent
BEGIN TRANSACTION;

-- define function arguments

CREATE OR REPLACE FUNCTION square(num INT)
RETURNS DECIMAL AS 

-- define function logic

'BEGIN
return num ^ 2;
END;
'
LANGUAGE 'plpgsql';

SELECT n, CAST(square(n) AS INT) res FROM square