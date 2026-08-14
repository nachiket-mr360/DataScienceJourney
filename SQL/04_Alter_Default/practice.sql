-- Q1. Add a stock status column defaulting to In Stock.
ALTER TABLE products
ADD COLUMN stock_status VARCHAR(20) DEFAULT 'In Stock';

-- Q2. Explicitly ensure all current products are In Stock.
UPDATE products
SET stock_status='In Stock';

-- Q3. Mark products below 1,000 as Clearance.
UPDATE products
SET stock_status='Clearance'
WHERE price<1000;

-- Q4. Add a discount column with default 0.
ALTER TABLE products
ADD COLUMN discount NUMERIC(5,2) DEFAULT 0;

-- Q5. Give monitors a 5% discount.
UPDATE products
SET discount=5
WHERE product_name='Monitor';

-- Q6. Display the final table.
SELECT *
FROM products
ORDER BY price DESC;

-- Q7. Pattern exercise:
-- Add an employment status column to employees with default Active.
-- (Run against the employees table from another practice dataset.)
-- ALTER TABLE employees
-- ADD COLUMN employment_status VARCHAR(20) DEFAULT 'Active';

-- Q8. Pattern exercise:
-- Update HR employees to On Notice.
-- UPDATE employees
-- SET employment_status='On Notice'
-- WHERE department='HR';
