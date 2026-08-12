-- ============================================================
-- SQL PRACTICE: BASICS & FILTERING
-- ============================================================

-- ============================================================
-- DATASET
-- ============================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary NUMERIC(10,2),
    experience_years INT
);

INSERT INTO employees
(employee_id, name, department, city, salary, experience_years)
VALUES
(1, 'Aarav',  'Data',      'Bengaluru', 75000, 3),
(2, 'Priya',  'Finance',   'Pune',      68000, 4),
(3, 'Rohan',  'Data',      'Hyderabad', 85000, 5),
(4, 'Meera',  'HR',        'Mumbai',    55000, 2),
(5, 'Karan',  'Marketing', 'Bengaluru', 62000, 3),
(6, 'Sneha',  'Finance',   'Mumbai',    72000, 5),
(7, 'Arjun',  'Data',      'Pune',      58000, 2),
(8, 'Neha',   'Marketing', 'Hyderabad', 49000, 1);

-- ============================================================
-- QUESTION 1
-- Find all employees working in the Data or Finance
-- departments who earn at least 60,000.
-- ============================================================

SELECT employee_id,
       name,
       department,
       city,
       salary
FROM employees
WHERE department IN ('Data', 'Finance')
  AND salary >= 60000
ORDER BY salary DESC;

-- EXPECTED RESULT
--
-- employee_id | name   | department | city      | salary
-- --------------------------------------------------------
-- 3           | Rohan  | Data       | Hyderabad | 85000
-- 6           | Sneha  | Finance    | Mumbai    | 72000
-- 1           | Aarav  | Data       | Bengaluru | 75000
-- 2           | Priya  | Finance    | Pune      | 68000
--
-- ============================================================
-- QUESTION 2
-- Find employees earning between 60,000 and 90,000
-- who live in Bengaluru, Pune, or Hyderabad.
-- Sort by salary from highest to lowest.
-- ============================================================

SELECT employee_id,
       name,
       department,
       city,
       salary
FROM employees
WHERE salary BETWEEN 60000 AND 90000
  AND city IN ('Bengaluru', 'Pune', 'Hyderabad')
ORDER BY salary DESC;

-- ============================================================
-- QUESTION 3
-- Find Data and Finance employees earning at least 60,000,
-- working in Bengaluru or Pune, excluding Aarav.
-- ============================================================

SELECT employee_id,
       name,
       department,
       city,
       salary
FROM employees
WHERE department IN ('Data', 'Finance')
  AND salary >= 60000
  AND city IN ('Bengaluru', 'Pune')
  AND name <> 'Aarav'
ORDER BY salary DESC;

-- ============================================================
-- QUESTION 4
-- Increase the salary of Marketing employees earning
-- less than 55,000 to 55,000.
-- ============================================================

UPDATE employees
SET salary = 55000
WHERE salary < 55000
  AND department = 'Marketing';

-- ============================================================
-- QUESTION 5
-- Delete HR employees with less than 3 years of experience.
-- ============================================================

DELETE FROM employees
WHERE department = 'HR'
  AND experience_years < 3;