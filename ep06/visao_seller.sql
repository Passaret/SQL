-- Qual o produto mais caro que o seller já vendeu
-- considere pedidos entregues

WITH tb_seller_product AS
(
    SELECT seller_id,
           product_id,
           count(*) AS qntd_produto,
           sum(price) AS receita_produto

    FROM tb_orders AS t1

    LEFT JOIN tb_order_items AS t2
    ON t1.order_id = t2.order_id

    WHERE order_status = 'delivered'

    GROUP BY seller_id,
             product_id

    ORDER BY seller_id
),

tb_seller_max as (
    SELECT seller_id,
           max(qntd_produto) as max_qntd

    FROM tb_seller_product

    GROUP BY seller_id
)

/* SELECT t1.*,
       t2.*

FROM tb_seller_max as t1

LEFT JOIN tb_seller_product as t2
ON t1.seller_id = t2.seller_id
AND t1.max_qntd = t2.qntd_produto */

SELECT *
FROM tb_seller_product