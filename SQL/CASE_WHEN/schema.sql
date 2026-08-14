CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    city VARCHAR(50),
    salary NUMERIC(12,2),
    bonus NUMERIC(12,2),
    experience_years INT
);
