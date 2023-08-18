-- Quarter of the Year

-- Given a month as an integer from 1 to 12, return to which quarter of the year it belongs as an integer number.

-- For example: month 2 (February), is part of the first quarter; month 6 (June), is part of the second quarter; and month 11 (November), is part of the fourth quarter.

-- Constraint:

-- 1 <= month <= 12

-- Return a table with column 'month' and your result in a column named 'res' Given a table 'quarterof' with column 'month', 

-- my answer, best practices and most clever
select month,
 ((month-1)/3) +1 as res 
 from quarterof

-- my answer using case statements
select 
month,
case
    when month <= 3 then 1
    when month <= 6 then 2
    when month <= 9 then 3
    else 4
    end as res
from quarterof

-- users answer using case statements with between and then key words
SELECT month,
  CASE
    WHEN month BETWEEN 1 and 3 THEN 1
    WHEN month BETWEEN 4 and 6 THEN 2
    WHEN month BETWEEN 7 and 9 THEN 3
    WHEN month BETWEEN 10 and 12 THEN 4
    END AS res
FROM
  quarterof
WHERE  month BETWEEN 1 and 12

-- using CEILING to round up and AS INT to return an integer
SELECT month, CAST(CEILING(month / 3.0) AS INT) AS res 
FROM quarterof

-- creating a new fn and returning a table
 create or replace function getQuarter(m int) returns integer as 
 $$
 select ceil(m/3.0) ::int ;
 $$ language sql;
 
 select month, getQuarter(month) as res from quarterof;