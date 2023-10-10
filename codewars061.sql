-- Easy SQL: Bit Length
/*
Given a demographics table in the following format:

** demographics table schema **

id
name
birthday
race
you need to return the same table where all text fields (name & race) are changed to the bit length of the string.
*/

-- my answer and best practices
-- using bit_length()
select
id,
birthday,
bit_length(name) as name,
bit_length(race) as race
from demographics

-- most clever
-- using octet_length()
SELECT id, 
  octet_length(name)*8 AS name, 
  birthday, 
  octet_length(race)*8 AS race
FROM demographics;

-- using length()*8
select id, LENGTH(name)*8 as name, birthday, LENGTH(race)*8 as race FROM demographics