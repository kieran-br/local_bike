with order_items_grouped_by_order as (
    select 
        order_id,
        customer_id,
        count(distinct product_id) as total_distinct_item,
        sum(total_order_items_amount) as total_order_amount,
        sum(item_quantity) as total_items,
        order_date,
        required_date,
        shipped_date,
        {{ datediff("order_date", "shipped_date", "day") }} as time_between_order_and_delivery,
        {{ datediff("shipped_date", "required_date", "day") }} as time_between_needed_and_delivery,
        store_id,
        staff_id
    from {{ ref('int_sale_database__order_items') }}
    group by 
        order_id,
        customer_id,
        order_date,
        required_date,
        shipped_date,
        store_id,
        staff_id
)

select
    oi.order_id,
    oi.customer_id,
    customer_city,
    customer_state,
    coalesce(total_distinct_item,0) as total_distinct_item,
    coalesce(total_order_amount,0) as total_order_amount,
    coalesce(total_items,0) as total_items,
    order_date,
    required_date,
    shipped_date,
    time_between_order_and_delivery,
    time_between_needed_and_delivery,
    store_id,
    staff_id
from order_items_grouped_by_order as oi
left join {{ ref('stg_sale_database__customers') }} as c on c.customer_id = oi.customer_id