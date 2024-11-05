-- Ex4: Quantos produtos de 'beleza_saude' com menos de 1 litro?
-- 132

SELECT 
        count(DISTINCT product_id) as qntd_1L
FROM tb_products
WHERE (product_height_cm * product_length_cm * product_width_cm)/1000 < 1
AND
       product_category_name = 'beleza_saude'
