-- Century From Year
/*
The first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.

Task
Given a year, return the century it is in.

Examples
1705 --> 18
1900 --> 19
1601 --> 17
2000 --> 20
In SQL, you will be given a table years with a column yr for the year. Return a table with a column century.
*/

-- my answer 
-- if there is a remainder when dividing my 100 then round up and add 1 else return yr divided by 100
SELECT
case when yr % 100 != 0 then ceil(yr/100) + 1
else yr/100
end as century
from years

-- best practices and most clever
-- dividing by a float to 2 decimal places which specifies the return type
SELECT CEILING(yr/100.00) AS Century
FROM years

-- MOST CLEVER IMO
-- lol using date object to convert to century
SELECT
  EXTRACT(CENTURY FROM TO_DATE(yr::text, 'YYYY')) AS century
FROM years;


-- clever use of math
-- adding 99 then dividing by 100 instead of rounding up
select (yr+99)/100 as century from years;


-- :: changes yr rows into floating point numbers
select ceil(yr::real / 100) as century from years;

-- converting to float with ::float, rounding up with ceil() and converting back into integer with ::integer
select ceil(yr::float / 100)::integer as century
from years;

-- using Postgres to create a function to run if else statements
CREATE OR REPLACE FUNCTION century(year integer)
RETURNS integer
AS $$
BEGIN 
   IF (year % 100 = 0) THEN
    RETURN (year / 100);
    ELSE
     RETURN FLOOR((year+100)/100) ;
    END IF;
   END;
  $$ LANGUAGE plpgsql;
  
select century(yr) from years