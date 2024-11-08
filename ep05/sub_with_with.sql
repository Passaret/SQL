-- a receita por estado do seller, 
-- por produto da categoria mais vendida


WITH tb_best_categoria AS (

    SELECT t2.product_category_name

    FROM tb_order_items AS t1

    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id

    GROUP BY t2.product_category_name
    ORDER BY count(*) DESC

    LIMIT 3
),

tb_receita_estado_produto as (
    select
        t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price) as receita_total

    from tb_order_items as t1

    left join tb_sellers as t2
    on t1.seller_id = t2.seller_id

    left join tb_products as t3
    on t1.product_id = t3.product_id

    group by t2.seller_state,
             t1.product_id,
             t3.product_category_name
)

select *
from tb_receita_estado_produto as t1

inner join tb_best_categoria as t2
on t1.product_category_name = t2.product_category_name