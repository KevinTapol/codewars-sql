-- Will you make it?
/*
You were camping with your friends far away from home, but when it's time to go back, you realize that your fuel is running out and the nearest pump is 50 miles away! You know that on average, your car runs on about 25 miles per gallon. There are 2 gallons left.

Considering these factors, write a function that tells you if it is possible to get to the pump or not.

Function should return true if it is possible and false if not.

Return all columns EXCEPT ID COLUMNS!!
*/
--END AS same as break case statement and as keyword means alias to create column name res with this data AS is not required END res
-- my answer
select 
distance_to_pump,
mpg,
fuel_left,
CASE WHEN 
    distance_to_pump - (mpg*fuel_left) > 0 THEN false
ELSE true
END AS res 
from zerofuel

-- best practices and most clever
-- creating a new column in your select statement
SELECT distance_to_pump, mpg, fuel_left, distance_to_pump <= mpg * fuel_left AS res 
FROM zerofuel


-- wow I didn't know you could use conditionals
create or replace function is_possible(distance_to_pump int,mpg int,fuel_left int) returns boolean as
$$
begin
if   distance_to_pump<=mpg*fuel_left then  return true ;
else return false;  
end if;
end;
$$ language plpgsql;
select
distance_to_pump, 
mpg ,
fuel_left,
  is_possible(distance_to_pump,mpg,fuel_left ) as res
from zerofuel