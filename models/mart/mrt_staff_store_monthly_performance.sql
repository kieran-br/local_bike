select 
    DATE_TRUNC(o.order_date,month) as order_month,
    st.store_name,
    concat(s.staff_first_name, '_', s.staff_last_name) as staff_seller,
    round(sum(o.total_order_amount),2) as total_order_amount,
    round(sum(o.total_distinct_item),2) as total_distinct_item,
    round(sum(o.total_items),2) as total_order_item
from {{ ref('int_sale_database__order') }} as o
left join {{ ref('stg_sale_database__staffs') }} as s on s.staff_id = o.staff_id
left join {{ ref('stg_sale_database__stores') }} as st on st.store_id = o.store_id
group by
    order_month,
    st.store_name,
    staff_seller
ORDER BY order_month, st.store_name, staff_seller