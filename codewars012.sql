-- Even or Odd

/*
You will be given a table numbers, with one column number.

Return a dataset with two columns: number and is_even, where number contains the original input value, and is_even containing "Even" or "Odd" depending on number column values.

Numbers table schema
* number INT
Output table schema
* number  INT
* is_even STRING

*/

-- Return an output table of the input column number and another column named is_ even of each row as even or odd in string type 
-- my answer using switch case
select
number,
case when   
    number % 2 = 0 then 'Even'
else
    'Odd'
end as is_even
from numbers

-- best practices same as my answer but using capitalization and parenthesis
SELECT number, 
CASE WHEN (number % 2) = 0 THEN 'Even'
ELSE 'Odd' END AS is_even
FROM numbers;

-- Altering the table to add a column, using update set where to fill the columns based on even odd and returning the altered table with a select statement.
ALTER TABLE numbers
ADD COLUMN IF NOT EXISTS is_even VARCHAR(4);

UPDATE numbers SET is_even = 'Even' WHERE number%2 = 0;
UPDATE numbers SET is_even = 'Odd' WHERE number%2 != 0;

SELECT * FROM numbers;

-- using not equals != for initial case
SELECT number, 
  CASE WHEN number % 2 != 0 THEN 'Odd'
  ELSE 'Even' END AS is_even
FROM numbers;