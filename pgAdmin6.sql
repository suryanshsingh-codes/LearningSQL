-- SMALL PROJECT 2

--Q1. Display the name and price of the cheapest product in the entire table.
	select name, price from products where price = (select min(price) from products);
	--two query in one line

--Q2.Find the average price of products that belong to the 'Home & Kitchen' or 'Fitness' category.
	select * from products;
	select avg(price) as Average_Price
	from products 
	where category in ('Electronics','Kitchen')
	group by category;
	
--Q3. Show product names and stock quantity where the product is available, stock is more than 50, and price is not equal to ₹299.
	select name,stock_quantity, is_available from products where is_available=True and stock_quantity>50 and price!=299.00;
	
--Q3. Q5. Show all unique categories in uppercase, sorted in descending order.
	select distinct upper(category) as UPPERCASE from products order by uppercase desc;