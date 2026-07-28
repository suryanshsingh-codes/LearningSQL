--VIEWS--

CREATE VIEW electronics_view AS -- this line will be added, rest all will be same
SELECT product_id, name, price, stock_quantity
FROM products
WHERE category = 'electronics' AND is_available = TRUE;

select * from electronics_view;

-- PROCEDURES--
-- ============================================
-- Create a stored procedure to add a new product to the 'products' table
-- ============================================

CREATE PROCEDURE add_product(

    -- Product name
    p_name VARCHAR,

    -- Unique SKU (Stock Keeping Unit) code
    p_sku CHAR(8),

    -- Product price
    p_price NUMERIC,

    -- Available stock quantity
    p_qty INT,

    -- Product category
    p_category TEXT
)

-- Specify that the procedure is written in PL/pgSQL
LANGUAGE plpgsql
AS $$
	BEGIN
		    -- Insert a new product into the products table
		    INSERT INTO products(name,
		        sku_code,
		        price,
		        stock_quantity,
		        category)
		    VALUES(p_name,
		        p_sku,
		        p_price,
		        p_qty,
		        p_category);
	    -- Display a success message after insertion
	    RAISE NOTICE 'Product added successfully!';
	END;
$$;

-- ============================================
-- Call the stored procedure to add a new product
-- ============================================

CALL add_product(
    'Wireless Mouse',
    'SKU10001',
    799.99,
    50,
    'Electronics'
);

-- ============================================
-- Display all records from the 'products' table
-- ============================================

SELECT * FROM products;