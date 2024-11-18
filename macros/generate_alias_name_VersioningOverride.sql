{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if custom_alias_name -%}

        {{ custom_alias_name | trim }}

    {%- elif node.version == node.latest_version -%}
        
        {{ node.name | trim }}
        
    {%- elif node.version < node.latest_version -%}

        {{ return(node.name ~ "_deprecated" | replace(".", "_")) }}

    {%- elif node.version > node.latest_version -%}

        {{ return(node.name ~ "_prerelease" | replace(".", "_")) }}

    {%- else -%}

        {{ node.name }}

    {%- endif -%}

{%- endmacro %}