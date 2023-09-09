-- Opposites Attract
/*
Timmy & Sarah think they are in love, but around where they live, they will only know once they pick a flower each. If one of the flowers has an even number of petals and the other has an odd number of petals it means they are in love.

Write a function that will take the number of petals of each flower and return true if they are in love and false if they aren't.
*/
-- given a table 'love' with columns 'flower1' and 'flower2', return a table with all the columns and your result in a column named 'res'.
-- my answer
-- if both are even or both or odd return false else true
SELECT
flower1,
flower2,
case 
    when flower1 % 2 = 0 and flower2 % 2 = 0 then false
    when flower2 % 2 != 0 and flower1 % 2 != 0 then false
    else true
end as res
from love

-- best practices and most clever
-- clever using truthy/falsy as an implicit return 
SELECT flower1, flower2, (flower1 + flower2) % 2 = 1 AS res 
FROM love

-- same as best practices and most clever but not using truthy/falsy
SELECT flower1,flower2, CASE
    WHEN (flower1+flower2)%2=0 THEN false
    ELSE true
END 
AS res
FROM love

-- using mod() instead of %
SELECT  flower1, 
        flower2, 
        CASE 
              WHEN MOD(flower1, 2) = 0 AND MOD(flower2, 2) <> 0 THEN TRUE
              WHEN MOD(flower2, 2) = 0 AND MOD(flower1, 2) <> 0 THEN TRUE
              ELSE FALSE
        END AS res
FROM love;

-- using truthy falsy comparing remainders
SELECT
  flower1,
  flower2,
  flower1 % 2 != flower2 % 2 AS res
FROM love;