-- Data Insertion Operations

USE revision_db;

-- 1. Create a table to demonstrate insertion behaviors
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    dob DATE NULL,                              -- Nullable column, no default
    country VARCHAR(30) DEFAULT 'India'         -- Default value defined
);

-- 2. Standard Insert (Specifying columns)
INSERT INTO users (id, name, dob, country) 
VALUES (1, 'Aditya', '2001-01-01', 'India');

-- 3. Bulk Insert
INSERT INTO users (id, name, dob, country) 
VALUES 
(2, 'Rahul', '2002-01-15', 'USA'),
(3, 'Aman', '2001-02-01', 'UK');

-- 4. Omit Nullable Column (dob) -> Stores NULL automatically
INSERT INTO users (id, name, country) 
VALUES (4, 'Deepak', 'Canada');

-- 5. Omit Default Column (country) -> Stores 'India' automatically
INSERT INTO users (id, name, dob) 
VALUES (5, 'Karan', '1999-12-31');

-- 6. Explicitly insert NULL
INSERT INTO users (id, name, dob, country)
VALUES (6, 'Sneha', NULL, 'Australia');

-- 7. What happens if you omit a NOT NULL column without default? (e.g. name or id)
-- Un-comment the line below to test the error behavior:
-- INSERT INTO users (dob, country) VALUES ('2000-05-10', 'India'); 
-- Error: Field 'id' doesn't have a default value
