-- SQL Basics: Repeat and Reverse
/*
Using our monsters table with the following schema:

monsters table schema

id
name
legs
arms
characteristics
return the following table:

** output schema**

name
characteristics
Where the name is the original string repeated three times (do not add any spaces), and the characteristics are the original strings in reverse (e.g. 'abc, def, ghi' becomes 'ihg ,fed ,cba').
*/

-- return a column named name that is the original column name but repeated 3 times WITHOUT ADDING SPACES! and a second column named characteristics that is the column characteristics but in reverse string order
-- my answer and best practices using repeat(string, numberOfRepeats) reverse(string)
select
repeat(name,3) as name,
reverse(characteristics) as characteristics
from monsters

-- most clever
-- using || to concatenate 
SELECT (name || name || name) as name, REVERSE(characteristics) as characteristics
FROM monsters

-- using concat()
SELECT concat(name, name, name) as name, Reverse(characteristics) as characteristics FROM monsters;

-- updating the current table instead of creating new columns
UPDATE monsters
SET name = CONCAT(name, name, name);

UPDATE monsters
SET characteristics = REVERSE(characteristics);

SELECT name, characteristics FROM monsters;

-- using replace(string, old_string, new_string)
SELECT REPLACE((m.name||m.name||m.name),' ','') AS name,
REVERSE(m.characteristics) AS characteristics
FROM monsters m

-- concat_ws(separator, expression1, expression2, expression3,...)
select concat_ws('', name, name, name) as name, reverse(characteristics) as characteristics from monsters