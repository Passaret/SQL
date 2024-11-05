-- Ex3. Faça uma query que apresente o tamanho 
-- médio, máximo e mínimo do nome do objeto por categoria
-- Considere apenas os objetos que tenham a 
-- descrição maior que 100.

SELECT
    product_category_name,
    avg(product_name_lenght) as product_name_avg,
    max(product_name_lenght) as product_name_max,
    min(product_name_lenght) as product_name_min

FROM tb_products

WHERE product_category_name IS NOT NULL
AND   product_description_lenght >= 100

GROUP BY product_category_name