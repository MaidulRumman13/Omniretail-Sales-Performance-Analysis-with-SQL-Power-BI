--1. Region-wise Average Order Value (AOV)
SELECT 
    Region,
    ROUND(SUM(Total_Sale_Amount) / COUNT(DISTINCT Sale_ID), 2) AS Avg_Order_Value
FROM Sales
GROUP BY Region
ORDER BY Avg_Order_Value DESC;

--2. Region-wise return rate
 SELECT Region, 
    ROUND(SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReturnRate 
FROM Sales 
GROUP BY Region 
ORDER BY ReturnRate DESC;

--3. Product Category-wise Return vs Revenue Ratio
SELECT 
    Product_Category,
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS Total_Returns,
    ROUND(SUM(Total_Sale_Amount), 2) AS Total_Revenue,
    ROUND((SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS Return_Percentage
FROM Sales
GROUP BY Product_Category
ORDER BY Return_Percentage DESC;

--4. Payment Method Preference by Region
SELECT 
    Region,
    Payment_Method,
    COUNT(Sale_ID) AS Total_Transactions
FROM Sales
GROUP BY Region, Payment_Method
ORDER BY Region, Total_Transactions DESC;

--5. Top 5 Customers by Average Purchase Value
SELECT 
    Customer_ID,
    ROUND(SUM(Total_Sale_Amount) / COUNT(DISTINCT Sale_ID), 2) AS Avg_Purchase_Value,
    ROUND(SUM(Total_Sale_Amount), 2) AS Total_Spent
FROM Sales
GROUP BY Customer_ID
ORDER BY Avg_Purchase_Value DESC
LIMIT 5;

--6. Category Performance by Quarter
SELECT 
    CONCAT('Q', QUARTER(Sale_Date)) AS Quarter,
    Product_Category,
    ROUND(SUM(Total_Sale_Amount), 2) AS Total_Revenue
FROM Sales
GROUP BY Quarter, Product_Category
ORDER BY Quarter, Total_Revenue DESC;

--7. Store Performance Efficiency (Revenue per Sale)
SELECT 
    Store_ID,
    ROUND(SUM(Total_Sale_Amount) / COUNT(DISTINCT Sale_ID), 2) AS Revenue_Per_Sale
FROM Sales
GROUP BY Store_ID
ORDER BY Revenue_Per_Sale DESC;

--8. Returned Items Trend Over Time
SELECT 
    DATE_FORMAT(Sale_Date, '%Y-%m') AS Month,
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS Returned_Items
FROM Sales
GROUP BY Month
ORDER BY Month;

--9. Return Rate by Payment Method
SELECT 
    Payment_Method,
    ROUND(SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReturnRate
FROM Sales
GROUP BY Payment_Method
ORDER BY ReturnRate DESC;
