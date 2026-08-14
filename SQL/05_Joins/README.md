# SQL Practice 05 — JOINs

## Concepts
INNER JOIN, LEFT JOIN, RIGHT JOIN, multi-table joins, JOIN conditions, filtering after joins, GROUP BY after joins, COUNT, COUNT(DISTINCT), SUM, COALESCE.

## Key mental model
A JOIN combines rows based on a relationship:
`child.foreign_key = parent.primary_key`.

LEFT JOIN keeps every row from the left table even when the right table has no match.
