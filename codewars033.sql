-- Grasshopper - Messi goals function
/*
Messi goals function
Messi is a soccer player with goals in three leagues:

LaLiga
Copa del Rey
Champions
Complete the function to return his total number of goals in all three leagues.

Note: the input will always be valid.

For example:

5, 10, 2  -->  17
*/

-- given a table, goals, with columns la_liga_goals, copa_del_rey_goals, and champions_league_goals. Return a table with a column, res.

-- my answer, best practices and most clever
-- add up the columns as a new column res
SELECT
la_liga_goals + copa_del_rey_goals + champions_league_goals as res
from goals

-- alter table to add column then update the empty column
ALTER TABLE goals ADD res int;
UPDATE goals SET res = (la_liga_goals + champions_league_goals + copa_del_rey_goals);
SELECT res FROM goals;

-- postgres function returning a query
CREATE OR REPLACE FUNCTION goal_table()
    RETURNS TABLE( res INT) AS $$

BEGIN
  RETURN QUERY SELECT
                      g.la_liga_goals + g.copa_del_rey_goals + g.champions_league_goals AS res
                FROM 
                      goals g;
END;
$$ LANGUAGE plpgsql;

SELECT * from goal_table();

-- 
select sum(b.goals) res
from 
  goals a,
  lateral (values (la_liga_goals), (copa_del_rey_goals), (champions_league_goals)) b(goals)
group by a.id
order by a.id

-- using sum()
select(
        select sum(t.f)
        from (values (goals.la_liga_goals),(goals.copa_del_rey_goals), (goals.champions_league_goals)) t(f) 
) as res
from goals

-- using sum()  and with on each column
with total_la_liga_goals (id,total) as
  (select distinct id, sum(la_liga_goals) 
   from goals
   group by id
  )
  ,total_copa_del_rey_goals (id,total) as
  (select distinct id,sum(copa_del_rey_goals)
   from goals
   group by id
  )
  ,total_champions_league_goals (id,total) as 
  (select distinct id,sum(champions_league_goals)
   from goals
   group by id)
   
select (total_champions_league_goals.total + total_copa_del_rey_goals.total + total_la_liga_goals.total) as res
from total_champions_league_goals
left join total_copa_del_rey_goals on total_champions_league_goals.id = total_copa_del_rey_goals.id
left join total_la_liga_goals on total_champions_league_goals.id = total_la_liga_goals.id
order by total_champions_league_goals.id;