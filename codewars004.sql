-- On the Canadian Border (SQL for Beginners #2)

-- You are a border guard sitting on the Canadian border. You were given a list of travelers who have arrived at your gate today. You know that American, Mexican, and Canadian citizens don't need visas, so they can just continue their trips. You don't need to check their passports for visas! You only need to check the passports of citizens of all other countries!

-- Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US.

-- travelers table schema

-- name
-- country
-- NOTE: The United States is written as 'USA' in the table.

-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.

--  Return the name and country of all travelers whose country is not Canada, Mexico, USA

-- my answer 
select name, country from travelers
where country != 'USA' 
and country != 'Canada'
and country != 'Mexico';

-- my answer refactored, best practice and clever
select name, country from travelers
where country not in ('Canada', 'USA', 'Mexico')

-- using an array of strings
SELECT
  name,
  country
FROM travelers 
WHERE country <> ALL(ARRAY['Mexico','Canada','USA']);

-- renaming the tables
SELECT t.name, t.country
FROM travelers AS t
WHERE t.country NOT IN ('USA', 'Canada', 'Mexico');