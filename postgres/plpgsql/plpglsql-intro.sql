---> Overview: 
	--PL/pgSQL is a procedural programming language for the PostgreSQL database system.
	--PL/pgSQL allows you to extend the functionality of the PostgreSQL database server by creating server objects with complex logic
	-- by postgres sql you can only execute single line of code but by plpgsql, u can execute multiple lines of code. ABORT


---> Dollar-Quoted String Constants:
	select 'I''m good';   --: here ' is an escape character 
	-- the plpgsql is written in this formt only , so it gets hard to write it down 
	-- ex : 
		do
		'declare
		   film_count integer;
		begin
		   select count(*) into film_count
		   from film;
		
		   raise notice ''The number of films: %'', film_count;
		end;'
		;

	-- $$ lets us avoid the using of escape character 
	--select $$I'm good $$;

	-- can be written in tag as well 



	-- using $$ in sps 
		create procedure proc_name(param_list)
		language lang_name
		as $$
		  -- stored procedure body
		$$




---> Block structure : 
	--here is the syntax of the block 
		[ <<label>> ]
		[ declare
		    declarations ]
		begin
		    statements;
			...
		end [ label ];

	-- finding the film count 
	do
	$$
	<<film_count>>
	DECLARE
		film_count int=0;
	BEGIN
		select count(*) into film_count from film;
		raise notice 'Film count is %',film_count;

	end film_count;
	$$;


---> Nested blocks :
	-- here is an example
	do
	$$
	<<film_count>>
	DECLARE
		film_count int=0;
	BEGIN
		<<inner_block>>
		declare 
			temp int=2;
		begin 
			raise notice 'value is %',temp;
		end inner_block;
		select count(*) into film_count from film;
		raise notice 'Film count is %',film_count;

	end film_count;
	$$;

	-- here do is used to execute an annonymous block ABORT
	