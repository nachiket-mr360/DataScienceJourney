DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments(department_id INT PRIMARY KEY,department_name VARCHAR(40));
INSERT INTO departments VALUES
(1,'Data'),(2,'Finance'),(3,'HR'),(4,'Marketing'),(5,'Operations');

CREATE TABLE employees(
 employee_id INT PRIMARY KEY,
 name VARCHAR(50),
 department_id INT,
 city VARCHAR(40),
 salary NUMERIC(10,2),
 experience_years INT
);
INSERT INTO employees VALUES
(1,'Rahul',1,'Bengaluru',72000,3),
(2,'Amit',1,'Bengaluru',90000,5),
(3,'Rohan',1,'Chennai',85000,4),
(4,'Priya',2,'Pune',65000,2),
(5,'Karan',2,'Mumbai',80000,6),
(6,'Isha',2,'Pune',92000,8),
(7,'Sneha',3,'Pune',55000,4),
(8,'Arjun',3,'Hyderabad',70000,7),
(9,'Meera',4,'Hyderabad',65000,3),
(10,'Neha',4,'Mumbai',75000,5),
(11,'Ananya',4,'Pune',78000,6),
(12,'Vikram',5,'Bengaluru',60000,2);
