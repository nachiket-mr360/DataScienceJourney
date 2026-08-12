DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary NUMERIC(10,2),
    experience_years INT
);

INSERT INTO employees VALUES
(1, 'Aarav', 'Data', 'Bengaluru', 75000, 3),
(2, 'Priya', 'Finance', 'Pune', 68000, 4),
(3, 'Rohan', 'Data', 'Hyderabad', 85000, 5),
(4, 'Meera', 'HR', 'Mumbai', 55000, 2),
(5, 'Karan', 'Marketing', 'Bengaluru', 62000, 3),
(6, 'Sneha', 'Finance', 'Mumbai', 72000, 5),
(7, 'Arjun', 'Data', 'Pune', 58000, 2),
(8, 'Neha', 'Marketing', 'Hyderabad', 49000, 1);
