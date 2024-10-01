{% macro generate_schema_name(custom_schema_name, node) %}

    {% set default_schema = target.schema %}
d
    {% if custom_schema_name == 'uat' %}

        {{ default_schema | trim }}

    {% elif custom_schema_name is not none and env_var('DBT_TARGET_ENV', 'dev') in ('staging', 'prod') %}

        {{ custom_schema_name | trim }}

    {% else %}



    {% endif %}

{% endmacro %}
