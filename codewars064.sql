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

-- return a table named monsters with the column id, name and a new column named comma using position(',' in characteristics) to display the first occurrence of ',' in the column characteristics HIDDEN REQUIREMENT!!! FOUND IN TEST CASES!!! ORDER BY COMMA !
-- I'm surprised there wasn't an answer using charindex(',', characteristics) as comma
-- my answer 
select
id,
name,
position(',' in characteristics) as comma
from monsters
order by comma

-- best practices
-- similar to my answer but including the key word asc in order by
SELECT id, name, POSITION(',' in characteristics) as comma FROM monsters
ORDER BY comma ASC;