-- Hello SQL World!
/*
Hello SQL!

Return a table with a single column named Greeting with the phrase 'hello world!'

Please use Data Manipulation Language and not Data Definition Language to solve this Kata
*/

-- my answer
-- create a temporary table named greetings with a column named greetings type text, insert into the Greeting column the value 'hello world!' and select everything from greetings to display the table
create temp table greetings (
    Greeting text
);

insert into greetings (Greeting)
values ('hello world!');

select
Greeting as "Greeting"
from greetings

-- best practices and most clever
SELECT 'hello world!' as "Greeting"

-- similar to my answer but not using alias
CREATE TABLE tbl(Greeting text);
INSERT INTO tbl values("hello world!");
SELECT * FROM tbl;

-- using varchar(255) instead of text
CREATE TABLE words
(
Greeting varchar(255)
);

INSERT INTO words (Greeting) VALUES ('hello world!');

SELECT * FROM words;

-- postgres fn
CREATE FUNCTION greet() RETURNS text
  AS $$
    BEGIN
      RETURN 'hello world!';
    END
  $$
LANGUAGE plpgsql;

SELECT greet() AS "Greeting"