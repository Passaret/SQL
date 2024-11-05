-- Qual o valor total de receita gerada por clientes de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

SELECT 
    t3.customer_state,
    round(sum(t2.price), 2) as receita_total,
    round(sum(t2.price) / count(DISTINCT t3.customer_id), 2) as avg_receita_cliente

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_customers as t3
ON t1.customer_id = t3.customer_id

WHERE order_status = 'delivered'

GROUP BY t3.customer_state

ORDER BY sum(t2.price) / count(DISTINCT t3.customer_id) DESC