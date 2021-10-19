SELECT customers.id AS customer_id
       , customers.name
       , customers.email
       , min(orders.created_at)    AS first_order_at
       , NVL(count(orders.id),0)   AS number_orders
       , max(orders.created_at)    AS last_order_at
FROM coffee_shop.customers a
LEFT JOIN coffee_shop.orders b
ON a.id = b.customer_id
GROUP BY 1,2,3
ORDER BY first_order_at
;