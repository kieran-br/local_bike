select
    oi.order_id,
    product_id,
    total_order_items_amount,
    item_quantity,
    order_date,
    required_date,
    shipped_date,
    customer_id,
    store_id,
    staff_id
from {{ ref('stg_sale_database__order_items') }} as oi
inner join 
{{ ref('stg_sale_database__orders')}} as o 
on oi.order_id = o.order_id