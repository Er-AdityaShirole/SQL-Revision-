-- Views Operations

USE revision_db;

-- 1. Setup helper tables
CREATE TABLE IF NOT EXISTS hr_records (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    ssn VARCHAR(11)
);

TRUNCATE TABLE hr_records;

INSERT INTO hr_records VALUES 
(1, 'Aditya', 75000.00, '111-22-3333'),
(2, 'Rahul', 45000.00, '444-55-6666'),
(3, 'Aman', 60000.00, '777-88-9999');

-- 2. Create View (Masking sensitive SSN data for general staff)
CREATE OR REPLACE VIEW employee_directory AS
SELECT id, name
FROM hr_records;

-- Query the view (SSN and Salary are hidden)
SELECT * FROM employee_directory;

-- 3. Update data through an Updatable View
-- Changing Rahul's name via the view
UPDATE employee_directory 
SET name = 'Rahul Kumar' 
WHERE id = 2;

-- Check underlying table: name is changed in hr_records!
SELECT * FROM hr_records;

-- 4. Non-updatable view example (using aggregation)
CREATE OR REPLACE VIEW payroll_summary AS
SELECT SUM(salary) AS total_payroll 
FROM hr_records;

-- Attempting update on aggregated view will FAIL (commented)
-- UPDATE payroll_summary SET total_payroll = 200000;
-- Error: The target table payroll_summary of the UPDATE is not updatable
