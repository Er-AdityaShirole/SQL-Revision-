# 10 MySQL Functions & GROUP BY

## 1. GROUP BY vs. WHERE (Doubt Resolved)

### Why is `GROUP BY` preferred over multiple `WHERE` queries?
Suppose you want the average salary of males and females.
- **Without `GROUP BY`:** You have to write two separate queries:
  ```sql
  SELECT AVG(salary) FROM users WHERE gender = 'Male';
  SELECT AVG(salary) FROM users WHERE gender = 'Female';
  ```
- **With `GROUP BY`:** You write a single query:
  ```sql
  SELECT gender, AVG(salary) FROM users GROUP BY gender;
  ```

#### Advantages of `GROUP BY`:
1. **Single Query:** The database scans the table once instead of running multiple scans.
2. **Dynamic Categories:** If a new category (e.g. `'Other'`) is added, `GROUP BY` automatically calculates its average. A `WHERE` query would require writing a new SQL statement.
3. **Efficiency and Scalability:** If you have 20 departments, writing 20 `WHERE` queries is inefficient. `GROUP BY` does it in one pass.

### Rule of Thumb:
- Need statistics for **one specific category** $\rightarrow$ use `WHERE`.
- Need statistics for **all categories/groups** $\rightarrow$ use `GROUP BY`.

---

## 2. GROUP BY Syntax Rules (Doubt Resolved)

### Do I need to SELECT the column I GROUP BY?
**No.** It is not compulsory to include the grouped column in your `SELECT` list.
```sql
-- Valid Syntax:
SELECT AVG(salary) FROM users GROUP BY gender;
```
However, the output will only show numbers without group labels, making it hard to interpret. Thus, we usually select the group column for clarity.

### The ONLY_FULL_GROUP_BY Rule:
Every non-aggregated column in the `SELECT` list **must** appear in the `GROUP BY` clause.
- **Correct:**
  ```sql
  SELECT gender, AVG(salary) FROM users GROUP BY gender;
  ```
- **Incorrect (Fails in standard MySQL):**
  ```sql
  SELECT gender, city, AVG(salary) FROM users GROUP BY gender;
  -- 'city' is not aggregated (e.g. MIN(city)) and not in GROUP BY.
  ```

---

## 3. The `IF()` Function in MySQL (Doubt Resolved)

The `IF()` function acts like an inline if-else statement.
- **Syntax:** `IF(condition, value_if_true, value_if_false)`

### Key Examples:
1. **Basic Expression:**
   ```sql
   SELECT IF(10 > 5, 'Yes', 'No') AS result; -- Returns 'Yes'
   ```
2. **Table Conditional Labeling:**
   ```sql
   SELECT name, IF(salary >= 50000, 'High', 'Low') AS status FROM users;
   ```
3. **Handling NULL values:**
   ```sql
   SELECT name, IF(dob IS NULL, 'Missing', 'Present') AS status FROM users;
   ```
4. **Conditional Aggregation (SUM(IF()) Trick):**
   Count male and female users in a single table scan:
   ```sql
   SELECT 
       SUM(IF(gender = 'Male', 1, 0)) AS male_count,
       SUM(IF(gender = 'Female', 1, 0)) AS female_count
   FROM users;
   ```
   *How it works:* The `IF()` returns `1` for matched rows and `0` for unmatched. `SUM()` adds them up, effectively acting as a conditional count.
5. **Conditional Arithmetic:**
   ```sql
   SELECT name, salary + IF(salary >= 50000, 10000, 5000) AS new_salary FROM users;
   ```

---

## 4. Comparisons: `IF()` vs. `WHERE` vs. `CASE` (Doubt Resolved)

### `IF()` vs. `WHERE`
- **`IF()`** labels and processes **every single row** without removing any rows from the output.
- **`WHERE`** **filters out** and drops rows that do not match the criteria from the query execution path.

### `IF()` vs. `CASE`
- **`IF()`** is ideal for binary (two-choice) logic.
- **`CASE`** is cleaner and standard SQL for multiple conditional branches:
  ```sql
  CASE 
      WHEN salary >= 80000 THEN 'Excellent'
      WHEN salary >= 50000 THEN 'Good'
      ELSE 'Average'
  END
  ```

### Real-Life Interview Example:
Calculate the average salary of employees earning more than 50,000 within each gender group:
```sql
SELECT 
    gender,
    COUNT(*) AS total,
    AVG(IF(salary > 50000, salary, NULL)) AS avg_high_salary
FROM users
GROUP BY gender;
```
*Note:* Since aggregate functions like `AVG()` ignore `NULL` values, the `IF(...)` function maps salaries $\le 50000$ to `NULL`, ensuring they are excluded from the average calculation.
