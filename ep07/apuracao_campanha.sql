
WITH tb_venda as (
    SELECT *

    FROM tb_orders as t1

    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id

    WHERE order_approved_at >= '2018-07-01'
    AND order_approved_at <= '2018-07-10'
)

SELECT t1.flag_controle,
       avg(t2.price) as avg_venda,
       count(DISTINCT t1.seller_id) as tamanho_amostra,
       count(DISTINCT t2.seller_id) as convertidos,
       count(DISTINCT t2.seller_id) / cast(count(DISTINCT t1.seller_id) as float) as tx_conversão

FROM tb_audiencia_venda as t1

LEFT JOIN tb_venda as t2
ON t1.seller_id = t2.seller_id

GROUP BY t1.flag_controle