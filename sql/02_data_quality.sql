-- Data quality checks
-- Identifying broken or inconsistent price values

SELECT 
    COUNT(*) AS total_rows,
    MIN(price) AS cheapest,
    MAX(price) AS most_expensive,
    AVG(price) AS average,
    COUNT(*) FILTER (WHERE price IS NULL OR price <= 0) AS broken_rows
FROM olist_order_items_dataset;
