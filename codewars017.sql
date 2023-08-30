-- String repeat
/*
Write a function that accepts an integer n and a string s as parameters, and returns a string of s repeated exactly n times.

Examples (input -> output)
6, "I"     -> "IIIIII"
5, "Hello" -> "HelloHelloHelloHelloHello"
*/

--given a table 'repeatstr' with columns 'n' and 's', return a table with all columns and your result in a column named 'res'.

-- my answer and best practices
-- using repeat(string, number)
select
s,
n,
repeat(s,n) as res
from repeatstr

-- most clever
-- use PostgresSQL to create a function, declare an empty column res, use a while loop to concat() string t to res i times
-- call that function on columns n and s, as column res and display the columns n, s, and res from table repeatstr
/*
create a new rule or function named fkt requiring inputs of int i and string or text t
allow PostgreSQL or 'plpgsql' language to perform more complex operations and computations encapsulating the function between AS $$ and $$;
declare an empty column res as text with empty strings
while i is greater than 0
decrement i by 1
concat t to column res
repeat the while loop till i = 0
*/
CREATE OR REPLACE FUNCTION fkt(i int, t text) RETURNS text LANGUAGE 'plpgsql' AS $$
DECLARE res text := '';
BEGIN
  WHILE i>0 LOOP
    i := i-1;
    res := CONCAT(res,t);
  END LOOP;
  RETURN res;
END;
$$;

SELECT s,n,fkt(n,s) AS res
FROM repeatstr

-- using a for loop instead of a while loop
CREATE or REPLACE FUNCTION multi_pulti (string VARCHAR, repeat_count INT)
RETURNS VARCHAR
language plpgsql
as
$$
DECLARE 
  result VARCHAR;  
BEGIN
  result = '';
  FOR k IN 1..repeat_count LOOP  
  result = result || string;
END LOOP;  
  
  RETURN result;
END;
$$;

select s, n, multi_pulti(s, n) as res from repeatstr;