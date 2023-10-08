-- SQL Basics: Truncating
/*
Given the following table 'decimals':

decimals table schema
id
number1
number2
Return a table with a single column towardzero where the values are the result of number1 + number2 truncated towards zero.
*/

-- my answer and best practices
-- using trunc() to round the sum to remove decimal places
SELECT trunc(number1+number2) as towardzero
FROM decimals;

-- most clever
-- using floor() to round down if the sum is greater or equal to 0 else ceil() to round up
select
    case
        when number1 + number2 >= 0 then floor(number1 + number2)
        else ceil(number1 + number2)
    end as towardzero
from decimals