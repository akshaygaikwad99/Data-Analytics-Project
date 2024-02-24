
select oi.price,op.payment_value,od.order_id,od.customer_id
from olist_order_items_dataset oi
join olist_order_payments_dataset op on oi.order_id=op.order_id
join olist_orders_dataset od on  oi.order_id=od.order_id;

with cte1 as(
select oi.price,op.payment_value,od.customer_id,od.order_id
from olist_order_items_dataset oi
join olist_order_payments_dataset op on oi.order_id=op.order_id
join olist_orders_dataset od on oi.order_id=od.order_id)
select round(avg(t1.price),2) as Avg_price,round(avg(t1.payment_value),2) as avg_payment_value,cd.customer_city
from cte1 t1 join olist_customers_dataset cd
on t1.customer_id=cd.customer_id
where cd.customer_city="sao paulo";





SELECT 
        ROUND(AVG(oi.price), 2) AS avg_price,
        ROUND(AVG(op.payment_value), 2) AS avg_payment_value,
        cd.customer_city
    FROM 
        olist_order_items_dataset oi
    JOIN 
        olist_order_payments_dataset op ON oi.order_id = op.order_id
    JOIN 
        olist_orders_dataset od ON oi.order_id = od.order_id
    JOIN 
        olist_customers_dataset cd ON od.customer_id = cd.customer_id
    WHERE 
        cd.customer_city = "sao paulo";
        
