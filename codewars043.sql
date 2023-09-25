-- SQL Basics: Mod
/*
Given the following table 'decimals':

** decimals table schema **

id
number1
number2
Return a table with one column (mod) which is the output of number1 modulus number2.
*/


-- my answer and most clever using % instead of mod
SELECT
number1 % number2 as mod
from decimals

-- best practices using mod()
select
  mod(number1, number2) as mod
from decimals

-- using a where statement for not null cases
SELECT number1 % number2 AS mod 
  FROM decimals
 WHERE number1 IS NOT NULL
   AND number2 IS NOT NULL