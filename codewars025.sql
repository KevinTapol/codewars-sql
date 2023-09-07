-- Beginner Series #1 School Paperwork

/*
Your classmates asked you to copy some paperwork for them. You know that there are 'n' classmates and the paperwork has 'm' pages.

Your task is to calculate how many blank pages do you need. If n < 0 or m < 0 return 0.

Example:
n= 5, m=5: 25
n=-5, m=5:  0
*/

-- given a table 'paperwork' with columns 'id', n' and 'm', return a table with columns 'n', 'm' and your result in a column named 'res'.

-- my answer and best practices
-- grab tables n m and create a new table res with a switch case of if n or m is less than 0 return 0 else return the product of n and m
select
n,
m,
case 
    when n < 0 or m < 0 then 0
    else n*m 
    end as res
from paperwork;

-- most clever
-- using greatest() to take the higher number meaning if the input is less than 0 take 0
SELECT n, m, GREATEST(n, 0) * GREATEST(m, 0) AS res FROM paperwork;

-- using sign() to check for negative values
SELECT  n,  m, 
  CASE
    WHEN SIGN(n) = -1 THEN 0
    WHEN SIGN(m) = -1 THEN 0
    ELSE(n * m) 
  END
AS res
FROM paperwork;