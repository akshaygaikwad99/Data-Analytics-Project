SELECT * FROM e_commerce.olist_orders_dataset;

select order_id,order_purchase_timestamp,dayname(order_purchase_timestamp) as day_name,
case
when dayname(order_purchase_timestamp)="monday" then "Weekday"
when dayname(order_purchase_timestamp)="tuesday" then "Weekday"
when dayname(order_purchase_timestamp)="wednesday" then "Weekday"
when dayname(order_purchase_timestamp)="thursday" then "Weekday"
when dayname(order_purchase_timestamp)="friday" then "Weekday"
when dayname(order_purchase_timestamp)="saturday" then "Weekend"
else "Weekend"
end as weekperiod
from olist_orders_dataset;

with CTE1 as(
select order_id,order_purchase_timestamp,dayname(order_purchase_timestamp) as day_name,
case
when dayname(order_purchase_timestamp)="monday" then "Weekday"
when dayname(order_purchase_timestamp)="tuesday" then "Weekday"
when dayname(order_purchase_timestamp)="wednesday" then "Weekday"
when dayname(order_purchase_timestamp)="thursday" then "Weekday"
when dayname(order_purchase_timestamp)="friday" then "Weekday"
when dayname(order_purchase_timestamp)="saturday" then "Weekend"
else "Weekend"
end as Week
from olist_orders_dataset)

select Week,count(t1.order_id) as count_of_order,round(sum(pd.payment_value),2) as total_payment_value, 
round(avg(pd.payment_value),2) as avg_payment_value
from CTE1 t1 join olist_order_payments_dataset pd
on t1.order_id=pd.order_id
group by Week;



WITH CTE1 AS (
    SELECT
        order_id,
        order_purchase_timestamp,
        DAYNAME(order_purchase_timestamp) AS day_name,
        CASE
            WHEN DAYNAME(order_purchase_timestamp) = "monday" THEN "Weekday"
            WHEN DAYNAME(order_purchase_timestamp) = "tuesday" THEN "Weekday"
            WHEN DAYNAME(order_purchase_timestamp) = "wednesday" THEN "Weekday"
            WHEN DAYNAME(order_purchase_timestamp) = "thursday" THEN "Weekday"
            WHEN DAYNAME(order_purchase_timestamp) = "friday" THEN "Weekday"
            WHEN DAYNAME(order_purchase_timestamp) = "saturday" THEN "Weekend"
            ELSE "Weekend"
        END AS Week
    FROM
        olist_orders_dataset
)

SELECT
    Week,
    COUNT(t1.order_id) AS count_of_order,
    ROUND(SUM(pd.payment_value), 2) AS total_payment_value,
    ROUND(AVG(pd.payment_value), 2) AS avg_payment_value
FROM
    CTE1 t1
JOIN
    olist_order_payments_dataset pd ON t1.order_id = pd.order_id
GROUP BY
    Week;
