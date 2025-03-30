USE classicmodels;

-- Day 4
-- 1) Show the orderNumber, status and comments from orders table for shipped status only.
-- If some comments are having null values then show them as “-“.
-- */

SELECT orderNumber,STATUS,IFNULL(comments,"-") AS "Comments"
FROM orders
WHERE STATUS ="Shipped";

/*

-- 2)	Select employee number, first name, job title and job title abbreviation from employees table 
based on following conditions.
If job title is one among the below conditions, then job title abbreviation column should show below forms.
●	President then “P”
●	Sales Manager / Sale Manager then “SM”
●	Sales Rep then “SR”
●	Containing VP word then “VP”
*/

SELECT employeeNumber,firstName,jobTitle,
CASE
	WHEN jobTitle = "President" THEN "P"
    WHEN jobTitle LIKE "Sales Manager%" OR jobTitle LIKE 'Sale Manager%' THEN "SM"
	WHEN jobTitle = "Sales Rep" THEN "SR"
	WHEN jobTitle LIKE "%VP%" THEN "VP"
END AS jobTitle_abbr
FROM employees
ORDER BY jobTitle;