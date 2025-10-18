{% macro check_nulls(table_name, column_list) %}
{% set null_conditions = [] %}
{% for col in column_list %}
{% do null_conditions.append(col ~ ' IS NULL') %}
{% endfor %}

select * , 
CASE
WHEN {{null_conditions | join (' OR ')}} Then 'Fail'
else 'Pass'
end as null_check_status
from {{table_name}}
{% endmacro %}