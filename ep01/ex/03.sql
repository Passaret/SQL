-- Ex3: Crie uma coluna nova que contenha a informação de volume em m3

SELECT 
product_id,
product_category_name,
product_name_lenght,
product_description_lenght,
product_photos_qty,
product_weight_g,
product_height_cm * product_length_cm * product_width_cm / 1000000 AS product_volume_m3,
product_length_cm,
product_height_cm,
product_width_cm


FROM tb_products
