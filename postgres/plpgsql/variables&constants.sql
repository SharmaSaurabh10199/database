---> Variables 
	-- variable_name data_type [= expression];
	-- an example 
	do 
	$$
	declare 
		ac_bill decimal =2344.56;
		customer_name varchar(100)= 'saurabh sharma';

	begin 
		raise notice '% ka bill % h',customer_name,ac_bill;
	end;
	$$


	---> copying data-types : imp
	do 
	$$
	declare 
		film_title film.title%type='some_title';
	begin 
		--film_title='some';
		raise notice '% is title',film_title;
	end;
	$$;


	---> Nested variables :
	do 
	$$
	<<outer_block>>
	DECLARE
		counter int=0;
		counter_1 int=1;

	begin 
		raise notice '%',counter;
		declare 
			counter int=10;
		BEGIN
			raise notice '%',outer_block.counter; --to access oter counter
			raise notice '%',counter_1;
			raise notice '%',counter;  -- by default, innner counter is accessible 
		end;
	end outer_block;
	$$;


---> Select into 
	-- general syntax is 
		select column1, column2, ...
		into variable1, variable2, ...
		from table_expression;


	-- ex: 
		do
		$$
		declare
		   v_first_name varchar;
		   v_last_name varchar;
		begin
		   -- select the first_name and last_name of the actor id 1
		   select first_name, last_name
		   into v_first_name, v_last_name
		   from actor
		   where actor_id = 1;
		
		   -- show the full name
		   raise notice '% %', v_first_name, v_last_name;
		end;
		$$;



---> Row types 
	-- this variabe contins a row of a table 
	-- row_variable table_name%ROWTYPE;
	-- ex: ABORT

		do
		$$
		declare
		   selected_row actor%ROWTYPE;
		  
		begin
		   -- select the first_name and last_name of the actor id 1
		   select *
		   into selected_row
		   from actor
		   where actor_id = 1;
		
		   -- show the full name
		   raise notice 'selected actor is % %', selected_row.first_name, selected_row.last_name;
		end;
		$$;

---> Rocord type :
	-- we might not want all the columns of the table , thats solved by record type
		do
		$$
		declare
		   rec record;
		  
		begin
		   -- select the first_name and last_name of the actor id 1
		   select actor.first_name,actor_id
		   into rec
		   from actor
		   where actor_id = 1;
		
		   -- show the full name
		   raise notice 'selected actor is % %', rec.actor_id, rec.first_name;
		end;
		$$;

---> constants: ABORT
		do
		$$
		declare
		   vat constant decimal=0.2;
		  
		begin
		   vat=0.3 -- throws error 
		   -- show the full name
		   raise notice 'vat is % ', vat;
		end;
		$$;
