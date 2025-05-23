---> If Statment 
	-- if statment allow you to execute one or more statments based on a condition 
	-- there are 3 types of if/else statmets here :
		-- if then 
		-- if then else 
		-- if the elsif then else 

		-- if then ex: 
		select * from film
		DO
		$$
		declare 
			film_id_var int=3;

		begin 
			if EXISTS (select 1 from film where film.film_id=film_id_var) then 
				raise notice 'exists %',film_id_var;
			end if;
		end; $$;

		--2 if then else 
			DO
			$$
			declare 
				film_row film%ROWTYPE;
	
			begin 
				select * into film_row from film where film_id=0;
				-- if EXISTS (select 1 from film where film.film_id=film_id_var) then 
				-- 	raise notice 'exists %',film_id_var;
				-- ELSE
				-- 	raise notice 'does not exists %',film_id_var;
				-- end if;
				if found then 
					raise notice 'exists ';
				else 
					raise notice 'not exists ';
				end if;
			end; $$;
			--NOTE: found is a global variable and set to true if there is some record in select into statment 


		--3 if...then...elsif
		-- catorize a grade 
			DO
			$$
				declare 
					grade int=9;
		
				begin 
					
					if grade<3 then 
						raise notice 'very bad ';
					elsif  grade<5 then
						raise notice 'bad';
					elsif  grade<7 then
						raise notice 'satisfactory';
					elsif  grade<9 then
						raise notice 'good';
					else 
						raise notice 'very good';
					end if;
			end; $$;


---> Case statments : 
	-- kinda alternative to if elsif statments 
	-- ex: ABORT
		do $$
		declare
		    total_payment numeric;
		    service_level varchar(25) ;
		begin
		     select sum(amount) into total_payment
		     from Payment
		     where customer_id = 100;
		
			 if found then
			    case
				   when total_payment > 200 then
		               service_level = 'Platinum' ;
		           when total_payment > 100 then
			           service_level = 'Gold' ;
		           else
		               service_level = 'Silver' ;
		        end case;
				raise notice 'Service Level: %', service_level;
		     else
			    raise notice 'Customer not found';
			 end if;
		end; $$
		