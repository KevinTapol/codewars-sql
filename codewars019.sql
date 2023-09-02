-- Grasshopper - Summation

/*
Summation
Write a program that finds the summation of every number from 1 to num. The number will always be a positive integer greater than 0.

For example (Input -> Output):

2 -> 3 (1 + 2)
8 -> 36 (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8)
*/

-- given a table 'kata' with a column 'n', return a table with 'n' and your result stored in a column naed 'res'. n*(n+1)/2
-- my answer, best practices and most clever
-- using Guass's 1 to n summation theorem of n*(n+1)/2
SELECT
n,
n*(n+1)/2 as res
from kata

-- using a function from PostgreSQL
CREATE OR REPLACE FUNCTION summation(num INTEGER)
RETURNS INTEGER AS $$
DECLARE
  i INTEGER := 1;
  total INTEGER := 0;
BEGIN
  WHILE i <= num LOOP
    total := total + i;
    i := i + 1;
  END LOOP;
  RETURN total;
END;
$$ LANGUAGE plpgsql;


select n, summation(n) as res
from kata

-- creating a range from 1 to n then sum it as the column
SELECT 
  n,
  (SELECT SUM(range) FROM generate_series(1, n) as t(range)) as res
FROM kata

-- renaming the table and using Gauss's sum
with recursive summ as( 
select n,n*(n+1)/2 as res from kata

)
select n,res from summ;

-- union all
SELECT n, (
    WITH RECURSIVE NumberSeq AS (
      SELECT 1 AS num
      UNION ALL
      SELECT num + 1
      FROM NumberSeq
      WHERE num < n
    )
    SELECT SUM(num) AS summation
    FROM NumberSeq
) AS res
FROM kata;