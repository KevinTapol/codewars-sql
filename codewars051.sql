-- SQL: Concatenating Columns
/*
Given the table below:

** names table schema **

id
prefix
first
last
suffix
Your task is to use a select statement to return a single column table containing the full title of the person (concatenate all columns together except id), as follows:

** output table schema **

title
Don't forget to add spaces.
*/

-- use concat(column, ' ') adding each column and alias to name the new column as title from the table names
-- my answer
SELECT
concat(prefix, ' ', first, ' ', last, ' ', suffix) as title
from names

-- best practices and most clever
SELECT concat_ws(' ', prefix,first,last,suffix) AS title FROM names;

-- format() string interpolation
SELECT format('%s %s %s %s', prefix, first, last, suffix) AS title
  FROM names

-- || is the concatenate operator
SELECT prefix || ' ' || first || ' ' || last || ' ' || suffix AS title  FROM names

-- creating an array then converting to string with empty space in-between
select
  array_to_string(array[prefix,first,last,suffix],' ') as title
from
  names