-- Day 12
-- 1) Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. Format the YoY values in no decimals and show in % sign.
-- Table : Orders

SELECT 
    OrderYear,
    OrderMonth,
    OrderCount,
    CONCAT(ROUND((OrderCount / YOY - 1) * 100), '%') AS YoYPercentageChange
FROM
    (SELECT 
        YEAR(orderDate) AS OrderYear,
            MONTHNAME(orderDate) AS OrderMonth,
            COUNT(orderNumber) AS OrderCount,
            (SELECT 
                    COUNT(DISTINCT orderNumber)
                FROM
                    orders
                WHERE
                    YEAR(orderDate) = YEAR(orderDate) - 1
                        AND MONTH(orderDate) = MONTH(orderDate - INTERVAL 1 YEAR)) AS YOY
    FROM
        orders
    GROUP BY OrderYear , OrderMonth) AS subquery
ORDER BY OrderYear;


-- 2) Create the table emp_udf with below fields.
-- Emp_ID
-- Name
-- DOB

Create table Emp_UDF (
	Emp_ID int auto_increment primary key,
    Name Varchar(50),
    DOB date
    );
    
-- Add the data as shown in below query.
-- INSERT INTO Emp_UDF(Name, DOB)
-- VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");

INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), 
("Aman", "1992-08-15"), 
("Meena", "1998-07-28"), 
("Ketan", "2000-11-21"), 
("Sanjay", "1995-05-21");

-- Create a user defined function calculate_age which returns the age in years and months
-- (e.g. 30 years 5 months) by accepting DOB column as a parameter.

DELIMITER //
CREATE FUNCTION calculate_age(dob DATE)
RETURNS VARCHAR(50)
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);

    SET years = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    SET months = TIMESTAMPDIFF(MONTH, dob, CURDATE()) - years * 12;

    SET age = CONCAT(years, ' years ', months, ' months');
    
    RETURN age;
END //
DELIMITER ;