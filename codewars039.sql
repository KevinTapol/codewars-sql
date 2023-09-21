-- SQL Basics: Simple WHERE and ORDER BY
/*
For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50

people table schema
id
name
age
You should return all people fields where their age is over 50 and order by the age descending

NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/

-- my answer, best practices and most clever
-- grab all columns 
select * from people
where age > 50
order by age desc

-- listing each column and renaming the table
SELECT p.id, p.name, p.age
  FROM people AS p
  WHERE p.age > 50
  ORDER BY p.age DESC;