select round(avg(datediff(od.order_delivered_customer_date,od.order_purchase_timestamp)),0) as date_difference,rd.review_score
from olist_orders_dataset od join olist_order_reviews_dataset rd
on od.order_id=rd.order_id
group by rd.review_score
order by review_score desc;

SELECT
    ROUND(AVG(DATEDIFF(od.order_delivered_customer_date, od.order_purchase_timestamp)), 0) AS date_difference,
    rd.review_score
FROM
    olist_orders_dataset od
JOIN
    olist_order_reviews_dataset rd ON od.order_id = rd.order_id
GROUP BY
    rd.review_score
ORDER BY
    date_difference DESC;
