-- SQL with Harry Potter: Sorting Hat Comparators
/*
There is truly no magic in the world; the Hogwarts Sorting Hat is SQL-based, its decision-making powers are common operators and prospectIve students are merely data - names, and two columns of qualities.

students

id
name
quality1
quality2
Slytherin are being quite strict this year and will only take students who are evil AND cunning.
Gryffindor will take students who are brave but only if their second quality is NOT evil.
Ravenclaw accepts students who are studious OR intelligent.
Hufflepuff will simply take those who have the quality hufflepuff.

(don't worry, for simplicity's sake 'brave' and 'studious' will only appear in quality1, and 'cunning' and 'intelligent' will only appear in quality2.)

Return the id, name, quality1 and quality2 of all the students who'll be accepted, ordered by ascending id.
*/

-- my answer
-- grab all columns where sorting hat conditions are met and order the table by id in ascending order
select
*
from students
where
  (quality1 = 'evil' and quality2 = 'cunning') or
  (quality1 = 'brave' and quality2 != 'evil') or
  (quality1 = 'studious' or quality2 = 'intelligent') or
  (quality1 = 'hufflepuff' or quality2 = 'hufflepuff')
order by id asc;

-- best practices 
-- omitting the key word asc since order by orders by ascending by default
Select * 
from students 
where ((quality1='evil' and quality2='cunning')
or (quality1='brave' and quality2 !='evil')
or  (quality1='studious' or quality2='intelligent')
or (quality1='hufflepuff' or quality2='hufflepuff'))
order by id

-- most clever 
-- making a new column house where all the conditions are met and grabbing the original data where the house column is not null
WITH
    sorted_students AS (
      SELECT
        s.*,
        CASE
        WHEN (s.quality1 = 'evil' AND s.quality2 = 'cunning')
             OR (s.quality1 = 'cunning' AND s.quality2 = 'evil')
          THEN 'Slytherin'
        WHEN (s.quality1 = 'brave' AND s.quality2 != 'evil')
             OR (s.quality1 != 'evil' AND s.quality2 = 'brave')
          THEN 'Gryffindor'
        WHEN (s.quality1 = 'studious' OR s.quality2 = 'studious' OR s.quality1 = 'intelligent' OR
              s.quality2 = 'intelligent')
          THEN 'Ravenclaw'
        WHEN (s.quality1 = 'hufflepuff' OR s.quality2 = 'hufflepuff')
          THEN 'Hufflepuff'
        ELSE NULL
        END AS house
      FROM students s
  )
SELECT
  ss.id,
  ss.name,
  ss.quality1,
  ss.quality2
FROM sorted_students ss
WHERE ss.house NOTNULL
ORDER BY ss.id;

-- clever to use key word in
SELECT * FROM students
WHERE quality1 IN ( 'hufflepuff', 'studious') 
OR quality2 IN ( 'hufflepuff', 'intelligent') 
OR (quality1 = 'evil' AND quality2 = 'cunning')
OR (quality1 = 'brave' AND quality2 != 'evil')