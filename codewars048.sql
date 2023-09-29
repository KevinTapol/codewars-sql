-- Best-Selling Books (SQL for Beginners #5)
/*
You work at a book store. It's the end of the month, and you need to find out the 5 bestselling books at your store. Use a select statement to list names, authors, and number of copies sold of the 5 books which were sold most.

books table schema

name
author
copies_sold
NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
*/
-- use a select statement on the table named books with columns name, author, copies_sold of ONLY THE TOP 5 HIGHEST COPIES SOLD

-- my answer, best practices and most clever
-- using order by on the column copies_sold in descending order and limiting the records with limit to 5
SELECT
*
from books
order by copies_sold desc
limit 5

-- listing every column instead of using the universal selector *
SELECT name, author, copies_sold
  FROM books
ORDER BY copies_sold DESC 
 LIMIT 5

-- using fetch first 5 rows only instead of limit 5
SELECT * FROM books
ORDER BY copies_sold DESC 
FETCH FIRST 5 ROWS ONLY;