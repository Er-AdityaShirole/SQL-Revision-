-- Joins and Combinations Queries

USE revision_db;

-- 1. Setup sample tables
CREATE TABLE IF NOT EXISTS employee_details (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    manager_id INT
);

CREATE TABLE IF NOT EXISTS department_details (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Clean existing data
TRUNCATE TABLE employee_details;
TRUNCATE TABLE department_details;

-- Populate data
INSERT INTO department_details VALUES 
(1, 'Engineering'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO employee_details VALUES 
(1, 'Aditya', 1, NULL),       -- Manager of all (No manager_id)
(2, 'Rahul', 1, 1),           -- Reports to Aditya
(3, 'Aman', 2, 1),            -- Reports to Aditya
(4, 'Sneha', NULL, 1);        -- Unassigned department, reports to Aditya

-- 2. INNER JOIN: Find employees with assigned departments
SELECT e.name, d.dept_name
FROM employee_details e
INNER JOIN department_details d ON e.dept_id = d.dept_id;

-- 3. LEFT JOIN: Find all employees, even without departments
SELECT e.name, d.dept_name
FROM employee_details e
LEFT JOIN department_details d ON e.dept_id = d.dept_id;

-- 4. RIGHT JOIN: Find all departments, even without employees
SELECT e.name, d.dept_name
FROM employee_details e
RIGHT JOIN department_details d ON e.dept_id = d.dept_id;

-- 5. Emulated FULL OUTER JOIN in MySQL (LEFT JOIN UNION RIGHT JOIN)
SELECT e.name, d.dept_name
FROM employee_details e
LEFT JOIN department_details d ON e.dept_id = d.dept_id
UNION
SELECT e.name, d.dept_name
FROM employee_details e
RIGHT JOIN department_details d ON e.dept_id = d.dept_id;

-- 6. SELF JOIN: Find employee managers
SELECT e.name AS Employee, m.name AS Manager
FROM employee_details e
LEFT JOIN employee_details m ON e.manager_id = m.emp_id;

-- 7. CROSS JOIN: Combined matching
SELECT e.name, d.dept_name
FROM employee_details e
CROSS JOIN department_details d;
