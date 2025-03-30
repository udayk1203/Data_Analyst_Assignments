-- Day 9

-- 1. Create table university with below fields.
-- ID
-- Name

CREATE TABLE University (
    ID INT NOT NULL,
    Name VARCHAR(50)
);

-- 1. Add the below data into it as it is.

insert into University values (1, "       Pune          University     "),
(2, "  Mumbai          University     "),
(3, "     Delhi   University     "),
(4, "Madras University"),
(5, "Nagpur University");

select * From university;

-- 2. Remove the spaces from everywhere and update the column like Pune University etc.

UPDATE University 
set name = REGEXP_REPLACE(Name, ' ',' ');
SELECT * FROM university;

