-- CONSTRAINTS
    -- 1. Primary Key
	    create table random(
	        id serial Primary key, -- primary key consntraint
	        name varchar(100) not null,
			email text unique not null,
			age int check (age>=18)
	    );
	-- 2. Insert into the table
		insert into random(name,age, email)
		values('Akarsh',28,'akarsh009@gmail.com');
	
	--3. View the data
		select * from random;