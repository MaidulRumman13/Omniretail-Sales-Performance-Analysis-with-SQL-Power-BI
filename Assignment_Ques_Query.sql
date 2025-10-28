SELECT * FROM sales

-- 1.	Which region has the highest total revenue?
SELECT 
    Region, 
    ROUND(SUM(Total_Sale_Amount), 2) AS TotalRevenue 
FROM Sales 
GROUP BY Region 
ORDER BY TotalRevenue DESC 
LIMIT 1;

-- 2.	Which product category generates the highest revenue on average per sale?
SELECT 
    Product_Category, 
    ROUND(AVG(Total_Sale_Amount), 2) AS Avg_Revenue_Per_Sale 
FROM Sales 
GROUP BY Product_Category 
ORDER BY Avg_Revenue_Per_Sale DESC 
LIMIT 1;

-- 3.	What is the return rate per product category?
SELECT 
    Product_Category,
    ROUND(SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReturnRatePercentage
FROM Sales
GROUP BY Product_Category
ORDER BY ReturnRatePercentage DESC;

-- 4.	Identify the top 5 products with the highest total sales by quantity.
SELECT 
    Product_ID, 
    SUM(Quantity_Sold) AS TotalQuantitySold 
FROM Sales 
GROUP BY Product_ID 
ORDER BY TotalQuantitySold DESC 
LIMIT 5;

-- 5.	Which store has the lowest revenue but highest number of sales?
SELECT 
    Store_ID, 
    ROUND(SUM(Total_Sale_Amount),2) AS TotalRevenue, 
    COUNT(Sale_ID) AS NumberOfSales
FROM Sales
GROUP BY Store_ID
ORDER BY NumberOfSales DESC, TotalRevenue ASC;

-- Using CTE 
-- 5.	Which store has the lowest revenue but highest number of sales?
WITH StoreStats AS (
    SELECT 
        Store_ID,
        ROUND(SUM(Total_Sale_Amount), 2) AS TotalRevenue,
        COUNT(Sale_ID) AS NumberOfSales,
        RANK() OVER (ORDER BY COUNT(Sale_ID) DESC) AS SalesRank,
        RANK() OVER (ORDER BY SUM(Total_Sale_Amount) ASC) AS RevenueRank
    FROM Sales
    GROUP BY Store_ID
)
SELECT *
FROM StoreStats
ORDER BY SalesRank ASC, RevenueRank DESC
LIMIT 1;



-- 6.	How do different payment methods impact total revenue?
SELECT 
    Payment_Method, 
    ROUND(SUM(Total_Sale_Amount), 2) AS TotalRevenue 
FROM Sales 
GROUP BY Payment_Method 
ORDER BY TotalRevenue DESC;

-- 7.	Which customers have made the most purchases in terms of total amount spent?
SELECT 
    Customer_ID, 
    ROUND(SUM(Total_Sale_Amount), 2) AS TotalSpent 
FROM Sales 
GROUP BY Customer_ID 
ORDER BY TotalSpent DESC 
LIMIT 10;

-- 8.	Which quarter sees the highest sales?
SELECT
    CASE
        
        WHEN MONTH(Sale_Date) IN (1, 2, 3) THEN 'Q1'
        WHEN MONTH(Sale_Date) IN (4, 5, 6) THEN 'Q2'
        WHEN MONTH(Sale_Date) IN (7, 8, 9) THEN 'Q3'
        ELSE 'Q4' 
    END AS Quarter,
    ROUND(SUM(Total_Sale_Amount), 2) AS TotalSales
FROM Sales
GROUP BY Quarter
ORDER BY TotalSales DESC;



-- Finding Error in Sale_Date
SELECT Sale_Date FROM Sales LIMIT 10;
-- Test Converting date Format
SELECT 
    Sale_Date,
    STR_TO_DATE(Sale_Date, '%c/%e/%Y') AS ConvertedDate
FROM Sales 
LIMIT 10;  

-- Cornvarting Date Format
-- Create a column name Sale_Date_New
ALTER TABLE Sales ADD COLUMN Sale_Date_New DATE;
-- Converting Date Format and Update the new column
UPDATE Sales 
SET Sale_Date_New = STR_TO_DATE(Sale_Date, '%c/%e/%Y')
-- Validate no NULLs
WHERE STR_TO_DATE(Sale_Date, '%c/%e/%Y') IS NULL;
-- Verify the Update
SELECT Sale_Date, Sale_Date_New FROM Sales LIMIT 10;
-- Remove old column and Rename the new column
ALTER TABLE Sales DROP COLUMN Sale_Date;
ALTER TABLE Sales RENAME COLUMN Sale_Date_New TO Sale_Date;

-- 8.	Which quarter sees the highest sales? (Using QUARTER function)
SELECT 
    CONCAT('Q', QUARTER(Sale_Date)) AS Quarter,
    ROUND(SUM(Total_Sale_Amount), 2) AS TotalSales 
FROM Sales 
GROUP BY Quarter 
ORDER BY TotalSales DESC;

-- 9.	What is the average unit price per product category?
SELECT 
    Product_Category, 
    ROUND(AVG(Unit_Price), 2) AS AverageUnitPrice ,
    ROUND(SUM(Total_Sale_Amount), 2) AS TotalRevenue
FROM Sales 
GROUP BY Product_Category 
ORDER BY AverageUnitPrice DESC, TotalRevenue ASC;

-- 10.	Which product categories have the highest return percentage?
SELECT 
    Product_Category,
    ROUND(SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReturnPercentage
FROM Sales
GROUP BY Product_Category
ORDER BY ReturnPercentage DESC;






