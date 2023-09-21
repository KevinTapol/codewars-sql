-- Count Odd Numbers below n
/*
Given a number n, return the number of positive odd numbers below n, EASY!

Examples (Input -> Output)
7  -> 3 (because odd numbers below 7 are [1, 3, 5])
15 -> 7 (because odd numbers below 15 are [1, 3, 5, 7, 9, 11, 13])
*/

-- given a table 'oddcount' with column 'n', return a table with column 'n' and your result in a column named 'res'.
-- my answer and best practices
-- return column n and n divided by 2 as column res
SELECT
n,
n/2 as res
from oddcount

-- most clever
select n, n >> 1 as res from oddcount

-- using type bigint
select n, cast(n/2 as bigint) as res
from oddcount;

-- postgres
CREATE OR REPLACE FUNCTION count_odd(num bigint) RETURNS bigint AS $$
  DECLARE 
--     start_index bigint := 1;
--     max_num bigint := num - 1;
--     odd_count bigint := 0;
  BEGIN
--       WHILE start_index < max_num 
--       LOOP
--           odd_count = odd_count + 1;
--           start_index = start_index + 2;
--       END LOOP;
--       RETURN odd_count;
      RETURN num/2;
  
  END;

$$ language plpgsql;

SELECT n, count_odd(n) as res FROM oddcount;

-- type conversion for bigint
SELECT n, FLOOR(n/2) :: BIGINT res
FROM oddcount