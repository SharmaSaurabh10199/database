---> UNION 
	-- it combines the 2 result sets given that the schema is same ABORT


	---> Set upa the data 

	CREATE TABLE top_rated_films(
	  title VARCHAR NOT NULL,
	  release_year SMALLINT
	);
	
	CREATE TABLE most_popular_films(
	  title VARCHAR NOT NULL,
	  release_year SMALLINT
	);
	
	INSERT INTO top_rated_films(title, release_year)
	VALUES
	   ('The Shawshank Redemption', 1994),
	   ('The Godfather', 1972),
	   ('The Dark Knight', 2008),
	   ('12 Angry Men', 1957);
	
	INSERT INTO most_popular_films(title, release_year)
	VALUES
	  ('An American Pickle', 2020),
	  ('The Godfather', 1972),
	  ('The Dark Knight', 2008),
	  ('Greyhound', 2020);


	-- using union , it removes the duplicates ABORT
	select * from top_rated_films union select * from most_popular_films   --: 6 records

---> Union all: ABORT
	-- it includes the duplicates as well ABORT
		select * from top_rated_films union all select * from most_popular_films --: 8 records







---> Intersect : ABORT
	-- it gets the common resultset from the 2 tables ABORT
			select * from top_rated_films intersect select * from most_popular_films --: 2 records

---> Except: ABORT
	-- returns the result set which is not in another one ABORT
	select * from top_rated_films except select * from most_popular_films : 2 records 
			


