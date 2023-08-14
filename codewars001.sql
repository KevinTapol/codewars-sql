-- Adults only (SQL for Beginners #1)

-- In your application, there is a section for adults only. You need to get a list of names and ages of users from the users table, who are 18 years old or older.
-- users table schema
-- name
-- age
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.

-- my answer and best practices
-- specifying columns with greater than or equal to
select name,age from users
where age >= 18

-- most clever
-- return all columns greater than 
SELECT * FROM users WHERE age > 17

-- deleting users table and creating a new one then select all from the table
drop table if exists users;
create table users (
name character varying(128) not null,
age int not null check(age >=18)
);
insert into users (name,age) values
('a',185),
('b',172),
('c',133),
('d',24);
select * from users;

-- renaming table as u
select u.name, u.age 
from users as u
where age >= 18

-- also creating a new table an intserting data
create table adults(
        name text,
        age integer
);

insert into adults(name, age)
values('Tony Corleone', 30);
insert into adults(name, age)
values('Irwin Dundee', 18);
insert into adults(name, age)
values('Kitty Dream', 25);
insert into adults(name, age)
values('Yuno Sykk', 25);
insert into adults(name, age)
values('Johnny Doe', 15);
insert into adults(name, age)
values('Christine Pristine', 16);
insert into adults(name, age)
values('Fion Fifi', 17);

select * 
from adults
where age >= 18;

-- between key word
SELECT *
FROM users
WHERE age BETWEEN '18' AND '99';

-- including order by
SELECT name, age
FROM users 
WHERE age >= 18
ORDER BY name