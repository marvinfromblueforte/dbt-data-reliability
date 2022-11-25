{% macro database_boolean(value) %}
    {{ return(adapter.dispatch('database_boolean','elementary')(value)) }}
{% endmacro %}

{% macro default__database_boolean(value) -%}
    {{ value }}
{%- endmacro %}

{% macro sqlserver__database_boolean(value) -%}
    {{ 1 if value else 0 }}
{%- endmacro %}
