-- Simple multiplication
/*
This kata is about multiplying a given number by eight if it is an even number and by nine otherwise.
*/
-- given a table 'multiplication' with column 'number', return a table with column 'number' and your result in a column named 'res'. 


-- my answer and best practices
-- if the number is even then multiply it by 8 else multiply it by 9 and create a new column 'res' to store the data in 
SELECT
number,
case
    when number % 2 = 0 then number * 8
    else number * 9
end as res
from multiplication

-- most clever 
-- here they used the method MOD() instead of the math symbol % and multiplied the outcome by number instead of in the individual case when statements
SELECT number, number * 
      (CASE WHEN MOD(number, 2) = 1 THEN 9 ELSE 8 END) AS res 
FROM multiplication

-- same idea as most clever but using string interpolation with type conversion
select number, number * ('{8, 9}'::int[])[1 + number % 2] res
from multiplication

-- postgres answer using function rule
CREATE OR REPLACE FUNCTION multi(number_value int)
RETURNS int
AS $$
DECLARE
  return_value int;
BEGIN
  IF number_value % 2 = 0 THEN
    return_value := number_value * 8;
  ELSE
    return_value := number_value * 9;
  END IF;
  
  RETURN return_value;
END;
$$ LANGUAGE plpgsql;
SELECT number, multi(number) AS res
FROM multiplication