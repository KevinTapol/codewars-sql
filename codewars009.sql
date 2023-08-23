-- SQL Basics: Simple JOIN

/*
For this challenge you need to create a simple SELECT statement that will return all columns from the products table, and join to the companies table so that you can return the company name.

products table schema
id
name
isbn
company_id
price
companies table schema
id
name
You should return all product fields as well as the company name as "company_name".

NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/ 

-- aliases is a neat way of labeling columns that are the result of some calculations

-- my answer
SELECT
t1.*,
t2.name as company_name
from products as t1
left join companies as t2
on t1.company_id = t2.id

-- best practices and most clever
-- same answer as my answer but using a different variable name for table companies
SELECT products.*, companies.name AS company_name
FROM products JOIN companies ON company_id = companies.id

-- listing all tables
SELECT 
  products.id,
  products.name,
  products.isbn,
  products.company_id,
  products.price,
  companies.name as company_name
FROM
  products
JOIN
  companies on companies.id = products.company_id

-- using an inner join
SELECT 
  products.*,
  companies.name as company_name
FROM products INNER JOIN companies ON companies.id = products.company_id