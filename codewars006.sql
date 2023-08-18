-- Easy SQL: Counting and Grouping

-- Given a demographics table in the following format:

-- ** demographics table schema **

-- id
-- name
-- birthday
-- race
-- you need to return a table that shows a count of each race represented, ordered by the count in descending order as:

-- ** output table schema **

-- race
-- count

--give me a single row for each race and the count of people who belong to that race from the demographics table ordered by the count descending

-- my answer
select race,
count(id) as count
from demographics
group by race
order by count(id) desc


select race,
count(*) as count
from demographics
group by race
order by count(*) desc

-- best practices and most clever
SELECT race, COUNT(race)
FROM demographics
GROUP BY race
ORDER BY Count(race) desc

-- similar to best practices but using count(*) to count all instead
SELECT RACE, COUNT(*) AS COUNT
FROM DEMOGRAPHICS
GROUP BY RACE
ORDER BY COUNT DESC;

-- using count(1)
SELECT
  RACE,
  COUNT(1) AS COUNT
FROM
  DEMOGRAPHICS
GROUP BY
  RACE
ORDER BY
  COUNT DESC