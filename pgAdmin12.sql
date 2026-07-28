-- ============================================
-- Create Products Table
-- This table stores information about products.
-- ============================================

CREATE TABLE products (

  -- Unique ID for each product
  product_id INT PRIMARY KEY,

  -- Name of the product
  product_name VARCHAR(100),

  -- Category of the product (e.g., Electronics, Grocery)
  category TEXT,

  -- Price of the product (up to 10 digits with 2 decimal places)
  price NUMERIC(10,2),

  -- Number of products available in stock
  stock_quantity INT,

  -- Indicates whether the product is available for sale
  is_available BOOLEAN,

  -- Date when the product was added
  added_on DATE
);


-- ============================================
-- Create Orders Table
-- This table stores customer order details.
-- ============================================

CREATE TABLE orders (

  -- Unique ID for each order
  order_id INT PRIMARY KEY,

  -- Product ID (references the Products table)
  product_id INT,

  -- Quantity of the product ordered
  quantity INT,

  -- Date on which the order was placed
  order_date DATE,

  -- Name of the customer who placed the order
  customer_name VARCHAR(50),

  -- Payment method used (e.g., Cash, Card, UPI)
  payment_method VARCHAR(50),

  -- Foreign Key Constraint
  -- Ensures that every product_id exists in the products table.
  -- If a product is deleted, all related orders are deleted automatically.
  CONSTRAINT fk_product
  FOREIGN KEY (product_id)
  REFERENCES products(product_id)
  ON DELETE CASCADE
);
-- Display all records from the 'orders' table
SELECT * FROM orders;

-- Display all records from the 'products' table
SELECT * FROM products;


--Q1. Show each order along with the product name and price


	-- Select specific columns from both tables for a combined report
	SELECT 
	    o.order_id,           -- Unique identifier for each order
	    o.customer_name,      -- Name of the customer who placed the order
		
	    p.product_name,       -- Name of the product ordered
	    p.price               -- Price of the product at time of order
	FROM 
	    orders o              -- 'orders' table aliased as 'o' for brevity
	JOIN 
	    products p            -- 'products' table aliased as 'p' for brevity
	    ON o.product_id = p.product_id;  
	                          -- Join condition: match orders to their corresponding products
	                          -- using the shared product_id foreign key

--Q2. Show all products even if they were never ordered


	-- Select product name and order ID 
	SELECT 
	    p.product_name,       -- Name of the product from the products table
	    o.order_id            -- Order ID from the orders table (NULL if no orders exist)
	FROM 
	    products p            -- Primary table: all products will be returned
	LEFT JOIN 
	    orders o              -- Secondary table: matched orders are included
	    ON p.product_id = o.product_id;  
	                          -- Join condition: link products to orders via product_id
	
--Q3. Show orders for only 'Electronics' category


	-- Select order ID, product name, and category for Electronics 
	SELECT 
	    o.order_id,            -- Order ID from the orders table
		
	    p.product_name,        -- Name of the product from the products table
	    p.category             -- Category of the product from the products table
	FROM 
	    orders o               -- Primary table: contains the order records
	JOIN 
	    products p             -- Joined table: contains product details
	    ON o.product_id = p.product_id  
	                           -- Join condition: link orders to products via product_id
	WHERE 
	    p.category = 'Electronics';  
	                           -- Filter condition: only include products in the 'Electronics' category

--Q4. List all orders sorted by product price (high to low)

SELECT o.order_id, p.product_name, p.price
FROM orders o
JOIN products p 
ON o.product_id = p.product_id
ORDER BY p.price DESC;

--Q5. Show number of orders placed for each product

SELECT p.product_name, COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o -- left join did on purpose
ON p.product_id = o.product_id
GROUP BY p.product_name;