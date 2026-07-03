-- Indexes Operations

USE revision_db;

-- 1. Create a table with indexes
CREATE TABLE IF NOT EXISTS customer_profile (
    id INT AUTO_INCREMENT PRIMARY KEY,            -- Auto-creates Clustered Index
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    
    -- Defining a unique index inline
    UNIQUE INDEX idx_cust_email (email)
);

-- 2. Add an index to an existing table
-- Adding a secondary index on name columns to speed up searches by name
CREATE INDEX idx_cust_names ON customer_profile (first_name, last_name);

-- 3. Show all indexes present on the table
SHOW INDEX FROM customer_profile;

-- 4. Analyzing query plans using EXPLAIN
-- Insert dummy record
INSERT INTO customer_profile (email, first_name, last_name)
VALUES ('aditya@gmail.com', 'Aditya', 'Shirole')
ON DUPLICATE KEY UPDATE first_name = 'Aditya';

-- Query 1: Filtering by non-indexed column (last_name only) -> Full Table Scan (ALL)
EXPLAIN SELECT * FROM customer_profile WHERE last_name = 'Shirole';

-- Query 2: Filtering by indexed column (email) -> Index Lookup (const)
EXPLAIN SELECT * FROM customer_profile WHERE email = 'aditya@gmail.com';

-- 5. Dropping an index
ALTER TABLE customer_profile DROP INDEX idx_cust_names;
