{{ config (
    database= 'SNOWFLAKE_DT',
    schema = 'TRANSFORM_DT',
    snowflake_warehouse = 'COMPUTE_WH',
    materialized = 'dynamic_table',
    target_lag = 'DOWNSTREAM'   
)
}}

select * from RAW.PUBLIC.CUST