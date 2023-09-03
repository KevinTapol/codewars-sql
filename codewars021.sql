-- Keep Hydrated!

/*
Nathan loves cycling.

Because Nathan knows it is important to stay hydrated, he drinks 0.5 litres of water per hour of cycling.

You get given the time in hours and you need to return the number of litres Nathan will drink, rounded to the smallest value.

For example:

hours = 3 ----> liters = 1

hours = 6.7---> liters = 3

hours = 11.8--> liters = 5
Input data is available from the table cycling, which has 2 columns: id and hours. For each row, you have to return 3 columns: id, hours and liters (not litres, it's a difference from the kata description)
*/

-- my answer
-- multiplying hours by the 0.5 liters per hour then rounding down with floor
SELECT
id,
hours,
floor(hours * 0.5) as liters
from cycling

-- best practices and most clever
-- same as my answer but dividing by 2 instead of multiplying by 0.5
-- also using * to grab all tables instead of specifying each table
SELECT *, floor(hours / 2) as liters FROM cycling

-- using trunc() to round down
SELECT *, trunc(hours* 0.5)  AS liters FROM cycling

-- adding column to table instead of using alias
ALTER TABLE cycling 
ADD COLUMN liters INTEGER;

UPDATE cycling 
SET liters=FLOOR(hours*0.5);

SELECT * FROM cycling;

-- using round( as int) to round down
SELECT *
  , CAST(ROUND(hours / 2 - 0.5) AS int) AS liters
FROM cycling

-- rounding up with ceil() then subtracting by 1
SELECT *,CEIL(hours*0.5)-1 AS liters FROM cycling