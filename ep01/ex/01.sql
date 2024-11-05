-- Ex1: Quantos produtos temos da categoria 'artes'?
-- 55 produtos


SELECT 
        count(DISTINCT product_id) as qntd_product
FROM tb_products
WHERE product_category_name = 'artes'
