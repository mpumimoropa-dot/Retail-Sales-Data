-- Databricks notebook source


-- COMMAND ----------

---UPLOADING THE TABLE
SELECT *
FROM brightcoffee.shop.coffee_sales_v

--Counting the number of rows
SELECT COUNT(*)
FROM brightcoffee.shop.coffee_sales_v

---descriping the data types and checking the nulls 
DESCRIBE TABLE brightcoffee.shop.coffee_sales_v

---Finding rows containing IN Colmns 
SELECT* 
FROM brightcoffee.shop.coffee_sales_v
WHERE transaction_id IS NULL
OR transaction_date IS NULL
OR transaction_time IS NULL
OR transaction_qty IS NULL
OR unit_price IS NULL
OR store_location IS NULL
OR store_id IS NULL
OR product_id IS NULL
OR product_category IS NULL
OR product_type IS NULL
OR product_detail IS NULL;

---verifying if null in product category 
SELECT 
    product_id,product_category,product_type,product_detail,
    IFNULL(product_category, 'n/a') AS product_categ_verified
FROM brightcoffee.shop.coffee_sales_v;

--replacing NULLS with n/a
SELECT product_id,product_type,product_detail,unit_price,
    IFNULL(product_type, 'n/a') AS product_type_verified,
    IFNULL(product_detail, 'n/a') AS product_detail_verified,
    IFNULL(unit_price, 0) AS price_verified
FROM brightcoffee.shop.coffee_sales_v;

--data range of data set
SELECT MIN(transaction_date) AS earliest_date,
       MAX(transaction_date) AS latest_date
FROM brightcoffee.shop.coffee_sales_v;

---remove time stamp
SELECT transaction_time,
       DATE_FORMAT(transaction_time,'hh:mm:ss') AS clean_time
  FROM brightcoffee.shop.coffee_sales_v;   

  SELECT *
FROM brightcoffee.shop.coffee_sales_v

  ---calculating total sales 
  SELECT transaction_id,transaction_qty,unit_price,
        (transaction_qty * unit_price) AS total_price
FROM brightcoffee.shop.coffee_sales_v

--Group by time periods morning,midday, and aftenoon
   WITH sales_with_period AS (
    SELECT 
        CASE 
            WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 12 AND 14 THEN 'Lunch'
            WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 15 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS time_period,
        (store_id * unit_price) AS total_sales
    FROM brightcoffee.shop.coffee_sales_v
)
SELECT 
    time_period,
    COUNT(*) AS transaction_count,
    SUM(total_sales) AS grand_total
FROM sales_with_period
GROUP BY time_period;

-------------------------------------------------------------------------------------------------------------------------
Final query that brings master table 

SELECT *
 FROM brightcoffee.shop.coffee_sales_v

 SELECT transaction_id,
        transaction_date,
        DATE_FORMAT(transaction_time,'hh:mm:ss') AS clean_time,
        transaction_qty,
        store_id,
        store_location,
        product_id,
        unit_price,
        product_category,
        product_type,
        product_detail,
        DAYNAME(transaction_date) AS day_name, ------day name (moday, tues...)
        MONTHNAME(transaction_date) AS month_name, ---month name (Jan, Feb...)
        DAYOFMONTH(transaction_date) AS day_number, ---day of month (1,2 ...)
        CASE 
            WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 12 AND 14 THEN 'Lunch'
            WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 15 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS time_bucket,
        CASE 
        WHEN EXTRACT(DOW FROM transaction_date) IN (0, 5) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM brightcoffee.shop.coffee_sales_v;


