select
  category,
  date_trunc(order_date, month) as order_month,
  sum(total_sales) as total_revenue,
  sum(quantity) as total_quantity,
  count(distinct customer_id) as unique_customers
from {{ ref('int_order_details') }}
group by 1,2
