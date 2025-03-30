-- Day 14

-- Create the table Emp_EH. Below are its fields.
-- EmpID (Primary Key)
-- EmpName
-- EmailAddress

-- Create a procedure to accept the values for the columns in Emp_EH. Handle the error using exception handling concept. 
-- Show the message as “Error occurred” in case of anything wrong.

CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    EmailAddress VARCHAR(100)
);

DELIMITER //
DELIMITER $$

CREATE PROCEDURE InsertEmp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(50),
		IN p_EmailAddress VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error occurred' AS Message;
    END;

    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress)
    VALUES (p_EmpID, p_EmpName, p_EmailAddress);

    SELECT 'Data entered successfully' AS Message;
END $$

DELIMITER ;