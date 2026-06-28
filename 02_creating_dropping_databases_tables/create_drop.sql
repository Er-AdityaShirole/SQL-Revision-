-- DDL Operations: Database & Table Management

-- 1. Database Operations
CREATE DATABASE IF NOT EXISTS school_db;
USE school_db;

-- 2. Table Operations
-- Create a simple table
CREATE TABLE IF NOT EXISTS student (
    id INT,
    name VARCHAR(50),
    email VARCHAR(50)
);

-- Drop the table (if you want to clean up)
-- DROP TABLE student;

-- Drop the database (commented for safety)
-- DROP DATABASE school_db;
