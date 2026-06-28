-- Demonstrating MySQL Data Types and Constraints

USE revision_db;

CREATE TABLE IF NOT EXISTS employee (
    emp_id INT PRIMARY KEY,                       -- Numeric Type, Primary Key Constraint
    first_name VARCHAR(50) NOT NULL,              -- String Type, NOT NULL Constraint
    last_name VARCHAR(50) NOT NULL,               -- String Type, NOT NULL Constraint
    email VARCHAR(100) UNIQUE,                    -- String Type, UNIQUE Constraint
    salary DECIMAL(10, 2) DEFAULT 30000.00,       -- Exact Decimal Type, DEFAULT Constraint
    hire_date DATE DEFAULT (CURRENT_DATE)         -- Date Type, Default to current system date
);

-- Describe table structure
DESCRIBE employee;
