{{ config (
    materialiazed = 'table',
    database = 'RAW',
    alias = 'null_cust_tab'
)
}}

with dq_check As(
    {{check_nulls(ref('stg_cust'),['C_CUSTKEY'])}}
)

select *
from dq_check
where null_check_status = 'Fail'