# SQL Interview Practice — Views

> Only questions actually practiced in this preparation are included.

## Q1 — Basic View
Create `high_paid_employees` with employee_id, name, city and salary where salary > 75000.

### Answer
```sql
CREATE VIEW high_paid_employees AS
SELECT employee_id, name, city, salary
FROM employees
WHERE salary > 75000;

SELECT * FROM high_paid_employees;
```

## Q2 — View + JOIN + Aggregation
Create `department_salary_summary` containing department_id, department_name, employee count, average salary and highest salary. Include departments with at least 2 employees and order the queried view by average salary descending.

### Answer
```sql
CREATE VIEW department_salary_summary AS
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count,
       AVG(e.salary) AS average_salary,
       MAX(e.salary) AS highest_salary
FROM departments d
LEFT JOIN employees e
    ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 2;

SELECT *
FROM department_salary_summary
ORDER BY average_salary DESC;
```

## Q3 — Replace a View
Change an existing `employee_summary` view so it includes city and uses salary >= 70000.

### Answer
```sql
CREATE OR REPLACE VIEW employee_summary AS
SELECT employee_id, name, city, salary
FROM employees
WHERE salary >= 70000;

SELECT * FROM employee_summary;
```

## Q4 — Compensation View
Create a view containing name, department_name, city, salary, bonus and final compensation where:
```text
final_compensation = salary + bonus
```
Treat NULL bonus as 0 and require final compensation >= 75000.

### Answer — filter inside view
```sql
CREATE VIEW employee_compensation_summary AS
SELECT e.name,
       d.department_name,
       e.city,
       e.salary,
       e.bonus,
       e.salary + COALESCE(e.bonus,0) AS final_compensation
FROM employees e
LEFT JOIN departments d
    ON d.department_id = e.department_id
WHERE e.salary + COALESCE(e.bonus,0) >= 75000;

SELECT *
FROM employee_compensation_summary
ORDER BY final_compensation DESC;
```

### Answer — filter outside view
```sql
CREATE VIEW employee_compensation_summary AS
SELECT e.name,
       d.department_name,
       e.city,
       e.salary,
       e.bonus,
       e.salary + COALESCE(e.bonus,0) AS final_compensation
FROM employees e
LEFT JOIN departments d
    ON d.department_id = e.department_id;

SELECT *
FROM employee_compensation_summary
WHERE final_compensation >= 75000
ORDER BY final_compensation DESC;
```
Both are valid. The second creates a more general-purpose view.
