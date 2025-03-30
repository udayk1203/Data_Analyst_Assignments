use classicmodels;

-- 1.Show employee number, Sales Person (combination of first and last names of employees), unique customers for each employee number and sort the data by highest to lowest unique customers.
-- Tables: Employees, Customers

SELECT 
    employeeNumber,
    CONCAT(firstName, ' ', lastName) AS Sales_Person,
    COUNT(DISTINCT c.customerNumber) AS Unique_Customers
FROM
    employees AS e
        INNER JOIN
    customers AS c ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.employeeNumber
ORDER BY Unique_Customers DESC;

-- 2.Show total quantities, total quantities in stock, left over quantities for each product and each customer. 
-- Sort the data by customer number.
-- Tables: Customers, Orders, Orderdetails, Products

SELECT 
    c.customerNumber,
    c.customerName,
    p.productCode,
    p.productName,
    SUM(od.quantityOrdered) AS OrderedQuantity,
    p.quantityInStock AS TotalInventry,
    (p.quantityInStock - SUM(od.quantityOrdered)) AS LeftQuantity
FROM Customers c
JOIN Orders o ON c.customerNumber = o.customerNumber
JOIN Orderdetails od ON o.orderNumber = od.orderNumber
JOIN Products p ON od.productCode = p.productCode
GROUP BY c.customerNumber, p.productCode
ORDER BY c.customerNumber;

-- 3.Create below tables and fields. (You can add the data as per your wish)
-- Laptop: (Laptop_Name)
-- Colours: (Colour_Name)
-- Perform cross join between the two tables and find number of rows.

create table Laptop (
Laptop_Name varchar(50) primary key
);

create table Colours (
Colour_Name varchar(20) primary key
);

insert into Laptop(Laptop_Name) values ('HP'), ('DELL');
INSERT into Colours(Colour_Name) values ('White'),('Silver'),('Black');

-- Find the number of rows

select count(*) as No_of_Laptop
From Laptop
cross Join Colours;

-- 4) Create table project with below fields.
-- EmployeeID
-- FullName
-- Gender
-- ManagerID

-- Add below data into it.
-- INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
-- INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
-- INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
-- INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
-- INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
-- INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
-- INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);
-- Find out the names of employees and their related managers.

CREATE TABLE Project (
    Employee_ID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Gender VARCHAR(10),
    ManagerID INT
);

insert into Project (Employee_ID, FullName,Gender,ManagerID) values
(1, 'Pranaya', 'Male', 3),
(2, 'Priyanka', 'Female', 1),
(3, 'Preety', 'Female', NULL),
(4, 'Anurag', 'Male', 1),
(5, 'Sambit', 'Male', 1),
(6, 'Rajesh', 'Male', 3),
(7, 'Hina', 'Female', 3);

-- Find out the names of employees and their related managers.

SELECT 
    m.FullName AS ManagerName, e.FullName AS EmployeeName
FROM
    Project e
        LEFT JOIN
    Project m ON e.ManagerID = m.Employee_ID
WHERE
    e.managerID IS NOT NULL
ORDER BY ManagerName;