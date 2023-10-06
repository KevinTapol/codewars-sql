-- SQL Basics: Maths with String Manipulations
/*
Given a demographics table in the following format:

demographics table schema
id
name
birthday
race
return a single column named calculation where the value is the bit length of name, added to the number of characters in race.
*/

-- my answer and best practices
-- length() returns the length of the given string
-- bit_length() returns the length of the given string in bits
-- add bit_length of name and length of race and set it equal to a new column calculation
select
(bit_length(name) + length(race)) as calculation
from demographics

-- most clever 
-- using length()*8 instead of bit_length()
SELECT  length(name)*8 + length(race) AS calculation
FROM demographics

-- using char_length() instead of length()
SELECT bit_length(name)+char_length(race) as calculation FROM demographics