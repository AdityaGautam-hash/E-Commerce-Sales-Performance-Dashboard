USE ecommerce_analytics;

DROP TABLE IF EXISTS fact_sales;
DROP VIEW IF EXISTS fact_sales;

CREATE VIEW fact_sales AS
SELECT
    oi.order_id,
    o.customer_id,
    oi.product_id,
    DATE(o.order_purchase_timestamp) AS order_date,
    oi.order_item_id,
    oi.price AS item_price,
    oi.freight_value

FROM stg_order_items oi

JOIN stg_orders o
    ON oi.order_id = o.order_id

WHERE o.order_status = 'delivered';


SELECT COUNT(*) FROM fact_sales;