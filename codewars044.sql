-- Easy SQL: LowerCase
/*
Given a demographics table in the following format:

** demographics table schema **

id
name
birthday
race
you need to return the same table where all letters are lowercase in the race column.
*/

-- my answer and best practices using lower() on the column
SELECT
id,
name,
birthday,
lower(race) as race
from demographics

-- most clever using universal selector and lower() on specific column
SELECT *, lower(race) AS race
FROM demographics

-- this should be best practice imo using update set 
UPDATE demographics SET race = LOWER(race);
SELECT * FROM demographics;

-- translate()
SELECT * FROM demographics, TRANSLATE(race, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') as race;