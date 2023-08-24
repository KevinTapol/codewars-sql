/*
-- Register for the Party

You received an invitation to an amazing party. Now you need to write an insert statement to add yourself to the table of participants.

participants table schema

name (string)
age (integer)
attending (boolean)
NOTES:

Since alcohol will be served, you can only attend if you are 21 or older
You can't attend if the attending column returns anything but true
NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.

-- delete specific row or rows
DELETE from participants where name = 'Kevin' and age = 40;

-- keep table but delete all data
truncate table participants;

-- delete table entirely
drop table participants;

create table participants (
    name varchar(255), -- string length
    age integer,
    attending boolean
);

-- insert multiple rows
insert into participants (name, age, attending) values
('Alice', 21, true),
('Bob', 20, false)
*/

-- my answer
insert into participants (name, age, attending)
values 
('Kevin', 40, true);

select * from participants;

-- voted best practices and most clever
-- I strongly disagree because the columns are not specified.
INSERT INTO participants VALUES ('mozart', '26', true);
SELECT * FROM participants;

-- using switch case end
INSERT INTO participants (name, age)
VALUES ('Aki', 27);

SELECT 
  name, 
  age,
  (CASE 
    when age>=21 then 1=1
    else 1=0
   END) as attending 
FROM participants