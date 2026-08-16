# SQL Interview Practice — Indexing

> Only questions actually practiced in this preparation are included.

## Q1 — Composite Index
Given:
```sql
CREATE INDEX idx_dept_sal
ON employees(department_id, salary);
```
Does this create two independent indexes?

### Answer
No. It creates **one composite index** containing both columns in that order.

---

## Q2 — Leftmost Prefix
Given:
```sql
CREATE INDEX idx_dept_city_salary
ON employees(department_id, city, salary);
```
What is the important usage pattern?

### Answer
Think:
```text
department_id
department_id + city
department_id + city + salary
```
The leading column order matters.

---

## Q3 — Primary Key
If `employee_id` is a PostgreSQL primary key, should another identical index normally be created?

### Answer
No. PostgreSQL automatically creates the supporting unique index.

---

## Q4 — UNIQUE Constraint
If:
```sql
email VARCHAR(150) UNIQUE
```
is used in PostgreSQL, do we also need a separate identical unique index?

### Answer
Normally no. The UNIQUE constraint is backed by a unique index.

---

## Q5 — Index Selection
Suppose:
```text
A → department_id + city
B → salary
C → city
D → department_id
```
and we create:
```sql
CREATE INDEX idx_dept_id ON employees(department_id);
CREATE INDEX idx_city ON employees(city);
```

Which patterns are supported?

### Answer
```text
department_id → A and D
city          → A and C
salary        → not directly indexed
```

The lesson: index design is a workload trade-off, not "index every column."
