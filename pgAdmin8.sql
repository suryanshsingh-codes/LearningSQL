--ALTER : changes done directly to the table--

create table table1(
    studentId serial primary key, 
	name varchar(100),
    age bigint
);
insert into table1(name, age) values('akarsh',23), ('anjali',22);
select * from table1;



--1. Add new columns
alter table table1
add column
email varchar(100) default 'abc@gmail.com';
select * from table1;

--2. Remove columns
alter table table1
drop column email;
select * from table1;


--3. Rename columns
alter table table1
rename column name to myname;
select * from table1;


--4. Change data types
alter table table1
alter column age type int; -- alter table->alter columnn


--1. Add new columns
alter table table1
add column
email varchar(100) default 'abc@gmail.com';
select * from table1;


--5. Set default values
alter table table1
alter column age set default 18; -- alter table->alter columnn
insert into table1(myname) values('harsh');
select * from table1;

--5. remove default values
alter table table1
alter column age drop default; -- alter table->alter columnn
insert into table1(myname) values('harsh');
select * from table1;


--6. Add constraints
alter table table1
add constraint age_check check (age>=18); --give the name of the constraint and give the constraint

--6. remove constraints
alter table table1
drop constraint age_check;

--7. Rename the table
alter table table1
rename to MYTABLE1;