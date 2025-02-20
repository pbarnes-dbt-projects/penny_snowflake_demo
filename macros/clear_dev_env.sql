{%- macro clear_dev_env() -%}

    {%- if target.name in var('dev_targets') -%}

        {%- set sql -%}
            drop schema if exists {{ target.database }}.{{ target.schema }} cascade;
        {%- endset -%}

        {{ log("Dropping target schema.", info = true) }}

        {%- do run_query(sql) -%}

        {{ log("Dropped target schema.", info = true) }}

    {%- else -%}

        {{ exceptions.raise_compiler_error("No-op: your current target is " ~ target.name ~ ". This macro only works for a dev target.") }}

    {%- endif -%}

{%- endmacro -%}
