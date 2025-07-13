select
    category_id,
    category_name
from {{ source('production_database', 'categories') }}