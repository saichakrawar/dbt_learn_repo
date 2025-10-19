{{ config (
    database= 'SILVER_DB',
    
    
)
}}

with base as (
    select * from {{ref('stg_cust_rank')}}
),

dq_check as (
    select *,
        CASE
            WHEN({{check_null_rank(['C_CUSTKEY'])}}) THEN 'FAIL'
            ELSE 'PASS'
        END AS DQ_STATUS
    FROM base
)

SELECT * FROM dq_check WHERE DQ_STATUS = 'PASS'