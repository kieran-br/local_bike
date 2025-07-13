select
    concat(order_id, '_', item_id) AS order_item_id,
    order_id,
    product_id,
    quantity as item_quantity,
    list_price as unit_price,
    discount,
    (list_price * quantity)*(1-discount) as total_order_items_amount
from {{ source('sale_database', 'order_items') }}