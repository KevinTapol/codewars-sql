-- Opposite number
/*
Very simple, given an integer or a floating-point number, find its opposite.

Examples:

1: -1
14: -14
-34: 34
You will be given a table: opposite, with a column: number. Return a table with a column: res.
*/

-- Return ONLY THE COLUMN RES 
-- my answer multiplying data in the column number by -1 and returning only the resulting column and not the number column
SELECT
number*(-1) as res
from opposite;

-- best practices and most clever
Select -number AS res FROM opposite;

-- here they are not using the keyword as
select -number res from opposite

-- using switch case
select  case when number =0 then 0
else -1*number end as res 
from opposite 

-- referring to the column by table name
SELECT opposite.number*-1 as res FROM opposite

-- altering the table to add a column int, update set where and select only the created table res
ALTER TABLE opposite ADD COLUMN res INT;

UPDATE opposite SET res = (number * -1);

SELECT res
FROM opposite;

-- using abs() and -abs() with switch case
SELECT CASE 
        WHEN SIGN(opposite.number) = 1 THEN -ABS(opposite.number)
        ELSE ABS(opposite.number) 
        END AS res
FROM opposite 