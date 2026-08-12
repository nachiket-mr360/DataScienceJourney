-- ============================================================
-- QUESTION 1
-- Find Data and Finance employees earning at least 60,000.
-- ============================================================
SELECT employee_id, name, department, city, salary
FROM employees
WHERE department IN ('Data', 'Finance')
  AND salary >= 60000
ORDER BY salary DESC;

-- Expected: Rohan, Aarav, Sneha, Priya

-- ============================================================
-- QUESTION 2
-- Find employees earning between 60,000 and 90,000 who live
-- in Bengaluru, Pune or Hyderabad.
-- ============================================================
SELECT employee_id, name, department, city, salary
FROM employees
WHERE salary BETWEEN 60000 AND 90000
  AND city IN ('Bengaluru', 'Pune', 'Hyderabad')
ORDER BY salary DESC;

-- ============================================================
-- QUESTION 3
-- Find Data/Finance employees earning at least 60,000,
-- located in Bengaluru/Pune, excluding Aarav.
-- ============================================================
SELECT employee_id, name, department, city, salary
FROM employees
WHERE department IN ('Data', 'Finance')
  AND salary >= 60000
  AND city IN ('Bengaluru', 'Pune')
  AND name <> 'Aarav'
ORDER BY salary DESC;

-- ============================================================
-- QUESTION 4
-- Increase Marketing employees earning below 55,000 to 55,000.
-- ============================================================
UPDATE employees
SET salary = 55000
WHERE department = 'Marketing'
  AND salary < 55000;

-- ============================================================
-- QUESTION 5
-- Delete HR employees with less than 3 years experience.
-- ============================================================
DELETE FROM employees
WHERE department = 'HR'
  AND experience_years < 3;
