SELECT
customer_id,
product_id AS favorite_product_id
FROM {{ ref('int_sale_database__order_items') }}
GROUP BY
customer_id,
product_id
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY customer_id
  ORDER BY SUM(item_quantity) DESC
) = 1