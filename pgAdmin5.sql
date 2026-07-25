-- clauses

--1. SELECT, FROM, WHERE
	select * from products where category='electronics';

--2. GROUP BY
	select category from products group by category;

--3. HAVING
	--group all the categories which more than one product
	select category from products group by category having count(*)>1;

--4. ORDER BY
	select * from products order by price asc;

--5. LIMIT
	select * from products limit 2;

--6. AS
	select name as Item_Name from products;
	
--6. DISTINCT: same as group by, it's just direct one
	select DISTINCT category from products;