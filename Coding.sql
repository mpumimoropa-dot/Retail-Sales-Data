select * 
from retail_sales
limit 100;

--Display only the Customer ID and Product Category columns
SELECT `Customer ID`,
       `Product Category`
 FROM  retail_sales     

 --Display all electronic sales transactions
 SELECT *
 FROM  retail_sales 
 WHERE`Product Category`='Electronics';

--Display customers over 40
 SELECT *
 FROM  retail_sales 
 WHERE AGE>40;

 --Display transaction where the quantity purchased is 3 or more
 SELECT *
 FROM  retail_sales
 WHERE Quantity>3;

 --Display Beauty product sales where total amount is greater than 100
 SELECT *
 FROM  retail_sales
 WHERE`Product Category`='Beauty'AND `Total Amount`>100;

 --Display customers whose ages are between 25 and 35
 SELECT *
 FROM  retail_sales
 WHERE AGE BETWEEN 25 AND 35;
 
 --Calculate the sales amount for all transactions
 SELECT SUM(`Total Amount`) AS `Total transact`
 FROM  retail_sales

 --Calculate the average age of all customers
SELECT AVG(AGE)
 FROM  retail_sales

--Find the highest sale amount recorded 
SELECT MAX(`Total Amount`)
FROM retail_sales

--Count the total number of transactions
SELECT COUNT(*)
FROM  retail_sales
