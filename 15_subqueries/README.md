# 15 Subqueries

A **subquery** (or nested query) is a query query within another SQL query. The subquery is known as the **inner query**, and the containing query is the **outer query**.

---

## 1. Classification by Output Structure

### A. Scalar Subquery
Returns a single value (one row, one column). Can be used with standard comparison operators (`=`, `>`, `<`, etc.).
```sql
-- Find employees who earn more than the average salary
SELECT name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);
```

### B. Column Subquery
Returns a single column with multiple rows. Typically used with operators like `IN`, `ANY`, or `ALL`.
```sql
-- Find employees in active departments
SELECT name 
FROM employees 
WHERE dept_id IN (SELECT id FROM departments WHERE status = 'Active');
```

### C. Table Subquery (Derived Table)
Returns multiple rows and columns. When placed in the `FROM` clause, it acts as a temporary table and **must be assigned an alias** in MySQL.
```sql
SELECT avg_salary 
FROM (SELECT dept_id, AVG(salary) AS avg_salary FROM employees GROUP BY dept_id) AS dept_averages;
```

---

## 2. Classification by Execution Dependency

### A. Non-correlated Subquery
The inner query is independent of the outer query. It runs exactly once, retrieves its result, and passes it to the outer query.

### B. Correlated Subquery
The inner query references one or more columns from the outer query. The outer query executes the inner query **once for every single row** it processes.
```sql
-- Find employees who earn more than the average salary of their specific department
SELECT e1.name, e1.salary, e1.dept_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary) 
    FROM employees e2 
    WHERE e2.dept_id = e1.dept_id -- References outer query table e1
);
```

---

## 3. EXISTS vs. IN (Interview Tip)

- **`IN`**: The inner subquery executes first and builds a list of values. The outer query then scans this list.
  - *Best used when:* The subquery result set is relatively small.
- **`EXISTS`**: Does not return data rows; it returns `TRUE` or `FALSE` as soon as a single match is found (**early exit** evaluation).
  - *Best used when:* The subquery dataset is very large, or when checking for row existence.
  ```sql
  -- Find departments that have at least one employee
  SELECT d.dept_name 
  FROM departments d
  WHERE EXISTS (
      SELECT 1 
      FROM employees e 
      WHERE e.dept_id = d.id
  );
  ```
