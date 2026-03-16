-- This is an expolatory data analysis (EDA) project of the table cafe_sales.
-- The cafe sales dataset contains 10,000 rows of synthetic data representing sales transactions in a cafe. 
-- https://www.kaggle.com/datasets/ahmedmohamed2003/cafe-sales-dirty-data-for-cleaning-training


-- The data has been already cleaned and the clean data is in cafe_sales_staging. I will be using the clean data for EDA.

SELECT *
FROM cafe_sales_staging;

-- 1. Calculation of basic statistics 
-- Calculating total transactions, total revenue, average transaction value and total items sold

SELECT 
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS avg_transaction_value,
    SUM(quantity) AS total_items_sold
FROM cafe_sales_staging;

-- Calculating min sale and max sale 

SELECT 
    MIN(total_spent) AS min_sale,
    MAX(total_spent) AS max_sale
FROM cafe_sales_staging;

-- 2. Calculatung daily and monthly trends

-- Daily sales stats- number of sales in a day and daily revenues
SELECT 
    DATE(transaction_date) AS `date`, 
    COUNT(transaction_id) AS num_transactions,
    SUM(total_spent) AS daily_sales_revenue
FROM cafe_sales_staging
WHERE transaction_date IS NOT NULL
GROUP BY transaction_date
ORDER BY transaction_date;

-- Monthly sales stats- 
SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(total_spent) AS monthly_sales_revenue,
    COUNT(DISTINCT transaction_id) AS num_transactions
FROM cafe_sales_staging
WHERE transaction_date IS NOT NULL
GROUP BY YEAR(transaction_date), MONTH(transaction_date)
ORDER BY year, month;

-- Which day of the week gets the highest sales revenue?

SELECT 
    WEEKDAY(transaction_date) AS day_of_week,
    CASE WEEKDAY(transaction_date)
        WHEN 0 THEN 'Monday'
        WHEN 1 THEN 'Tuesday'
        WHEN 2 THEN 'Wednesday'
        WHEN 3 THEN 'Thursday'
        WHEN 4 THEN 'Friday'
        WHEN 5 THEN 'Saturday'
        WHEN 6 THEN 'Sunday'
    END as day_name,
    ANY_VALUE(transaction_date) AS sample_date,  
    SUM(total_spent) AS total_sales,
    AVG(total_spent) AS avg_sale,
    COUNT(*) AS num_transactions
FROM cafe_sales_staging
WHERE transaction_date IS NOT NULL
GROUP BY WEEKDAY(transaction_date)
ORDER BY total_sales DESC;
    
-- 3. Payment method analysis

-- Calculating most used payment method in desc order
SELECT 
    payment_method,
    COUNT(transaction_id) AS num_transactions,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS avg_transaction_value,
    ROUND(100.0 * COUNT(transaction_id) / SUM(COUNT(transaction_id)) OVER(), 2) as transaction_percentage
FROM cafe_sales_staging
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Calculating most used payment method in desc order based on location preference
SELECT 
    location,
    payment_method,
    COUNT(transaction_id) AS frequency,
    SUM(total_spent) AS revenue
FROM cafe_sales_staging
GROUP BY location, payment_method
ORDER BY location, revenue DESC;

-- 4. Location based analysis

-- Performance based on location
SELECT 
    location,
    COUNT(DISTINCT transaction_id) AS transactions,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS avg_transaction,
    SUM(quantity) AS items_sold,
    SUM(total_spent) / SUM(quantity) AS revenue_per_item
FROM cafe_sales_staging
WHERE location != 'UNKNOWN'
GROUP BY location
ORDER BY total_revenue DESC;

-- Popular items based on location
SELECT 
    location,
    item,
    COUNT(transaction_id) AS order_count,
    SUM(quantity) AS total_quantity
FROM cafe_sales_staging
WHERE (location != 'ERROR' AND location != 'UNKNOWN' AND location is NOT NULL) AND item != 'UNKNOWN'
GROUP BY location, item
ORDER BY location, order_count DESC;




