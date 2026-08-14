DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations(location_id INT PRIMARY KEY,city VARCHAR(40));
INSERT INTO locations VALUES(1,'Bengaluru'),(2,'Pune'),(3,'Hyderabad'),(4,'Mumbai');

CREATE TABLE departments(department_id INT PRIMARY KEY,department_name VARCHAR(40),location_id INT);
INSERT INTO departments VALUES
(1,'Data',1),(2,'Finance',2),(3,'HR',4),(4,'Marketing',3),(5,'Operations',2);

CREATE TABLE employees(employee_id INT PRIMARY KEY,employee_name VARCHAR(50),department_id INT,salary NUMERIC(10,2));
INSERT INTO employees VALUES
(1,'Aarav',1,75000),(2,'Priya',2,68000),(3,'Rohan',1,85000),
(4,'Meera',3,55000),(5,'Neha',4,72000),(6,'Isha',2,91000);

CREATE TABLE projects(project_id INT PRIMARY KEY,project_name VARCHAR(50),department_id INT);
INSERT INTO projects VALUES
(101,'Analytics Dashboard',1),(102,'Audit Automation',2),
(103,'Recruitment System',3),(104,'Marketing BI',4);

CREATE TABLE employee_projects(employee_id INT,project_id INT,hours INT);
INSERT INTO employee_projects VALUES
(1,101,20),(1,104,10),(2,102,30),(3,101,35),(5,104,25);

CREATE TABLE customers(customer_id INT PRIMARY KEY,name VARCHAR(50),city VARCHAR(40));
INSERT INTO customers VALUES
(1,'Rahul','Bengaluru'),(2,'Priya','Pune'),(3,'Amit','Hyderabad'),(4,'Neha','Mumbai'),(5,'Kiran','Pune');

CREATE TABLE orders(order_id INT PRIMARY KEY,customer_id INT,product_id INT,quantity INT,unit_price NUMERIC(10,2),amount NUMERIC(10,2),status VARCHAR(20));
INSERT INTO orders VALUES
(201,1,501,2,12000,24000,'Completed'),
(202,1,502,1,10000,10000,'Pending'),
(203,2,501,3,12000,36000,'Completed'),
(204,3,503,2,9000,18000,'Completed'),
(205,4,501,1,12000,12000,'Completed');
