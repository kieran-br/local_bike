with  orders_summary as (
select
 customer_id,
 customer_city,
 customer_state,
 sum(total_order_amount) as total_amount_spents,
 sum(total_items) as total_items,
 sum(total_distinct_item) as total_distinct_items,
 count(distinct order_id) as total_orders
from {{ ref('int_sale_database__order') }} 
group by
 customer_id,
 customer_city,
 customer_state
)

select
os.customer_id,
os.customer_city,
os.customer_state,
os.total_amount_spents,
os.total_items,
os.total_distinct_items,
os.total_orders,
p.favorite_product_id
from orders_summary as os
left join {{ ref('int_sale_database__customer_favorite_product') }} p
on os.customer_id = p.customer_id