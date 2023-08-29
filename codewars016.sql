-- Convert boolean values to strings 'Yes' or 'No'.

/*
Complete the method that takes a boolean value and return a "Yes" string for true, or a "No" string for false.
*/
-- given a table 'booltoword' with column 'bool', return a table with column 'bool' and your result in a column named 'res'.

-- my answer and best practices
-- if the row is true then return a row 'Yes' in the new column res else return 'No' in the new column res
SELECT
bool,
case when bool = true then 'Yes'
else 'No'
end as res
from booltoword

-- most clever
-- create a new column res copy of bool but since 0 evaluates to boolean false and 1 to boolean true use replace on the bool column copy 
select bool,
replace (
         replace (bool , 0, 'No'),
        1,'Yes') res
   from booltoword

-- being specific for true and false statements
SELECT
  bool,
  CASE
    WHEN bool = true THEN 'Yes'
    WHEN bool = false THEN 'No'
  END
  AS res  
FROM booltoword