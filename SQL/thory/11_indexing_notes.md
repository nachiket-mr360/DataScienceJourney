# SQL Notes — Indexing (PostgreSQL)

## What is an Index?
An index is a database structure that can make retrieval faster, especially on large tables.

```sql
CREATE INDEX index_name
ON table_name(column_name);
```

Example:
```sql
CREATE INDEX idx_dept_id
ON employees(department_id);
```

## Composite Index
```sql
CREATE INDEX idx_dept_sal
ON employees(department_id, salary);
```
This creates **one composite index**, not two independent indexes.

## Leftmost-Prefix Rule
For:
```sql
CREATE INDEX idx_dept_city_salary
ON employees(department_id, city, salary);
```
Think of the leading sequence as:
- `department_id`
- `department_id + city`
- `department_id + city + salary`

Column order matters. A composite index is not equivalent to separate indexes on each column.

## Primary Key and UNIQUE in PostgreSQL
A PostgreSQL primary key is automatically backed by a unique index, so normally you do not create another identical index.

A `UNIQUE` constraint is also backed by a unique index.

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(150) UNIQUE
);
```

Normally you do **not** also create:
```sql
CREATE UNIQUE INDEX idx_employee_email
ON employees(email);
```

## How to Choose Indexes
Do not index every column. Consider:
1. Table size.
2. Frequent `WHERE` columns.
3. Frequent join columns.
4. Frequent combinations of columns.
5. Existing PK/UNIQUE indexes.
6. Storage and INSERT/UPDATE/DELETE overhead.

## Key Patterns
```text
PRIMARY KEY → automatic supporting unique index
UNIQUE      → automatic supporting unique index
CREATE INDEX → one normal index
(a,b)       → one composite index
(a,b,c)     → think leading sequence a → a+b → a+b+c
```
