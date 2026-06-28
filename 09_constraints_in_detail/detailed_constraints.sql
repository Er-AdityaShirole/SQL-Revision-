-- Detailed Constraints & Auto-Increment

USE revision_db;

-- 1. Create a table demonstrating named table constraints
CREATE TABLE IF NOT EXISTS member (
    id INT,
    email VARCHAR(50),
    age INT,
    
    -- Primary Key Constraint
    CONSTRAINT pk_member PRIMARY KEY (id),
    
    -- Named UNIQUE Constraint
    CONSTRAINT uq_member_email UNIQUE (email),
    
    -- Named CHECK Constraint
    CONSTRAINT chk_member_age CHECK (age >= 18)
);

-- Inspect table structure
DESCRIBE member;

-- Inspect creation DDL statement to see constraint names
SHOW CREATE TABLE member;

-- 2. Drop named constraints
-- Drop Unique constraint
ALTER TABLE member DROP INDEX uq_member_email;

-- Drop Check constraint
ALTER TABLE member DROP CONSTRAINT chk_member_age;

-- 3. Demonstrating AUTO_INCREMENT (must be defined with an index)
CREATE TABLE IF NOT EXISTS product (
    prod_id INT AUTO_INCREMENT,
    prod_name VARCHAR(50),
    PRIMARY KEY (prod_id)                         -- AUTO_INCREMENT requires an index
);

-- Insert rows without specifying prod_id
INSERT INTO product (prod_name) VALUES ('Laptop'), ('Phone'), ('Tablet');

-- View generated IDs
SELECT * FROM product;
