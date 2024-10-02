{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if custom_alias_name -%}

        {{ custom_alias_name | trim }}

    {%- elif node.version != node.latest_version -%}

        {{ return(node.name ~ "_old" | replace(".", "_")) }}

    {%- elif node.version == node.latest_version -%}
        
        {{ node.name | trim }}

    {%- else -%}

        {{ node.name }}

    {%- endif -%}

{%- endmacro %}