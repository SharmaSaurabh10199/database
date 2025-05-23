---> GROUP BY :  ABORT
	--select * from payment
	select * from customer
	-- The GROUP BY clause divides the rows returned from the SELECT statement into groups.

	--For each group, you can apply an aggregate function such as SUM() to calculate the sum of items or COUNT() to get the number of items in the groups
	SELECT
	  customer_id
	FROM
	  payment
	GROUP BY
	  customer_id
	ORDER BY
	  customer_id;

	  select , customer_id,sum(amount) as spending from payment group by (customer_id)



---> Having : 
	--query uses the GROUP BY clause to find the number of customers per store
	-- The WHERE clause filters the rows based on a specified condition whereas the HAVING clause filter groups of rows according to a specified condition.
	-- you can use where as well as HAVING caluse in a statement 
	--In 	other words, you apply the condition in the WHERE clause to the rows while you apply the condition in the HAVING clause to the groups of rows.
	select * from store 
	select * from customer
	select count(customer_id) customers , store_id from customer group by(store_id) having count(customer_id)>300