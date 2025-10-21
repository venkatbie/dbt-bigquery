select
  customer_id,
  customer_name,
  min(order_date) as first_order_date,
  max(order_date) as last_order_date,
  count(distinct order_id) as total_orders,
  sum(total_sales) as total_spent
from {{ ref('int_order_details') }}
group by 1,2
