-- Day 10
-- Create the view products status. Show year wise total products sold. Also find the percentage of total value for each year.
USE classicmodels;

CREATE VIEW Product_Status AS;
SELECT 
    EXTRACT(YEAR FROM paymentDate) AS "Year",
    COUNT(customerNumber) / "Year" AS ProductsSold,
    SUM(amount) AS TotalValue,
    MIN(amount) AS MinPayAmount,
    (SUM(amount) / (SELECT 
                    SUM(amount)
                FROM
                    payments
                WHERE
                    EXTRACT(YEAR FROM paymentDate) = EXTRACT(YEAR FROM paymentDate))) * 100 PercentageValue
FROM
    payments