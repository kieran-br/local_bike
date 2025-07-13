select
    staff_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    email as staff_email,
    phone as staff_phone,
    active,
    store_id,
    cast(coalesce(replace(manager_id, "NULL", cast(staff_id as string)),cast(staff_id as string))as int) as manager_id
from {{ source('sale_database', 'staffs') }}