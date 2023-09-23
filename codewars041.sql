-- SQL Basics: Simple MIN / MAX
/*
For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.

people table schema
id
name
age
select table schema
age_min (minimum of ages)
age_max (maximum of ages)
NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/

-- my answer, best practices and most clever
-- return 2 columns with 1 row each using min() and max() on the column age without the use of group by key word for math on which column
SELECT
min(age) as age_min,
max(age) as age_max
from people

-- clever imo using case statement when exists
-- RETURN 1 ITEM WITH MIN_AGE AND MAX_AGE
-- CREATE MIN AGE 
SELECT 
  CASE 
    WHEN EXISTS (SELECT * FROM people WHERE age IS NOT NULL) 
      THEN (SELECT MIN(age) FROM people)
        ELSE NULL END AS age_min,
-- CREATE MAX AGE
  CASE
    WHEN EXISTS (SELECT * FROM people WHERE age IS NOT NULL) 
      THEN (SELECT MAX(age) FROM people)
        ELSE NULL END AS age_max;