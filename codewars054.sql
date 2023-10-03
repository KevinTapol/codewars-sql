-- SQL Basics - Position
/*
You have access to a table of monsters as follows:

monsters schema

id
name
legs
arms
characteristics
In each row, the characteristic column has a single comma. Your job is to find it using position(). You must return a table with the format as follows:

output schema

id
name
comma
The comma column will contain the position of the comma within the characteristics string. Order the results by comma.
*/

-- return a table named monsters with the column id and name and a new column named comma searching for the position of ',' in the column named characteristics 
-- my answer and best practices
SELECT id, 
name, 
position(',' in characteristics) as comma 
FROM monsters
ORDER BY comma ASC;

-- most clever is not including the key word asc in order by
SELECT id, 
name, 
POSITION(',' IN characteristics) as comma 
FROM monsters 
ORDER BY comma;

-- renaming the table as m
SELECT
  m.id,
  m.name,
  POSITION(',' IN m.characteristics) AS comma
FROM monsters AS m
ORDER BY comma;