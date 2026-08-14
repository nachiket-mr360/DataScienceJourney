-- SQL Practice: CASE WHEN
-- Only questions actually solved during practice are included.

-- Q1 — Salary classification
SELECT name, salary,
       CASE
           WHEN salary >= 80000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_level
FROM employees
ORDER BY salary DESC;

-- Q2 — Salary band
SELECT name, salary,
       CASE
           WHEN salary >= 90000 THEN 'Excellent'
           WHEN salary >= 75000 THEN 'Good'
           WHEN salary >= 50000 THEN 'Average'
           ELSE 'Low'
       END AS salary_band
FROM employees
ORDER BY salary_band;

-- Q3 — Multiple conditions
SELECT name, department, salary, experience_years,
       CASE
           WHEN salary >= 80000 AND experience_years >= 4 THEN 'Senior High Earner'
           WHEN salary >= 80000 THEN 'High Earner'
           WHEN experience_years >= 3 THEN 'Experienced'
           ELSE 'Regular'
       END AS employee_type
FROM employees
ORDER BY salary DESC;

-- Q4 — CASE + NULL
SELECT name, salary, bonus,
       CASE
           WHEN bonus IS NULL THEN 'No Bonus'
           WHEN bonus > 5000 THEN 'High Bonus'
           ELSE 'Normal Bonus'
       END AS bonus_status
FROM employees
ORDER BY salary DESC;

-- Q5 — CASE + calculation
SELECT name, salary, bonus,
       CASE
           WHEN bonus > 5000 THEN salary + bonus
           ELSE salary
       END AS final_salary
FROM employees
ORDER BY final_salary DESC;

-- Q6 — CASE + COALESCE + percentage
SELECT name, salary, bonus,
       CASE
           WHEN COALESCE(bonus, 0) > 5000
               THEN salary + salary * 0.10 + COALESCE(bonus, 0)
           ELSE salary + COALESCE(bonus, 0)
       END AS final_salary
FROM employees
ORDER BY final_salary DESC;

-- Q7 — CASE + COALESCE + percentage comparison
SELECT name, salary, bonus,
       CASE
           WHEN COALESCE(bonus, 0) > salary * 0.10
               THEN salary + COALESCE(bonus, 0)
           ELSE salary + salary * 0.05
       END AS adjusted_salary
FROM employees
ORDER BY adjusted_salary DESC;

-- Q8 — Final mixed CASE interview question
SELECT e.name AS employee_name, d.department_name, e.city,
       e.salary, e.bonus,
       CASE
           WHEN COALESCE(e.bonus, 0) > 5000
               THEN e.salary + COALESCE(e.bonus, 0)
           ELSE e.salary + e.salary * 0.05
       END AS final_salary,
       CASE
           WHEN e.salary >= 90000 AND e.experience_years >= 5 THEN 'Elite'
           WHEN e.salary >= 80000 AND e.experience_years >= 4 THEN 'Senior'
           WHEN e.salary >= 60000 THEN 'Mid-Level'
           ELSE 'Junior'
       END AS employee_level
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (
    SELECT e2.department_id
    FROM employees e2
    GROUP BY e2.department_id
    HAVING COUNT(e2.employee_id) >= 2
)
AND (
    CASE
        WHEN COALESCE(e.bonus, 0) > 5000
            THEN e.salary + COALESCE(e.bonus, 0)
        ELSE e.salary + e.salary * 0.05
    END
) > 70000
ORDER BY final_salary DESC;
