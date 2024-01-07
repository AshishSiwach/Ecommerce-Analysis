CREATE DATABASE ecommerce;
SELECT * FROM orders;
SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM shipping;
SELECT * FROM market_fact;
SET SQL_SAFE_UPDATES=0;
UPDATE orders SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');
UPDATE shipping SET ship_date = STR_TO_DATE(ship_date, '%d-%m-%Y');
-- number of orders that were made on the most happening days (25th Dec and 31st Dec) for the year 2010 and 2011? 
SELECT
DATE(order_date) as order_day,
COUNT(*) as order_count
FROM orders
WHERE MONTH(order_date) = 12 AND DAY(order_date) IN (25,31) AND YEAR(order_date) IN (2010,2011)
GROUP BY order_day
ORDER BY order_count DESC;

-- Most profitable product_id
SELECT 
Prod_id,
ROUND(AVG(Profit),2) as Profit FROM market_fact GROUP BY Prod_id ORDER BY Profit DESC LIMIT 3;

-- Least Profitable product_id
SELECT 
Prod_id,
ROUND(AVG(Profit),2) as Profit FROM market_fact GROUP BY Prod_id ORDER BY Profit LIMIT 3;

-- Most frequent mode of shipment used by the company?
SELECT Ship_Mode,
COUNT(*) as Frequency
FROM shipping
GROUP BY Ship_Mode
ORDER BY
Frequency DESC 
LIMIT 2;

-- Number of unique regions that the company has
SELECT COUNT(DISTINCT Region) AS Regions FROM customer; 

-- Which region has the maximum number of customers in it?
SELECT
Region,
COUNT(DISTINCT Cust_id) as Number_of_Customers
FROM customer
GROUP BY Region
ORDER BY Number_of_Customers DESC;

-- most profitable regions
SELECT 
c.Region, ROUND(AVG(m.Profit),2) as Profit
FROM 
customer c
LEFT JOIN market_fact m
ON c.Cust_id = m.Cust_id
GROUP BY c.Region
ORDER BY Profit DESC
LIMIT 3;

-- least profitable regions
SELECT 
c.Region, ROUND(AVG(m.Profit),2) as Profit
FROM 
customer c
LEFT JOIN market_fact m
ON c.Cust_id = m.Cust_id
GROUP BY c.Region
ORDER BY Profit
LIMIT 3;

-- Customers who have not made any order
WITH CTE AS (
SELECT
DISTINCT Cust_id
FROM market_fact
)
SELECT Cust_id
FROM customer
WHERE Cust_id
NOT IN (SELECT Cust_id FROM CTE);

-- The e-commerce company claims that, a High priority order is shipped on the same day of the order or the very next day
-- Number of orders in which the shipment was done on the same day or the very next day?

-- NUMBER OF ORDERS WHERE ORDER PRIORITY IS HIGH

SELECT COUNT(*)
FROM orders
WHERE Order_Priority = 'HIGH';

WITH CTE AS (
SELECT *
FROM orders
WHERE Order_Priority = 'HIGH'
)
SELECT COUNT(c.Order_ID) as Count_Orders
FROM CTE c
LEFT JOIN
shipping s ON
c.Order_ID = s.Order_ID
WHERE s.Ship_Date = c.Order_Date OR s.Ship_Date = date_add(c.Order_Date, interval 1 day); 

-- The average shipping cost for various “order_priority” for the region which has the most number of customers in it. 
WITH 
CTE1 
AS(
SELECT
Region,
COUNT(DISTINCT Cust_id) as Number_of_Customers
FROM customer
GROUP BY Region
ORDER BY Number_of_Customers DESC
LIMIT 1
),

CTE2
AS (
SELECT *
FROM customer
WHERE Region IN (SELECT Region FROM CTE1)
)
SELECT o.Order_Priority, ROUND(AVG(m.Shipping_Cost),2) AS Avg_Shipping_Cost
FROM CTE2 c
LEFT JOIN market_fact m
ON c.Cust_id = m.Cust_id
RIGHT JOIN orders o
ON m.Ord_id = o.Ord_id
GROUP BY o.Order_Priority
ORDER BY Avg_Shipping_Cost DESC;

-- Product Category with highest avg Profit Margin
SELECT p.Product_Category, ROUND(100*(AVG(m.Product_Base_Margin)),2) as Avg_Margin
FROM product p
LEFT JOIN market_fact m
ON p.Prod_id = m.Prod_id
GROUP BY p.Product_Category
ORDER BY Avg_Margin DESC
LIMIT 2;
