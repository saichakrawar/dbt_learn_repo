{{ config(
    database = 'SNOWFLAKE_DT',
    schema = 'TRANSFORM_DT',
    snowflake_warehouse = 'COMPUTE_WH',
    materialized = 'dynamic_table',
    target_lag = '7 minutes'
) }}

SELECT *
FROM {{ ref('customer_dt') }} AS a
JOIN {{ ref('nation_dt') }} AS b 
  ON a.C_NATIONKEY = b.N_NATIONKEY
