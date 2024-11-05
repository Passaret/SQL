-- tempo entre vendas dos sellers
-- apenas pedidos entregues

WITH tb_seller_order as (
    SELECT t1.order_id,
           date(t1.order_approved_at) as data_venda,
           t2.seller_id
    
    FROM tb_orders as t1
    
    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id
    
    WHERE order_status = 'delivered'
),

tb_seller_order_sort AS (

    SELECT *,
        row_number() OVER (PARTITION BY seller_id, data_venda) AS date_seller_order

    FROM tb_seller_order
    ),

    tb_seller_lag_data as (

    SELECT order_id,
        seller_id,
        data_venda,
        lag(data_venda) OVER (PARTITION BY seller_id 
                                ORDER BY data_venda) AS lag_data_venda

    FROM tb_seller_order_sort

    WHERE date_seller_order = 1
)

SELECT *,
       julianday(data_venda) - julianday(lag_data_venda) as diff_dias

FROM tb_seller_lag_data

WHERE lag_data_venda IS NOT NULL