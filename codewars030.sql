-- Is n divisible by x and y?
/*
Create a function that checks if a number n is divisible by two numbers x AND y. All inputs are positive, non-zero numbers.

Examples:
1) n =   3, x = 1, y = 3 =>  true because   3 is divisible by 1 and 3
2) n =  12, x = 2, y = 6 =>  true because  12 is divisible by 2 and 6
3) n = 100, x = 5, y = 3 => false because 100 is not divisible by 3
4) n =  12, x = 7, y = 5 => false because  12 is neither divisible by 7 nor 5
*/

-- You will be given a table 'kata' with columns 'id', 'n', 'x', and 'y'. 
-- Return the 'id' and your result in a column named 'res' using a SELECT statement.
-- You DON'T need to create a function, that's for other languages.


-- it is possible that x and y could be the same number. So using x*y will fail on cases where n is 17, x is 17 and y is 17.
-- my answer
SELECT
id,
case
  when n % x = 0 and n % y = 0 then true
  else false
  end as res
from kata

-- best practices and most clever
-- using truthy falsy with AND
SELECT id, n % x = 0 AND n % y = 0 AS res FROM kata

-- postgres function if else
CREATE FUNCTION isDivisible(n int, x int, y int)
RETURNS boolean AS $$
BEGIN
IF (mod(n, x) = 0 AND mod(n, y) = 0) THEN
  RETURN True;
ELSE
  RETURN False;
END IF;
END;
$$ LANGUAGE plpgsql;
SELECt id, isDivisible(n, x, y) AS res FROM kata

-- clever imo adding both to make sure both return no remainders
SELECT id, (n % x + n % y) = 0 AS res FROM kata;

-- using mod() vs %
select id,(MOD(n,x)+MOD(n,y))=0 as res from kata