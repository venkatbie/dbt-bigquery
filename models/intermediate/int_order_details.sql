select
  o.order_id,
  o.order_date,
  c.customer_id,
  c.customer_name,
  p.product_id,
  p.product_name,
  p.category,
  o.quantity,
  o.quantity * p.price as total_sales
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c on o.customer_id = c.customer_id
join {{ ref('stg_products') }} p on o.product_id = p.product_id
