-- UNION and UNION ALL Operations

USE revision_db;

-- 1. Setup sample tables
CREATE TABLE IF NOT EXISTS local_clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS global_clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

-- Clean data
TRUNCATE TABLE local_clients;
TRUNCATE TABLE global_clients;

-- Populate data (introducing duplicate client 'Aditya')
INSERT INTO local_clients VALUES 
(1, 'Aditya', 'aditya@gmail.com'),
(2, 'Rahul', 'rahul@gmail.com');

INSERT INTO global_clients VALUES 
(1, 'Aditya', 'aditya@gmail.com'),
(3, 'Aman', 'aman@gmail.com');

-- 2. UNION (Filters duplicates - 'Aditya' will only appear once)
SELECT name, email FROM local_clients
UNION
SELECT name, email FROM global_clients;

-- 3. UNION ALL (Keeps duplicates - 'Aditya' will appear twice)
SELECT name, email FROM local_clients
UNION ALL
SELECT name, email FROM global_clients;
