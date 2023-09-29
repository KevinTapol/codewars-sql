-- Easy SQL: Convert to Hexadecimal
/*

to hexYou have access to a table of monsters as follows:

monsters table schema
id
name
legs
arms
characteristics
Your task is to turn the numeric columns (arms, legs) into equivalent hexadecimal values.

output table schema
legs
arms
*/

-- my answer and should be best practices in my opinion but this kata ONLY ACCEPTS THE MySQL FUNCTION TO_HEX()
-- converting the integer to base 16 which does not work in MySQL
SELECT
legs::varchar(16) as legs,
arms::varchar(16) as arms
from monsters

-- my other answer that also doesn't work in this kata because it only accepts MySQL functions
SELECT
CONVERT(varchar(50), legs, 16) as legs,
CONVERT(varchar(50), arms, 16) as arms
from monsters

-- clever, someone used postgres function to get around the demand of the to_hex() function
create or replace function hex(number integer)returns varchar(8) language plpgsql as $$
declare s varchar(8);
BEGIN
  s:=substr('0123456789abcdef',1+(number % 16),1);
  if number>=16 then return concat(hex(number/16),s);end if;
  return s;
END
$$
;
select hex(legs) as legs,hex(arms) as arms from monsters

-- the answer they expected which only works in MySQL
SELECT 
TO_HEX(legs) legs, 
TO_HEX(arms) arms 
from monsters;