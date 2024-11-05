--  Ex1. Faça uma query que apresente o tamanho 
-- médio, máximo e mínimo da descrição do objeto por categoria

SELECT 
    product_category_name,
    avg(product_description_lenght) as product_description_avg,
    max(product_description_lenght) as product_description_max,
    min(product_description_lenght) as product_description_min
FROM tb_products

WHERE product_category_name IS NOT NULL

GROUP BY product_category_name