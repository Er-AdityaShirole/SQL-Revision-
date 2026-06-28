-- Update and Delete Operations

USE revision_db;

-- 1. Setup sample data
CREATE TABLE IF NOT EXISTS customer (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO customer (name, balance) 
VALUES 
('Aditya', 500.00),
('Rahul', 1200.00),
('Aman', 300.00);

-- 2. UPDATE operation
UPDATE customer 
SET balance = balance + 100.00 
WHERE cust_id = 1;

-- 3. Safe DELETE workflow
-- Step A: Verify which rows will be affected
SELECT * FROM customer WHERE balance < 500.00;

-- Step B: Delete verified rows
DELETE FROM customer WHERE balance < 500.00;

-- 4. DELETE vs TRUNCATE vs DROP illustration (Read-only comments)
-- If we do:
-- DELETE FROM customer; 
-- Result: All rows deleted, but AUTO_INCREMENT counter remains at 4. Next insert gets id 4.

-- If we do:
-- TRUNCATE TABLE customer;
-- Result: All rows deleted, fast, and AUTO_INCREMENT counter resets to 1. Next insert gets id 1.

-- If we do:
-- DROP TABLE customer;
-- Result: Table customer is completely deleted. DESCRIBE customer; will fail.
