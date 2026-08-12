DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 name VARCHAR(50),
 department VARCHAR(30),
 city VARCHAR(30),
 salary NUMERIC(10,2),
 experience_years INT
);
INSERT INTO employees VALUES
(1,'Aarav','Data','Bengaluru',75000,3),
(2,'Meera','Finance','Pune',68000,4),
(3,'Rohan','Data','Hyderabad',85000,5),
(4,'Ananya','HR','Mumbai',55000,2),
(5,'Karan','Marketing','Bengaluru',62000,3),
(6,'Sneha','Finance','Mumbai',72000,5),
(7,'Arjun','Data','Pune',58000,2),
(8,'Neha','Marketing','Hyderabad',49000,1),
(9,'Manoj','HR','Pune',64000,4),
(10,'Isha','Finance','Bengaluru',91000,7),
(11,'Varun','Data','Mumbai',66000,3),
(12,'Pooja','Marketing','Pune',57000,2);
