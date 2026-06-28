# 02 Creating & Dropping Databases and Tables

## 1. Managing Databases

### Creating a Database
To create a new database schema:
```sql
CREATE DATABASE school_db;
```

### Selecting a Database
Before performing operations on tables, select the active database:
```sql
USE school_db;
```

### Dropping a Database
To permanently delete a database (and all tables/data within it):
```sql
DROP DATABASE school_db;
```

> [!CAUTION]
> `DROP DATABASE` is a destructive operation. All data contained in the database will be lost forever.

---

## 2. Managing Tables

### Creating a Table
Tables are created inside databases using the `CREATE TABLE` command. You must define column names, their data types, and any optional constraints.
```sql
CREATE TABLE student (
    id INT,
    name VARCHAR(50),
    email VARCHAR(50)
);
```

### Dropping a Table
To completely delete a table, including its structure, columns, constraints, and all its rows:
```sql
DROP TABLE student;
```
*(Note: Refer to Topic 08 for a detailed comparison of `DROP` vs `DELETE` vs `TRUNCATE`)*.
