WITH order_items AS (
    SELECT
        order_id,
        SUM(sale_price) AS total_sale_price
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
    GROUP BY order_id
)
SELECT
    o.order_id,
    o.user_id,
    o.status,
    oi.total_sale_price,
    o.created_at,
    EXTRACT(YEAR FROM o.created_at) AS order_year,
    EXTRACT(MONTH FROM o.created_at) AS order_month
FROM `bigquery-public-data.thelook_ecommerce.orders` o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
