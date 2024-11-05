-- Qual o valor total de receita gerada por sellers de cada estado? 
-- Considere a base completa, com apenas pedidos entregues


SELECT 
    t2.seller_state,
    round(sum(t1.price), 2) as receita,
    round(sum(t1.price) / count(DISTINCT t2.seller_id), 2) as avg_receita_seller,
    count(DISTINCT t2.seller_id) as qntd_sellers

FROM tb_order_items as t1

LEFT JOIN tb_sellers as t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_orders as t3
ON t1.order_id = t3.order_id

WHERE t3.order_status = 'delivered'

GROUP BY t2.seller_state

ORDER BY sum(t1.price) / count(DISTINCT t2.seller_id) DESC