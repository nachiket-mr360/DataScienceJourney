-- ============================================================
-- Q1. Data or Finance employees earning at least 60,000.
-- ============================================================
SELECT employee_id,name,department,city,salary
FROM employees
WHERE department IN ('Data','Finance')
  AND salary >= 60000
ORDER BY salary DESC;

-- ============================================================
-- Q2. Employees earning 50,000–85,000 in Bengaluru/Pune/Hyderabad.
-- ============================================================
SELECT name,department,city,salary
FROM employees
WHERE salary BETWEEN 50000 AND 85000
  AND city IN ('Bengaluru','Pune','Hyderabad')
ORDER BY salary DESC;

-- ============================================================
-- Q3. Exclude Aarav, Mumbai and salaries below 60,000.
-- ============================================================
SELECT employee_id,name,department,city,salary
FROM employees
WHERE department IN ('Data','Finance')
  AND salary >= 60000
  AND city IN ('Bengaluru','Pune')
  AND name <> 'Aarav'
ORDER BY salary DESC;

-- ============================================================
-- Q4. Names containing 'a', selected cities, salary >= 55,000.
-- ============================================================
SELECT name,department,city,salary
FROM employees
WHERE name ILIKE '%a%'
  AND city IN ('Bengaluru','Pune','Hyderabad')
  AND salary >= 55000
ORDER BY salary DESC;

-- ============================================================
-- Q5. Names beginning with A or M, excluding Mumbai,
-- salary 50,000–85,000 and selected departments.
-- ============================================================
SELECT name,department,city,salary
FROM employees
WHERE (name LIKE 'A%' OR name LIKE 'M%')
  AND city <> 'Mumbai'
  AND salary BETWEEN 50000 AND 85000
  AND department IN ('Data','Finance','Marketing')
ORDER BY salary DESC
LIMIT 2;

-- ============================================================
-- Q6. Bengaluru/Hyderabad employees whose name contains a or e
-- and salary >= 55,000.
-- ============================================================
SELECT name,department,city,salary
FROM employees
WHERE city IN ('Bengaluru','Hyderabad')
  AND (name ILIKE '%a%' OR name ILIKE '%e%')
  AND salary >= 55000
ORDER BY salary DESC;

-- ============================================================
-- Q7. Top 3 highest-paid employees matching name/city filters.
-- ============================================================
SELECT name,department,city,salary
FROM employees
WHERE name ILIKE '%a%'
  AND city <> 'Mumbai'
ORDER BY salary DESC
LIMIT 3;

-- ============================================================
-- Q8. Data, Finance or Marketing employees outside Mumbai,
-- name contains a, salary >= 55,000.
-- ============================================================
SELECT department,COUNT(*) AS employee_count,AVG(salary) AS average_salary
FROM employees
WHERE department IN ('Data','Finance','Marketing')
  AND city <> 'Mumbai'
  AND name ILIKE '%a%'
  AND salary >= 55000
GROUP BY department
HAVING COUNT(*) >= 2
   AND AVG(salary) > 65000
ORDER BY average_salary DESC
LIMIT 2;

-- ============================================================
-- Q9. Find employees in Data/Finance earning >= 60,000,
-- located in Bengaluru/Pune, excluding Aarav.
-- ============================================================
SELECT employee_id,name,department,city,salary
FROM employees
WHERE department IN ('Data','Finance')
  AND salary >= 60000
  AND city IN ('Bengaluru','Pune')
  AND name <> 'Aarav'
ORDER BY salary DESC;

-- ============================================================
-- Q10. Return departments with at least 3 employees.
-- ============================================================
SELECT department,COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) >= 3
ORDER BY employee_count DESC;

-- ============================================================
-- Q11. Count employees earning >= 60,000 by department.
-- ============================================================
SELECT department,COUNT(*) AS employee_count
FROM employees
WHERE salary >= 60000
GROUP BY department
ORDER BY employee_count DESC;

-- ============================================================
-- Q12. Highest 2 departments by employee count among employees
-- whose name contains a and salary >= 55,000.
-- ============================================================
SELECT department,COUNT(*) AS employee_count,AVG(salary) AS average_salary
FROM employees
WHERE name ILIKE '%a%'
  AND salary >= 55000
GROUP BY department
ORDER BY employee_count DESC
LIMIT 2;

-- ============================================================
-- Q13. Update Marketing employees below 55,000 to 55,000.
-- ============================================================
UPDATE employees
SET salary = 55000
WHERE department = 'Marketing'
  AND salary < 55000;

-- ============================================================
-- Q14. Put HR employees on notice.
-- ============================================================
ALTER TABLE employees
ADD COLUMN IF NOT EXISTS employment_status VARCHAR(20) DEFAULT 'Active';

UPDATE employees
SET employment_status = 'On Notice'
WHERE department = 'HR';

-- ============================================================
-- Q15. Delete HR employees with less than 3 years experience.
-- ============================================================
DELETE FROM employees
WHERE department = 'HR'
  AND experience_years < 3;

-- ============================================================
-- Q16. Interview: return the top 3 employees who have names
-- containing 'a', are outside Mumbai, earn >= 55,000, and work
-- in Data/Finance/Marketing.
-- ============================================================
SELECT name,department,city,salary
FROM employees
WHERE name ILIKE '%a%'
  AND city <> 'Mumbai'
  AND salary >= 55000
  AND department IN ('Data','Finance','Marketing')
ORDER BY salary DESC
LIMIT 3;
