-- SQL with Sailor Moon: Thinking about JOINs...
/*
Practise some SQL fundamentals by making a simple database on a topic you feel familiar with. Or use mine, populated with a wealth of Sailor Moon trivia.

sailorsenshi schema
id
senshi_name
real_name_jpn
school_id
cat_id
cats schema
id
name
schools schema
id
school
Return a results table - sailor_senshi, real_name, cat and school - of all characters, containing each character's high school, their civilian name and the cat who introduced them to their magical crime-fighting destiny.

Keep in mind some senshi were not initiated by a cat guardian and one is not in high school. The field can be left blank if this is the case.
*/

-- my answer
select
s.senshi_name as sailor_senshi,
s.real_name_jpn as real_name,
c.name as cat,
sch.school
from sailorsenshi s
left join cats c on s.cat_id = c.id
left join schools sch on s.school_id = sch.id;

-- best practices and most clever
-- similar to mine but didn't rename the databases
SELECT
  senshi_name AS sailor_senshi,
  real_name_jpn AS real_name,
  cats.name AS cat,
  school AS school
FROM sailorsenshi
LEFT JOIN cats ON cat_id = cats.id
LEFT JOIN schools ON school_id = schools.id


-- here they are using a full join instead of a left join
SELECT 
  sa.senshi_name AS sailor_senshi,
  sa.real_name_jpn AS real_name,
  ca.name AS cat,
  sc.school AS school
  
FROM sailorsenshi sa
FULL JOIN cats ca     -- FULL JOIN or LEFT JOIN can be used
ON ca.id = sa.cat_id
FULL JOIN schools sc  -- FULL JOIN or LEFT JOIN can be used
ON sc.id = sa.school_id