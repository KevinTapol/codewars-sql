-- Grasshopper - Check for factor
/*
This function should test if the factor is a factor of base.

Return true if it is a factor or false if it is not.

About factors
Factors are numbers you can multiply together to get another number.

2 and 3 are factors of 6 because: 2 * 3 = 6

You can find a factor by dividing numbers. If the remainder is 0 then the number is a factor.
You can use the mod operator (%) in most languages to check for a remainder
For example 2 is not a factor of 7 because: 7 % 2 = 1

Note: base is a non-negative number, factor is a positive number.
*/
--given a table 'kata' with columns 'id', 'base', and 'factor' return the 'id' and your result in a column named 'res'.

-- my answer, best practices and most clever
-- create a column named res that has a boolean response if factor is a factor of base 
select
id,
base % factor = 0 as res
from kata

-- using mod(base, factor) instead of base % factor
SELECT id, MOD(base, factor) = 0 AS res FROM kata;

-- changing string true to boolean with ::boolean
select id,
case
  when base % factor = 0 then 'true'::boolean
  else 'false'::boolean
end as res from kata

-- postgres fn if else
CREATE OR REPLACE FUNCTION is_divisible(factor1 INT, base1 INT)
RETURNS BOOLEAN AS $$
BEGIN
  IF base1 % factor1 = 0 THEN RETURN TRUE;
  ELSE RETURN FALSE;
  END IF;
END $$ LANGUAGE plpgsql;

SELECT id, is_divisible(factor,base) AS res
FROM kata

-- creating column first with a default then filling with update set
ALTER TABLE kata ADD COLUMN res boolean DEFAULT false;

UPDATE kata SET res = true WHERE MOD(base, factor) = 0;

SELECT id, res FROM kata;