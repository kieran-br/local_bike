select 
    DATE_TRUNC(oi.order_date,month) as order_month,
    oi.product_id,
    p.product_name,
    p.brand_name,
    p.category_name,
    p.model_year,
    sum(oi.item_quantity) as total_monthly_quantity_selled,
    round(sum(oi.total_order_items_amount),2) as total_monthly_order_items_amount
from {{ ref('int_sale_database__order_items' ) }} as oi
left join {{ ref('int_production_database__products') }} as p on p.product_id = oi.product_id
group by
    order_month,
    oi.product_id,
    p.product_name,
    p.brand_name,
    p.category_name,
    p.model_year
ORDER BY order_month, total_monthly_quantity_selled DESC


