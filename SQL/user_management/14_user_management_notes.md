# SQL User Management Notes

## Why User Management?
Controls **who can access the database and what they can do**.
- Authentication = Who are you?
- Authorization = What are you allowed to do?
- Least privilege = Give only required permissions.

## USER
```sql
CREATE USER analyst WITH PASSWORD 'abc123';
```
Creating a user does not automatically grant table access.

## GRANT
```sql
GRANT SELECT ON employees TO analyst;
GRANT SELECT ON employees, sales, customers TO analyst;
GRANT SELECT, INSERT, UPDATE ON employees TO analyst;
```

## REVOKE
```sql
REVOKE UPDATE ON employees FROM analyst;
```
Remember:
```text
GRANT  → TO
REVOKE → FROM
```

## Permission Layers
```text
DATABASE → CONNECT
SCHEMA   → USAGE
TABLE    → SELECT / INSERT / UPDATE / DELETE
```

Example:
```sql
GRANT CONNECT ON DATABASE company_db TO analyst;
GRANT USAGE ON SCHEMA public TO analyst;
GRANT SELECT ON employees TO analyst;
```

All existing tables in a PostgreSQL schema:
```sql
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst;
```

## ROLE as a Group
For many users with the same permissions:
```sql
CREATE ROLE data_analyst NOLOGIN;
GRANT SELECT ON sales, customers TO data_analyst;
GRANT data_analyst TO user1;
GRANT data_analyst TO user2;
```
Changing the role's permissions can affect all members receiving those permissions through the role.

A PostgreSQL role can represent a login identity or a group/permission role.

## Multiple Permission Sources
If a user has both a role grant and a direct grant, removing the role grant does not remove the direct grant.

## ALTER ROLE
```sql
ALTER ROLE analyst LOGIN;
ALTER ROLE analyst NOLOGIN;
ALTER ROLE analyst PASSWORD 'newpassword';
```

## DROP ROLE
If a role owns objects, ownership/privilege cleanup may be required:
```sql
REASSIGN OWNED BY analyst TO admin;
DROP OWNED BY analyst;
DROP ROLE analyst;
```

## Core Mental Model
```text
CREATE USER → identity
GRANT       → give permission
REVOKE      → remove permission
ROLE        → reusable permission/group identity
ALTER ROLE  → change role properties
DROP ROLE   → remove role
```
