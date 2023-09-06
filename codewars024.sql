-- Beginner Series #2 Clock
/*
Clock shows h hours, m minutes and s seconds after midnight.

Your task is to write a function which returns the time since midnight in milliseconds.

Example:
h = 0
m = 1
s = 1

result = 61000
Input constraints:

0 <= h <= 23
0 <= m <= 59
0 <= s <= 59
*/

-- given table past columns h, m, s return ONLY A NEW COLUMN NAMED res representing the total time in milliseconds
-- my answer, best practices and most clever
SELECT
(h * 3600 + m * 60 + s) * 1000 as res
from past

-- Postgres function
CREATE FUNCTION to_milliseconds(h integer, m integer, s integer) RETURNS bigint
    LANGUAGE plpgsql
    IMMUTABLE
    AS $$
        BEGIN
            RETURN (h * 3600 + m * 60 + s) * 1000;
        END;
    $$;

SELECT to_milliseconds(h, m, s) AS res FROM past;

-- calculating each column individually
SELECT (h*3600000) + (m*60000) + (s*1000) AS res FROM past

-- where clause
select ((h*3600 + m*60 + s)* 1000 )as res 
from past
where (h between 0 and 23) and (m between 0 and 59) and (s between 0 and 59)

-- modifying and renaming the database
with ms as (
  select (s * 1000) s,
         (m * 60)*1000 m,
         (h * 60 * 60)*1000 h
  from past
)
select s+m+h as res
from ms