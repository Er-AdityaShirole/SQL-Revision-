# 19 Stored Procedures

A **Stored Procedure** is a collection of pre-compiled SQL statements stored in the database. Instead of sending long queries repeatedly over the network, client applications can simply call the procedure.

---

## 1. Delimiters in Stored Procedures

In MySQL, SQL statements end with a semicolon (`;`). 
Because a stored procedure contains multiple statements inside its block, using `;` would cause MySQL to think the procedure definition has ended prematurely.
- **Solution:** Change the delimiter temporarily to something else (e.g. `//` or `$$`), then change it back at the end of the block.

```sql
DELIMITER //

CREATE PROCEDURE MyProcedure()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;
```

---

## 2. Parameter Types (IN, OUT, INOUT)

Stored procedures can accept input and output parameters.

1. **`IN` (Default):**
   Passes a value from the calling environment *into* the procedure. The procedure cannot modify this value in the caller's environment.
2. **`OUT`:**
   Sends a value from the procedure *back* to the calling environment. The initial value passed in is ignored.
3. **`INOUT`:**
   Acts as both `IN` and `OUT`. A value is passed in, modified inside the procedure, and the modified value is returned.

---

## 3. Running and Managing Procedures

### Calling a Procedure
```sql
CALL GetEmployeeCount(@total);
SELECT @total;
```

### Dropping a Procedure
```sql
DROP PROCEDURE IF EXISTS GetEmployeeCount;
```

---

## 4. Advantages
- **Reduced Network Traffic:** Multiple statements are executed on the server, sending only the procedure call over the network.
- **Security:** You can grant users permission to execute a stored procedure without giving them direct access to read/write the underlying tables.
- **Maintainability:** Business logic is centralized in the database layer.
