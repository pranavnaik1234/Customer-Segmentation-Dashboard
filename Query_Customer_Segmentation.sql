create database customer;
use customer;

select distinct * from customer_segmentation;
select * from customer_segmentation;

#category vs total orders
SELECT 
    category, COUNT(*) AS total_orders
FROM
    customer_segmentation
GROUP BY category
ORDER BY total_orders DESC;

#category vs total purchased amount
SELECT 
    category,
    ROUND(SUM(Purchased_Amount_USD),2) AS total_purchased_amount_usd
FROM
    customer_segmentation
GROUP BY category
ORDER BY total_purchased_amount_usd DESC;

#season vs total spending
SELECT 
    season, round(SUM(purchased_amount_usd),2) AS Total_Spending
FROM
    customer_segmentation
GROUP BY season
ORDER BY Total_Spending DESC;

#location wise total spending 
SELECT 
    location,
    ROUND(SUM(purchased_amount_usd), 2) AS Total_Spending
FROM
    customer_segmentation
GROUP BY location
ORDER BY Total_Spending DESC;

describe customer_segmentation;
ALTER TABLE customer_segmentation 
CHANGE `Payment _Method` Payment_Method VARCHAR(100);

select distinct Payment_Method from customer_segmentation;

#Payment method wise purchase count
SELECT 
    Payment_Method, count(Payment_Method) AS Payment_Method_Users
FROM
    customer_segmentation
GROUP BY Payment_Method; 