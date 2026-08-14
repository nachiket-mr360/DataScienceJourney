-- Q1. Employees earning above company average.
SELECT name,department_id,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- Q2. Employees earning more than the highest HR salary.
SELECT name,department_id,salary
FROM employees
WHERE salary > (
    SELECT MAX(e2.salary)
    FROM employees e2
    JOIN departments d2 ON e2.department_id=d2.department_id
    WHERE d2.department_name='HR'
)
ORDER BY salary DESC;

-- Q3. Employees belonging to departments with at least one
-- employee earning above 75,000.
SELECT name,department_id,salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE salary>75000
)
ORDER BY salary DESC;

-- Q4. Employees belonging to departments with nobody earning
-- above 80,000.
SELECT name,department_id,salary
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM employees
    WHERE salary>80000
)
ORDER BY salary DESC;

-- Q5. Employees earning above their own department average.
SELECT e.name,e.department_id,e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id=e.department_id
)
ORDER BY e.salary DESC;

-- Q6. Highest-paid employee(s) in each department.
SELECT e.name,e.department_id,e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id=e.department_id
)
ORDER BY e.department_id,e.salary DESC;

-- Q7. Demonstrate the "greater than at least one other" pattern.
SELECT e.name,e.department_id,e.salary
FROM employees e
WHERE e.salary > (
    SELECT MIN(e2.salary)
    FROM employees e2
    WHERE e2.department_id=e.department_id
      AND e2.employee_id<>e.employee_id
)
ORDER BY e.salary DESC;

-- Q8. Departments with at least 3 employees.
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>=3;

-- Q9. Employees working in departments having at least 3 employees.
SELECT e.name,e.department_id,e.salary
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*)>=3
)
ORDER BY e.salary DESC;

-- Q10. Employees who are not the highest-paid employee in the company.
SELECT name,department_id,salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees)
ORDER BY salary DESC;

-- Q11. Employees whose salary is above their department average,
-- whose name contains 'a', and who are not from Mumbai.
SELECT e.name,e.department_id,e.city,e.salary
FROM employees e
WHERE e.name ILIKE '%a%'
  AND e.city<>'Mumbai'
  AND e.salary > (
      SELECT AVG(e2.salary)
      FROM employees e2
      WHERE e2.department_id=e.department_id
  )
ORDER BY e.salary DESC
LIMIT 3;

-- Q12. Employees whose salary is greater than the average salary
-- of departments that have at least 3 employees.
-- This is a scalar comparison against a derived set of group averages.
SELECT e.name,e.department_id,e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(dept_avg)
    FROM (
        SELECT department_id,AVG(salary) AS dept_avg
        FROM employees
        GROUP BY department_id
        HAVING COUNT(*)>=3
    ) x
)
ORDER BY e.salary DESC;

-- Q13. Interview: employees above their own department average,
-- but below the company maximum, with name containing 'a',
-- outside Mumbai, from departments having at least 3 employees.
SELECT e.name,d.department_name,e.city,e.salary
FROM employees e
JOIN departments d ON d.department_id=e.department_id
WHERE e.name ILIKE '%a%'
  AND e.city<>'Mumbai'
  AND e.salary > (
      SELECT AVG(e2.salary)
      FROM employees e2
      WHERE e2.department_id=e.department_id
  )
  AND e.salary < (
      SELECT MAX(salary)
      FROM employees
  )
  AND e.department_id IN (
      SELECT department_id
      FROM employees
      GROUP BY department_id
      HAVING COUNT(*)>=3
  )
ORDER BY e.salary DESC
LIMIT 3;

-- Q14. Interview: employees earning more than every other employee
-- in their own department, excluding themselves from the comparison.
SELECT e.name,d.department_name,e.salary
FROM employees e
JOIN departments d ON d.department_id=e.department_id
WHERE e.salary > (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id=e.department_id
      AND e2.employee_id<>e.employee_id
)
ORDER BY e.salary DESC;

-- Q15. Interview: employees earning more than HR's maximum,
-- but not the company's maximum, with name containing 'a'.
SELECT e.name,d.department_name,e.salary
FROM employees e
JOIN departments d ON d.department_id=e.department_id
WHERE e.name ILIKE '%a%'
  AND e.salary > (
      SELECT MAX(e2.salary)
      FROM employees e2
      JOIN departments d2 ON d2.department_id=e2.department_id
      WHERE d2.department_name='HR'
  )
  AND e.salary < (
      SELECT MAX(salary)
      FROM employees
  )
ORDER BY e.salary DESC;

-- Q16. Interview: top 3 employees whose salary is above their
-- own department average, department has at least 3 employees,
-- not Mumbai, name contains 'a', and show a calculated 10% bonus.
SELECT e.name,
       d.department_name,
       e.city,
       e.salary,
       e.experience_years,
       ROUND(e.salary*1.10,2) AS salary_after_bonus
FROM employees e
JOIN departments d ON d.department_id=e.department_id
WHERE e.name ILIKE '%a%'
  AND e.city<>'Mumbai'
  AND e.salary > (
      SELECT AVG(e2.salary)
      FROM employees e2
      WHERE e2.department_id=e.department_id
  )
  AND e.department_id IN (
      SELECT department_id
      FROM employees
      GROUP BY department_id
      HAVING COUNT(*)>=3
  )
  AND e.salary < (
      SELECT MAX(salary)
      FROM employees
  )
ORDER BY salary_after_bonus DESC
LIMIT 3;

-- Q17. Interview: find departments whose average salary is above
-- the company-wide average, then list employees from those departments.
SELECT e.name,d.department_name,e.salary
FROM employees e
JOIN departments d ON d.department_id=e.department_id
WHERE e.department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > (
        SELECT AVG(salary)
        FROM employees
    )
)
ORDER BY e.salary DESC;

-- Q18. Interview: for every employee, show whether their salary
-- is above, equal to, or below their department average.
SELECT e.name,d.department_name,e.salary,
       ROUND((
           SELECT AVG(e2.salary)
           FROM employees e2
           WHERE e2.department_id=e.department_id
       ),2) AS department_avg_salary,
       CASE
           WHEN e.salary > (
               SELECT AVG(e2.salary)
               FROM employees e2
               WHERE e2.department_id=e.department_id
           ) THEN 'Above Average'
           WHEN e.salary = (
               SELECT AVG(e2.salary)
               FROM employees e2
               WHERE e2.department_id=e.department_id
           ) THEN 'Equal to Average'
           ELSE 'Below Average'
       END AS salary_position
FROM employees e
JOIN departments d ON d.department_id=e.department_id
ORDER BY d.department_name,e.salary DESC;
