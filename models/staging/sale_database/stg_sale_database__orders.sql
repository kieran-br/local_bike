select
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    cast(coalesce(replace(shipped_date, "NULL", cast(order_date as string)),cast(order_date as string))as date) as shipped_date,
    store_id,
    staff_id
from {{ source('sale_database', 'orders') }}