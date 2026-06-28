# 11 Autocommit & Transactions

## 1. What is Autocommit?

By default, MySQL has **Autocommit** enabled.
- This means that every single DML statement (`INSERT`, `UPDATE`, `DELETE`) you execute is instantly committed and saved permanently to the database.
- Once executed under autocommit, the changes **cannot** be rolled back.

---

## 2. Managing Autocommit

You can check and modify the autocommit settings for your current session:

### Check Status:
```sql
SELECT @@autocommit;
-- Returns 1 (ON) or 0 (OFF)
```

### Turn Autocommit OFF:
```sql
SET autocommit = 0;
-- or
SET autocommit = OFF;
```
When autocommit is turned off, any change you make is temporary and visible only to your session. To make changes permanent or discard them, you must explicitly call transaction commands:
- **`COMMIT;`**: Saves all changes made since the last commit permanently to disk.
- **`ROLLBACK;`**: Discards all changes made since the last commit, restoring the database to its previous state.

### Turn Autocommit ON:
```sql
SET autocommit = 1;
-- or
SET autocommit = ON;
```

---

## 3. Explicit Transactions (Recommended)

Even if autocommit is enabled, you can group multiple operations into a single atomic transaction by starting it explicitly. This automatically suspends autocommit for that block:

```sql
-- Starts a transaction block
START TRANSACTION; 
-- or: BEGIN;

-- Perform operations
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

-- If everything succeeds:
COMMIT;

-- If an error occurs:
ROLLBACK;
```
Once `COMMIT` or `ROLLBACK` is executed, the session returns to its default autocommit state.
