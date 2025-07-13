select
    concat(store_id, '_', product_id) as stock_id,
    store_id,
    product_id,
    quantity as stocks_quantity
from {{ source('production_database', 'stocks') }}