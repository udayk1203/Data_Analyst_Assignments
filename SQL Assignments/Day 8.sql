-- Day 8

-- Create table facility. Add the below fields into it.
-- Facility_ID
-- Name
-- State
-- Country

CREATE TABLE Facility (
    Facility_ID INT,
    Name VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

-- i) Alter the table by adding the primary key and auto increment to Facility_ID column.

alter table facility 
add primary key(Facility_ID);

alter table facility
modify column Facility_ID int auto_increment;

-- ii) Add a new column city after name with data type as varchar which should not accept any null values.

alter table facility
add City varchar(100) not null after Name;

describe facility;