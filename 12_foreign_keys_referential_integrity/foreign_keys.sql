-- Foreign Keys and Referential Integrity Examples

USE revision_db;

-- 1. Create Parent Table (Departments)
CREATE TABLE IF NOT EXISTS department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- 2. Create Child Table (Employees) with Foreign Key & Cascade Options
CREATE TABLE IF NOT EXISTS member_employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT,
    
    -- Defining Foreign Key constraint pointing to department
    CONSTRAINT fk_employee_dept 
        FOREIGN KEY (dept_id) 
        REFERENCES department(dept_id)
        ON DELETE CASCADE                      -- If department is deleted, delete employee
        ON UPDATE CASCADE                      -- If dept_id changes, update employee
);

-- Populate Parent Table
INSERT INTO department (dept_name) VALUES ('Engineering'), ('Marketing'), ('Sales');

-- Populate Child Table
INSERT INTO member_employee (emp_name, dept_id) VALUES 
('Aditya', 1), 
('Rahul', 2), 
('Aman', 1);

-- Verify records
SELECT * FROM department;
SELECT * FROM member_employee;

-- 3. Test CASCADE Delete
-- Delete 'Marketing' department (dept_id = 2)
DELETE FROM department WHERE dept_id = 2;

-- Check child table: Rahul (who belonged to Marketing) should be automatically deleted
SELECT * FROM member_employee;
