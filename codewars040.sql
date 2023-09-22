-- SQL Basics: Simple SUM
/*
For this challenge you need to create a simple SUM statement that will sum all the ages.

people table schema
id
name
age
select table schema
age_sum (sum of ages)
NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

NOTE2: You need to use ALIAS for creating age_sum
*/


-- very confusing at first, what they want is a single row of every integer in the column age summed in one column with one row named age_sum
-- my answer and best practices
SELECT
sum(age) as age_sum
from people

-- most clever
-- not using the key word as for alias
SELECT
  SUM(age) age_sum
FROM
  people

-- specifying the table in the sum() statement
SELECT SUM(people.age) as age_sum FROM people;