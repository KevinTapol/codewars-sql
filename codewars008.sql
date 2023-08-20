-- Multiply

-- This code does not execute properly. Try to figure out why.
SELECT * FROM items sum(price,amount) AS total 

-- The name of the kata says multiply. So I'm assuming they want the values of the columns multiplied together. If this is true, then I need to return a table of columns price and amount multiplied together at there respective rows as a new column named total.

-- my answer
SELECT price * amount as total from items

-- best practices is using parenthesis for the multiply
SELECT (price*amount) AS total FROM items

-- most clever
-- CAST() function converts a value (of any type) into a specified datatype. In this case they are using float.
-- The CASE command is used is to create different output based on conditions. This reminds me of switch case default or if elif else.
-- Example of CASE WHEN THEN ELSE: 
    -- SELECT OrderID, Quantity,
    -- CASE
    --     WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    --     WHEN Quantity = 30 THEN 'The quantity is 30'
    --     ELSE 'The quantity is under 30'
    -- END
    -- FROM OrderDetails;

SELECT CASE WHEN CAST(price AS float) IS NULL
  THEN 0.0
  ELSE CAST(price AS float) 
  END
  *
  CASE WHEN CAST(amount AS float) IS NULL 
    THEN 0.0
    ELSE CAST(amount AS float)
    END
     AS total 
   FROM items

-- using rowid+1 instead of column name amount
SELECT price *(rowid+1) AS total FROM items

-- declaring the data as floats from each column
SELECT (price::float * amount::float) AS total FROM items