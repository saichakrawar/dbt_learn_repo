{{ config (
    materialiazed = 'view',
    alias = 'rank_cust'
)
}}

with cte as (
    select *,
            ROW_NUMBER() OVER(PARTITION BY C_MKTSEGMENT ORDER BY C_CUSTKEY) AS RANK_
    from RAW.PUBLIC.CUST
)
SELECT * FROM cte