-- Regional delivery cost analysis
-- Comparing delivery costs to order value by state

WITH order_totals AS(
	SELECT
		order_id,
		SUM(price) AS total_items_price,
		SUM(freight_value) AS total_order_delivery,
		COUNT(*) AS items_in_order
	FROM
		olist_order_items_dataset
	GROUP BY order_id
), 
final_geo_data AS (
	SELECT 
		c.customer_state AS state,
		t.total_items_price,
		t.total_order_delivery,
		(t.total_items_price + t.total_order_delivery) AS full_order_price
	FROM 
		olist_orders_dataset o JOIN olist_customers_dataset c
		ON o.customer_id = c.customer_id
		JOIN order_totals t 
		ON o.order_id = t.order_id
	WHERE o.order_status = 'delivered'
	)
SELECT 
	state,
	ROUND( AVG(total_items_price)::NUMERIC, 2) AS avg_order_price,
	ROUND( AVG(total_order_delivery)::NUMERIC, 2) AS avg_delivery_per_order,
	ROUND( AVG(total_order_delivery)::NUMERIC, 2) / ROUND( AVG(total_items_price)::NUMERIC, 2) * 100 AS delivery_ratio_percent
FROM final_geo_data
GROUP BY state 
ORDER BY delivery_ratio_percent DESC;
