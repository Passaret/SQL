-- Ex4. Faça uma query que apresente o tamanho
-- médio, máximo e mínimo do nome do objeto por categoria
-- Considere apenas os objetos que tenham a descrição maior que 100
-- Exiba apenas as categorias com tamanho médio de descrição
-- do objeto maior que 500 caracteres.

SELECT
    product_category_name,
    avg(product_name_lenght) as product_name_avg,
    max(product_name_lenght) as product_name_max,
    min(product_name_lenght) as product_name_min

FROM tb_products

WHERE product_category_name IS NOT NULL
AND   product_description_lenght > 100

GROUP BY product_category_name

HAVING avg(product_description_lenght) > 500

ORDER BY 
    min(product_name_lenght) desc
