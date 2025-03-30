-- Day 11
-- 1) Create a stored procedure GetCustomerLevel which takes input as customer number and gives the output as either Platinum, Gold or Silver as per below criteria.
-- Table : Customers

delimiter //
create procedure GetCustomerLevel(in customerNumber int, out CustomerLevel varchar(20))
begin
	declare creditlimit decimal(10,2);
    
	-- Get the credit limit for the specified customer number
    select creditLimit into CreditLimit FROM customers WHERE customerNumber = CustomerNumber;
    
    -- Determine the customer level based on credit limit
    case
		when CreditLimit > 100000 then
			set CustomerLevel = "Platinum";
		when CreditLimit between 25000 and 100000 then
			set CustomerLevel = "Gold";
		when CreditLimit < 25000 then
			set CustomerLevel = "Silver";
		else
			set CustomerLevel = "Unknown";
	end case;
end //
delimiter ;

-- 2) Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output. Format the total amount to nearest thousand unit (K)
-- Tables: Customers, Payments

DELIMITER //

CREATE PROCEDURE Get_country_payments(
    IN p_Year INT,
    IN p_Country VARCHAR(100)
)
BEGIN
    SELECT 
        YEAR(P.PaymentDate) AS PaymentYear,
        C.Country,
        CONCAT(FORMAT(SUM(P.Amount), 0), 'K') AS TotalAmount_K
    FROM 
        Payments P
    JOIN 
        Customers C ON P.CustomerID = C.CustomerID
    WHERE 
        YEAR(P.PaymentDate) = p_Year
        AND C.Country = p_Country
    GROUP BY 
        YEAR(P.PaymentDate), C.Country;
END //

DELIMITER ;
