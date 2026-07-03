# 17 Views

A **View** is a virtual table based on the result-set of an SQL statement. It contains rows and columns just like a real table, but it does **not** store data physically. Instead, it queries the underlying base tables dynamically whenever it is referenced.

---

## 1. Advantages of Views

1. **Security (Data Masking):**
   You can prevent users from seeing sensitive columns (e.g. passwords, SSN, salary) by creating a view that excludes those fields.
2. **Query Simplicity:**
   Instead of writing long, complex queries with multiple `JOIN`s, subqueries, and filters repeatedly, you can write the query once as a view. Users can then query the view with a simple command:
   ```sql
   SELECT * FROM simplified_view;
   ```
3. **Consistency & Abstraction:**
   If the physical database schema changes (e.g., splitting a table into two), you can update the view definition to match. Client applications querying the view will not break.

---

## 2. Managing Views

### Creating a View
```sql
CREATE VIEW active_engineers AS
SELECT emp_id, name, dept_id
FROM employee_details
WHERE dept_id = 1;
```

### Querying a View
```sql
SELECT * FROM active_engineers;
```

### Dropping a View
```sql
DROP VIEW active_engineers;
```

---

## 3. Updatable Views
You can perform `INSERT`, `UPDATE`, and `DELETE` operations on a view, which propagates back to modify the underlying base table, but **only if** the view matches certain criteria.

### A View is NOT Updatable if it contains:
- Aggregate functions (`SUM`, `AVG`, `MIN`, `MAX`, `COUNT`)
- `DISTINCT` keyword
- `GROUP BY` or `HAVING` clauses
- `UNION` or `UNION ALL` operators
- Outer joins or subqueries referencing the same base tables
