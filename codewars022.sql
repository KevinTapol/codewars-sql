-- Returning Strings
/*
Write a select statement that takes name from person table and return "Hello, <name> how are you doing today?" results in a column named greeting

[Make sure you type the exact thing I wrote or the program may not execute properly]
person table has name data
*/

-- my answer
-- using concat_ws(separator, firstString, secondString, thirdString)
-- create a column named greeting that takes the name from table person and greets them RETURN THE COLUMN GREETING ONLY!!!
SELECT
concat_ws(' ', 'Hello,', name, 'how are you doing today?') as greeting
from person

-- best practices
-- brute force concatenation and adding the white space in the 1st and 3rd strings
select 'Hello, ' || name || ' how are you doing today?' as greeting from person

-- most clever
-- This is the method I was looking for. I wanted to use string interpolation. This reminds me of Python %s.
-- format('string %s moreStrings', insertInto%s)
select format('Hello, %s how are you doing today?', name) as greeting
from person

-- concat() doesn't have a separator parameter
Select CONCAT('Hello, ',name ,' how are you doing today?') as greeting from person;

-- brute force concatenation but specifying the table that column belongs to
Select ( 'Hello, ' || person.name || ' how are you doing today?')  as greeting from person

-- using function but with using language sql instead of Postgres
CREATE OR REPLACE FUNCTION greeting_func (t1 text) RETURNS text AS $$
  SELECT * FROM FORMAT('Hello, %s how are you doing today?', t1);
$$ LANGUAGE SQL;

SELECT greeting_func(name) AS greeting
FROM person

-- very clever to use replace() to replace <name> with the column name in the string
SELECT REPLACE(
  'Hello, <name> how are you doing today?',
  '<name>', name
) as greeting FROM person;

-- using switch case to make sure that the specific row in column name is not null
SELECT
CASE WHEN p.name IS NOT NULL
THEN 'Hello, ' || name || ' how are you doing today?' 
Else 'No name'
END AS greeting
FROM person p;