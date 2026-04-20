create database if not exists apex_planet_task_2;
use  apex_planet_task_2;



CREATE TABLE orders (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code BIGINT,
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

select * from orders;


CREATE TABLE customers (
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    region VARCHAR(50),
    segment VARCHAR(50)
);

select * from customers;

SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM customers;

-- Perform INNER JOIN
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.region,
    o.category,
    o.sales,
    o.profit
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- 1. Total Sales by Region
SELECT 
    c.region,
    SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

-- 2. Profit Margin by Category
SELECT 
    category,
    SUM(profit)/SUM(sales) AS profit_margin
FROM orders
GROUP BY category;

-- 3. Monthly Sales Trend
SELECT 
    MONTH(order_date) AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- 4. Top 5 Customers
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_revenue
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;

