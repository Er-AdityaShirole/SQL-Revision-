# 20 Triggers

A **Trigger** is a database object that automatically runs (fires) in response to a specified event (`INSERT`, `UPDATE`, or `DELETE`) on a particular table.

---

## 1. Trigger Activation Timing

Triggers can be executed at two different timings:
- **`BEFORE`**: Fires before the database writes the changes to disk. Excellent for data validation, formatting (e.g. converting email to lowercase), or preventing execution if business rules fail.
- **`AFTER`**: Fires after the database completes writing the changes. Ideal for keeping audit logs, recalculating statistics tables, or updating summary fields in other tables.

---

## 2. OLD vs. NEW Modifiers

Within the trigger body, you can access the row data being modified using the `OLD` and `NEW` qualifiers:

| Event | `OLD` Availability | `NEW` Availability |
| :--- | :--- | :--- |
| **`INSERT`** | No (no previous record exists). | Yes (the values about to be inserted). |
| **`UPDATE`** | Yes (the original values before update). | Yes (the new values about to be saved). |
| **`DELETE`** | Yes (the values of the row being deleted). | No (no new values are generated). |

---

## 3. Basic Syntax Example

```sql
DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- Force email to lowercase before inserting
    SET NEW.email = LOWER(NEW.email);
END //

DELIMITER ;
```

---

## 4. Key Considerations
- **Performance:** Triggers execute synchronously inside the database transaction. Complex logic inside triggers can severely slow down `INSERT`/`UPDATE`/`DELETE` queries.
- **Debugging Complexity:** Since triggers fire automatically in the background, they can make debugging difficult for developers unaware of their existence.
