----> Errors and messages 
	-- In PL/pgSQL, you use the raise statement to issue a message. Here's the syntax of the raise statement
	-- syntax: raise level format;
	-- 	Level
		-- The level option determines the error severity with the following values:		
		-- debug
		-- log
		-- notice
		-- info
		-- warning
		-- exception
		-- If you don't specify the level, the raise statement will use exception level that raises an error and stops the current transaction by default. We'll discuss the raise exception shortly.

		DO
		$$
		begin 
			raise info 'information message %',now();
			raise log 'log message %',now();
			raise warning 'warning message %', now();
			
		end;
		$$;

		--Notice that not all messages are reported back to the client. PostgreSQL only reports the info, warning, and notice level messages back to the client. This is controlled by client_min_messages and log_min_messages configuration parameter


---> Raising error: ABORT
	do $$
	declare
	  email varchar(255) := 'john.doe@example.com';
	begin
	  -- check email for duplicate
	  -- ...
	  -- report duplicate email
	  raise exception 'duplicate email: %', email
			using hint = 'check the email again';
	end $$;


---> Assert STATEMENT: 
	-- for raising error on base of contion,uefull for debugging.
	do $$
	declare
	  email varchar(255) := 'john.doe@example.com';
	begin
	  -- check email for duplicate
	  -- ...
	  -- report duplicate email
	  assert email='weww', 'Not the desired email';
	end $$;