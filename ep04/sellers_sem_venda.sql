-- sellers sem venda em dezembro de 2017
-- considere vendas validas (entregues)

SELECT 
        t2.seller_id,
        t3.seller_state

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_sellers as t3
ON t2.seller_id = t3.seller_id

WHERE t1.order_approved_at < '2018-01-01'
AND   t1.order_status = 'delivered'

GROUP BY t2.seller_id, t3.seller_state

HAVING max(CASE WHEN strftime('%Y-%m', t1.order_approved_at) = '2017-12' THEN 1
             else 0
        end) = 0