-- Selecting and Querying Data Operations

USE revision_db;

-- 1. Inefficient vs Efficient selections
-- Avoid doing this on production tables:
SELECT * FROM users;

-- Better: Select only required columns
SELECT id, name FROM users;

-- 2. Inspecting table structures
DESCRIBE users;
SHOW CREATE TABLE users;

-- 3. Limiting output size (essential for large datasets)
SELECT * FROM users LIMIT 3;

-- 4. Using BETWEEN (inclusive boundaries)
-- Retrieves employees born on or between Jan 1, 2001 and Feb 1, 2001
SELECT * FROM users 
WHERE dob BETWEEN '2001-01-01' AND '2001-02-01';

-- 5. Three-Valued Logic NULL comparison
-- WRONG: This query will execute but return an empty set
SELECT * FROM users WHERE dob = NULL;

-- CORRECT: Use IS NULL or IS NOT NULL
SELECT * FROM users WHERE dob IS NULL;
SELECT * FROM users WHERE dob IS NOT NULL;

-- 6. Sorting with ORDER BY (does not mutate table data)
SELECT * FROM users ORDER BY name ASC;
SELECT * FROM users ORDER BY dob DESC;
