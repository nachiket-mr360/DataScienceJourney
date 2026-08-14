DROP TABLE IF EXISTS products;
CREATE TABLE products(
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50),
 price NUMERIC(10,2)
);
INSERT INTO products VALUES
(1,'Laptop',80000),(2,'Phone',50000),(3,'Keyboard',800),
(4,'Mouse',600),(5,'Monitor',15000),(6,'Cable',300);
