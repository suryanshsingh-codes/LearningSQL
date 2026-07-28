--ONE TO MANY RELATIONSHIP--

-- 1. first i will create two tables

		-- table 1
		CREATE TABLE students1n (
		  student_id SERIAL PRIMARY KEY,
		  name VARCHAR(100) NOT NULL
		);

		-- table 2
		CREATE TABLE marks (
		  mark_id SERIAL PRIMARY KEY,
		  student_id INT,
		  subject VARCHAR(50),
		  marks INT,
		  FOREIGN KEY (student_id) REFERENCES students1n(student_id) --since it's one to many so connect both tables now,
		  --this student id should be in both tables
		);

-- 2. fill the values

		-- into table 1
		INSERT INTO students1n (name)
		VALUES
		('Akarsh Vyas'), ('Simran Mehta'), ('Rohan Gupta');

		-- into table 2
		INSERT INTO marks (student_id, subject, marks)
		VALUES
		(1, 'English', 85), (1, 'Math', 89), (1, 'Science', 92),
		(2, 'English', 80), (2, 'Math', 75), (2, 'Science', 78),
		(3, 'English', 72), (3, 'Math', 70), (3, 'Science', 74);

		select * from marks;

--PERFORMING JOINS--

--1. INNER JOIN: return all the matching rows
select * from students1n s
join marks m
on s.student_id=m.student_id;

--1. LEFT JOIN: returns all rows from the left table, even if there's no match in the right table

	insert into students1n(name) values ('surya');
	--a new student was there who had not appeared for exam, so the inner join will not represent the value of this instance, 
	-- so his marks data will not be there
	select s.name,
			m.marks,m.subject
	from students1n s
	left join marks m
	on s.student_id=m.student_id; -- left side and right side here
	-- his exam data will be null because he has not appeared for exam


--2. LEFT JOIN: returns all rows from the left table, even if there's no match in the right table

	insert into marks(student_id, subject,marks) values (4,'Python',34); -- we have to give the matching student id otherwise it will be irrelevant to the table
	--a unknown student was there who had appeared for exam, so the right join will represent the value of this instance, 
	-- so his student data will not be there
	--what does right join do: his right side( marks ) will be represented, even if left side(student id) is not availble
	select s.name,
			m.marks,m.subject
	from students1n s
	right join marks m
	on s.student_id=m.student_id; -- left side and right side here
	-- his name data will be null because he appeared for exam but no name was given

--3. FULL JOIN: return all the matching rows AND fill null for missing values
	insert into students1n(name) values ('Sarthak');
	--a new student was there who had not appeared for exam, so the inner join will not represent the value of this instance, 
	-- so his marks data will not be there
	select * from students1n s
	full join marks m
	on s.student_id=m.student_id;
	
--4. CROSS JOIN: NO 'on' needed
	
	select s.name, m.subject,m.marks from students1n s
	cross join marks m;