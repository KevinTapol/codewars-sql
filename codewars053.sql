-- SQL Basics: Raise to the Power
/*
Given the following table 'decimals':

decimals table schema
id
number1
number2
Return a table with a single column result which is the output of number1 raised to the power of number2.
*/

-- my answer
-- using power(base, exponent)
SELECT
power(number1, number2) as result
from decimals

-- best practices
-- using pow(base, exponent)
select pow(number1, number2) as result
from decimals;

-- most clever
-- using ^
SELECT (number1 ^ number2) AS result 
FROM decimals;

-- using :: for type conversion
SELECT POWER (number1::float, number2) AS result FROM decimals 