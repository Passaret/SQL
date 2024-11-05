SELECT 
    seller_state,
    count(DISTINCT seller_id) as qntd_sellers
    
FROM tb_sellers

-- filtro pré agg (agregação)
WHERE seller_state IN ('SP', 'RJ', 'PR', 'AC')

-- agg
GROUP BY seller_state

-- filtro pós agg
HAVING count(DISTINCT seller_id) > 10 -- remove estados com <10 sellers
