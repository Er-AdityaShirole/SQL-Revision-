-- Reusable SQL Script Example
-- This script safely sets up a revision database and a table

-- 1. Setup Database
CREATE DATABASE IF NOT EXISTS revision_db;
USE revision_db;

-- 2. Setup Table
CREATE TABLE IF NOT EXISTS topics (
    topic_id INT,
    topic_name VARCHAR(100),
    revised_date DATE
);

-- 3. Show Table Status to verify
DESCRIBE topics;
