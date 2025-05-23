--->SELECT statment 
	-- The SELECT statement has the following clauses:
	
	-- Select distinct rows using DISTINCT operator.
	-- Sort rows using ORDER BY clause.
	-- Filter rows using WHERE clause.
	-- Select a subset of rows from a table using LIMIT or FETCH clause.
	-- Group rows into groups using GROUP BY clause.
	-- Filter groups using HAVING clause.
	-- Join with other tables using joins such as INNER JOIN, LEFT JOIN, FULL OUTER JOIN, CROSS JOIN clauses.
	-- Perform set operations using UNION, INTERSECT, and EXCEPT.
	-- In this tutorial, you are going to focus on the SELECTand FROM clauses.

	--->Using PostgreSQL SELECT statement with expressions example
		-- || is concatination operator here , fullname is alias
	SELECT
	   first_name || ' ' || last_name as fullname,
	   email
	FROM
	   customer;

	---> Using PostgreSQL SELECT statement without a FROM clause
		-- from is evaluated before the select 
	SELECT NOW()

---> COlumns ALias 

	select last_name as surname from customer
	-- as is optional 
	select last_name  surname from customer

	-- columan alias as space 
	select first_name ||' ' || last_name "full name" from customer

---> Order BY: 
	-- used to sort a table 
	-- order of executions: from-->select--> order by 

	select * from customer order by first_name 

	-- sorting on 2 columsn 
	select * from customer order by first_name asc, last_name desc

	-- Using PostgreSQL ORDER BY clause to sort rows by expressions
	select first_name , length(first_name) as len from customer order by len desc  -- since order by is applied to last, len is evaluated first and then sorted 

	-- NULLS FIRST and NULLS LAST  
	select * from customer order by first_name asc nulls first;

---> Distinct 
	-- SELECT DISTINCT to remove duplicate rows from a result set of a query.
	CREATE TABLE colors(
	  id SERIAL PRIMARY KEY,
	  bcolor VARCHAR,
	  fcolor VARCHAR
	);

	INSERT INTO
  	colors (bcolor, fcolor)
	VALUES
	  ('red', 'red'),
	  ('red', 'red'),
	  ('red', NULL),
	  (NULL, 'red'),
	  (NULL, NULL),
	  ('green', 'green'),
	  ('blue', 'blue'),
	  ('blue', 'blue');

	select distinct bcolor from colors -- distinct fist columsn 
	select distinct bcolor, fcolor from colors -- both distinct columns , red,red one is taken once 
	select distinct on (bcolor) * from colors  -- selects columns based on first column only 
	