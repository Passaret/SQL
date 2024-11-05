-- receita por estado do seller, por produto da categoria 
-- mais vendida


SELECT t2.seller_state,
       t1.product_id,
       round(sum(t1.price), 2) as receita_total
FROM tb_order_items as t1

LEFT JOIN tb_sellers as t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id

WHERE t3.product_category_name = (

        SELECT product_category_name
        FROM tb_products
        GROUP BY product_category_name
        ORDER BY count(*) DESC
        LIMIT 1
)

GROUP BY t2.seller_state, t1.product_id