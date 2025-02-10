WITH

order_item_measures AS (
	SELECT
		order_id,
		SUM(item_sale_price) AS total_sale_price,
		SUM(product_cost) AS total_sale_cost,
		SUM(item_profit) AS total_sale_profit,
		SUM(item_discount) AS total_sale_discount
  	FROM {{ ref('int_ecommerce__order_items_products')}}
	GROUP BY 1
)

SELECT
	-- Dimensions
	od.*,

	-- Measures
	total_sale_price,
	total_sale_cost,
	total_sale_profit,
	total_sale_discount

FROM {{ ref('stg_ecommerce__orders') }} AS od
LEFT JOIN order_item_measures AS om
	ON od.order_id = om.order_id