# 07 Altering Tables

## 1. Basic ALTER TABLE Operations

The `ALTER TABLE` statement is used to add, delete, or modify columns in an existing table.

### Adding a Column
```sql
ALTER TABLE student ADD age INT;
```

### Dropping a Column
```sql
ALTER TABLE student DROP COLUMN age;
```

### Modifying Column Datatype or Constraints
```sql
ALTER TABLE student MODIFY COLUMN name VARCHAR(100) NOT NULL;
```

---

## 2. Reordering Columns (Doubt Resolved)

You can change the physical order of columns in MySQL using `AFTER` or `FIRST`.

### Is it compulsory to rewrite the datatype when shifting a column?
**Yes, in MySQL it is absolutely compulsory.**
- `MODIFY COLUMN` completely redefines the column. You must repeat its datatype, size, and constraints.
- If you don't write the datatype again, you will get a syntax error.

#### Correct Syntax:
```sql
ALTER TABLE student 
MODIFY COLUMN email VARCHAR(50) NOT NULL UNIQUE 
AFTER id;
```

#### Incorrect Syntax (Will Fail):
```sql
ALTER TABLE student 
MODIFY COLUMN email 
AFTER id; -- WRONG
```

---

## 3. Altering Tables with Existing Data (Doubt Resolved)

### Can columns be altered only when the table is empty?
**No.** You can alter columns, add columns, drop columns, or change column orders even when the table is full of data (whether it has 0 rows, 100 rows, or 1 million rows).
- Shifting column positions (`AFTER`, `FIRST`) does **not** corrupt or modify the row data; it only changes the metadata definition of column ordering.

### What if I decrease a column size (e.g., VARCHAR(20) $\rightarrow$ VARCHAR(10))?
If the table has existing data, the outcome depends on the MySQL **SQL Mode**:

1. **Strict SQL Mode Enabled (Default):**
   If any row has a value longer than 10 characters, MySQL will throw an error:
   ```text
   ERROR 1406 (22001): Data too long for column 'email'
   ```
   The database rolls back, and the alteration **fails** completely.
2. **Strict SQL Mode Disabled:**
   MySQL will force the truncation of the data to fit the 10-character limit. The trailing characters are permanently lost (e.g., `'abc@gmail.com'` becomes `'abc@gmail'`).
3. **If all existing values fit:**
   The command succeeds with no data loss.
