-- SQL Basics: Simple GROUP BY
/*
For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

people table schema
id
name
age
select table schema
age [group by]
people_count (people count)
NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/

-- return a table named people group by column age and create a column people_count counting age duplicates 
-- my answer
SELECT
age,
count(age) as people_count
from people
group by age

-- best practices and most clever using count(*)
SELECT
  age,
  COUNT(*) people_count
FROM
  people
GROUP BY
  age

-- using count on name
SELECT age, COUNT(name) AS people_count
FROM people
GROUP BY age

-- using count on id
SELECT age,
       COUNT(id) AS people_count
FROM people
GROUP BY age