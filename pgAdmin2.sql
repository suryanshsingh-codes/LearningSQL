-- DATATYPES
	-- 1. create a new table
	create table students(
	    studentId serial, -- SERIAL datatype will run and increase automatically, if not givem
	    name char(50), -- this tells that student name is in character and it's length is 50
	    age int,
	    grade char(1)
	);
	-- 2. insert values into the table
	insert into students(name,age,grade)
	values('Akash',23,'A'), -- write strings into single qoutes only
			('Raj',23,'C');
			
	--3. View the data
	select * from students; -- fetch all the data