---> CTE (common table expression)
	-- it imroves the readability of the code ABORT
	-- can write recursive queries ABORT
		WITH cte_name (column1, column2, ...) AS (
	    -- CTE query
	    SELECT ...
		)
		-- Main query using the CTE
		SELECT ...
		FROM cte_name;


	with MyCTE as (
		select * from payment inner join customer using(customer_id)
	)
	select * from MyCTE order by customer_id asc;
	--SELECT * from MyCTE;  --: can only be accesed in the main query ABORT


---> Recursive CTE 
	-- is used to recursively iterate a query 
	-- general syntax 
		WITH RECURSIVE cte_name (column1, column2, ...)
		AS(
		    -- anchor member
		    SELECT select_list FROM table1 WHERE condition
		
		    UNION [ALL]
		
		    -- recursive term
		    SELECT select_list FROM cte_name WHERE recursive_condition
		)
		SELECT * FROM cte_name;


	--- set up 
		CREATE TABLE employees (
		  employee_id SERIAL PRIMARY KEY,
		  full_name VARCHAR NOT NULL,
		  manager_id INT
		);

		INSERT INTO employees (employee_id, full_name, manager_id)
		VALUES
		  (1, 'Michael North', NULL),
		  (2, 'Megan Berry', 1),
		  (3, 'Sarah Berry', 1),
		  (4, 'Zoe Black', 1),
		  (5, 'Tim James', 1),
		  (6, 'Bella Tucker', 2),
		  (7, 'Ryan Metcalfe', 2),
		  (8, 'Max Mills', 2),
		  (9, 'Benjamin Glover', 2),
		  (10, 'Carolyn Henderson', 3),
		  (11, 'Nicola Kelly', 3),
		  (12, 'Alexandra Climo', 3),
		  (13, 'Dominic King', 3),
		  (14, 'Leonard Gray', 4),
		  (15, 'Eric Rampling', 4),
		  (16, 'Piers Paige', 7),
		  (17, 'Ryan Henderson', 7),
		  (18, 'Frank Tucker', 8),
		  (19, 'Nathan Ferguson', 8),
		  (20, 'Kevin Rampling', 8);


select * from employees
	-- find all the sub ordinates of megan berry 
	With recursive subordinates as (
		-- stop STATEMENT
		select employee_id , full_name , manager_id from employees where employee_id=2
		union  
		-- iterative statment 
		select e.employee_id,e.full_name,e.manager_id from employees e join subordinates s on s.employee_id=e.manager_id
	)
	select * from subordinates
	