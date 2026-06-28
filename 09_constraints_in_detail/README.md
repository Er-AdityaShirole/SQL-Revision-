# 09 Constraints in Detail

## 1. Column Constraints vs. Table Constraints

SQL constraints can be written in two ways:
- **Column Constraints:** Specified inline next to the column definition.
  ```sql
  email VARCHAR(50) UNIQUE
  ```
- **Table Constraints:** Specified at the end of the table declaration. Required for composite keys (keys spanning multiple columns).
  ```sql
  CONSTRAINT uq_email UNIQUE (email)
  ```

---

## 2. Naming Constraints (Doubt Resolved)

You can assign custom names to `UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`, and `CHECK` constraints using the `CONSTRAINT` keyword.

### What is the advantage of naming a constraint?

1. **Easier to Drop Later:**
   If you want to remove the constraint, you need to know its name. If you named it, you can drop it directly:
   ```sql
   ALTER TABLE users DROP INDEX uq_email;
   -- or
   ALTER TABLE users DROP CONSTRAINT uq_email;
   ```
   If you do not name it, MySQL will automatically generate a name (e.g., `email` or `email_2`), forcing you to run `SHOW CREATE TABLE` first to discover it.
2. **Clearer Debugging:**
   When a constraint is violated, the error message references the name:
   ```text
   ERROR 1062 (23000): Duplicate entry 'a@gmail.com' for key 'uq_email'
   ```
   This instantly tells you which constraint was violated, rather than having to guess from a system-generated name.
3. **Easier Enterprise Schema Management:**
   Helps maintain and document complex relational structures.

### Why don't we name `NOT NULL` constraints?
In MySQL, `NOT NULL` is **not** a separate constraint object. It is stored as a simple attribute of the column (visible as `Null = NO` when running `DESCRIBE`).
- Because it is not a distinct constraint object, **you cannot name it**.
- The following syntax is **invalid** and throws a syntax error in MySQL:
  ```sql
  -- INVALID SYNTAX:
  email VARCHAR(50) CONSTRAINT nn_email NOT NULL
  ```

---

## 3. The `AUTO_INCREMENT` Attribute (Doubt Resolved)

### Is `AUTO_INCREMENT` a datatype or constraint?
**Neither.**
- **Datatype:** Specifies *what* kind of data is stored (e.g., `INT`, `VARCHAR`).
- **Constraint:** Specifies *validation rules* on the data (e.g., `PRIMARY KEY`, `UNIQUE`).
- **`AUTO_INCREMENT`:** Is a **column attribute/modifier** that dictates *how* values are generated automatically.

### Rules of `AUTO_INCREMENT`:
1. It automatically generates the next integer (1, 2, 3...) when a row is inserted and no value is provided for that column.
2. In MySQL, the `AUTO_INCREMENT` column **must be indexed** (usually defined as the `PRIMARY KEY` or `UNIQUE`).

#### Example Syntax:
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
```
