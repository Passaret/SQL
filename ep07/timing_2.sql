DROP TABLE IF EXISTS tb_audiencia_venda;
CREATE TABLE tb_audiencia_venda as
WITH tb_marcacao_seller as (
     SELECT t2.seller_id,
            max(t1.order_approved_at) as dt_ultima_venda,
            '2018-07-01' as dt_atual,

             /* Isso é o que o marketing quer */
            julianday('2018-07-01') - julianday(max(t1.order_approved_at)) as dt_dias_ult_venda,
            CASE WHEN julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > 90
                 THEN 1 ELSE 0
                 END AS flag_venda_90dias,

             /* Isso é a nossa proposta */
            t3.tempo_medio_venda,
            CASE WHEN julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > t3.tempo_medio_venda
                 THEN 1 ELSE 0
                 END AS flag_avg_tempo

     FROM tb_orders as t1

     LEFT JOIN tb_order_items as t2
     ON t1.order_id = t2.order_id

     LEFT JOIN tb_avg_compra_seller as t3
     ON t2.seller_id = t3.seller_id

     WHERE date(t1.order_approved_at) < '2018-07-01'
     AND t1.order_status = 'delivered'

     GROUP BY t2.seller_id
     )

SELECT seller_id,
       case when abs(random()%1000) / 1000. <= 0.1 then 1 else 0 
       end as flag_controle
       
FROM tb_marcacao_seller

WHERE flag_avg_tempo = 1
