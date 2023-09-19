-- Grasshopper - Terminal game move function
/*
Terminal game move function
In this game, the hero moves from left to right. The player rolls the dice and moves the number of spaces indicated by the dice two times.

In SQL, you will be given a table moves with columns position and roll. Return a table which uses the current position of the hero and the roll (1-6) and returns the new position in a column res.

Example:
move(3, 6) should equal 15
*/

--given a table 'moves' with columns 'position' and 'roll'. return a table with a column 'res'. #--

-- return a table with only 1 column named res with roll*2 + position
-- my answer and best practices
SELECT
position + (roll * 2) as res
from moves

-- most clever
-- top comment: It is bitwise shift left. So if you shift by one, is equivalent to multiply by 2. This solution can be nice here to see, but not in real world: it is not very readable IMO.
SELECT position + (roll << 1) AS res FROM moves;

-- coalesce() returns the first non-null value in a list
select coalesce(position,0)+
       coalesce(roll,0) * 2
       as res
from moves

-- postgres function 
create or replace function move(pos int, roll int) returns  int as
$$ 
begin
  return pos+roll*2;
end; 
$$ language plpgsql;

select move(position,roll) as res from moves  