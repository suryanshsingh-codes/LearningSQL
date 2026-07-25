-- Small Project

--1. create table
	create table products(product_id serial primary key,
	name varchar(100) not null,
	sku_code char(8) not null unique check(char_length(sku_code)=8), 
	price numeric(10,2) default 0 check (price>=0),-- numeric value containing 10 digits out of which 2 are decimal points
	stock_quantity int default 0 check (stock_quantity>=0),
	is_available boolean default true,
	category text not null,
	added_on date default current_date,
	last_update timestamp default now()
	);

--2. insert the values
	insert into products(name, sku_code, price, stock_quantity, category)
	values('mouse','mou12345',799.99,120,'electronics'),
	('keyboard','key12345',1499.99,80,'electronics'),
	('notebook','not54321',199.50,150,'stationery'),
	('coffee_mug','mug67890',349.00,200,'kitchen'),
	('running_shoes','run11223',2999.99,40,'footwear'),
	('backpack','bag44556',1599.75,65,'accessories');

--3. view the data
	select * from products;