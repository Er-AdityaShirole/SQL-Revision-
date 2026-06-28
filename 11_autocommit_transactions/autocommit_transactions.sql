-- Autocommit and Transaction Control

USE revision_db;

-- 1. Check current autocommit setting
SELECT @@autocommit;

-- 2. Setup a table for testing transactions
CREATE TABLE IF NOT EXISTS bank_account (
    acc_id INT PRIMARY KEY,
    owner_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO bank_account (acc_id, owner_name, balance) 
VALUES (1, 'Aditya', 1000.00)
ON DUPLICATE KEY UPDATE balance = 1000.00;

-- 3. Testing ROLLBACK with autocommit disabled
SET autocommit = 0; -- Turn off autocommit

-- Modify balance
UPDATE bank_account 
SET balance = 2000.00 
WHERE acc_id = 1;

-- Check local value (will show 2000.00)
SELECT * FROM bank_account;

-- Discard change
ROLLBACK;

-- Check value again (will be restored to 1000.00)
SELECT * FROM bank_account;

-- Restore autocommit
SET autocommit = 1;

-- 4. Using explicit Transaction Block (safest practice)
START TRANSACTION;

UPDATE bank_account 
SET balance = 1500.00 
WHERE acc_id = 1;

-- Confirm changes
COMMIT;

-- Verify final status
SELECT * FROM bank_account;
