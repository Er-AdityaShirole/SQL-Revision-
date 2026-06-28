# 08 Updating & Deleting Data

## 1. Updating Data (`UPDATE`)
Used to modify existing records in a table. Always use a `WHERE` clause to restrict the update, otherwise all rows will be modified!
```sql
UPDATE users 
SET salary = 55000 
WHERE id = 1;
```

---

## 2. Deleting Data (`DELETE`)
Used to remove rows from a table.

### What if I omit the `WHERE` clause in `DELETE`? (Doubt Resolved)
If you write `DELETE FROM users;` without a `WHERE` clause, **all rows in the table will be deleted**.
- The table structure, columns, and constraints remain empty but intact.
- This is a very common and critical mistake.

### Best Practice/Interview Tip (Doubt Resolved)
Before running a `DELETE` or `UPDATE` query, it is highly recommended to run a `SELECT` query using the exact same `WHERE` clause first:
```sql
-- Step 1: Inspect the target rows
SELECT * FROM users WHERE id = 2;

-- Step 2: Only after verification, run the delete command safely
DELETE FROM users WHERE id = 2;
```

---

## 3. Difference between DELETE, TRUNCATE, and DROP (Doubt Resolved)

| Feature | `DELETE` | `TRUNCATE` | `DROP` |
| :--- | :--- | :--- | :--- |
| **Command Type** | DML (Data Manipulation) | DDL (Data Definition) | DDL (Data Definition) |
| **WHERE Clause** | Supported (can delete specific rows). | Not supported (deletes all rows). | Not supported. |
| **Speed** | Slower (deletes row-by-row, logs each). | Extremely fast (deallocates pages). | Extremely fast. |
| **Table Structure** | Remains intact. | Remains intact. | Table is completely destroyed. |
| **Auto-Increment** | Does **not** reset the counter. | **Resets** the counter to 1. | N/A (table no longer exists). |
| **Rollback** | Can be rolled back if inside a transaction. | Cannot be rolled back in most DBMS. | Cannot be rolled back. |
