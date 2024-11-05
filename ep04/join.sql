-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos

-- SELECT * FROM tb_products ;

SELECT 
    t1.order_id,
    t1.order_item_id,
    t1.product_id,
    t2.product_category_name,
    t1.price

FROM tb_order_items as t1

LEFT JOIN tb_products as t2

ON t1.product_id = t2.product_id