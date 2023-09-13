-- Third Angle of a Triangle
/*
You are given two interior angles (in degrees) of a triangle.
Write a function to return the 3rd.
Note: only positive integers will be tested.
*/


-- given a table 'otherangle' with columns 'a' and 'b'.
-- return a table with these columns and your result in a column named 'res'.
-- my answer, best practices and most clever
-- add up both columns and subtract the sum from 180 as the column res
SELECT
a,
b,
180 - (a+b) as res
from otherangle

-- using postgres function being end
create or replace function getAngle(a int,b int) returns integer as
$$
begin
return 180-a-b;
end;
$$ language plpgsql;

select a, b,getAngle(a,b) as res from otherangle

-- interesting using postgres to return a query select
CREATE OR REPLACE FUNCTION fn_get_angles() RETURNS TABLE ("a" int, "b" int, "res" int)
AS $$
BEGIN
  RETURN QUERY SELECT 
    o.a, o.b, (180 - (o.a + o.b)) as res
  FROM otherangle o;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fn_get_angles();