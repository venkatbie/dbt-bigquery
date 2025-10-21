select
  id as customer_id,
  initcap(customer_name) as customer_name,
  email,
  created_at::date as signup_date,
  state,
  country
from {{ source('raw', 'customers') }}
