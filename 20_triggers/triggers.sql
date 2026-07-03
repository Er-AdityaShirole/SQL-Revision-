-- Triggers Operations

USE revision_db;

-- 1. Setup tables: employee list and an audit log table
CREATE TABLE IF NOT EXISTS member_account (
    acc_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    acc_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Clean up
TRUNCATE TABLE member_account;
TRUNCATE TABLE audit_log;

-- Insert initial record
INSERT INTO member_account VALUES (1, 'Aditya', 50000.00);

-- 2. CREATE BEFORE INSERT TRIGGER
-- Validates or cleans input data
DELIMITER //

CREATE TRIGGER before_member_insert
BEFORE INSERT ON member_account
FOR EACH ROW
BEGIN
    -- Prevent negative salaries by defaulting them to 0.00
    IF NEW.salary < 0.00 THEN
        SET NEW.salary = 0.00;
    END IF;
END //

DELIMITER ;

-- 3. CREATE AFTER UPDATE TRIGGER
-- Logs salary changes to the audit table
DELIMITER //

CREATE TRIGGER after_member_salary_update
AFTER UPDATE ON member_account
FOR EACH ROW
BEGIN
    -- Log only if salary has changed
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO audit_log (action_type, acc_id, old_salary, new_salary)
        VALUES ('SALARY_UPDATE', NEW.acc_id, OLD.salary, NEW.salary);
    END IF;
END //

DELIMITER ;

-- 4. Test BEFORE INSERT Trigger
INSERT INTO member_account VALUES (2, 'Rahul', -1500.00); -- Negative salary

-- Verify that Rahul's salary was modified to 0.00 by the trigger
SELECT * FROM member_account;

-- 5. Test AFTER UPDATE Trigger
UPDATE member_account 
SET salary = 55000.00 
WHERE acc_id = 1;

-- Check audit_log: there should be a record logging Aditya's salary change from 50000 to 55000
SELECT * FROM audit_log;

-- 6. Clean up triggers (DDL)
DROP TRIGGER IF EXISTS before_member_insert;
DROP TRIGGER IF EXISTS after_member_salary_update;
