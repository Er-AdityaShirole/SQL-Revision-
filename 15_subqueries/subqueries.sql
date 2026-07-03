-- Subquery Operations

USE revision_db;

-- 1. Setup sample data
CREATE TABLE IF NOT EXISTS member_staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    dept_id INT
);

TRUNCATE TABLE member_staff;

INSERT INTO member_staff VALUES 
(1, 'Aditya', 75000.00, 1),
(2, 'Rahul', 45000.00, 1),
(3, 'Aman', 60000.00, 2),
(4, 'Sneha', 80000.00, 2),
(5, 'Deepak', 30000.00, 3);

-- 2. Scalar Subquery
-- Find employees who earn more than the overall average salary
SELECT name, salary 
FROM member_staff
WHERE salary > (SELECT AVG(salary) FROM member_staff);

-- 3. Column Subquery using IN
-- Find employees in departments that have dept_id in (1, 2)
SELECT name, dept_id 
FROM member_staff
WHERE dept_id IN (
    SELECT dept_id 
    FROM department 
    WHERE dept_name IN ('Engineering', 'Marketing')
);

-- 4. Derived Table (Table Subquery) - Alias is mandatory
SELECT MAX(dept_avg) AS max_department_average
FROM (
    SELECT dept_id, AVG(salary) AS dept_avg 
    FROM member_staff 
    GROUP BY dept_id
) AS temp_avg_table;

-- 5. Correlated Subquery
-- Find employees earning more than their specific department's average
SELECT e.name, e.salary, e.dept_id
FROM member_staff e
WHERE e.salary > (
    SELECT AVG(sub.salary) 
    FROM member_staff sub 
    WHERE sub.dept_id = e.dept_id
);

-- 6. EXISTS Query
-- Find departments that have employees earning > 70000
SELECT d.dept_name
FROM department d
WHERE EXISTS (
    SELECT 1 
    FROM member_staff e 
    WHERE e.dept_id = d.dept_id AND e.salary > 70000
);
