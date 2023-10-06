-- SQL with LOTR: Elven Wildcards
/*
Deep within the fair realm of Lothlórien, you have been asked to create a shortlist of candidates for a recently vacated position on the council.

Of so many worthy elves, who to choose for such a lofty position? After much thought you decide to select candidates by name, which are often closely aligned to an elf's skill and temperament.

Choose those with tegil appearing anywhere in their first name, as they are likely to be good calligraphers, OR those with astar anywhere in their last name, who will be faithful to the role.

Elves table:

firstname
lastname
all names are in lowercase

To aid the scribes, return the firstname and lastname column concatenated, separated by a space, into a single shortlist column, and capitalise the first letter of each name.
*/
--but on the land of Lórien no shadow lay--

-- return 1 column of first name and last name capitalizing the first letter concatenated together where either the firstname column contains 'tegil' or the lastname column contains 'astar'
-- my answer
-- using uppercase on only the first letter separated then concat the rest of the columns starting from the next letter on 
select 
(concat(upper(left(firstname, 1)), substr(firstname, 2), ' ', upper(left(lastname, 1)), substr(lastname, 2))) as shortlist
from Elves
where firstname like '%tegil%' or lastname like '%astar%'

-- best practices and most clever
-- using initcap() to capitalize the first letter of each column
-- also using || for concatenation
SELECT INITCAP(firstname || ' ' || lastname) AS shortlist
FROM elves
WHERE firstname LIKE '%tegil%' OR lastname LIKE '%astar%'

-- using initcap() to capitalize first letters and concat_ws() to concat the columns with the separator white space
SELECT INITCAP(concat_ws(' ', firstname, lastname))  AS shortlist   FROM Elves
WHERE firstname LIKE '%tegil%' Or lastname LIKE '%astar%';

-- similar to above but using concat() instead of concat_ws()
SELECT INITCAP(CONCAT(firstname, ' ', lastname)) AS shortlist
  FROM elves
  WHERE firstname LIKE '%tegil%'
    OR lastname LIKE '%astar%'