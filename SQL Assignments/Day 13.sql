# Day 13

-- 1) Display the customer numbers and customer names from customers table who have not placed any orders using subquery
-- Table: Customers, Orders

SELECT CustomerNumber, CustomerName
FROM Customers
WHERE CustomerNumber NOT IN (
    SELECT CustomerNumber
    FROM Orders
);

-- 2) Write a full outer join between customers and orders using union and get the customer number, customer name, count of orders for every customer.
-- Table: Customers, Orders

SELECT c.CustomerNumber, c.CustomerName, COUNT(o.CustomerNumber) AS OrderCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerNumber = o.CustomerNumber
GROUP BY c.CustomerNumber, c.CustomerName

UNION

SELECT o.CustomerNumber, c.CustomerName, COUNT(o.CustomerNumber) AS OrderCount
FROM Orders o
RIGHT JOIN Customers c ON c.CustomerNumber = o.CustomerNumber
GROUP BY o.CustomerNumber, c.CustomerName;

-- 3) Show the second highest quantity ordered value for each order number.
-- Table: Orderdetails

WITH RankedOrderDetails AS (
    SELECT
        orderNumber,
        quantityOrdered,
        RANK() OVER (PARTITION BY OrderNumber ORDER BY quantityOrdered DESC) AS QuantityRank
    FROM Orderdetails
)

SELECT
    OrderNumber,
    MAX(quantityOrdered) AS SecondHighestQuantity
FROM RankedOrderDetails
WHERE QuantityRank = 2
GROUP BY OrderNumber;

-- 4) For each order number count the number of products and then find the min and max of the values among count of orders.
-- Table: Orderdetails

WITH OrderProductCounts AS (
    SELECT OrderNumber, COUNT(*) AS ProductCount
    FROM Orderdetails
    GROUP BY OrderNumber
)

SELECT
	MAX(ProductCount) AS MaxTotal,
    MIN(ProductCount) AS MinTotal   
FROM OrderProductCounts;

-- 5) Find out how many product lines are there for which the buy price value is greater than the average of buy price value. 
-- Show the output as product line and its count.

SELECT ProductLine, COUNT(*) AS LineCount
FROM Products
WHERE BuyPrice > (SELECT AVG(BuyPrice) FROM Products)
GROUP BY ProductLine;

