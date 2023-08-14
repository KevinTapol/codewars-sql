-- Collection Tuition

-- You are working for a local school, and you are responsible for collecting tuition from students. You have a list of all students, some of them have already paid tuition and some haven't. Write a select statement to get a list of all students who haven't paid their tuition yet. The list should include all the data available about these students.

-- students table schema

-- name (string)
-- age (integer)
-- semester (integer)
-- mentor (string)
-- tuition_received (Boolean)
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.


-- Return: Give me a list of all student information
-- where the tuition received values is false

-- my answer
select * from students
where tuition_received = false;

-- best practices and most clever
-- using where not for boolean false rows
select *
from students
where not tuition_received;

-- grabbing every column by name and referring to the column by table name
select name, age, semester, mentor, tuition_received 
from students 
where students.tuition_received = False;

-- referencing the boolean as a string instead of boolean value
select * 
from students
where tuition_received = 'false'

-- referencing the boolean as evaluating to '0' 
-- surprised this is possible
select name, age, semester, mentor, tuition_received
from students 
where tuition_received = '0'

-- using or column is null in the where clause
SELECT *
FROM students
WHERE tuition_received = FALSE 
  OR tuition_received IS NULL