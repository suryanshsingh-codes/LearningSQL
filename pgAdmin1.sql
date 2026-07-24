-- 1. create a new table
create table MyTable(
    studentId int, -- this tells that student id is integer datatype
    name char(50), -- this tells that student name is in character and it's length is 50
    age int,
    grade char(1)
);

-- 2. insert values into the table
insert into MyTable(name,age,grade)
values('Akash',23,'A'), -- write strings into single qoutes only
		('Raj',23,'C');

--3. View the data
select * from MyTable; -- fetch all the data
select name from MyTable; -- fetch only one coloumn
select name,age from MyTable; -- fetch multiple coloumn

		-- conditional view
select name from MyTable where grade='C'; 

-- 4. update the table
update MyTable
set age = 25 -- update the age
where name='Raj'; -- choose the location where you want to set the updated value
select * from MyTable;

-- 4. delete from table
delete from MyTable
where name='Raj'; -- choose the location where you want to set the updated value
select * from MyTable;
