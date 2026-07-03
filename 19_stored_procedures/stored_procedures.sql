-- Stored Procedures Operations

USE revision_db;

-- 1. Simple Stored Procedure (No parameters)
DELIMITER //

CREATE PROCEDURE GetHighSalaryEmployees()
BEGIN
    SELECT name, salary 
    FROM member_staff 
    WHERE salary > 50000;
END //

DELIMITER ;

-- Call the procedure
CALL GetHighSalaryEmployees();

-- 2. Stored Procedure with IN parameter
DELIMITER //

CREATE PROCEDURE GetStaffByDepartment(IN d_id INT)
BEGIN
    SELECT name, salary 
    FROM member_staff 
    WHERE dept_id = d_id;
END //

DELIMITER ;

-- Call with input parameter
CALL GetStaffByDepartment(1);

-- 3. Stored Procedure with OUT parameter
DELIMITER //

CREATE PROCEDURE GetTotalPayroll(OUT payroll_sum DECIMAL(10, 2))
BEGIN
    SELECT SUM(salary) INTO payroll_sum FROM member_staff;
END //

DELIMITER ;

-- Call and fetch output parameter
CALL GetTotalPayroll(@total);
SELECT @total AS total_payroll_result;

-- 4. Cleaning up
DROP PROCEDURE IF EXISTS GetHighSalaryEmployees;
DROP PROCEDURE IF EXISTS GetStaffByDepartment;
DROP PROCEDURE IF EXISTS GetTotalPayroll;
