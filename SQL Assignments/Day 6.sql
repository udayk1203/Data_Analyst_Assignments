USE excelr;

-- 1. Create a journey table with following fields and constraints.

CREATE TABLE journey (
    Bus_ID INT NOT NULL,
    Bus_Name VARCHAR(50) NOT NULL,
    Source_Station VARCHAR(100) NOT NULL,
    Destination VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE
);
    
-- 2. Create vendor table with following fields and constraints.

CREATE TABLE Vendor (
    Vendor_ID INT NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Country VARCHAR(100) DEFAULT 'N/A'
);

-- 3. Create movies table with following fields and constraints.

CREATE TABLE Movies (
    Movie_ID INT NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    Release_Year VARCHAR(10) DEFAULT '-',
    Cast VARCHAR(200) NOT NULL,
    Gender ENUM('Male', 'Female'),
    No_of_shows INT CHECK (No_of_shows > 0)
);

-- 4. Create the following tables. Use auto increment wherever applicable
-- a. Product

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(255) NOT NULL UNIQUE,
    Description TEXT,
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID)
	REFERENCES Suppliers (Supplier_ID)
);

-- b. Supplier

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    location VARCHAR(255)
);

-- c. Stock

CREATE TABLE Stock (
    id INT PRIMARY KEY,
    product_id INT,
    balance_stock INT,
    FOREIGN KEY (product_id)
	REFERENCES Product (product_id)
);