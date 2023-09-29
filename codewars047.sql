-- Easy SQL: Square Root and Log
/*
Given the following table 'decimals':

** decimals table schema **

id
number1
number2
Return a table with two columns (root, log) where the values in root are the square root of those provided in number1 and the values in log are changed to a base 10 logarithm from those in number2.
*/

-- my answer 
-- return the square root of column number1 renamed as root and the log base 10 of number2 renamed as log
-- using sqrt() for square root and log10()
SELECT
sqrt(number1) as root,
log10(number2) as log
from decimals

-- best practices
-- using log() instead of log10()
select sqrt(number1) as root, log(number2) from decimals

-- most clever
-- |/ is a unary operator for the square root. I guess it is supposed to look like the mathematical symbol √. They also have the cube root unary operator as ||/.
select
  |/ number1 as root,
  log(number2) as log
from 
  decimals