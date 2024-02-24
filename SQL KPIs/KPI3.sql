select round(avg(datediff(od.order_delivered_customer_date,od.order_purchase_timestamp)),0) as avg_days_to_deliver,pd.product_category_name
from olist_orders_dataset od join olist_order_items_dataset id
on od.order_id=id.order_id
join olist_products_dataset pd
on id.product_id=pd.product_id
where product_category_name="pet_shop";


SELECT
    ROUND(AVG(DATEDIFF(od.order_delivered_customer_date, od.order_purchase_timestamp)), 0) AS avg_days_to_deliver,
    pd.product_category_name
FROM
    olist_orders_dataset od
JOIN
    olist_order_items_dataset id ON od.order_id = id.order_id
JOIN
    olist_products_dataset pd ON id.product_id = pd.product_id
WHERE
    pd.product_category_name = "pet_shop"
GROUP BY
    pd.product_category_name;
