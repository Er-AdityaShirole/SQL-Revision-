-- Table Modification (ALTER TABLE) Operations

USE revision_db;

-- 1. Create a dummy table with data
CREATE TABLE IF NOT EXISTS student_records (
    id INT,
    name VARCHAR(20),
    email VARCHAR(20)
);

-- Insert sample record
INSERT INTO student_records (id, name, email) 
VALUES (1, 'Aditya', 'abc@gmail.com');

-- 2. Shifting column order (COMPULSORY to repeat datatype)
-- Move 'email' to be right after 'id'
ALTER TABLE student_records 
MODIFY COLUMN email VARCHAR(20) 
AFTER id;

-- Inspect structure to verify column order changed (email is now index 2)
DESCRIBE student_records;

-- 3. Adding a new column
ALTER TABLE student_records ADD age INT DEFAULT 18;

-- 4. Modifying size of VARCHAR
-- Let's try to reduce email size from VARCHAR(20) to VARCHAR(10)
-- Since 'abc@gmail.com' is 13 characters:
-- Under Strict SQL Mode (default), this next line will FAIL.
-- ALTER TABLE student_records MODIFY COLUMN email VARCHAR(10); 
-- Error: Data too long for column 'email'

-- Let's increase it instead, which is always safe:
ALTER TABLE student_records MODIFY COLUMN email VARCHAR(50);
