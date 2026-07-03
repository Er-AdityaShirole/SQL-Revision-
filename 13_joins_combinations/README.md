# 13 Joins and Combinations

Joins are used to combine rows from two or more tables based on a related column.

---

## 1. Core SQL Join Types

### INNER JOIN
Returns rows that have matching values in **both** tables.
```sql
SELECT employee.name, department.dept_name
FROM employee
INNER JOIN department ON employee.dept_id = department.dept_id;
```

### LEFT (OUTER) JOIN
Returns **all** rows from the left table, plus matching rows from the right table. If no match exists, the right side returns `NULL`.
```sql
SELECT employee.name, department.dept_name
FROM employee
LEFT JOIN department ON employee.dept_id = department.dept_id;
```

### RIGHT (OUTER) JOIN
Returns **all** rows from the right table, plus matching rows from the left table. If no match exists, the left side returns `NULL`.
```sql
SELECT employee.name, department.dept_name
FROM employee
RIGHT JOIN department ON employee.dept_id = department.dept_id;
```

### FULL OUTER JOIN
Returns all records when there is a match in either left or right table.
- **MySQL Limitation:** MySQL does **not** support `FULL OUTER JOIN` directly.
- **Workaround:** Emulate it by combining a `LEFT JOIN` and a `RIGHT JOIN` using `UNION`:
  ```sql
  SELECT employee.name, department.dept_name FROM employee LEFT JOIN department ON employee.dept_id = department.dept_id
  UNION
  SELECT employee.name, department.dept_name FROM employee RIGHT JOIN department ON employee.dept_id = department.dept_id;
  ```

---

## 2. Advanced Joins

### Self Joins
A **Self Join** is a regular join, but the table is joined with **itself**. You must use table aliases to distinguish the left copy from the right copy.
- **Typical Use Case:** Managing hierarchical structures (e.g. employee-to-manager relationships within the same table).
```sql
SELECT e.name AS Employee, m.name AS Manager
FROM employee e
INNER JOIN employee m ON e.manager_id = m.id;
```

### CROSS JOIN
Returns the Cartesian product of both tables. It pairs **every** row of the first table with **every** row of the second table.
```sql
SELECT student.name, course.course_name
FROM student
CROSS JOIN course;
```
