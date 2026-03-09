-- =========================================
-- KPI & Analytics Queries
-- Project: Ecommerce Analytics (MySQL)
-- =========================================

USE ecommerce_analytics;

-- =========================================
-- KPI 1: Total Revenue
-- =========================================
SELECT 
    ROUND(SUM(item_price + freight_value), 2) AS total_revenue
FROM fact_sales;


-- KPI 2: Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales;


-- KPI 3: Total Customers
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM fact_sales;


-- KPI 4: Average Order Value
SELECT
    ROUND(
        SUM(item_price + freight_value) /
        COUNT(DISTINCT order_id),
        2
    ) AS avg_order_value
FROM fact_sales;


-- KPI 5: Orders by Payment Type
SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS orders
FROM fact_sales
GROUP BY payment_type
ORDER BY orders DESC;


-- KPI 6: Average Review Score
SELECT
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM fact_sales
WHERE review_score IS NOT NULL;



-- KPI 7: Monthly Revenue
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(item_price + freight_value), 2) AS revenue
FROM fact_sales
GROUP BY month
ORDER BY month;


-- KPI 8: Top 10 Products by Revenue
SELECT
    product_id,
    ROUND(SUM(item_price + freight_value), 2) AS revenue
FROM fact_sales
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;





-- KPI 9: Month-over-Month Revenue Growth
WITH monthly_revenue AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(item_price + freight_value) AS revenue
    FROM fact_sales
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT
    year,
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY year, month)) 
        / LAG(revenue) OVER (ORDER BY year, month) * 100,
        2
    ) AS mom_growth_pct
FROM monthly_revenue;






-- KPI 10: Year-over-Year Revenue Growth
WITH yearly_revenue AS (
    SELECT
        YEAR(order_date) AS year,
        SUM(item_price + freight_value) AS revenue
    FROM fact_sales
    GROUP BY YEAR(order_date)
)
SELECT
    year,
    revenue,
    LAG(revenue) OVER (ORDER BY year) AS prev_year_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY year)) 
        / LAG(revenue) OVER (ORDER BY year) * 100,
        2
    ) AS yoy_growth_pct
FROM yearly_revenue;