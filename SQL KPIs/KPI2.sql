select p.payment_type,r.review_score,count(o.order_id) as total_order_count
from olist_orders_dataset o join olist_order_payments_dataset p
on o.order_id=p.order_id
join olist_order_reviews_dataset r
on o.order_id=r.order_id
where payment_type="credit_card" and review_score="5"
group by payment_type and review_score;

SELECT
    p.payment_type,
    r.review_score,
    COUNT(o.order_id) AS total_order_count
FROM
    olist_orders_dataset o
JOIN
    olist_order_payments_dataset p ON o.order_id = p.order_id
JOIN
    olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE
    p.payment_type = "credit_card" AND r.review_score = 5
GROUP BY
    p.payment_type, r.review_score;
