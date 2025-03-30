-- Day 3
use	classicmodels;

/* 1)	Show customer number, customer name, state and credit limit from customers table for below conditions. Sort the results by highest to lowest values of creditLimit.
 State should not contain null values
 credit limit should be between 50000 and 100000
*/

select customerNumber, customerName, state, creditLimit
from customers
where state is not null and creditLimit between 50000 and 100000
order by creditLimit desc;

-- 2)	Show the unique productline values containing the word cars at the end from products table.

select distinct(productLine)
from products
where productLine like "%Cars";