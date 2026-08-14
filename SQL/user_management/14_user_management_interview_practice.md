# SQL User Management — Interview & Practice

> Only questions actually practiced during preparation are included.

## 1. Why separate users?
A common account can expose sensitive data, allow unwanted changes, and makes accountability difficult.

## 2. Does creating a user grant table access?
No. The user must receive appropriate permissions.

## 3. Read-only employees
```sql
GRANT SELECT ON employees TO analyst;
```

## 4. Multiple tables
```sql
GRANT SELECT ON employees, sales, customers TO analyst;
```

## 5. CONNECT
`GRANT CONNECT ON DATABASE company_db TO analyst;` allows connection, not automatic SELECT on every table.

## 6. Keep SELECT, remove INSERT/UPDATE
```sql
REVOKE INSERT, UPDATE ON employees FROM analyst;
```

## 7. Multiple permission sources
If SELECT is granted directly to a user and through a role, revoking the role's SELECT does not remove the direct SELECT grant.

## 8. 50 analysts
Create one permission role and add users to it:
```sql
CREATE ROLE data_analyst NOLOGIN;
GRANT SELECT ON sales, customers TO data_analyst;
GRANT data_analyst TO user1;
GRANT data_analyst TO user2;
```

## 9. Remove role permission
```sql
REVOKE SELECT ON sales FROM data_analyst;
```
Users receiving that permission only through the role lose it.

## 10. Stop login
```sql
ALTER ROLE analyst NOLOGIN;
```

## 11. Employee leaves
General sequence:
```text
Reassign ownership
→ clean role-owned privileges/objects
→ drop role
```
PostgreSQL:
```sql
REASSIGN OWNED BY analyst TO admin;
DROP OWNED BY analyst;
DROP ROLE analyst;
```

## 12. Mixed setup
```sql
CREATE ROLE data_analyst NOLOGIN;
GRANT SELECT ON sales TO data_analyst;

CREATE USER new_analyst WITH PASSWORD 'password';
GRANT data_analyst TO new_analyst;
```

## 13. Authentication vs Authorization
```text
Authentication → Who are you?
Authorization  → What can you do?
```

## 14. Least privilege
Do not give every employee ALL privileges. Give only what their job requires.
