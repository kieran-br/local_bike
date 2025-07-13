select
    store_id,
    product_id,
    quantity as stocks_quantity
from {{ source('production_database', 'stocks') }}