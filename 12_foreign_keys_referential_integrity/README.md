# 12 Foreign Keys and Referential Integrity

## 1. Primary Key & Auto-Increment Recap
- **Primary Key (PK):** A column (or set of columns) that uniquely identifies each record in a table. It must be unique and cannot contain `NULL` values.
- **Auto-Increment:** A column modifier that automatically generates sequential integers for the primary key when new rows are inserted.

---

## 2. What is a Foreign Key?
A **Foreign Key (FK)** is a column (or set of columns) in one table (the **Child table**) that references a Primary Key or Unique key in another table (the **Parent table**).

### Purpose:
Foreign keys enforce **Referential Integrity**, which guarantees that the relationship between tables remains consistent. Specifically:
- You cannot insert a row in the child table with a foreign key value that does not exist in the parent table.
- You cannot delete a row from the parent table if active child rows refer to it (unless configured with cascade rules).

---

## 3. Referential Actions (ON DELETE & ON UPDATE)

When a row in the parent table is deleted or modified, we can configure how the child table reacts using the following options:

### 1. `CASCADE`
If a parent row is deleted or updated, the corresponding rows in the child table are automatically deleted or updated.
```sql
FOREIGN KEY (parent_id) REFERENCES parent_table(id) ON DELETE CASCADE
```

### 2. `SET NULL`
If a parent row is deleted or updated, the foreign key column in the child table is set to `NULL`. (Note: The child column must be nullable).
```sql
FOREIGN KEY (parent_id) REFERENCES parent_table(id) ON DELETE SET NULL
```

### 3. `RESTRICT` / `NO ACTION` (Default)
Prevents deletion or modification of a parent row if there are any child rows referencing it. MySQL will throw an error:
```text
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails...
```
