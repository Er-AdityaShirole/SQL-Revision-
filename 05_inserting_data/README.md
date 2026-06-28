# 05 Inserting Data

## 1. Syntax for INSERT INTO

### Option A: Specifying Columns (Recommended)
Allows you to insert values into specific columns. The order of values must match the order of specified columns.
```sql
INSERT INTO student (id, name, email) 
VALUES (1, 'Aditya', 'a@gmail.com');
```

### Option B: Inserting into All Columns
You can omit the column names if you provide values for all columns in the exact order they were defined in the table.
```sql
INSERT INTO student 
VALUES (2, 'Rahul', 'r@gmail.com');
```

### Option C: Bulk Insert (Multiple Rows)
```sql
INSERT INTO student (id, name, email) 
VALUES 
(3, 'Aman', 'aman@gmail.com'),
(4, 'Deepak', 'deepak@gmail.com');
```

---

## 2. Omitted Columns Behavior (Doubt Resolved)

When you insert a row but do not specify a value for a column (e.g. omitting it from the column list), how does MySQL decide what to store?

### Priority Order for Omitted Columns:
1. **`DEFAULT` Value:** If the column has a defined default value (e.g. `country VARCHAR(30) DEFAULT 'India'`), MySQL will automatically assign the default value.
2. **`NULL` (Nullable):** If the column is allowed to be `NULL` (the default) and has no default value, MySQL will automatically store `NULL`.
3. **Error (NOT NULL & No Default):** If the column is marked `NOT NULL` and does not have a default value, MySQL will block the insert and throw an error:
   ```text
   ERROR 1364 (HY000): Field 'column_name' doesn't have a default value
   ```

### Explicitly Inserting NULL
If a column is nullable, you can also explicitly pass the `NULL` keyword in the values list:
```sql
INSERT INTO student (id, name, email) 
VALUES (5, 'Sneha', NULL); -- Explicitly setting email to NULL
```
