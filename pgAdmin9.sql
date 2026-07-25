--CASES: like a if else or switch statement--

		--WHY DO WE USE CASE?--

		--1. To create custom columns on-the-fly: create custom column based on some condition
		
		--2. To categorize data based on certain logic: differetiate data on basis of certain condition
		
		--3. To replace values conditionally
		
		--4. To handle nulls or missing values gracefully
		
		--5. To simplify complex logic inside SELECT queries

		--syntax--

		'''
		select
			column_name,: which has to be shown
			//all the cases
				case
					when condition 1 then result 1
					when conditoin 2 then result 2
				else default_result
				
				end as new_colmn: new col wil be created to display the results
		
		from table_name;

		'''

select * from products;

--	task 1--

	--add a custom column in which you will have price_tag. If the price is above 1000 you will say it is expensive. 
	--If the price is between 500 and 1000 you will say it is moderate. and If the price is below 500 it is cheap. 
	select name, price,
					case 
					when (price>1000) then 'Expensive'
					when price between 500 and 1000 then 'moderate'
					
					else 'cheap'
					
					end as price_tag
	from products;
	-- this is just the snap shot not the part of main table, so now i will apply case in creating a new col
	select * from products;

--task 2--

--1. add the col name
alter table products
add column price_tag text;

select * from products;

--2. update the values
update products
set price_tag=
				case 
				when (price>1000) then 'Expensive'
				when price between 500 and 1000 then 'moderate'
				
				else 'cheap'
				
				end;

select * from products;
