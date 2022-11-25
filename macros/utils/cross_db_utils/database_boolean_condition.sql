{% macro database_boolean_condition(value) %}
    {{ return(adapter.dispatch('database_boolean_condition','elementary')(value)) }}
{% endmacro %}

{% macro default__database_boolean_condition(value) -%}
    {{ value }}
{%- endmacro %}

{% macro sqlserver__database_boolean_condition(value) -%}
    {%- if value %}
        1=1
    {%- else -%}
        1=2
    {%- endif %}
{%- endmacro %}
