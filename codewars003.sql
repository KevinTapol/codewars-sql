-- Easy SQL - Ordering

-- Your task is to sort the information in the provided table 'companies' by number of employees (high to low). Returned table should be in the same format as provided:

-- companies table schema

-- id
-- ceo
-- motto
-- employees
-- Solution should use pure SQL. Ruby is only used in test cases.

-- Return the table data in descending order by the employees column

-- my answer, best practices and most clever
select * from companies
order by employees desc;

-- listing all the columns individually instead of using *
SELECT id, ceo, motto, employees FROM companies ORDER BY employees DESC

-- using column location of 4 instead of column name employees
select id,ceo,motto,employees
from companies
order by 4 desc

-- renaming the table c and adding a group by statement
select c.id, c.ceo, c.motto, c.employees
from companies as c
group by c.id
order by c.employees desc;