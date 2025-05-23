---> Inner join 
	select * from category c join film_category fc on c.category_id =fc.category_id

	select * from customer c join payment p on p.customer_id = c.customer_id order by p.payment_date desc

---> Left outer join 
	select * from category c left join film_category fc on c.category_id =fc.category_id
	SELECT
	  *
	FROM
	  film
	  LEFT JOIN inventory ON inventory.film_id = film.film_id
	  where inventory.inventory_id is null
	ORDER BY
	  film.title;

---> Self join : #imp
	-- its use case exists in the hirarchial data , a classic example of it is list of employees with managers in it.
	-- a classic example of it is the folder structer in docstore as well ABORT
	CREATE TABLE employee (
	  employee_id INT PRIMARY KEY,
	  first_name VARCHAR (255) NOT NULL,
	  last_name VARCHAR (255) NOT NULL,
	  manager_id INT,
	  FOREIGN KEY (manager_id) REFERENCES employee (employee_id) ON DELETE CASCADE
	);
	INSERT INTO employee (employee_id, first_name, last_name, manager_id)
	VALUES
	  (1, 'Windy', 'Hays', NULL),
	  (2, 'Ava', 'Christensen', 1),
	  (3, 'Hassan', 'Conner', 1),
	  (4, 'Anna', 'Reeves', 2),
	  (5, 'Sau', 'Norman', 2),
	  (6, 'Kelsie', 'Hays', 3),
	  (7, 'Tory', 'Goff', 3),
	  (8, 'Salley', 'Lester', 3);
	SELECT * FROM employee;
	select e1.first_name AS Employee_Name, e2.first_name AS Manager_Name 
	from employee e1 join employee e2 on e1.manager_id = e2.employee_id
	-- here e1s manager is an employee as well



---> Full outer join : ABORT
	--The FULL OUTER JOIN combine data from two tables and returns all rows from both tables, 
	--including matching and non-matching rows from both sides


---> Cross join : 
	-- a record with combination of each record in another table 
	-- use case is a an employee havinf various shits 