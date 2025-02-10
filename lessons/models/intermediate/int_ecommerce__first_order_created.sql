SELECT
	user_id,
	min(created_at) as first_order_created_at
FROM {{ ref("stg_ecommerce__orders")}}
GROUP BY user_id