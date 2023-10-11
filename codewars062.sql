-- SQL Basics: Up and Down
/*
Given a table of random numbers as follows:

numbers table schema
id
number1
number2
Your job is to return table with similar structure and headings, where if the sum of a column is odd, the column shows the minimum value for that column, and when the sum is even, it shows the max value. You must use a case statement.

output table schema
number1
number2
*/

-- my answer
/*
The description is incredibly confusing. What the really meant was: add up the individual digits of the number in the column and if the result is odd then return the lowest digit in that column. If the result is even then return the highest digit in that column.
*/
select
    case
        when (sum(number1) % 2) != 0 then min(number1)
        else max(number1)
    end as number1,
    case
        when (sum(number2) % 2) != 0 then min(number2)
        else max(number2)
    end as number2
from numbers;

-- best practices and most clever 
-- similar to my answer but using %2 = 1 meaning the answer is odd
select 
  case when sum(number1)%2=1 then min(number1) else max(number1) end as number1, 
  case when sum(number2)%2=1 then min(number2) else max(number2) end as number2
  from numbers

-- case for when the result is even
SELECT
  CASE WHEN(sum(number1)%2=0) THEN max(number1) ELSE min(number1) END as number1,
  CASE WHEN(sum(number2)%2=0) THEN max(number2) ELSE min(number2) END as number2
FROM numbers

-- using <> for no remainder instead of =
SELECT
  CASE WHEN (SELECT SUM(number1) FROM numbers) % 2 <> 0 THEN MIN(number1) ELSE MAX(number1) END AS number1
  ,CASE WHEN (SELECT SUM(number2) FROM numbers) % 2 <> 0 THEN MIN(number2) ELSE MAX(number2) END AS number2
FROM numbers

-- using postgres
DROP FUNCTION IF EXISTS getValue(BIGINT, INTEGER, INTEGER);

CREATE FUNCTION getValue(sumValue BIGINT, minValue INTEGER, maxValue INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN
        CASE
            WHEN sumValue % 2 = 1 THEN minValue
            ELSE maxValue
        END;
END; 
$$ LANGUAGE plpgsql;

SELECT
    getValue(SUM(number1), MIN(number1), MAX(number1)) AS number1
    , getValue(SUM(number2), MIN(number2), MAX(number2)) AS number2
FROM
    numbers