-- MySQL Functions and GROUP BY Operations

USE revision_db;

-- 1. Setup sample user table
CREATE TABLE IF NOT EXISTS test_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    salary DECIMAL(10, 2),
    department VARCHAR(20)
);

-- Populating data
INSERT INTO test_users (name, gender, salary, department) 
VALUES 
('Aditya', 'Male', 65000.00, 'IT'),
('Rahul', 'Male', 45000.00, 'HR'),
('Sneha', 'Female', 70000.00, 'IT'),
('Aman', 'Male', 55000.00, 'IT'),
('Priya', 'Female', 48000.00, 'HR');

-- 2. GROUP BY vs WHERE (Scanning all departments at once)
SELECT department, AVG(salary) AS avg_salary
FROM test_users
GROUP BY department;

-- 3. SELECT without GROUP BY column (Valid but unlabelled)
SELECT AVG(salary) 
FROM test_users 
GROUP BY gender;

-- 4. IF() inline statements
-- Simple evaluation
SELECT IF(100 > 50, 'Yes', 'No') AS comparison;

-- Labeling row data
SELECT name, salary, IF(salary >= 60000, 'High Earner', 'Normal Earner') AS tier
FROM test_users;

-- 5. SUM(IF()) Count Aggregation Trick
-- Count male and female users in a single query
SELECT 
    SUM(IF(gender = 'Male', 1, 0)) AS male_count,
    SUM(IF(gender = 'Female', 1, 0)) AS female_count
FROM test_users;

-- 6. CASE WHEN (Multiple conditions)
SELECT name, salary,
    CASE 
        WHEN salary >= 65000 THEN 'Gold Tier'
        WHEN salary >= 55000 THEN 'Silver Tier'
        ELSE 'Bronze Tier'
    END AS reward_tier
FROM test_users;

-- 7. Real-world interview query: Average salary of employees earning > 50000 inside each gender
SELECT 
    gender,
    COUNT(*) AS total_employees,
    AVG(IF(salary > 50000, salary, NULL)) AS avg_salary_high_earners
FROM test_users
GROUP BY gender;
