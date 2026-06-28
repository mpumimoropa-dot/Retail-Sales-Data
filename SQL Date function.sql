-- Databricks notebook source
--Extracting Date Function
SELECT YEAR('2026-06-20'),
       MONTH('2026-06-20'),
       DAY('2026-06-20'),
       HOUR('2026-06-20 04:12:00'),
       MINUTE('2026-06-20 04:12:00'),
       SECOND('2026-06-20 04:12:00'),
       DAYOFWEEK('2026-06-20'),
       DAYOFYEAR('2026-06-20'),
       WEEKOFYEAR('2026-06-20'),
       QUARTER('2026-06-20'),
       DAYNAME('2026-06-20'),
       MONTHNAME('2026-06-20');

--Create a table and run order dayname & order date
CREATE TABLE orders AS
SELECT *
FROM (VALUES
    (1001, 101, DATE '2026-05-01'),
    (1002, 102, DATE '2026-05-02'),
    (1003, 103, DATE '2026-05-03'),
    (1004, 104, DATE '2026-05-04'),
    (1005, 105, DATE '2026-05-05')) 
    AS t(order_id, customer_id, order_date);

----Bringing up the table
SELECT*
FROM orders

----Return each order with the day name of the order date
SELECT order_id,customer_id,order_date,
DAYNAME(order_date) AS day_name
FROM orders;

--Question 2 Create table
CREATE OR REPLACE TABLE customer_signups AS
SELECT* FROM (VALUES
(201,'John','2026-01-15'), 
(202,'Mary','2026-02-20'),
(203,'Peter','2026-03-05'),
(204,'Sarah','2026-04-18'),
(205,'Thabo','2026-05-30'))
AS customer_signups(customer_id,customer_name,signup_date);

----Bringing up the table
SELECT*
FROM customer_signups

----Return each customer with the name of the month which they signed up
SELECT customer_id,customer_name,signup_date,
MONTHNAME(signup_date) AS signup_month_name
FROM customer_signups

--Question 3 Create table
CREATE TABLE sales AS
SELECT* FROM VALUES
('S001','Laptop','2026-01-10',1200), 
('S002','Mouse','2026-02-15',250),
('S003','Keyboard','2026-03-20',700),
('S004','Monitor','2026-04-25',3500),
('S005','Desk','2026-05-30',2000)
AS sales(sale_id,product_name,sale_date,amount);

----Bringing up the table
SELECT*
FROM sales

----Return each sale with the month number from sale_date
SELECT sale_id,product_name,sale_date,
MONTH(sale_date) AS sale_month
FROM sales

--Question 4 Create table
CREATE TABLE transactions AS
SELECT* FROM VALUES
('T001',101,'2024-12-15',500), 
('T002',102,'2025-01-20',1200),
('T003',103,'2025-06-10',800),
('T004',104,'2026-02-05',1500),
('T005',105,'2026-05-25',2000)
AS transactions(transaction_id,customer_id,transaction_date,amount);

----Bringing up the table
SELECT*
FROM transactions

----Return each transaction with the year extracted from transaction_date
SELECT transaction_id,customer_id,transaction_date,
YEAR(transaction_date) AS transaction_year
FROM transactions

--Question 5 Create table
CREATE TABLE deliveries AS
SELECT* FROM VALUES
('D001',101,'2026-05-01'), 
('D002',102,'2026-05-08'), 
('D003',103,'2026-05-15'), 
('D004',104,'2026-05-22'),
('D005',105,'2026-05-29')
AS deliveries (delivery_id,customer_id,delivery_date)

----Bringing up the table
SELECT*
FROM deliveries

----Return each delivery with the day of the month extracted from delivery_date
SELECT delivery_id,customer_id,delivery_date,
DAY(delivery_date) AS day_of_month
FROM deliveries



      

