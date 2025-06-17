{{ config(materialized='table', schema='gold', alias='percentual_das_categoria') }}

WITH somente_categoria AS (
    SELECT * 
    FROM {{ ref("somente_categoria")}}
),
aggregation AS (
    SELECT  
        categoria,
        qtde,
        round(c.qtde / (SELECT sum(c.qtde) FROM somente_categoria c) * 100:: numeric, 2) as percentual
    FROM somente_categoria c
)

SELECT *
FROM aggregation