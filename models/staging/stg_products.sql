select
  id as product_id,
  initcap(product_name) as product_name,
  category,
  price
from {{ source('raw', 'products') }}
