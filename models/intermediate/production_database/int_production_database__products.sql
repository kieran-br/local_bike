select
    p.product_id,
    s.store_id,
    p.product_name,
    b.brand_name,
    c.category_name,
    p.model_year,
    s.stocks_quantity
from {{ ref('stg_production_database__products') }} as p
left join {{ ref('stg_production_database__categories') }} as c on c.category_id = p.category_id
left join {{ ref('stg_production_database__stocks') }} as s on s.product_id = p.product_id
left join {{ ref('stg_production_database__brands') }} as b on b.brand_id = p.brand_id
