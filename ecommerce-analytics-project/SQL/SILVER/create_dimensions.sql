USE ecommerce_analytics;

-- =========================================
-- CUSTOMER DIMENSION
-- =========================================
DROP TABLE IF EXISTS dim_customer;


CREATE TABLE dim_customer AS
SELECT
    customer_id,
    MAX(customer_unique_id) AS customer_unique_id,
    MAX(customer_city) AS customer_city,
    MAX(customer_state) AS customer_state
FROM stg_customers
GROUP BY customer_id;


-- =========================================
-- PRODUCT DIMENSION
-- =========================================
DROP TABLE IF EXISTS dim_product;

CREATE TABLE dim_product AS
SELECT
    p.product_id,
    p.product_category_name,
    t.product_category_name_english,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM stg_products p
LEFT JOIN stg_category_translation t
    ON p.product_category_name = t.product_category_name;



-- =========================================
-- PAYMENT SUMMARY (1 row per order)
-- =========================================
DROP TABLE IF EXISTS payment_summary;

CREATE TABLE payment_summary AS
SELECT
    order_id,
    SUM(payment_value) AS total_payment_value,
    MAX(payment_type) AS payment_type,
    MAX(payment_installments) AS payment_installments
FROM stg_payments
GROUP BY order_id;



-- =========================================
-- REVIEW SUMMARY (1 row per order)
-- =========================================
DROP TABLE IF EXISTS review_summary;

CREATE TABLE review_summary AS
SELECT
    order_id,
    MAX(review_score) AS review_score
FROM stg_reviews
GROUP BY order_id;



SHOW TABLES;