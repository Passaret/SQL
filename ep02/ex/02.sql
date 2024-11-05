-- Ex2 Faça uma query que apresente o tamanho 
-- médio, máximo e mínimo do nome do objeto por categoria
SELECT
    product_category_name,
    avg(product_name_lenght) as product_name_avg,
    max(product_name_lenght) as product_name_max,
    min(product_name_lenght) as product_name_min

FROM tb_products

WHERE product_category_name IS NOT NULL

GROUP BY product_category_name