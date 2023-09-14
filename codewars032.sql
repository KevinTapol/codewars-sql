-- Remove exclamation marks
/*
Write function RemoveExclamationMarks which removes all exclamation marks from a given string.
*/

-- given a table 'removeexclamationmarks' with column 's', return a table with column 's' and your result in a column named 'res'.

-- my answer, best practices and most clever
-- using translate(string, 'charToBeReplaced', 'charReplacing')
SELECT
s,
translate(s, '!', '') as res
from removeexclamationmarks

-- using regex
select s, regexp_replace(s,'[!]+','','g')  res

from removeexclamationmarks

-- using replace
select s, replace(s, '!', '') as res from removeexclamationmarks

-- postgres function using translate
CREATE OR REPLACE FUNCTION RemoveExclamationMarks (s TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN TRANSLATE(s, '!', '');
END $$;

SELECT
  s,
  RemoveExclamationMarks(s) res
FROM
  removeexclamationmarks;

--  postgres using regex
CREATE OR REPLACE FUNCTION removeexclamationmarks(input_string TEXT)
RETURNS TABLE (res TEXT) AS $$
BEGIN
    res := regexp_replace(input_string, '(!+)', '', 'g');
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql;

SELECT s, regexp_replace(s, '(!+)', '', 'g') as res FROM removeexclamationmarks;