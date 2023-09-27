-- Easy SQL: Rounding Decimals
/*
Given the following table 'decimals':

** decimals table schema **

id
number1
number2
Return a table with two columns (number1, number2), the value in number1 should be rounded down and the value in number2 should be rounded up.
*/

-- my answer, best practices and most clever
-- rounding down with floor() up with ceil() using alias
SELECT
floor(number1) as number1,
ceil(number2) as number2
from decimals

-- using ceiling() instead of ceil()
SELECT FLOOR(number1) AS number1, CEILING(number2) AS number2
FROM decimals

-- not using alias as
SELECT
  floor(number1) number1,
  ceil(number2) number2
from decimals;

-- using update set where instead of alias
UPDATE decimals
SET number1 = FLOOR(number1),
  number2 = CEIL(number2);
SELECT number1, number2 FROM decimals;