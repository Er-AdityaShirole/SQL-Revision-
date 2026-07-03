# 16 GROUP BY and HAVING

## 1. The Need for the HAVING Clause

In SQL, you cannot use aggregate functions (like `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`) inside a `WHERE` clause. 
For example, the following query is **invalid** and throws an error:
```sql
-- INVALID SQL:
SELECT dept_id, AVG(salary) 
FROM employees 
WHERE AVG(salary) > 50000 -- Error: Invalid use of group function
GROUP BY dept_id;
```
To solve this limitation, SQL introduced the **`HAVING`** clause.

---

## 2. WHERE vs. HAVING

| Feature | `WHERE` | `HAVING` |
| :--- | :--- | :--- |
| **Applied To** | Applied to **individual rows** before grouping. | Applied to **grouped records (categories)** after grouping. |
| **Aggregates** | **Cannot** contain aggregate functions. | **Can** contain aggregate functions. |
| **Execution Order** | Executes **before** `GROUP BY`. | Executes **after** `GROUP BY`. |

### Execution Workflow:
1. **`FROM` / `JOIN`**: Fetches the data source.
2. **`WHERE`**: Filters rows that don't match the condition.
3. **`GROUP BY`**: Organizes remaining rows into groups.
4. **`HAVING`**: Filters groups based on aggregate conditions.
5. **`SELECT`**: Formulates columns and expressions.

---

## 3. Using WHERE and HAVING Together

You can use both in a single query to filter individual rows first, group them, and then filter the aggregate groups.

```sql
SELECT dept_id, SUM(salary) AS total_payroll
FROM employees
WHERE status = 'Active'         -- 1. Filter out inactive employees first
GROUP BY dept_id                -- 2. Group by department
HAVING SUM(salary) > 100000;    -- 3. Filter groups with total payroll > 100k
```
