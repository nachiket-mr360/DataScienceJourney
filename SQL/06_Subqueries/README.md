# SQL Practice 06 — Subqueries

This is the most advanced milestone currently practiced. Questions deliberately mix subqueries with previous filtering, aggregation and JOIN concepts.

## Patterns to remember

### 1. Company-wide scalar aggregate
`salary > (SELECT AVG(salary) FROM employees)`

### 2. Compare with another group's aggregate
`salary > (SELECT MAX(salary) FROM employees WHERE department='HR')`

### 3. Multi-row membership
`department IN (SELECT department FROM employees WHERE salary > 75000)`

### 4. Correlated subquery
The inner query depends on the current outer row:
`WHERE e2.department_id = e.department_id`

### 5. Group qualification
`department_id IN (SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) >= 3)`

### 6. MIN vs MAX
- Greater than at least one other value → think `MIN`
- Greater than every other value → think `MAX` (and consider excluding the current row if required)
