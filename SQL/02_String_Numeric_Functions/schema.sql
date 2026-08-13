DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS products;

CREATE TABLE customers(customer_id INT PRIMARY KEY,first_name VARCHAR(30),last_name VARCHAR(30),city VARCHAR(40));
INSERT INTO customers VALUES
(1,'Rahul','Sharma','Bengaluru'),(2,'Priya','Patil','Pune'),
(3,'Amit','Kumar','Hyderabad'),(4,'Neha','Rao','Mumbai'),
(5,'Ananya','Desai','Bengaluru');

CREATE TABLE payments(payment_id INT PRIMARY KEY,customer VARCHAR(40),amount NUMERIC(10,2),status VARCHAR(20));
INSERT INTO payments VALUES
(1,'Rahul',1250.40,'Completed'),(2,'Priya',2500.75,'Completed'),
(3,'Amit',999.10,'Pending'),(4,'Neha',1800.99,'Completed'),
(5,'Ananya',4210.20,'Completed');

CREATE TABLE shipments(shipment_id INT PRIMARY KEY,package_weight NUMERIC(8,2),shipping_fee NUMERIC(8,2));
INSERT INTO shipments VALUES
(1,4.20,500),(2,7.80,700),(3,3.10,450),(4,9.90,1000),(5,6.25,900);

CREATE TABLE products(product_id INT PRIMARY KEY,category VARCHAR(30),price NUMERIC(10,2),cost NUMERIC(10,2));
INSERT INTO products VALUES
(1,'Laptop',80000,65000),(2,'Phone',50000,42000),(3,'Monitor',18000,11000),
(4,'Keyboard',4000,1800),(5,'Tablet',30000,21000),(6,'Mouse',1500,800);
