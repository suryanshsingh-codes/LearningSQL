--ONE TO ONE RELATIONSHIP--

-- 1. first i will create two tables

		--table 1
		CREATE TABLE students (
		  student_id SERIAL PRIMARY KEY,
		  name VARCHAR(100) NOT NULL
		);
		--table 2
		CREATE TABLE student_profiles (
		  student_id INT PRIMARY KEY,
		  address TEXT,
		  age INT,
		  phone VARCHAR(15)
		);
--2. fill the values
		-- into table 1
		INSERT INTO students (name)
		VALUES
		('Akarsh Vyas'), ('Simran Mehta'), ('Rohan Gupta');
		
		-- into table 2
		INSERT INTO student_profiles (student_id, address, age, phone)
		VALUES
		(1, 'Delhi, India', 22, '9999999999'),
		(2, 'Mumbai, India', 21, '8888888888'),
		(3, 'Bangalore, India', 23, '7777777777');

-- 3. create a foreign key relationship between both tables

		ALTER TABLE student_profiles -- working on the student_profiles table
		ADD CONSTRAINT fk_student_id -- creating a foreign key constraint
		FOREIGN KEY (student_id) -- selecting the column that will become the foreign key
		REFERENCES students(student_id); -- linking (current table we are dealing) it with student_id (primary key) of the students table

-- 4. display the data from both tables using join

		
		--s: student table; sp: student profile

		SELECT s.student_id, s.name, -- selecting the required columns from table 1
				sp.address, sp.age, sp.phone -- selecting the required columns from table 2
				
		FROM students s -- taking data from the students table, where s is representing the student table
		
		JOIN student_profiles sp -- sp represesntig the student profile table AND THIS WILL NOW JOIN BOTH TABLES
		
		ON s.student_id = sp.student_id -- joining both tables using student_id, JOIN WILL BE DONE ON THIS COMMON PARAMETEER