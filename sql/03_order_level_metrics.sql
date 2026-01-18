-- Preparing order-level data for delivery cost percentage analysis
-- Aggregating item prices and delivery costs per order
-- This dataset will be used in further regional and ratio-based analysis

WITH order_totals AS (
    SELECT
        order_id,
        SUM(price) AS total_items_price,
        SUM(freight_value) AS total_order_delivery,
        COUNT(*) AS items_in_order
    FROM olist_order_items_dataset
    GROUP BY order_id
)
SELECT *
FROM order_totals
LIMIT 10;
