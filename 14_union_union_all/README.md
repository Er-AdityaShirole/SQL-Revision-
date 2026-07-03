# 14 UNION vs UNION ALL

The `UNION` and `UNION ALL` operators are used to combine the result sets of two or more `SELECT` queries into a single result set.

---

## 1. Syntax Rules for UNION/UNION ALL
For a query containing a set operator to compile, it must satisfy three strict rules:
1. Every `SELECT` query must return the **same number of columns**.
2. The columns in matching positions must have **compatible data types**.
3. The columns must be in the **same order** in each query.

---

## 2. Key Differences

| Feature | `UNION` | `UNION ALL` |
| :--- | :--- | :--- |
| **Duplicates** | **Removes** duplicate rows from the final result. | **Preserves** all duplicate rows. |
| **Performance** | **Slower** (requires sorting/unique checking in memory). | **Faster** (just appends results without checking). |
| **Behavior** | Equivalent to combining queries and running `DISTINCT`. | Direct concatenation of datasets. |

### Syntax Example:
```sql
-- Returns unique emails across both tables
SELECT email FROM customer_list
UNION
SELECT email FROM employee_list;

-- Returns all emails across both tables, including duplicates
SELECT email FROM customer_list
UNION ALL
SELECT email FROM employee_list;
```
