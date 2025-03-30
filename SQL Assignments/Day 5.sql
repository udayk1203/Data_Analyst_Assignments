-- Day 5

USE classicmodels;
-- 1)	For every year, find the minimum amount value from payments table.

SELECT YEAR(paymentDate) AS "Year", MIN(amount) AS "Min Amount"
FROM payments
GROUP BY YEAR(paymentDate)
ORDER BY YEAR(paymentDate);

-- 2)	For every year and every quarter, find the unique customers and total orders from orders table. Make sure to show the quarter as Q1,Q2 etc.

SELECT YEAR(orderDate) AS Year,
CASE
	WHEN QUARTER(orderDate) = 1 THEN 'Q1'
    WHEN QUARTER(orderDate) = 2 THEN 'Q2'
    WHEN QUARTER(orderDate) = 3 THEN 'Q3'
    WHEN QUARTER(orderDate) = 4 THEN 'Q4'
END AS Quarter,
COUNT(DISTINCT customerNumber) AS "Unique Customers",
COUNT(*) AS 'Total Orders'
FROM orders
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- 3)	Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb etc.) with filter on total amount as 500000 to 1000000. 
-- Sort the output by total amount in descending mode. [Refer. Payments Table]

SELECT 
SUBSTRING(MONTHNAME(paymentDate), 1, 3) AS Month,
CONCAT(ROUND(sum(amount) / 100), 'K') AS 'Formatted Amount'
FROM 
	payments
WHERE
	amount >= 500000 and amount <= 1000000
GROUP BY Month
ORDER BY round(sum(amount) / 100) DESC;

-- 
select concat(round(sum(amount) / 100),"K") 
FROM 
	payments
WHERE
	amount >= 500000 and amount <= 1000000