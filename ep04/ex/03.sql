-- Qual o peso médio dos produtos vendidos por sellers de cada estado? 
-- Considere apenas o ano de 2017 e pedidos entregues nesta análise.

SELECT 
    t4.seller_state,
    round(avg(t3.product_weight_g), 2) as avg_product,
    round(avg(t3.product_weight_g) / count(DISTINCT t4.seller_id), 2) as avg_product_seller

FROM tb_order_items as t1

LEFT JOIN tb_orders as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id

LEFT JOIN tb_sellers as t4
ON t1.seller_id = t4.seller_id

WHERE t2.order_status = 'delivered'
AND   strftime('%Y', t2.order_approved_at) = '2017'

GROUP BY t4.seller_state

ORDER BY avg(t3.product_weight_g) DESC