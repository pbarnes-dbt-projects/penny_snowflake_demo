{% macro get_end_of_last_month() %}
    {{ dbt.dateadd('second', -1, dbt.date_trunc('month', dbt.current_timestamp())) }}
{% endmacro %}