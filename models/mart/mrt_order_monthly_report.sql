select DATE_TRUNC(order_date,month) as order_month,
count(order_id) as total_monthly_orders,
count(distinct customer_id) as total_monthly_users,
round(avg(time_between_order_and_delivery),2) as average_monthly_delivery_time_day,
round(avg(time_between_needed_and_delivery),2) as average_monthly_delayed_delivery_day
from {{ ref('int_sale_database__order' ) }}
group by order_month