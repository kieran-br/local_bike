select
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    cast(coalesce(shipped_date, order_date), date) as shipped_date,
    store_id,
    staff_id
from {{ source('sale_database', 'orders') }}