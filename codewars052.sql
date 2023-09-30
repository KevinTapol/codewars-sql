-- Countries Capitals for Trivia Night (SQL for Beginners #6)
/*
Your friends told you that if you keep coding on your computer, you are going to hurt your eyes. They suggested that you go with them to trivia night at the local club.

Once you arrive at the club, you realize the true motive behind your friends' invitation. They know that you are a computer nerd, and they want you to query the countries table and get the answers to the trivia questions.

Schema of the countries table:

country (String)
capital (String)
continent (String)
The first question: from the African countries that start with the character E, get the names of their capitals ordered alphabetically.

You should only give the names of the capitals. Any additional information is just noise
If you get more than 3, you will be kicked out, for being too smart
Also, this database is crowd-sourced, so sometimes Africa is written Africa and in other times Afrika.
Resources:

SQL LIKE Oerator
SQL IN Operator
SQL ORDER BY
NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
*/

-- my answer and most clever
/*
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
There are two wildcards often used in conjunction with the LIKE operator:
 The percent sign % represents zero, one, or multiple characters
 The underscore sign _ represents one, single character

table name is countries columns country, capital and continent

return a table of only 1 column of capitals 
from table countries 
where the continent is like Africa or Afrika and the country starts with a capital E 
ordered from a-z
limit the rows to the first 3
*/
SELECT
capital
from countries
where continent like 'Afri_a' and country like 'E%'
order by capital asc
limit 3

-- best practices uses in key word with string values
SELECT capital 
FROM countries 
WHERE continent IN ('Africa', 'Afrika') 
  AND country LIKE 'E%' 
ORDER BY capital 
LIMIT 3

-- using the wildcard % only instead of a single character random of _
  SELECT capital
    FROM countries
   WHERE continent LIKE 'Afri%'
     AND country LIKE 'E%'
ORDER BY capital ASC
   LIMIT 3
   ;

-- substr(string, start, length) instead of like and wildcard %
SELECT capital
FROM countries
WHERE SUBSTR(country,1,1)='E' 
  AND continent IN ('Africa', 'Afrika')
ORDER BY capital  
LIMIT 3
;

-- key word similar with | for c or k instead of wild card _ for anything
SELECT
  CAPITAL
FROM COUNTRIES
WHERE UPPER(CONTINENT) SIMILAR TO 'AFRI(C|K)A'
  AND COUNTRY ILIKE 'E%'
ORDER BY CAPITAL
LIMIT 3