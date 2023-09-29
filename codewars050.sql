-- SQL Basics: Simple JOIN with COUNT
/*
For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the toys table so that you can return the COUNT of the toys

people table schema
id
name
toys table schema
id
name
people_id
You should return all people fields as well as the toy count as "toy_count".

NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/

-- return a table with all columns from people table and join with toys table with a column toy_count of the total count() of toys
-- my answer
SELECT
people.*,
count(toys.id) as toy_count
from people
left join toys
on people.id = toys.people_id
group by people.id, toys.people_id

-- best practices and most clever
-- very similar to my answer but using the key word join instead of left join and renaming columns and tables
SELECT p.*, COUNT(t) AS toy_count
FROM people p
JOIN toys t
  ON t.people_id = p.id
GROUP BY p.id

-- using a where clause
SELECT
  p.*,
  COUNT
    (t.id) AS toy_count
FROM
  people AS p,
  toys AS t
WHERE
  p.id = t.people_id
GROUP BY
  p.id
ORDER BY
  p.id;

-- using inner join
SELECT people.*, COUNT(toys.*) AS toy_count
FROM toys
INNER JOIN people
ON toys.people_id = people.id
GROUP BY people.id;