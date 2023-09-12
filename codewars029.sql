-- Fake Binary
/*
Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string.

Note: input will never be an empty string
*/
-- given a table 'fakebin' with column 'x', return a table with column 'x' and your result in a column named 'res'.

-- my answer, best practices and most clever
-- using translate to grab every possible instance string and replace with '0' or '1'
SELECT
x,
translate(x, '0123456789', '0000011111') as res
from fakebin

-- regex_replace() with ranges
select x,   regexp_replace(regexp_replace(x, '[0-4]', '0', 'g'), '[5-9]', '1', 'g')
AS res from fakebin;

-- using individual cases with regex
SELECT 
  x,
  REGEXP_REPLACE(REGEXP_REPLACE(x,'[1234]','0','g'),'[56789]','1','g') res
FROM fakebin

-- using case when and type conversions
SELECT x, (
  SELECT (
	  string_agg(
		  CASE WHEN ch::int >= 5 THEN '1'
		  ELSE '0'
		  END,
	    ''
    )
  ) as val 
  FROM regexp_split_to_table(x, '') AS ch
) as res
FROM fakebin;

-- case when type conversion with substring()
SELECT x,
       (
           SELECT STRING_AGG(CASE WHEN digit < '5' THEN '0' ELSE '1' END, '')
           FROM (SELECT SUBSTRING(x, i, 1) as digit FROM generate_series(1, length(x)) as i) t
       ) as res
FROM fakebin;

-- using postgres function
create or replace function binString(s text)       
    RETURNS  text 
LANGUAGE 'plpgsql' AS $$  

      DECLARE RetString text :='';
      Declare tempString text:='';
      Declare temp_no INT;
      declare i int :=length(s);
      declare cout int :=1;
    BEGIN   
     WHILE (cout <= i) LOOP
         temp_no = cast(substring(s,cout,1) as INT);
         if (temp_no >= 5) then
          RetString := concat(RetString,'1');
        
         elsif (temp_no < 5) and (temp_no >=0) then
          RetString := concat(RetString,'0');
         end if;
         cout:= cout + 1;
      END LOOP;
    RETURN RetString; 
  END; $$; 
  
  Select x, binString(x) as res from fakebin;

-- lol nested replace statements for each case
select x, replace(
  replace(
    replace(
      replace(
        replace(
          replace(
            replace(
              replace(
                replace(
                  replace( x, '4', '0')
                  ,'3', '0')
                , '2', '0')
              , '1', '0')
            , '0', '0')
          , '5', '1')
        , '6', '1')
      , '7', '1')
    , '8', '1')
  , '9', '1') as res
from fakebin