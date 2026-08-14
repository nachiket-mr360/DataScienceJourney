-- Q1. Employee with department name.
SELECT e.employee_id,e.employee_name,d.department_name
FROM employees e
JOIN departments d ON e.department_id=d.department_id;

-- Q2. Employees and department names using LEFT JOIN.
SELECT e.employee_id,e.employee_name,d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id=d.department_id;

-- Q3. Departments with no employees.
SELECT d.department_id,d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id=e.department_id
WHERE e.employee_id IS NULL;

-- Q4. RIGHT JOIN equivalent written as LEFT JOIN.
SELECT d.department_id,d.department_name,e.employee_name
FROM departments d
LEFT JOIN employees e ON e.department_id=d.department_id;

-- Q5. Employee + department + city.
SELECT e.employee_name,d.department_name,l.city
FROM employees e
JOIN departments d ON e.department_id=d.department_id
JOIN locations l ON d.location_id=l.location_id;

-- Q6. Same three-table join, only Bengaluru.
SELECT e.employee_name,d.department_name,l.city
FROM employees e
JOIN departments d ON e.department_id=d.department_id
JOIN locations l ON d.location_id=l.location_id
WHERE l.city='Bengaluru';

-- Q7. Count employees by city.
SELECT l.city,COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d ON e.department_id=d.department_id
JOIN locations l ON d.location_id=l.location_id
GROUP BY l.city
ORDER BY employee_count DESC;

-- Q8. Department and city with employee count >= 2.
SELECT d.department_name,l.city,COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d ON e.department_id=d.department_id
JOIN locations l ON d.location_id=l.location_id
GROUP BY d.department_id,d.department_name,l.city
HAVING COUNT(e.employee_id)>=2
ORDER BY employee_count DESC;

-- Q9. Customer completed revenue.
SELECT c.name AS customer_name,c.city,
       SUM(o.amount) AS total_revenue,
       COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
WHERE o.status='Completed'
GROUP BY c.customer_id,c.name,c.city
HAVING SUM(o.amount)>30000
ORDER BY total_revenue DESC;

-- Q10. All customers, including those with no completed orders.
SELECT c.name AS customer_name,
       COALESCE(SUM(o.amount),0) AS completed_revenue
FROM customers c
LEFT JOIN orders o
  ON c.customer_id=o.customer_id
 AND o.status='Completed'
GROUP BY c.customer_id,c.name
ORDER BY completed_revenue DESC;

-- Q11. Employee project hours by department.
SELECT d.department_name,
       COUNT(DISTINCT e.employee_id) AS employee_count,
       COALESCE(SUM(ep.hours),0) AS total_project_hours
FROM departments d
LEFT JOIN employees e ON d.department_id=e.department_id
LEFT JOIN employee_projects ep ON e.employee_id=ep.employee_id
GROUP BY d.department_id,d.department_name
HAVING COUNT(DISTINCT e.employee_id)>=1
ORDER BY total_project_hours DESC;

-- Q12. Department employee count and project hours, with salary filter.
SELECT d.department_name,
       COUNT(DISTINCT e.employee_id) AS employee_count,
       COALESCE(SUM(ep.hours),0) AS total_project_hours,
       ROUND(AVG(e.salary),2) AS average_salary,
       MAX(e.salary) AS highest_salary
FROM departments d
LEFT JOIN employees e ON d.department_id=e.department_id
LEFT JOIN employee_projects ep ON ep.employee_id=e.employee_id
WHERE e.salary>=65000
GROUP BY d.department_id,d.department_name
HAVING COUNT(DISTINCT e.employee_id)>=2
ORDER BY total_project_hours DESC;

-- Q13. Interview: revenue and distinct products per customer.
SELECT UPPER(c.name) AS customer_name,
       c.city,
       SUM(o.quantity*o.unit_price) AS total_revenue,
       ROUND(AVG(o.quantity*o.unit_price),2) AS avg_order_value,
       COUNT(o.order_id) AS order_count,
       COUNT(DISTINCT o.product_id) AS product_count
FROM customers c
LEFT JOIN orders o
  ON c.customer_id=o.customer_id
 AND o.status='Completed'
GROUP BY c.customer_id,c.name,c.city
HAVING SUM(o.quantity*o.unit_price)>20000
   AND COUNT(o.order_id)>=1
ORDER BY total_revenue DESC;

-- Q14. Interview: departments with at least one employee and
-- total project hours above 20.
SELECT d.department_name,
       COUNT(DISTINCT e.employee_id) AS employee_count,
       COALESCE(SUM(ep.hours),0) AS total_project_hours
FROM departments d
LEFT JOIN employees e ON d.department_id=e.department_id
LEFT JOIN employee_projects ep ON e.employee_id=ep.employee_id
GROUP BY d.department_id,d.department_name
HAVING COUNT(DISTINCT e.employee_id)>=1
   AND COALESCE(SUM(ep.hours),0)>20
ORDER BY total_project_hours DESC;

-- Q15. Interview: top customers by completed revenue,
-- excluding customers with no orders.
SELECT c.name AS customer_name,
       COALESCE(SUM(o.amount),0) AS total_revenue
FROM customers c
LEFT JOIN orders o
  ON c.customer_id=o.customer_id
 AND o.status='Completed'
GROUP BY c.customer_id,c.name
HAVING COALESCE(SUM(o.amount),0)>0
ORDER BY total_revenue DESC
LIMIT 3;
