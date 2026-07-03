-- GROUP BY and HAVING Operations

USE revision_db;

-- 1. Setup testing data
CREATE TABLE IF NOT EXISTS branch_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(50),
    product_category VARCHAR(50),
    amount DECIMAL(10, 2)
);

TRUNCATE TABLE branch_sales;

INSERT INTO branch_sales (branch_name, product_category, amount) VALUES 
('North', 'Electronics', 12000.00),
('North', 'Furniture', 4000.00),
('South', 'Electronics', 15000.00),
('South', 'Furniture', 9000.00),
('East', 'Electronics', 8000.00),
('East', 'Furniture', 1000.00),
('North', 'Electronics', 5000.00);

-- 2. Basic GROUP BY with Aggregation
-- Total sales per branch
SELECT branch_name, SUM(amount) AS total_sales
FROM branch_sales
GROUP BY branch_name;

-- 3. Attempting aggregate filter in WHERE (Will fail - commented)
-- SELECT branch_name, SUM(amount) 
-- FROM branch_sales 
-- WHERE SUM(amount) > 15000 
-- GROUP BY branch_name;

-- 4. Correct: Filtering aggregates with HAVING
-- Find branches that generated more than 15000 in total sales
SELECT branch_name, SUM(amount) AS total_sales
FROM branch_sales
GROUP BY branch_name
HAVING SUM(amount) > 15000;

-- 5. Using WHERE and HAVING together
-- Calculate total sales per branch for Electronics ONLY, where branch total sales exceeds 10000
SELECT branch_name, SUM(amount) AS electronics_sales
FROM branch_sales
WHERE product_category = 'Electronics'        -- Filters rows before grouping
GROUP BY branch_name
HAVING SUM(amount) > 10000;                   -- Filters groups after grouping
