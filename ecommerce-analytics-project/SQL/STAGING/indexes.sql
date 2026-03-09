USE ecommerce_analytics;

CREATE INDEX idx_orders_orderid
ON stg_orders(order_id);

CREATE INDEX idx_items_orderid
ON stg_order_items(order_id);

CREATE INDEX idx_payments_orderid
ON stg_payments(order_id);

CREATE INDEX idx_reviews_orderid
ON stg_reviews(order_id);