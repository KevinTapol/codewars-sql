-- SQL Basics: Simple DISTINCT

-- For this challenge you need to create a simple DISTINCT statement, you want to find all the unique ages.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age (distinct)
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

select
age
from people
group by age

-- my answer, best practices and most clever
-- distinct key word to eliminate duplicates
select
distinct age
from people

-- table alias
select
distinct p.age
from people as p

-- interesting that you can pass in the column age as what looks like an argument for distinct()
select distinct(p.age) from people p

-- lol using non existing string comparison with LIMIT
SELECT DISTINCT(people.age) as age
FROM people
WHERE people.name!='George Bush'
LIMIT 69;

-- creating a new column named Dist_age that uses distinct and grabbing all the values from it
with Dist_age as 
(
  select 
  DISTINCT 
  people.age
from people
)

select * from Dist_age