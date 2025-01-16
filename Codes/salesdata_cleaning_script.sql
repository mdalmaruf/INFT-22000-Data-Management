
-- Create the database
CREATE DATABASE IF NOT EXISTS salesdata;
USE salesdata;

-- Create the table
CREATE TABLE sales (
    CustomerID INT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    Region VARCHAR(50),
    PurchaseAmount VARCHAR(50) -- Using VARCHAR to accommodate invalid data for cleaning
);

-- Insert data (including invalid and duplicate entries)
INSERT INTO sales (CustomerID, Name, Email, Region, PurchaseAmount) VALUES
(101, 'Alice', 'alice@example.com', 'North', '250.75'),
(102, 'Bob', 'bob@example.com', 'East', '120.5'),
(103, 'Charlie', 'invalid_email', 'InvalidRegion', '330'),
(104, 'David', 'david@example.com', 'West', '-150'),
(105, 'Eve', 'eve@example.com', 'North', '200'),
(106, 'Frank', 'frank.example.com', 'East', '450'),
(107, 'Grace', 'grace@example.com', 'South', NULL),
(108, 'Helen', NULL, 'West', '310.25'),
(109, 'Ivy', 'ivy@example.com', 'North', '180.75'),
(110, 'Jack', 'jack@example.com', 'Unknown', 'InvalidAmount'),
(105, 'Eve', 'eve@example.com', 'North', '200'),
(103, 'Charlie', 'charlie@example.com', 'South', '330');

-- Check for invalid emails
SELECT * FROM sales WHERE Email NOT LIKE '%@%';
-- Check for missing emails
SELECT * FROM sales WHERE Email IS NULL;

-- Check for invalid regions
SELECT * FROM sales WHERE Region NOT IN ('North', 'East', 'South', 'West');

-- Check for invalid or negative PurchaseAmount
SELECT * FROM sales WHERE PurchaseAmount < 0 OR PurchaseAmount NOT REGEXP '^[0-9]+(\.[0-9]{1,2})?$';

-- Remove duplicates
DELETE FROM sales
WHERE CustomerID IN (
    SELECT CustomerID
    FROM (
        SELECT CustomerID, COUNT(*) AS count
        FROM sales
        GROUP BY CustomerID
        HAVING count > 1
    ) AS duplicates
)
AND NOT (Name = 'Eve' AND Email = 'eve@example.com' AND PurchaseAmount = '200');

-- Update invalid email addresses with placeholders
UPDATE sales
SET Email = 'unknown@example.com'
WHERE Email IS NULL OR Email NOT LIKE '%@%';

-- Update invalid regions to 'Unknown'
UPDATE sales
SET Region = 'Unknown'
WHERE Region NOT IN ('North', 'East', 'South', 'West');

-- Update invalid or negative PurchaseAmount to 0
UPDATE sales
SET PurchaseAmount = '0'
WHERE PurchaseAmount < 0 OR PurchaseAmount NOT REGEXP '^[0-9]+(\.[0-9]{1,2})?$';

-- Analyze cleaned data: Total PurchaseAmount by Region
SELECT Region, SUM(CAST(PurchaseAmount AS DECIMAL(10, 2))) AS TotalSales
FROM sales
GROUP BY Region;
